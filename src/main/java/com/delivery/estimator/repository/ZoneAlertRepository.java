package com.delivery.estimator.repository;

import com.delivery.estimator.entity.ZoneAlert;
import com.delivery.estimator.entity.ZoneAlert.AlertSeverity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ZoneAlertRepository extends JpaRepository<ZoneAlert, Long> {

    List<ZoneAlert> findByZoneIdAndActiveTrue(Long zoneId);

    List<ZoneAlert> findBySeverityAndActiveTrue(AlertSeverity severity);

    @Query("SELECT a FROM ZoneAlert a WHERE a.zone.id = :zoneId AND a.active = true AND a.severity IN :severities")
    List<ZoneAlert> findActiveAlertsForZone(@Param("zoneId") Long zoneId,
                                            @Param("severities") List<AlertSeverity> severities);
}
