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
import java.time.LocalDateTime;
import model.Notification;
import model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "ResponseMessage", urlPatterns = {"/ResponseMessage"})
public class ResponseMessage extends HttpServlet {

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
            out.println("<title>Servlet ResponseMessage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResponseMessage at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        UserDao ud = new UserDao();
        NotificationDao nd = new NotificationDao();

        User user1 = (User) session.getAttribute("user_Data");
        String id_user = request.getParameter("userTo");
        User user2 = ud.getUser((id_user == null || id_user.isEmpty()) ? 0 : Integer.parseInt(id_user));

        String resp = request.getParameter("send");
        String mess = request.getParameter("description");
        Notification notification = new Notification();
        notification.setFrom_user_id(user1);
        notification.setTo_user_id(user2);
        String title = "";

        if (resp.equals("Đồng ý và gửi mẫu hợp đồng")) {
            title = "Yêu cầu của bạn đã được chấp nhận";
            notification.setTitle(title);
            notification.setMessage(mess+"<br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang điền <a href=\"Contract.jsp\">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br>");
        }
        if (resp.equals("Từ chối yêu cầu")) {
            title = "Yêu cầu của bạn đã bị hủy";
            notification.setTitle(title);
            notification.setMessage(mess);
        }
        LocalDateTime now = LocalDateTime.now();
        notification.setTime(now);
        notification.setStatus(1);
        nd.addNotification(notification);
        util.Email.sendEmail(user2.getEmail(), title, mess);
        response.sendRedirect("NotificationList");
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
