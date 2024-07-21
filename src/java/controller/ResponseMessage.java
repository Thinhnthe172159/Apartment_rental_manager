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
        String noti_id = request.getParameter("notification_id");

        int notification_id = (noti_id == null) ? 0 : Integer.parseInt(noti_id);
        String resp = request.getParameter("send");
        String mess = request.getParameter("description");
        Notification notification = new Notification();
        notification.setFrom_user_id(user1);
        notification.setTo_user_id(user2);
        String title = "";

        if (resp.equals("Đồng ý và gửi mẫu hợp đồng")) {
            title = "Yêu cầu của bạn đã được chấp nhận";
            notification.setTitle(title);
            notification.setMessage(mess + "<br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang <a href=\"Contract.jsp\">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là<br> đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br>");
        }
        if (resp.equals("Từ chối yêu cầu")) {
            title = "Yêu cầu của bạn đã bị hủy";
            notification.setTitle(title);
            notification.setMessage(mess);
        }
        Notification notification1 = nd.getNotification(notification_id);
        notification1.setMessage("<table border=\"1\"><thead><tr><th>Tên căn hộ được yêu cầu</th><th>Thông tin căn hộ</th><th>Link bài đăng</th></tr></thead><tbody><tr><td>nhà của thịnh 4</td><td><a href=\"http://localhost:9999/SWP391_Apartment_rental_management_system/ViewApartmentDetail?apartment_id=54\">Thông tin căn hộ</a></td><td><a href=\"http://localhost:9999/SWP391_Apartment_rental_management_system/ApartmentDetail?Apartment_id=54&apartment_post_id=37\">link bài đăng</a></td></tr></tbody></table><br>Người gửi yêu cầu : Nguyễn Hoàng Hưng<br><form action=\"ResponseMessage\" method=\"post\"><input hidden name=\"userTo\"  type=\"text\" value=\"13\">  <textarea id=\"editor\" required=\"\" name=\"description\" class=\"form-control\" placeholder=\"Nhập phản hồi của bạn   \" id=\"floatingTextarea2\"  cols=\"300\" rows=\"10\">\n"
                + "                              \n"
                + "                    </textarea>\n"
                + "\n"
                + "                    <script>\n"
                + "                        ClassicEditor\n"
                + "                                .create(document.querySelector('#editor'))\n"
                + "                                .catch(error => {\n"
                + "                                    console.error(error);\n"
                + "                                });\n"
                + "                    </script><br>Yêu cầu này đã được được phản hồi</form>");
        nd.updateNotification(notification1);
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
