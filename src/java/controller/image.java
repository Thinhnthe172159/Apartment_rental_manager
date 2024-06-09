/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Collection;

/**
 *
 * @author thinh
 */
@MultipartConfig()
@WebServlet(name = "image", urlPatterns = {"/image"})
public class image extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet image</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet image at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // Construct the directory path to save the uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Create the directory if it does not exist
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        StringBuilder fileNames = new StringBuilder();

        // Get all parts from the request (images)
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            // Get the submitted file name
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // Save the file to the specified directory
                part.write(uploadFilePath + File.separator +"thinh"+ fileName);
                fileNames.append(fileName).append(" ");
            }
        }

        // Respond with the names of the uploaded files
        response.setContentType("text/plain");
        response.getWriter().write("Files uploaded successfully: " + fileNames.toString());
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
