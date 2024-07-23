package vn.fpt.edu.controller;

import vn.fpt.edu.dal.ApartmentDao;
import vn.fpt.edu.dal.ApartmentPostDao;
import vn.fpt.edu.dal.NotificationDao;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.Notification;
import vn.fpt.edu.model.User;
import vn.fpt.edu.util.Email;

@WebServlet(name = "RequestContract", urlPatterns = {"/RequestContract"})
public class RequestContract extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NotificationDao notificationDao = new NotificationDao();
        ApartmentDao apartmentDao = new ApartmentDao();
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
            return;
        }

        String apartmentIdRaw = request.getParameter("apartment_id");
        String postId = request.getParameter("apartment_post_id");

        int apartmentId = 0;
        try {
            apartmentId = Integer.parseInt(apartmentIdRaw);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid apartment ID");
            return;
        }

        Apartment apartment = apartmentDao.getApartment(apartmentId);
        if (apartment == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Apartment not found");
            return;
        }

       
        String title = "Yêu hợp đồng từ khách hàng";
        LocalDateTime dateTime = LocalDateTime.now();
        User toUser = apartment.getLandLord_id();

        Notification notification = new Notification(0, user, toUser, null, title, 1, dateTime);
        int mess = processNotification(notificationDao, notification, user, toUser, dateTime);
        
        Notification n = notificationDao.getNewestNotification(user.getId(), toUser.getId());
        n.setMessage(generateMessage( apartment, postId, user, n.getId()));
        notificationDao.updateNotification(n);
        response.sendRedirect("ApartmentDetail?Apartment_id=" + apartmentId + "&apartment_post_id=" + postId + "&mess=" + mess);
    }

    private String generateMessage(Apartment apartment, String postId, User user,int newNoti_id) {
        return "<table border=\"1\">"
                + "<thead>"
                + "<tr>"
                + "<th>Tên căn hộ được yêu cầu</th>"
                + "<th>Thông tin căn hộ</th>"
                + "<th>Link bài đăng</th>"
                + "</tr>"
                + "</thead>"
                + "<tbody>"
                + "<tr>"
                + "<td>" + apartment.getName() + "</td>"
                + "<td><a href=\"http://localhost:9999/SWP391_Apartment_rental_management_system/ViewApartmentDetail?apartment_id=" + apartment.getId() + "\">Thông tin căn hộ</a></td>"
                + "<td><a href=\"http://localhost:9999/SWP391_Apartment_rental_management_system/ApartmentDetail?Apartment_id=" + apartment.getId() + "&apartment_post_id=" + postId + "\">link bài đăng</a></td>"
                + "</tr>"
                + "</tbody>"
                + "</table><br>"
                + "Người gửi yêu cầu : " + user.getFirst_name() + " " + user.getLast_name() + "<br>"
                + "<form action=\"ResponseMessage\" method=\"post\">"
                + "<input hidden name=\"userTo\"  type=\"text\" value=\"" + user.getId() + "\">"
                + "  <textarea id=\"editor\" required=\"\" name=\"description\" class=\"form-control\" placeholder=\"Nhập phản hồi của bạn   \" cols=\"300\" rows=\"10\">\n"
                + "                              \n"
                + "                    </textarea>\n"
                + "\n"
                + "                    <script>\n"
                + "                        ClassicEditor\n"
                + "                                .create(document.querySelector('#editor'))\n"
                + "                                .catch(error => {\n"
                + "                                    console.error(error);\n"
                + "                                });\n"
                + "                    </script>"
                + "<input hidden name=\"notification_id\"  type=\"text\" value=\"" + newNoti_id +"\">"
                + "<span><input name=\"send\" class=\"btn btn-primary\" type=\"submit\" value=\"Đồng ý và gửi mẫu hợp đồng\"></span>"
                + "<span><input name=\"send\" class=\"btn btn-primary\" type=\"submit\" value=\"Từ chối yêu cầu\"></span>"
                + "</form>";
    }

    private int processNotification(NotificationDao notificationDao, Notification notification, User fromUser, User toUser, LocalDateTime currentDateTime) {
        Notification latestNotification = notificationDao.getNewestNotification(fromUser.getId(), toUser.getId());
        if (latestNotification != null) {
            Duration duration = Duration.between(latestNotification.getTime(), currentDateTime);
            if (duration.toHours() >= 1) {
                notificationDao.addNotification(notification);
                Email.sendEmail(toUser.getEmail(), notification.getTitle(), notification.getMessage());
                return 2;
            } else {
                return 1;
            }
        } else {
            notificationDao.addNotification(notification);
            Email.sendEmail(toUser.getEmail(), notification.getTitle(), notification.getMessage());
            return 2;
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles contract requests from users";
    }
}
