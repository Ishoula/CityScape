package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Landmark;
import repository.LandmarkRepoImpl;
import service.LandmarkService;
import service.LandmarkServiceImpl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import Enum.Category;

@WebServlet("/landmark/*")
@MultipartConfig(
        fileSizeThreshold = 1024*1024*2,
        maxFileSize = 1024*1024*10,
        maxRequestSize = 1024*1024*50
)
public class LandmarkController extends HttpServlet {

    private LandmarkService landmarkService;

    @Override
    public void init() {
        landmarkService = new LandmarkServiceImpl(new LandmarkRepoImpl());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getPathInfo();

        if (action == null || action.equals("/")) {
            res.sendRedirect(req.getContextPath() + "/landmark/listLandmarks");
            return;
        }

        switch (action) {
            case "/listLandmarks"      -> listLandmarks(req, res);
            case "/newLandmark"       -> showNewForm(req, res);
            case "/editLandmark"      -> showEditForm(req, res);
            case "/deleteLandmark"    -> handleDelete(req, res);
            case "/category"  -> listByCategory(req, res);
            default -> res.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getPathInfo();

        switch (action) {
            case "/insertLandmark" -> handleInsert(req, res);
            case "/updateLandmark" -> handleUpdate(req, res);
            default -> res.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
    }

    private void showPage(HttpServletRequest req, HttpServletResponse res, String jsp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/" + jsp).forward(req, res);
    }

    private void listLandmarks(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Landmark> landmarks = landmarkService.getAllLandmarks();
        req.setAttribute("landmarks", landmarks);

        showPage(req, res, "home.jsp");
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setAttribute("categories", Category.values());
        showPage(req, res, "newLandmark.jsp");
    }

    private void handleInsert(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String folderPath = "C:\\Users\\HP\\Documents\\Business\\cityScapeUploads";

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String latitude = req.getParameter("latitude");
        String longitude = req.getParameter("longitude");
        Category category = Category.valueOf(req.getParameter("category"));

        Part filePart = req.getPart("imageFile");
        String fileName = Paths.get(filePart.getSubmittedFileName())
                .getFileName()
                .toString();

        File uploads = new File(folderPath);
        if (!uploads.exists()) uploads.mkdir();

        String filePath = folderPath + File.separator + fileName;
        filePart.write(filePath);

        Landmark landmark = new Landmark(
                name, category, description, latitude, longitude, fileName
        );

        landmarkService.registerLandmark(landmark);

        res.sendRedirect(req.getContextPath() + "/landmark/listLandmarks");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        Optional<Landmark> landmark = landmarkService.getLandmarkById(id);

        req.setAttribute("landmark", landmark.orElse(null));
        req.setAttribute("categories", Category.values());

        showPage(req, res, "editLandmark.jsp");
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        Landmark landmark = new Landmark(
                id,
                req.getParameter("name"),
                Category.valueOf(req.getParameter("category")),
                req.getParameter("description"),
                req.getParameter("latitude"),
                req.getParameter("longitude")
        );

        landmarkService.updateLandmark(landmark);

        res.sendRedirect(req.getContextPath() + "/landmark/listLandmarks");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        landmarkService.deleteLandmark(id);

        res.sendRedirect(req.getContextPath() + "/landmark/listLandmarks");
    }

    private void listByCategory(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Category category = Category.valueOf(req.getParameter("category"));
        List<Landmark> landmarks = landmarkService.getLandmarksByCategory(category);

        req.setAttribute("landmarks", landmarks);

        showPage(req, res, "home.jsp");
    }
}