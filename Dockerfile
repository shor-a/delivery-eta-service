FROM eclipse-temurin:17-jre-ubi9-minimal

WORKDIR /app

# Copy the fat JAR built by maven
COPY target/estimator-0.0.1-SNAPSHOT.jar app.jar

# Expose Spring Boot port
EXPOSE 8080

# JVM tuning:
#   -Xms / -Xmx fixed heap  → removes heap-resize noise from GC metrics
#   G1GC                    → predictable pause behaviour
#   MaxGCPauseMillis=100    → target pause budget, not a hard cap
#   TieredCompilation        → enables C1+C2 JIT (default but explicit)
#   +HeapDumpOnOutOfMemory  → capture heap if OOM during extreme load
ENTRYPOINT ["java", \
  "-Xms256m", "-Xmx512m", \
  "-XX:+UseG1GC", \
  "-XX:MaxGCPauseMillis=100", \
  "-XX:+TieredCompilation", \
  "-XX:+HeapDumpOnOutOfMemoryError", \
  "-XX:HeapDumpPath=/app/heapdump.hprof", \
  "-jar", "app.jar"]
