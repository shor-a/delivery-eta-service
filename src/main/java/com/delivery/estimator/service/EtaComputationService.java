package com.delivery.estimator.service;

import com.delivery.estimator.config.EtaProperties;
import com.delivery.estimator.dto.EtaRequest;
import com.delivery.estimator.dto.EtaResponse;
import com.delivery.estimator.entity.ZoneRegion;
import com.delivery.estimator.model.TrafficCondition;
import com.delivery.estimator.model.VehicleType;
import com.delivery.estimator.model.WeatherCondition;
import lombok.RequiredArgsConstructor;
import org.apache.commons.math3.random.RandomDataGenerator;
import org.apache.commons.math3.stat.descriptive.DescriptiveStatistics;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Core ETA computation service.
 *
 * Request pipeline:
 *  1. Zone lookup          — resolve origin + destination area names
 *  2. Route segmentation   — build waypoints, compute Haversine distance
 *  3. Speed multipliers    — traffic, weather, time-of-day, vehicle, zone-limit
 *  4. Geofence penalty     — JTS point-in-polygon check
 *  5. Point estimate       — distance / adjustedSpeed + penalty
 *  6. Monte Carlo          — confidence min/median/max
 *  7. Historical bias      — weighted-median from EtaHistoryService
 *  8. Record + return
 */
@Service
@RequiredArgsConstructor
public class EtaComputationService {

    private static final double EARTH_RADIUS_KM = 6_371.0;
    private static final double BASE_SPEED_KMH  = 50.0;

    private final EtaProperties      props;
    private final GeofenceService    geofenceService;
    private final ZoneLookupService  zoneLookupService;
    private final EtaHistoryService  historyService;

    public EtaResponse estimate(EtaRequest req) {
        Instant requestTime = req.getRequestTime() != null ? req.getRequestTime() : Instant.now();

        ZoneRegion originZone = zoneLookupService.findNearestZone(req.getCurrentLat(), req.getCurrentLon());
        ZoneRegion destZone   = zoneLookupService.findNearestZone(req.getDestLat(),    req.getDestLon());

        List<double[]> waypoints = buildWaypoints(
                req.getCurrentLat(), req.getCurrentLon(),
                req.getDestLat(),    req.getDestLon(),
                props.getWaypointCount());

        double totalDistanceKm = sumSegmentDistances(waypoints);

        double trafficMult    = trafficMultiplier(req.getTrafficCondition());
        double weatherMult    = weatherMultiplier(req.getWeatherCondition());
        double timeOfDayMult  = timeOfDayMultiplier(requestTime);
        double vehicleMult    = vehicleMultiplier(req.getVehicleType(), req.getWeatherCondition());
        double zoneLimitMult  = zoneLimitMultiplier(originZone.getSpeedLimitKmh());

        double combinedMult   = trafficMult * weatherMult * timeOfDayMult * vehicleMult * zoneLimitMult;
        double adjustedSpeed  = BASE_SPEED_KMH * combinedMult;

        double geofencePenalty = geofenceService.computePenalty(waypoints);

        double rawEstimateMinutes = (totalDistanceKm / adjustedSpeed) * 60.0 + geofencePenalty;

        double[] confidence = monteCarloSimulation(
                totalDistanceKm, adjustedSpeed, geofencePenalty,
                trafficMult, weatherMult, props.getSimulationIterations());

        double historicalBias = historyService.computeHistoricalBias(
                req.getTrafficCondition(), originZone.getRegionType());

        double finalEstimateMinutes = rawEstimateMinutes + historicalBias;

        historyService.record(req.getTrafficCondition(), originZone.getRegionType(), finalEstimateMinutes);

        return EtaResponse.builder()
                .distanceKm(round2(totalDistanceKm))
                .baseSpeedKmh(BASE_SPEED_KMH)
                .adjustedSpeedKmh(round2(adjustedSpeed))
                .estimatedMinutes(round2(finalEstimateMinutes))
                .confidenceMinMin(round2(confidence[0]))
                .confidenceMedianMin(round2(confidence[1]))
                .confidenceMaxMin(round2(confidence[2]))
                .formattedEta(formatEta(finalEstimateMinutes))
                .trafficMultiplier(trafficMult)
                .weatherMultiplier(weatherMult)
                .timeOfDayMultiplier(timeOfDayMult)
                .vehicleMultiplier(vehicleMult)
                .zoneLimitMultiplier(round2(zoneLimitMult))
                .geofencePenaltyMinutes(round2(geofencePenalty))
                .historicalBiasMinutes(round2(historicalBias))
                .originArea(originZone.getName())
                .destinationArea(destZone.getName())
                .build();
    }

