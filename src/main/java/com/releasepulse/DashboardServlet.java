package com.releasepulse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private final ReleaseService releaseService = new ReleaseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("releases", releaseService.recentReleases());
        request.setAttribute("environments", releaseService.environmentStatus());
        request.setAttribute("successRate", releaseService.deploymentSuccessRate());

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
