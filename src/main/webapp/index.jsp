<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.releasepulse.ReleaseService.Release" %>
<%
    List<Release> releases = (List<Release>) request.getAttribute("releases");
    Map<String, String> environments = (Map<String, String>) request.getAttribute("environments");
    Integer successRate = (Integer) request.getAttribute("successRate");

    if (releases == null) {
        com.releasepulse.ReleaseService service = new com.releasepulse.ReleaseService();
        releases = service.recentReleases();
        environments = service.environmentStatus();
        successRate = service.deploymentSuccessRate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReleasePulse | Deployment Intelligence</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/style.css">
</head>
<body>

<div class="app-shell">
    <aside class="sidebar">
        <div class="brand">
            <div class="brand-mark">RP</div>
            <div>
                <strong>ReleasePulse</strong>
                <span>Deployment Intelligence</span>
            </div>
        </div>

        <nav>
            <a class="active" href="<%= request.getContextPath() %>/">Overview</a>
            <a href="#environments">Environments</a>
            <a href="#releases">Releases</a>
            <a href="#pipeline">Pipeline</a>
        </nav>

        <div class="sidebar-footer">
            <span class="pulse"></span>
            Platform systems operational
        </div>
    </aside>

    <main class="content">
        <header class="topbar">
            <div>
                <p class="eyebrow">PLATFORM / RELEASE CENTER</p>
                <h1>Good morning, team.</h1>
                <p class="muted">A clear view of what is deployed, where it is deployed, and how healthy the delivery flow is.</p>
            </div>
            <div class="version-badge">v1.4.2 <span>LIVE</span></div>
        </header>

        <section class="stats-grid">
            <article class="stat-card">
                <span>Current Release</span>
                <strong>v1.4.2</strong>
                <small>Production</small>
            </article>

            <article class="stat-card">
                <span>Deployment Success</span>
                <strong><%= successRate %>%</strong>
                <small>Last 30 deployments</small>
            </article>

            <article class="stat-card">
                <span>Active Environments</span>
                <strong><%= environments.size() %></strong>
                <small>All reporting healthy</small>
            </article>

            <article class="stat-card accent">
                <span>Pipeline Status</span>
                <strong>Healthy</strong>
                <small>Last run 8 minutes ago</small>
            </article>
        </section>

        <section id="environments" class="panel">
            <div class="section-heading">
                <div>
                    <p class="eyebrow">RUNTIME</p>
                    <h2>Environment health</h2>
                </div>
                <span class="live-indicator"><i></i> Live status</span>
            </div>

            <div class="environment-grid">
                <% for (Map.Entry<String, String> env : environments.entrySet()) { %>
                    <div class="environment">
                        <div class="env-top">
                            <span class="env-icon"><%= env.getKey().substring(0, 1) %></span>
                            <span class="status-dot"></span>
                        </div>
                        <h3><%= env.getKey() %></h3>
                        <p><%= env.getValue() %></p>
                        <div class="health-line"><span></span></div>
                    </div>
                <% } %>
            </div>
        </section>

        <div class="two-column">
            <section id="releases" class="panel">
                <div class="section-heading">
                    <div>
                        <p class="eyebrow">DELIVERY HISTORY</p>
                        <h2>Recent releases</h2>
                    </div>
                    <span class="count"><%= releases.size() %> releases</span>
                </div>

                <div class="release-list">
                    <% for (Release release : releases) { %>
                        <div class="release-row">
                            <div class="release-version"><%= release.version() %></div>
                            <div class="release-info">
                                <strong><%= release.environment() %></strong>
                                <span><%= release.date() %> · <%= release.owner() %></span>
                            </div>
                            <code><%= release.commit() %></code>
                            <span class="release-status <%= release.status().equals("Rolled back") ? "warning" : "" %>">
                                <%= release.status() %>
                            </span>
                        </div>
                    <% } %>
                </div>
            </section>

            <section id="pipeline" class="panel pipeline-panel">
                <div class="section-heading">
                    <div>
                        <p class="eyebrow">CI/CD</p>
                        <h2>Delivery pipeline</h2>
                    </div>
                </div>

                <div class="pipeline">
                    <div class="stage done"><b>01</b><span>GitHub</span><small>Source</small></div>
                    <div class="connector"></div>
                    <div class="stage done"><b>02</b><span>Maven</span><small>Build & Test</small></div>
                    <div class="connector"></div>
                    <div class="stage done"><b>03</b><span>SonarQube</span><small>Quality</small></div>
                    <div class="connector"></div>
                    <div class="stage done"><b>04</b><span>Nexus</span><small>Artifact</small></div>
                    <div class="connector"></div>
                    <div class="stage current"><b>05</b><span>Tomcat</span><small>Deploy</small></div>
                </div>

                <div class="pipeline-result">
                    <span class="check">✓</span>
                    <div>
                        <strong>Production deployment verified</strong>
                        <p>Release v1.4.2 passed build, quality checks and deployment.</p>
                    </div>
                </div>
            </section>
        </div>

        <footer>
            ReleasePulse · Built for a production-style CI/CD learning project
        </footer>
    </main>
</div>

</body>
</html>
