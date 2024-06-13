/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import dal.IncidentReportDao;
import dal.UserDao;
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
import java.sql.Date;
import model.Incident;
import model.User;
import java.sql.SQLException;

import java.time.LocalDate;
import java.util.Collection;

/**
 *
 * @author vumin
 */
@MultipartConfig()
@WebServlet(name = "AddIncidentReport", urlPatterns = {"/addincidentreport"})
public class AddIncidentReport extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "Incident_image";

    private IncidentReportDao incidentReportDao;
    private UserDao userDao;

    public void init() throws ServletException {
        DBContext dbContext = new DBContext();
        this.incidentReportDao = new IncidentReportDao(dbContext);
        this.userDao = new UserDao();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddIncidentReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddIncidentReportServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("AddIncidentReport.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String context = request.getParameter("context");
        try {
            User tenant = userDao.getUser(2);
            User landlord = userDao.getUser(2);

           

            Incident incident = new Incident();
            incident.setTenant_id(tenant);
            incident.setLandlord_id(landlord);
            incident.setContext(context);

            incident.setStatus(0);
            LocalDate localDate = LocalDate.now();
            Date datesql = Date.valueOf(localDate);
            incident.setDate(datesql);

            
            // Get the absolute path of the web application
            String applicationPath = request.getServletContext().getRealPath("");
            // Construct the directory path to save the uploaded file
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            // Create the directory if it does not exist
            File uploadDir = new File(uploadFilePath);
            String image;
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
                    
                    part.write(uploadFilePath + File.separator + fileName);
                    incident.setImage(fileName);
                    fileNames.append(fileName);
                }
            }
            
            incidentReportDao.addIncidentReport(incident);
            // Respond with the names of the uploaded files
            response.setContentType("text/plain");
            response.getWriter().write("Files uploaded successfully: " + fileNames.toString());
            //response.sendRedirect("listincidentreport");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred while adding the incident report");
            request.getRequestDispatcher("AddIncidentReport.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
