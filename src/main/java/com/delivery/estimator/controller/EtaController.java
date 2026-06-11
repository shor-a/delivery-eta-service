package com.delivery.estimator.controller;

import com.delivery.estimator.dto.EtaRequest;
import com.delivery.estimator.dto.EtaResponse;
import com.delivery.estimator.service.EtaComputationService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "ETA Estimation", description = "Compute delivery estimated time of arrival")
@RestController
@RequestMapping("/delivery-eta")
@RequiredArgsConstructor
public class EtaController {

    private final EtaComputationService computationService;

    @Operation(
        summary = "Estimate delivery ETA",
        description = """
            Computes an estimated time of arrival for an in-progress delivery given the
            courier's current coordinates, destination, traffic/weather conditions, and
            vehicle type. Returns a point estimate plus a Monte Carlo confidence range.
            """
    )
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "ETA computed successfully",
            content = @Content(
                mediaType = "application/json",
                schema = @Schema(implementation = EtaResponse.class),
                examples = @ExampleObject(value = """
                    {
                      "distanceKm": 6.24,
                      "baseSpeedKmh": 50.0,
                      "adjustedSpeedKmh": 40.0,
                      "estimatedMinutes": 9.36,
                      "confidenceMinMin": 8.12,
                      "confidenceMedianMin": 9.41,
                      "confidenceMaxMin": 11.03,
                      "formattedEta": "9 min",
                      "trafficMultiplier": 1.0,
                      "weatherMultiplier": 1.0,
                      "timeOfDayMultiplier": 0.75,
                      "vehicleMultiplier": 1.0,
                      "geofencePenaltyMinutes": 0.0
                    }
                    """)
            )
        ),
        @ApiResponse(
            responseCode = "400",
            description = "Invalid request — validation failed",
            content = @Content(
                mediaType = "application/json",
                examples = @ExampleObject(value = """
                    {
                      "status": 400,
                      "error": "Validation Failed",
                      "messages": ["currentLat: must be <= 90"]
                    }
                    """)
            )
        )
    })
    @PostMapping("/estimate")
    public ResponseEntity<EtaResponse> estimate(
            @io.swagger.v3.oas.annotations.parameters.RequestBody(
                description = "Delivery ETA request payload",
                required = true,
                content = @Content(
                    examples = @ExampleObject(
                        name = "Car in NYC — light traffic, clear weather",
                        value = """
                            {
                              "currentLat": 40.7128,
                              "currentLon": -74.0060,
                              "destLat": 40.7580,
                              "destLon": -73.9855,
                              "trafficCondition": "LIGHT",
                              "weatherCondition": "CLEAR",
                              "vehicleType": "CAR",
                              "requestTime": "2026-06-21T08:30:00Z"
                            }
                            """
                    )
                )
            )
            @Valid @RequestBody EtaRequest request) {
        EtaResponse response = computationService.estimate(request);
        return ResponseEntity.ok(response);
    }
}
