package com.delivery.estimator.repository;

import com.delivery.estimator.entity.ZoneRegion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ZoneRegionRepository extends JpaRepository<ZoneRegion, Long> {

    @Query("""
            SELECT z FROM ZoneRegion z
            ORDER BY (POWER(z.centerLat - :lat, 2) + POWER(z.centerLon - :lon, 2)) ASC
            LIMIT 1
            """)
    Optional<ZoneRegion> findNearestZone(@Param("lat") double lat,
                                         @Param("lon") double lon);
}
