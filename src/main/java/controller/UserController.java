package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Landmark;
import model.User;
import repository.LandmarkRepoImpl;
import service.*;
import repository.UserRepoImpl;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet("/admin/*")
public class UserController extends HttpServlet {

    private UserService userService;
    private LandmarkService landmarkService;
    @Override
    public void init() {
        this.userService = new UserServiceImpl(new UserRepoImpl());
        this.landmarkService=new LandmarkServiceImpl(new LandmarkRepoImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();

        if (action == null || action.equals("/")) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        switch (action) {
            case "/register" -> showPage(req, resp, "register.jsp");
            case "/login"    -> showPage(req, resp, "login.jsp");
            case "/dashboard" -> showDashboard(req, resp);
            case "/logout"   -> handleLogout(req, resp);
            default -> resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();

        switch (action) {
            case "/register" -> handleRegister(req, resp);
            case "/login"    -> handleLogin(req, resp);
            case "/delete"   -> handleDelete(req, resp);
            default -> resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void showPage(HttpServletRequest req, HttpServletResponse resp, String jspName) throws ServletException, IOException {
        req.getRequestDispatcher("/views/" + jspName).forward(req, resp);
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession(false);
        if (session==null||session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        showPage(req, resp, "dashboard.jsp");
    }

    private void handleRegister(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String fName = req.getParameter("firstName");
        String lName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        userService.register(fName, lName, email, pass);
        resp.sendRedirect(req.getContextPath() + "/admin/login?msg=registered");
    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        Optional<User> user = userService.login(email, pass);
        if (user.isPresent()) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user.get());
            List<Landmark> landmarks = landmarkService.getAllLandmarks();
            session.setAttribute("landmarks", landmarks);

            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/login?error=invalid");
        }
    }

    private void handleLogout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.getSession(false).invalidate();
        resp.sendRedirect(req.getContextPath() + "/admin/login");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email");
        if (userService.deleteAccount(email)) {

            HttpSession session=req.getSession(false);
            if(session!=null) session.invalidate();
            resp.sendRedirect(req.getContextPath() + "/admin/login?msg=deleted");
        }
    }
}