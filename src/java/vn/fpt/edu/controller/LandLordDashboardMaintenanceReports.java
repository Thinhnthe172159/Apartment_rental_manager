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
@WebServlet(name = "LandLordDashboardMaintenanceReports", urlPatterns = {"/LandLordDashboardMaintenanceReports"})
public class LandLordDashboardMaintenanceReports extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user_Data = (User) session.getAttribute("user_Data");

        if (user_Data == null) {
            request.getRequestDispatcher("Login").forward(request, response);
        }

        int landlordId = user_Data.getId();
        ReportMaintenanceDao dao = new ReportMaintenanceDao();
        List<ReportMaintain> reports = dao.getReportsForLandlord(landlordId);

        String successMessage = (String) session.getAttribute("messagesuccess");
        String errorMessage = (String) session.getAttribute("messagedanger");
        String postponedMessage = (String) session.getAttribute("messagepostponed");
        if (successMessage != null) {
            request.setAttribute("messagesuccess", successMessage);
            session.removeAttribute("messagesuccess");
        }
        if (errorMessage != null) {
            request.setAttribute("messagedanger", errorMessage);
            session.removeAttribute("messagedanger");
        }
        if (postponedMessage != null) {
            request.setAttribute("messagepostponed", postponedMessage);
            session.removeAttribute("messagepostponed");
        }
        request.setAttribute("report_List", reports);
        request.getRequestDispatcher("LandLordDashboardMaintenanceReports.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
