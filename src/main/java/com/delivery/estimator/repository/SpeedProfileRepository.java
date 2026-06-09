package com.delivery.estimator.repository;

import com.delivery.estimator.entity.SpeedProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpeedProfileRepository extends JpaRepository<SpeedProfile, Long> {

    List<SpeedProfile> findByZoneIdAndHourBucket(Long zoneId, int hourBucket);

    List<SpeedProfile> findByZoneIdAndVehicleType(Long zoneId, String vehicleType);
}
