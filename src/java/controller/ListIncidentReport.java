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
import java.util.List;
import model.Incident;
import java.sql.SQLException;

/**
 *
 * @author vumin
 */
@WebServlet(name = "ListIncidentReport", urlPatterns = {"/listincidentreport"})
public class ListIncidentReport extends HttpServlet {

    private IncidentReportDao incidentReportDao;

    public ListIncidentReport() {
        // Initialize the IncidentReportDao with a DBContext instance
        DBContext dbContext = new DBContext();
        incidentReportDao = new IncidentReportDao(dbContext);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetIncidentReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetIncidentReportServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set default pageNo and pageSize if not provided
        int pageNo = 1;
        int pageSize = 5; // Change this to the desired page size

        // Parse pageNo and pageSize from request parameters if provided
        if (request.getParameter("pageNo") != null) {
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }

        try {
            // Get the paginated incident reports
            List<Incident> incidentList = incidentReportDao.getPaginatedIncidentReports(pageNo, pageSize);
            int totalIncidents = incidentReportDao.getTotalIncidentCount();
            int totalPages = (int) Math.ceil((double) totalIncidents / pageSize);

            // Set the incidents and pagination details in request attributes
            request.setAttribute("incidentList", incidentList);
            request.setAttribute("currentPage", pageNo);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("pageSize", pageSize);

            // Forward to the JSP page to display the incidents
            request.getRequestDispatcher("ListIncident.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving the incident reports.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
