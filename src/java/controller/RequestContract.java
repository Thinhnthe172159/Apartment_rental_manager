/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ApartmentDao;
import dal.ApartmentPostDao;
import dal.NotificationDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Apartment;
import model.Notification;
import model.User;
import util.Email;

/**
 *
 * @author thinh
 */
@WebServlet(name = "RequestContract", urlPatterns = {"/RequestContract"})
public class RequestContract extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RequestContract</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestContract at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NotificationDao nd = new NotificationDao();
        ApartmentDao apd = new ApartmentDao();
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
        } 

            String apartment_id_raw = request.getParameter("apartment_id");
            String post_id = request.getParameter("apartment_post_id");

            int apartment_id = (apartment_id_raw == null || apartment_id_raw.isEmpty()) ? 0 : Integer.parseInt(apartment_id_raw);
            Apartment apartment = apd.getApartment(apartment_id);
            String status_ap = "";
            if (apartment.getStatus_apartment() == 1) {
                status_ap = "Chưa có người thuê";
            }
            if (apartment.getStatus_apartment() == 2) {
                status_ap = "Đã có người thuê";
            }

            String message = "     <table border=\"" + 1 + "\">\n"
                    + "                            <thead>\n"
                    + "                                <tr>\n"
                    + "                                    <th>Tên căn hộ</th>\n"
                    + "                                    <th>Trạng Thái</th>\n"
                    + "                                    <th>Link bài đăng</th>\n"
                    + "                                </tr>\n"
                    + "                            </thead>\n"
                    + "                            <tbody>\n"
                    + "                                <tr>\n"
                    + "                                    <td>" + apartment.getName() + "</td>\n"
                    + "                                    <td>" + status_ap + "</td>\n"
                    + "                                    <td><a href=" + "http://localhost:9999/SWP391_Apartment_rental_management_system/ApartmentDetail?Apartment_id=" + apartment_id + "&apartment_post_id=" + post_id + ">link bài đăng</a></td>\n"
                    + "                                </tr>\n"
                    + "                            </tbody>\n"
                    + "                        </table><br>"
                    + "Người gửi yêu cầu : " + user.getFirst_name() + " " + user.getLast_name();
            String title = "Yêu hợp đồng từ khách hàng";
            LocalDateTime dateTime = LocalDateTime.now();
            int status = 1;
            User ToUser = apartment.getLandLord_id();

            Notification notification = new Notification(0, user, ToUser, message, title, status, dateTime);
            nd.addNotification(notification);
            Email.sendEmail(ToUser.getEmail(), title, message);
            response.sendRedirect("ApartmentDetail?Apartment_id=" + apartment_id + "&apartment_post_id=" + post_id);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
