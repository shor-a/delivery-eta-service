package com.delivery.estimator.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "eta")
public class EtaProperties {

    private int waypointCount = 20;

    private int simulationIterations = 200;

    private int historyWindowSize = 500;
}
