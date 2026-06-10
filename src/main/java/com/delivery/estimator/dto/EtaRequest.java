package com.delivery.estimator.dto;

import com.delivery.estimator.model.TrafficCondition;
import com.delivery.estimator.model.VehicleType;
import com.delivery.estimator.model.WeatherCondition;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.Instant;

@Data
@Schema(description = "Delivery ETA estimation request")
public class EtaRequest {

    @Schema(description = "Courier's current latitude", example = "40.7128", minimum = "-90", maximum = "90")
    @NotNull(message = "currentLat is required")
    @DecimalMin(value = "-90.0", message = "currentLat must be >= -90")
    @DecimalMax(value = "90.0",  message = "currentLat must be <= 90")
    private Double currentLat;

    @Schema(description = "Courier's current longitude", example = "-74.0060", minimum = "-180", maximum = "180")
    @NotNull(message = "currentLon is required")
    @DecimalMin(value = "-180.0", message = "currentLon must be >= -180")
    @DecimalMax(value = "180.0",  message = "currentLon must be <= 180")
    private Double currentLon;

    @Schema(description = "Destination latitude", example = "40.7580", minimum = "-90", maximum = "90")
    @NotNull(message = "destLat is required")
    @DecimalMin(value = "-90.0",  message = "destLat must be >= -90")
    @DecimalMax(value = "90.0",   message = "destLat must be <= 90")
    private Double destLat;

    @Schema(description = "Destination longitude", example = "-73.9855", minimum = "-180", maximum = "180")
    @NotNull(message = "destLon is required")
    @DecimalMin(value = "-180.0", message = "destLon must be >= -180")
    @DecimalMax(value = "180.0",  message = "destLon must be <= 180")
    private Double destLon;

    @Schema(description = "Current road traffic condition", example = "LIGHT")
    @NotNull(message = "trafficCondition is required")
    private TrafficCondition trafficCondition;

    @Schema(description = "Current weather condition", example = "CLEAR")
    @NotNull(message = "weatherCondition is required")
    private WeatherCondition weatherCondition;

    @Schema(description = "Courier vehicle type", example = "CAR")
    @NotNull(message = "vehicleType is required")
    private VehicleType vehicleType;

    @Schema(description = "Request timestamp for rush-hour calculation. Defaults to now if omitted.",
            example = "2026-06-21T08:30:00Z")
    private Instant requestTime;
}
