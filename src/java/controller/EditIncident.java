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
            request.setAttribute("incident", incident);
            request.getRequestDispatcher("EditIncident.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error Message", "An error occurred while retrieving the incident report");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String context = request.getParameter("context");
            String status = request.getParameter("status");
            String dateStr = request.getParameter("date");

            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            Incident incident = incidentReportDao.getIncidentReport(id);
            incident.setContext(context);
            incident.setStatus(status);
            incident.setDate((java.sql.Date) date);
            incidentReportDao.updateIncidentReport(incident);
            request.setAttribute("Success Message", "Incident Report update successfully !!");
            response.sendRedirect("listincident");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the incident report.");
            request.getRequestDispatcher("EditIncident.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
