package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;

@WebServlet("/uploads/*")
public class UploadsServlet extends HttpServlet {

    private static final String UPLOADS_DIR = "C:\\Users\\HP\\Documents\\Business\\cityScapeUploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/") || pathInfo.isBlank()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String fileName = pathInfo.startsWith("/") ? pathInfo.substring(1) : pathInfo;

        if (fileName.contains("..") || fileName.contains("/") || fileName.contains("\\")) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        File file = new File(UPLOADS_DIR, fileName);
        if (!file.exists() || !file.isFile()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String mimeType = getServletContext().getMimeType(file.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        resp.setContentType(mimeType);
        resp.setContentLengthLong(file.length());

        try (InputStream in = Files.newInputStream(file.toPath());
             OutputStream out = resp.getOutputStream()) {
            in.transferTo(out);
        }
    }
}
