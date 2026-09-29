package com.releasepulse;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ReleaseServiceTest {

    private final ReleaseService service = new ReleaseService();

    @Test
    void shouldReturnRecentReleases() {
        assertFalse(service.recentReleases().isEmpty());
        assertEquals("v1.4.2", service.recentReleases().getFirst().version());
    }

    @Test
    void shouldReportHealthyDeploymentRate() {
        assertTrue(service.deploymentSuccessRate() >= 95);
    }

    @Test
    void shouldContainAllEnvironments() {
        assertEquals(4, service.environmentStatus().size());
        assertEquals("Healthy", service.environmentStatus().get("Production"));
    }
}
