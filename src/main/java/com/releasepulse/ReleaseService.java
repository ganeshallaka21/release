package com.releasepulse;

import java.util.List;
import java.util.Map;

public class ReleaseService {

    public record Release(
            String version,
            String date,
            String environment,
            String status,
            String commit,
            String owner
    ) {}

    public List<Release> recentReleases() {
        return List.of(
                new Release("v1.4.2", "Sep 29, 2026", "PROD", "Healthy", "a81f29c", "Platform Team"),
                new Release("v1.4.1", "Sep 27, 2026", "PROD", "Healthy", "6c21b7e", "Payments Team"),
                new Release("v1.4.0", "Sep 24, 2026", "STAGING", "Ready", "f04a9bd", "Platform Team"),
                new Release("v1.3.9", "Sep 21, 2026", "PROD", "Rolled back", "2e98d10", "Web Team")
        );
    }

    public Map<String, String> environmentStatus() {
        return Map.of(
                "Development", "Healthy",
                "Testing", "Healthy",
                "Staging", "Healthy",
                "Production", "Healthy"
        );
    }

    public int deploymentSuccessRate() {
        return 98;
    }
}
