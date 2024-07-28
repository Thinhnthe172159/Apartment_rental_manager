/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.ReportMaintenanceDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.model.ReportMaintain;
import vn.fpt.edu.model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LandLordDashboardEditMaintenanceReport", urlPatterns = {"/LandLordDashboardEditMaintenanceReport"})
public class LandLordDashboardEditMaintenanceReport extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user_Data = (User) session.getAttribute("user_Data");

        if (user_Data == null) {
            request.getRequestDispatcher("Login").forward(request, response);
        }

        int reportId = Integer.parseInt(request.getParameter("rmId"));
        ReportMaintenanceDao dao = new ReportMaintenanceDao();
        ReportMaintain report = dao.getReportById(reportId);
        request.setAttribute("report", report);
        request.getRequestDispatcher("LandLordDashboardEditMaintenanceReport.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        int reportId = Integer.parseInt(request.getParameter("reportId"));
        int newStatus = Integer.parseInt(request.getParameter("newStatus"));
        ReportMaintenanceDao dao = new ReportMaintenanceDao();
        ReportMaintain report = dao.getReportById(reportId);

        if (dao.updateReportStatus(reportId, newStatus)) {
            String messageSuccess = String.format("The request of %s %s lives at %s posted on %s changed to %s",
                    report.getTenantId().getFirst_name(),
                    report.getTenantId().getLast_name(),
                    report.getApartmentId().getName(),
                    report.getDatePost(),
                    getStatusString(newStatus));
            if (newStatus == 4) {
                session.setAttribute("messagepostponed", messageSuccess);
            } else {
                session.setAttribute("messagesuccess", messageSuccess);
            }
        } else {
            session.setAttribute("messagedanger", "Change status fail!");
        }
        response.sendRedirect("LandLordDashboardMaintenanceReports");
    }

    private String getStatusString(int status) {
        switch (status) {
            case 1:
                return "Pending";
            case 2:
                return "In-progress";
            case 3:
                return "Done";
            case 4:
                return "Postponed";
            default:
                return "Unknown";
        }
    }
}
