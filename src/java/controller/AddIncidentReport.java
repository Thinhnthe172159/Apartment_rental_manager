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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Incident;
import model.User;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author vumin
 */
@WebServlet(name = "AddIncidentReport", urlPatterns = {"/addincidentreport"})
public class AddIncidentReport extends HttpServlet {

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
        String tenantId = request.getParameter("tenant_id");
        String landlordId = request.getParameter("landlord_id");
        String context = request.getParameter("context");
        String image = request.getParameter("image");
        String status = request.getParameter("status");
        String dateStr = request.getParameter("date");

        try {
            User tenant = userDao.getUser(Integer.parseInt(tenantId));
            User landlord = userDao.getUser(Integer.parseInt(landlordId));
            Date date = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            Incident report = new Incident(0, tenant, landlord, context, image, status, new java.sql.Date(date.getTime()));
            incidentReportDao.addIncidentReport(report);

            request.setAttribute("successMessage", "Incident report added successfully!");
            request.getRequestDispatcher("ListIncident.jsp").forward(request, response);
        }catch (SQLException | ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("addIncidentReport.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
