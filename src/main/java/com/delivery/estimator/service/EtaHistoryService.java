package com.delivery.estimator.service;

import com.delivery.estimator.config.EtaProperties;
import com.delivery.estimator.model.EtaHistoryRecord;
import com.delivery.estimator.model.RegionType;
import com.delivery.estimator.model.TrafficCondition;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * Maintains a bounded in-memory window of recent ETA results for historical bias computation.
 */
@Service
@RequiredArgsConstructor
public class EtaHistoryService {

    private final EtaProperties props;

    // Thread-safe sliding window of recent ETA results.
    private final ConcurrentLinkedDeque<EtaHistoryRecord> window =
            new ConcurrentLinkedDeque<>();

    /**
     * Returns a weighted-median bias (2% of median) from past records matching
     * the given traffic and region type. Returns 0.0 if no matching records exist.
     */
    public double computeHistoricalBias(TrafficCondition traffic, RegionType regionType) {
        List<EtaHistoryRecord> snapshot = new ArrayList<>(window);

        List<Double> similar = snapshot.stream()
                .filter(r -> r.trafficCondition() == traffic
                          && r.regionType() == regionType)
                .map(EtaHistoryRecord::estimatedMinutes)
                .sorted()
                .toList();

        if (similar.isEmpty()) {
            return 0.0;
        }

        double median = weightedMedian(similar);
        return median * 0.02;
    }

    /** Appends a result to the window, evicting the oldest entry when full. */
    public void record(TrafficCondition traffic, RegionType regionType, double estimatedMinutes) {
        window.addLast(new EtaHistoryRecord(traffic, regionType, estimatedMinutes));
        while (window.size() > props.getHistoryWindowSize()) {
            window.pollFirst();
        }
    }

    /**
     * Weighted median where later (higher-index) values carry more weight,
     * giving recent observations more influence on the result.
     */
    private double weightedMedian(List<Double> sorted) {
        int n = sorted.size();
        double totalWeight = 0.0;
        double[] weights = new double[n];

        for (int i = 0; i < n; i++) {
            weights[i] = i + 1.0;
            totalWeight += weights[i];
        }

        double halfWeight = totalWeight / 2.0;
        double cumulative = 0.0;

        for (int i = 0; i < n; i++) {
            cumulative += weights[i];
            if (cumulative >= halfWeight) {
                return sorted.get(i);
            }
        }
        return sorted.get(n - 1);
    }
}
