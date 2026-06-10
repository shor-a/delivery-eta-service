package com.delivery.estimator.service;

import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.Polygon;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Checks route waypoints against hardcoded geofence zones using JTS point-in-polygon.
 * Each intersected zone adds a fixed minute penalty to the ETA.
 */
@Service
public class GeofenceService {

    private static final GeometryFactory GF = new GeometryFactory();

    private record Zone(String name, Polygon polygon, double penaltyMinutes) {}

    private static final List<Zone> ZONES = buildZones();

    /** Returns total penalty minutes for all zones intersected by any waypoint. */
    public double computePenalty(List<double[]> waypoints) {
        double total = 0.0;
        for (Zone zone : ZONES) {
            if (routeIntersects(zone.polygon(), waypoints)) {
                total += zone.penaltyMinutes();
            }
        }
        return total;
    }

    private boolean routeIntersects(Polygon polygon, List<double[]> waypoints) {
        for (double[] wp : waypoints) {
            Point point = GF.createPoint(new Coordinate(wp[1], wp[0])); // lon, lat
            if (polygon.contains(point)) {
                return true;
            }
        }
        return false;
    }

    private static List<Zone> buildZones() {
        return List.of(
            zone("Construction Zone Alpha", 5.0,
                new double[][]{{-74.010, 40.710}, {-74.000, 40.710},
                               {-74.000, 40.720}, {-74.010, 40.720}, {-74.010, 40.710}}),

            zone("School Zone Beta", 3.0,
                new double[][]{{-73.985, 40.748}, {-73.975, 40.748},
                               {-73.975, 40.758}, {-73.985, 40.758}, {-73.985, 40.748}}),

            zone("High-Traffic Corridor Gamma", 4.0,
                new double[][]{{-118.260, 34.050}, {-118.240, 34.050},
                               {-118.240, 34.065}, {-118.260, 34.065}, {-118.260, 34.050}}),

            zone("Airport Access Road Delta", 6.0,
                new double[][]{{-87.910, 41.975}, {-87.890, 41.975},
                               {-87.890, 41.990}, {-87.910, 41.990}, {-87.910, 41.975}})
        );
    }

    private static Zone zone(String name, double penaltyMinutes, double[][] coords) {
        Coordinate[] jtsCoords = new Coordinate[coords.length];
        for (int i = 0; i < coords.length; i++) {
            jtsCoords[i] = new Coordinate(coords[i][0], coords[i][1]);
        }
        return new Zone(name, GF.createPolygon(jtsCoords), penaltyMinutes);
    }
}
