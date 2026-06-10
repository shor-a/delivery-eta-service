package com.delivery.estimator.service;

import com.delivery.estimator.entity.ZoneRegion;
import com.delivery.estimator.model.RegionType;
import com.delivery.estimator.repository.ZoneRegionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Reverse-geocoding service: resolves a (lat, lon) pair to the nearest {@link ZoneRegion}.
 * Falls back to a default "Unknown Area" zone when no match is found.
 */
@Service
@RequiredArgsConstructor
public class ZoneLookupService {

    private static final ZoneRegion UNKNOWN_ZONE = buildUnknownZone();

    private final ZoneRegionRepository repository;

    @Transactional(readOnly = true)
    public ZoneRegion findNearestZone(double lat, double lon) {
        return repository.findNearestZone(lat, lon).orElse(UNKNOWN_ZONE);
    }

    private static ZoneRegion buildUnknownZone() {
        ZoneRegion z = new ZoneRegion();
        z.setName("Unknown Area");
        z.setRegionType(RegionType.SUBURBAN);
        z.setCenterLat(0.0);
        z.setCenterLon(0.0);
        z.setRadiusKm(999.0);
        z.setSpeedLimitKmh(50.0);
        return z;
    }
}
