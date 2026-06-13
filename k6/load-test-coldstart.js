/**
 * Delivery ETA Service — Cold-Start Step Load Test
 * ==================================================
 * Simulates a service that gets hammered immediately after startup,
 * Measure throughput and latency before JIT has warmed up
 * then load increases in steps of 25 VUs until 200 VUs.
 *
 * Stages (7 Minutes):
 *   Step 1  — 100 VUs / 60s  (immediate full load, cold JIT)
 *   Step 2  — 125 VUs / 60s  (+25)
 *   Step 3  — 150 VUs / 60s  (+25)
 *   Step 4  — 175 VUs / 60s  (+25)
 *   Step 5  — 200 VUs / 60s  (+25)
 *   Step 6  — 250 VUs / 60s  (+25)
 *   Step 7  — 300 VUs / 60s  (+25, saturation ceiling)
 *
 * Run (with Grafana — recommended so you see JIT warmup curve):
 *   podman run --rm -i `
 *     --network eta-net `
 *     -v "${PWD}/k6:/scripts" `
 *     grafana/k6 run `
 *     --out experimental-prometheus-rw `
 *     -e K6_PROMETHEUS_RW_SERVER_URL=http://prometheus:9090/api/v1/write `
 *     -e K6_PROMETHEUS_RW_TREND_AS_NATIVE_HISTOGRAM=true `
 *     --summary-export /scripts/summary-coldstart-step.json `
 *     /scripts/load-test-coldstart-step.js
 *
 * Run (no Grafana):
 *   podman run --rm -i --network eta-net -v "${PWD}/k6:/scripts" `
 *     grafana/k6 run --summary-export /scripts/summary-coldstart-step.json `
 *     /scripts/load-test-coldstart-step.js
 */

import http from "k6/http";
import { check, sleep } from "k6";
import { Counter, Rate, Trend } from "k6/metrics";

const etaRequestErrors = new Counter("eta_request_errors");
const etaSuccessRate = new Rate("eta_success_rate");
const etaResponseTime = new Trend("eta_response_time_ms", true);

export const options = {
  stages: [
    // No warmup — hit the service immediately at full cold-start load
    { duration: "60s", target: 100 }, // Step 1: cold start at 100 VUs
    { duration: "60s", target: 125 }, // Step 2: +25 VUs
    { duration: "60s", target: 150 }, // Step 3: +25 VUs
    { duration: "60s", target: 175 }, // Step 4: +25 VUs
    { duration: "60s", target: 200 }, // Step 5: +25 VUs
    { duration: "60s", target: 250 }, // Step 6: +50 VUs
    { duration: "60s", target: 300 }, // Step 7: +50 VUs (ceiling)
  ],
  thresholds: {
    eta_success_rate: ["rate>0.90"], // relaxed — cold JIT will be slower
    http_req_failed: ["rate<0.10"], // allow up to 10% errors during cold start
    http_req_duration: ["p(95)<5000"], // p95 under 5s across the full run
  },
};

// ---------------------------------------------------------------------------
// Payload config
// ---------------------------------------------------------------------------
const TRAFFIC_CONDITIONS = ["LIGHT", "MODERATE", "HEAVY", "SEVERE"];
const WEATHER_CONDITIONS = ["CLEAR", "RAIN", "FOG", "SNOW", "STORM"];
const VEHICLE_TYPES = ["BIKE", "CAR", "VAN", "TRUCK"];

const COORDINATE_PAIRS = [
  { fromLat: 40.7128, fromLon: -74.006, toLat: 40.758, toLon: -73.9855 },
  { fromLat: 40.7549, fromLon: -73.984, toLat: 40.6413, toLon: -73.7781 },
  { fromLat: 34.0522, fromLon: -118.2437, toLat: 33.9425, toLon: -118.4081 },
  { fromLat: 41.8781, fromLon: -87.6298, toLat: 41.9742, toLon: -87.9073 },
  { fromLat: 37.7749, fromLon: -122.4194, toLat: 37.4419, toLon: -122.143 },
  { fromLat: 47.6062, fromLon: -122.3321, toLat: 47.4502, toLon: -122.3088 },
  { fromLat: 29.7604, fromLon: -95.3698, toLat: 29.9902, toLon: -95.3368 },
  { fromLat: 51.5074, fromLon: -0.1278, toLat: 51.47, toLon: -0.4543 },
  { fromLat: 35.6938, fromLon: 139.7034, toLat: 35.5494, toLon: 139.7798 },
  { fromLat: -6.2088, fromLon: 106.8456, toLat: -6.1256, toLon: 106.6558 },
];

const REQUEST_TIMES = [
  "2026-06-22T07:30:00Z",
  "2026-06-22T08:00:00Z",
  "2026-06-22T12:00:00Z",
  "2026-06-22T17:30:00Z",
  "2026-06-22T23:00:00Z",
];

function randomElement(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

function buildPayload() {
  const coords = randomElement(COORDINATE_PAIRS);
  return JSON.stringify({
    currentLat: coords.fromLat,
    currentLon: coords.fromLon,
    destLat: coords.toLat,
    destLon: coords.toLon,
    trafficCondition: randomElement(TRAFFIC_CONDITIONS),
    weatherCondition: randomElement(WEATHER_CONDITIONS),
    vehicleType: randomElement(VEHICLE_TYPES),
    requestTime: randomElement(REQUEST_TIMES),
  });
}

const BASE_URL = __ENV.BASE_URL || "http://delivery-service:8080";
const HEADERS = { "Content-Type": "application/json" };

export default function () {
  const response = http.post(
    `${BASE_URL}/delivery-eta/estimate`,
    buildPayload(),
    {
      headers: HEADERS,
    },
  );

  etaResponseTime.add(response.timings.duration);

  const success = check(response, {
    "status is 200": (r) => r.status === 200,
    "has estimatedMinutes": (r) => {
      try {
        return JSON.parse(r.body).estimatedMinutes > 0;
      } catch {
        return false;
      }
    },
    "response time < 5000ms": (r) => r.timings.duration < 5000,
  });

  etaSuccessRate.add(success);
  if (!success) etaRequestErrors.add(1);

  // 50ms think time — prevents VUs from hot-looping and saturating
  // the connection pool independently of the service's actual capacity
  sleep(0.05);
}

export function setup() {
  console.log(`Target: ${BASE_URL}`);
  console.log("Cold-start step test — no JIT warmup before load begins");
  const res = http.get(`${BASE_URL}/actuator/health`);
  if (res.status !== 200) {
    throw new Error(
      `Health check failed: ${res.status} — is delivery-service running?`,
    );
  }
  console.log("Health check passed — starting immediately at 100 VUs");
}

export function teardown() {
  console.log(
    "Cold-start step test complete. Check Grafana at http://localhost:3000",
  );
  console.log("Summary exported to /scripts/summary-coldstart-step.json");
}
