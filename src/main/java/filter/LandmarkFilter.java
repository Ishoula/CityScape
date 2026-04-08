package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Filter to manage access to Landmark resources.
 * Public: /landmark/listLandmarks, /landmark/category
 * Protected: /landmark/admin/*
 */
@WebFilter("/landmark/*")
public class LandmarkFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String pathInfo = req.getPathInfo();

        boolean isProtectedLandmarkAction = pathInfo != null && (
                pathInfo.equals("/newLandmark") ||
                pathInfo.equals("/editLandmark") ||
                pathInfo.equals("/deleteLandmark") ||
                pathInfo.equals("/insertLandmark") ||
                pathInfo.equals("/updateLandmark")
        );

        if (isProtectedLandmarkAction) {
            HttpSession session = req.getSession(false);
            boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

            if (!isLoggedIn) {
                res.sendRedirect(req.getContextPath() + "/admin/login");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        
    }
}