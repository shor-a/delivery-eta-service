# Delivery ETA Service

A Spring Boot microservice that computes estimated delivery times using route segmentation, speed multipliers (traffic, weather, time-of-day, vehicle type), geofence penalties, Monte Carlo confidence ranges, and a historical bias window.

<img width="947" height="263" alt="6 grafana-dashboard-1" src="https://github.com/user-attachments/assets/5413102d-78ac-470c-bfbb-8cb686fb25ac" />

Built as medium logic flow complexity service to ensure valid benchmark JVM startup and throughput across three runtime variants of JDK 17 - GraalVM and JDK 25 with Leyden AOT.

---

## Prerequisites

- [Podman](https://podman.io/) with `podman-compose`
- JDK 25 (for backwards compatible local build) or just Podman (for containerised runs)
- [k6](https://k6.io/) via Podman (no local install needed)

---

## Project Structure

```
delivery-service/
├── Dockerfile                   # JDK 17 image (G1GC, fixed heap)
├── Dockerfile.native            # GraalVM Native Image (multi-stage)
├── Dockerfile.leyden            # JDK 25 + Project Leyden AOT cache
├── docker-compose.app.yml       # App container (JDK 17)
├── docker-compose.native.yml    # App container (Native)
├── docker-compose.leyden.yml    # App container (Leyden / JDK 25)
├── docker-compose.infra.yml     # Prometheus + Grafana
├── src/                         # Spring Boot application source
├── k6/                          # Load test scripts
└── docker/
    ├── prometheus/prometheus.yml
    └── grafana/provisioning/    # Auto-provisioned datasource + dashboard
```

---

## Runtime Variants

Three variants are available. Run only one at a time — all use port `8080` and `container_name: delivery-service`, so Prometheus scraping and k6 scripts work identically across them.

| Variant         | Dockerfile          | Compose file                | Image tag                           |
| --------------- | ------------------- | --------------------------- | ----------------------------------- |
| JDK 17          | `Dockerfile`        | `docker-compose.app.yml`    | `delivery-eta-service:1.0.0`        |
| GraalVM Native  | `Dockerfile.native` | `docker-compose.native.yml` | `delivery-eta-service-native:1.0.0` |
| Leyden / JDK 25 | `Dockerfile.leyden` | `docker-compose.leyden.yml` | `delivery-eta-service-leyden:1.0.0` |

---

## Start Infrastructure (Prometheus + Grafana)

The infra stack is shared across all variants. Start it once before running any app variant.

```powershell
podman compose -f docker-compose.infra.yml up -d
```

Stop infra:

```powershell
podman compose -f docker-compose.infra.yml down -v
> Drop `-v` if you want to keep Prometheus and Grafana data between runs.
```

---

## Quick Start — JDK 17

### 1. Build the JAR

```powershell
.\mvnw.cmd clean package -DskipTests
```

### 2. Start the app

```powershell
podman compose -f docker-compose.app.yml up --build -d
```

### 3. Verify the service is healthy

```powershell
podman ps
# delivery-service should show (healthy) after ~30 s
```

### 4. Stop service

```powershell
podman compose -f docker-compose.app.yml down
```

---

## GraalVM Native Image

Build happens entirely inside the container — no local GraalVM or compiler toolchain required. Expect 10–15 minutes on first build.

```powershell
podman build -f Dockerfile.native -t delivery-eta-service-native:1.0.0 .

podman compose -f docker-compose.native.yml up -d
```

Stop:

```powershell
podman compose -f docker-compose.native.yml down
```

---

## Project Leyden (JDK 25 AOT Cache)

Leyden pre-loads and links classes at build time and caches JIT profiles from a training run, giving 2–5× faster startup than standard JVM while keeping full JIT and dynamic class loading.

```powershell
# Build JAR with the leyden profile (compiles to Java 25 bytecode)
.\mvnw.cmd -Pleyden clean package -DskipTests

# Build the image (runs a training pass inside the container)
podman build -f Dockerfile.leyden -t delivery-eta-service-leyden:1.0.0 .

podman compose -f docker-compose.leyden.yml up -d
```

Stop:

```powershell
podman compose -f docker-compose.leyden.yml down
```

---

## Service URLs

| Resource     | URL                                         |
| ------------ | ------------------------------------------- |
| Swagger UI   | http://localhost:8080/swagger-ui.html       |
| ETA endpoint | http://localhost:8080/delivery-eta/estimate |
| Prometheus   | http://localhost:9090                       |
| Grafana      | http://localhost:3000                       |

### Example request

```bash
curl -X POST http://localhost:8080/delivery-eta/estimate \
  -H "Content-Type: application/json" \
  -d '{
    "currentLat": 40.7128, "currentLon": -74.0060,
    "destLat": 40.7580,    "destLon": -73.9855,
    "trafficCondition": "LIGHT",
    "weatherCondition": "CLEAR",
    "vehicleType": "CAR",
    "requestTime": "2026-06-21T08:30:00Z"
  }'
```

---

## Load Testing (k6)

The k6 script runs against whatever variant is currently up. It pushes metrics into Prometheus so they appear alongside JVM metrics on the same Grafana dashboard.

### With Grafana integration

```powershell
podman run --rm -i `
  --network eta-net `
  -v "${PWD}/k6:/scripts" `
  grafana/k6 run `
    --out experimental-prometheus-rw `
    -e K6_PROMETHEUS_RW_SERVER_URL=http://prometheus:9090/api/v1/write `
    -e K6_PROMETHEUS_RW_TREND_AS_NATIVE_HISTOGRAM=true `
    /scripts/load-test-coldstart.js
```

### Quick smoke test (no Prometheus output)

```powershell
podman run --rm -i --network eta-net -v "${PWD}/k6:/scripts" grafana/k6 run /scripts/load-test.js
```

### Test stages

No warmup — the service is hit immediately at full load to measure cold JIT behaviour.

| Step   | Duration | VUs | Notes                         |
| ------ | -------- | --- | ----------------------------- |
| Step 1 | 60 s     | 100 | Immediate full load, cold JIT |
| Step 2 | 60 s     | 125 | +25                           |
| Step 3 | 60 s     | 150 | +25                           |
| Step 4 | 60 s     | 175 | +25                           |
| Step 5 | 60 s     | 200 | +25                           |
| Step 6 | 60 s     | 250 | +50                           |
| Step 7 | 60 s     | 300 | +50, saturation ceiling       |

Total: ~7 minutes. Step increases reveal the saturation point without an artificial spike. Useful for comparing JDK 17 (cold JIT) against Leyden/JDK 25 (AOT cache, pre-warmed profiles).

---

## Grafana Dashboard

Open http://localhost:3000 → Dashboards → **Delivery ETA**
Set time range to **Last 15 minutes** and auto-refresh to **1s**.

Key panels: startup time, requests/sec, latency percentiles (p50/p90/p95/p99), JVM heap, GC pauses, Tomcat thread pool, CPU usage, and k6 VU count — all on the same timeline.

---

---

## Benchmark Results

Pre-recorded results from each runtime variant are available in the `benchmark/` folder.

```
benchmark/
├── jdk17/      # JDK 17 + G1GC
├── jdk25/      # JDK 25 + Project Leyden AOT cache
└── graalvm/    # GraalVM Native Image
```

Each subfolder contains 11 CSV files exported from Grafana, covering:

| File                                   | Metric                                |
| -------------------------------------- | ------------------------------------- |
| `1_Startup Time`                       | Application startup duration          |
| `2_1_Throughput — Requests per Second` | Raw requests/sec over time            |
| `2_1_Throughput_10s_avg`               | 10-second rolling average throughput  |
| `2_2_Total HTTP Requests — Cumulative` | Cumulative request count              |
| `3_1_Request Latency`                  | Latency percentiles (p50/p90/p95/p99) |
| `4_1_Tomcat Thread Pool`               | Active vs max Tomcat threads          |
| `4_2_JVM Thread Count`                 | Total JVM thread count over time      |
| `5_1_JVM CPU Usage`                    | CPU usage during the load test        |
| `5_2_JVM Heap Memory`                  | Heap used vs committed                |
| `5_3_JVM Non-Heap Memory`              | Metaspace and code cache              |
| `5_4_GC Pause Duration`                | GC pause durations over time          |
