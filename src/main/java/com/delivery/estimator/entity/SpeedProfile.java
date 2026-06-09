package com.delivery.estimator.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(
    name = "speed_profile",
    indexes = {
        @Index(name = "idx_sp_zone_hour",   columnList = "zone_id, hour_bucket"),
        @Index(name = "idx_sp_avg_speed",   columnList = "avg_speed_kmh"),
        @Index(name = "idx_sp_vehicle",     columnList = "vehicle_type"),
        @Index(name = "idx_sp_zone_id",     columnList = "zone_id")
    },
    uniqueConstraints = {
        @UniqueConstraint(
            name = "uq_sp_zone_hour_vehicle",
            columnNames = {"zone_id", "hour_bucket", "vehicle_type"}
        )
    }
)
@Getter
@Setter
@NoArgsConstructor
public class SpeedProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id", nullable = false)
    private ZoneRegion zone;

    @Column(name = "hour_bucket", nullable = false)
    private int hourBucket;

    @Column(name = "vehicle_type", nullable = false, length = 10)
    private String vehicleType;

    @Column(name = "avg_speed_kmh", nullable = false)
    private double avgSpeedKmh;

    @Column(name = "p85_speed_kmh", nullable = false)
    private double p85SpeedKmh;

    @Column(name = "p15_speed_kmh", nullable = false)
    private double p15SpeedKmh;

    @Column(name = "sample_count", nullable = false)
    private int sampleCount;
}