    private List<double[]> buildWaypoints(double lat1, double lon1,
                                          double lat2, double lon2,
                                          int segments) {
        List<double[]> pts = new ArrayList<>(segments + 1);
        for (int i = 0; i <= segments; i++) {
            double t   = (double) i / segments;
            double lat = lat1 + t * (lat2 - lat1);
            double lon = lon1 + t * (lon2 - lon1);
            pts.add(new double[]{lat, lon});
        }
        return pts;
    }

    private double sumSegmentDistances(List<double[]> pts) {
        double total = 0.0;
        for (int i = 0; i < pts.size() - 1; i++) {
            total += haversineKm(pts.get(i)[0], pts.get(i)[1],
                                 pts.get(i + 1)[0], pts.get(i + 1)[1]);
        }
        return total;
    }

    private double haversineKm(double lat1, double lon1, double lat2, double lon2) {
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                 + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                 * Math.sin(dLon / 2) * Math.sin(dLon / 2);
        return 2 * EARTH_RADIUS_KM * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    }

    private double trafficMultiplier(TrafficCondition tc) {
        return switch (tc) {
            case LIGHT    -> 1.00;
            case MODERATE -> 0.80;
            case HEAVY    -> 0.55;
            case SEVERE   -> 0.30;
        };
    }

    private double weatherMultiplier(WeatherCondition wc) {
        return switch (wc) {
            case CLEAR -> 1.00;
            case RAIN  -> 0.85;
            case FOG   -> 0.75;
            case SNOW  -> 0.60;
            case STORM -> 0.45;
        };
    }

    private double timeOfDayMultiplier(Instant instant) {
        ZonedDateTime zdt = instant.atZone(ZoneId.of("UTC"));
        int hour = zdt.getHour();
        boolean morningRush = hour >= 7 && hour < 9;
        boolean eveningRush = hour >= 17 && hour < 19;
        return (morningRush || eveningRush) ? 0.75 : 1.00;
    }

    private double vehicleMultiplier(VehicleType vt, WeatherCondition wc) {
        return switch (vt) {
            case BIKE -> switch (wc) {
                case CLEAR -> 1.10;
                case RAIN  -> 0.70;
                case FOG   -> 0.75;
                case SNOW  -> 0.50;
                case STORM -> 0.35;
            };
            case CAR -> switch (wc) {
                case CLEAR -> 1.00;
                case RAIN  -> 0.90;
                case FOG   -> 0.85;
                case SNOW  -> 0.70;
                case STORM -> 0.55;
            };
            case VAN -> switch (wc) {
                case CLEAR -> 0.95;
                case RAIN  -> 0.88;
                case FOG   -> 0.82;
                case SNOW  -> 0.68;
                case STORM -> 0.52;
            };
            case TRUCK -> switch (wc) {
                case CLEAR -> 0.85;
                case RAIN  -> 0.80;
                case FOG   -> 0.78;
                case SNOW  -> 0.65;
                case STORM -> 0.50;
            };
        };
    }

    /**
     * Converts a zone's speed limit into a multiplier relative to base speed.
     * e.g. 30 km/h limit in an urban zone → 30/50 = 0.60 cap.
     * Capped at 1.0 so high-speed zones don't boost above base.
     */
    private double zoneLimitMultiplier(double speedLimitKmh) {
        return Math.min(1.0, speedLimitKmh / BASE_SPEED_KMH);
    }

    private double[] monteCarloSimulation(double distanceKm, double adjustedSpeedKmh,
                                          double geofencePenalty,
                                          double trafficMult, double weatherMult,
                                          int iterations) {
        RandomDataGenerator rng   = new RandomDataGenerator();
        DescriptiveStatistics stats = new DescriptiveStatistics();

        for (int i = 0; i < iterations; i++) {
            double speedJitter   = rng.nextGaussian(adjustedSpeedKmh, adjustedSpeedKmh * 0.05);
            double trafficJitter = rng.nextGaussian(trafficMult, trafficMult * 0.03);
            double weatherJitter = rng.nextGaussian(weatherMult, weatherMult * 0.03);

            double simSpeed   = Math.max(1.0, speedJitter * trafficJitter * weatherJitter);
            double simMinutes = (distanceKm / simSpeed) * 60.0 + geofencePenalty;
            stats.addValue(Math.max(0.0, simMinutes));
        }

        return new double[]{
            stats.getMin(),
            stats.getPercentile(50),
            stats.getMax()
        };
    }

    private String formatEta(double minutes) {
        long rounded = Math.round(minutes);
        if (rounded < 60) {
            return rounded + " min";
        }
        long hours = rounded / 60;
        long mins  = rounded % 60;
        return mins > 0 ? hours + "h " + mins + "m" : hours + "h";
    }

    private double round2(double value) {
        return Math.round(value * 100.0) / 100.0;
    }
}
