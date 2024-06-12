/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import dal.IncidentReportDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import model.Incident;
import java.sql.SQLException;

/**
 *
 * @author vumin
 */
@WebServlet(name = "EditIncident", urlPatterns = {"/editincident"})
public class EditIncident extends HttpServlet {

    private IncidentReportDao incidentReportDao;

    public void init() throws ServletException {
        incidentReportDao = new IncidentReportDao(new DBContext());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditIncident</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditIncident at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int incidentId = Integer.parseInt(request.getParameter("id"));
        try {
            Incident incident = incidentReportDao.getIncidentReport(incidentId);
            if (incident != null) {
                request.setAttribute("incident", incident);
                request.getRequestDispatcher("EditIncident.jsp").forward(request, response);
            } else {
                request.setAttribute("Error Message", "Incident not found.");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("Error Message", "Database error occurred while retrieving the incident.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("Error Message", "Invalid incident ID.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int incidentId = Integer.parseInt(request.getParameter("id"));
        String context = request.getParameter("context");
        String image = request.getParameter("image");
        String status = request.getParameter("status");
        String dateStr = request.getParameter("date");

        try {
            Incident incident = incidentReportDao.getIncidentReport(incidentId);
            if (incident != null) {
                incident.setId(incidentId);
                incident.setContext(context);
                incident.setImage(image);
                incident.setStatus(status);
                incident.setDate(new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(dateStr).getTime()));
                incidentReportDao.updateIncidentReport(incident);

                request.setAttribute("Success Message", "Incident report updated successfully!");
                response.sendRedirect("listincident");
            } else {
                request.setAttribute("Error Message", "Incident not found.");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("Error Message", "Database error occurred while updating the incident.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error Message", "An error occurred. Please try again.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
