package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Address;
import model.Landmark;
import repository.LandmarkRepoImpl;
import service.LandmarkService;
import service.LandmarkServiceImpl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import Enum.*;

@WebServlet("/landmark/*")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,       // 10MB
        maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class LandmarkController extends HttpServlet {

    private LandmarkService landmarkService;
    // Externalize the path for easier maintenance
    private final String UPLOAD_DIRECTORY = "C:\\Users\\HP\\Documents\\Business\\cityScapeUploads";

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
            case "/listLandmarks"   -> listLandmarks(req, res);
            case "/newLandmark"    -> showNewForm(req, res);
            case "/editLandmark"   -> showEditForm(req, res);
            case "/deleteLandmark" -> handleDelete(req, res);
            case "/category"       -> listByCategory(req, res);
            case "/city"           -> listByCity(req, res);
            case "/province"       -> listByProvince(req, res);
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
        req.setAttribute("cities", City.values());
        req.setAttribute("provinces", Province.values());
        showPage(req, res, "newLandmark.jsp");
    }

    private void handleInsert(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // 1. Process File Upload
        Part filePart = req.getPart("imageFile");
        String fileName = "default.jpg"; // fallback

        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            File uploads = new File(UPLOAD_DIRECTORY);
            if (!uploads.exists()) uploads.mkdirs();
            filePart.write(UPLOAD_DIRECTORY + File.separator + fileName);
        }

        // 2. Map Address (Embedded)
        Address address = new Address(
                City.valueOf(req.getParameter("city")),
                Province.valueOf(req.getParameter("province")),
                req.getParameter("village"),
                req.getParameter("latitude"),
                req.getParameter("longitude")
        );

        // 3. Create Landmark
        Landmark landmark = new Landmark(
                req.getParameter("name"),
                Category.valueOf(req.getParameter("category")),
                req.getParameter("description"),
                fileName,
                address
        );

        landmarkService.registerLandmark(landmark);
        res.sendRedirect(req.getContextPath() + "/landmark/listLandmarks");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Optional<Landmark> landmark = landmarkService.getLandmarkById(id);

        if (landmark.isPresent()) {
            req.setAttribute("landmark", landmark.get());
            req.setAttribute("categories", Category.values());
            req.setAttribute("cities", City.values());
            req.setAttribute("provinces", Province.values());
            showPage(req, res, "editLandmark.jsp");
        } else {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        int id = Integer.parseInt(req.getParameter("id"));

        // Retrieve existing to preserve data (like imagePath) if not changed
        Optional<Landmark> existingOpt = landmarkService.getLandmarkById(id);
        if (existingOpt.isEmpty()) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        Landmark landmark = existingOpt.get();

        // Update basic info
        landmark.setName(req.getParameter("name"));
        landmark.setDescription(req.getParameter("description"));
        landmark.setCategory(Category.valueOf(req.getParameter("category")));

        // Update Address object
        Address address = new Address(
                City.valueOf(req.getParameter("city")),
                Province.valueOf(req.getParameter("province")),
                req.getParameter("village"),
                req.getParameter("latitude"),
                req.getParameter("longitude")
        );
        landmark.setAddress(address);

        // Handle Image Update (only if a new file is uploaded)
        Part filePart = req.getPart("imageFile");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePart.write(UPLOAD_DIRECTORY + File.separator + fileName);
            landmark.setImageName(fileName);
        }

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

    private void listByCity(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        City city = City.valueOf(req.getParameter("city"));
        List<Landmark> landmarks = landmarkService.getLandmarksByCity(city);
        req.setAttribute("landmarks", landmarks);
        showPage(req, res, "home.jsp");
    }

    private void listByProvince(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Province province = Province.valueOf(req.getParameter("province"));
        List<Landmark> landmarks = landmarkService.getLandmarksByProvince(province);
        req.setAttribute("landmarks", landmarks);
        showPage(req, res, "home.jsp");
    }
}