package com.delivery.estimator.entity;

import com.delivery.estimator.model.RegionType;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(
    name = "zone_region",
    indexes = {
        @Index(name = "idx_zr_region_type",   columnList = "regionType"),
        @Index(name = "idx_zr_center_lat",    columnList = "centerLat"),
        @Index(name = "idx_zr_center_lon",    columnList = "centerLon"),
        @Index(name = "idx_zr_speed_limit",   columnList = "speedLimitKmh"),
        @Index(name = "idx_zr_lat_lon",       columnList = "centerLat, centerLon")
    }
)
@Getter
@Setter
@NoArgsConstructor
public class ZoneRegion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private RegionType regionType;

    @Column(nullable = false)
    private double centerLat;

    @Column(nullable = false)
    private double centerLon;

    @Column(nullable = false)
    private double radiusKm;

    @Column(nullable = false)
    private double speedLimitKmh;

    @OneToMany(mappedBy = "zone", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<SpeedProfile> speedProfiles = new ArrayList<>();

    @OneToMany(mappedBy = "zone", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<ZoneAlert> alerts = new ArrayList<>();
}
