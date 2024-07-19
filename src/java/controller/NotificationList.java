/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.NotificationDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Notification;
import model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "NotificationList", urlPatterns = {"/NotificationList"})
public class NotificationList extends HttpServlet {

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
            out.println("<title>Servlet NotificationList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NotificationList at " + request.getContextPath() + "</h1>");
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
        NotificationDao nd = new NotificationDao();
        HttpSession session = request.getSession();
        String notification = request.getParameter("notification_id");
        String search = request.getParameter("search");

        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
        } else {
            int id = (notification == null || notification.isEmpty()) ? 0 : Integer.parseInt(notification);
            Notification notification1 = nd.getNotification(id);
            if (notification1 != null) {
                notification1.setStatus(2);
                nd.updateNotification(notification1);
            }

            List<Notification> notificationList = nd.getListNotificationList(user.getId(), search);

            if (search != null) { // Handle AJAX request
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                for (Notification no : notificationList) {
                    out.println("<a class='d-flex align-items-center p-2 text-white mb-2 rounded cursor-pointer' href='NotificationList?notification_id=" + no.getId() + "' style='background: #221fc49c;text-decoration: none;'>");
                    out.println("<img class='rounded-circle me-2' src='" + no.getFrom_user_id().getImage() + "' alt='User profile picture' style='width: 40px; height: 40px;' />");
                    out.println("<div class='flex-grow-1'>");
                    out.println("<div class=''>" + no.getFrom_user_id().getFirst_name() + " " + no.getFrom_user_id().getLast_name() + "</div>");
                    out.println("<div>");
                    out.println("<h2 class='h6 '>" + no.getTitle() + "</div>");
                    out.println("<p class='formatted-time text-white' data-datetime='" + no.getTime() + "'></p>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</a>");
                }
                return;
            }

            request.setAttribute("notification", notification1);
            request.setAttribute("notificationList", notificationList);
            request.getRequestDispatcher("notificationList.jsp").forward(request, response);
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
