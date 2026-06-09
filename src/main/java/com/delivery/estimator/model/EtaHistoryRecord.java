package com.delivery.estimator.model;

public record EtaHistoryRecord(
        TrafficCondition trafficCondition,
        RegionType regionType,
        double estimatedMinutes) {
}
