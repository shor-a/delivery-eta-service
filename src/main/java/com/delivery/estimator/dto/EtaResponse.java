package com.delivery.estimator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Schema(description = "Delivery ETA estimation result")
public class EtaResponse {

    @Schema(description = "Total segmented route distance in km", example = "6.24")
    private double distanceKm;

    @Schema(description = "Base speed before any modifier is applied (km/h)", example = "50.0")
    private double baseSpeedKmh;

    @Schema(description = "Speed after all multipliers are applied (km/h)", example = "40.0")
    private double adjustedSpeedKmh;

    @Schema(description = "Point estimate of remaining time in minutes (after historical bias)", example = "9.55")
    private double estimatedMinutes;

    @Schema(description = "Monte Carlo lower bound in minutes", example = "8.12")
    private double confidenceMinMin;

    @Schema(description = "Monte Carlo median in minutes", example = "9.41")
    private double confidenceMedianMin;

    @Schema(description = "Monte Carlo upper bound in minutes", example = "11.03")
    private double confidenceMaxMin;

    @Schema(description = "Human-readable ETA string", example = "9 min")
    private String formattedEta;

    @Schema(description = "Traffic speed multiplier applied", example = "1.0")
    private double trafficMultiplier;

    @Schema(description = "Weather speed multiplier applied", example = "1.0")
    private double weatherMultiplier;

    @Schema(description = "Time-of-day (rush-hour) multiplier applied", example = "0.75")
    private double timeOfDayMultiplier;

    @Schema(description = "Vehicle-type multiplier applied", example = "1.0")
    private double vehicleMultiplier;

    @Schema(description = "Speed-limit cap multiplier derived from origin zone", example = "0.9")
    private double zoneLimitMultiplier;

    @Schema(description = "Total penalty minutes added by geofence zone intersections", example = "0.0")
    private double geofencePenaltyMinutes;

    @Schema(description = "Bias in minutes added from historical weighted-median", example = "0.19")
    private double historicalBiasMinutes;

    @Schema(description = "Named area of the courier's current location", example = "Downtown Manhattan")
    private String originArea;

    @Schema(description = "Named area of the destination", example = "JFK Airport Corridor")
    private String destinationArea;
}
