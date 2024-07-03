package util;

import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

public class Email {
    // Email: tungletest1.email@gmail.com
    // Password: nebeekfipcstxcox

    static final String from = "thinhnthe172159@fpt.edu.vn";
    static final String password = "zfuhgagukkwewwth";

    public static boolean sendEmail(String to, String tieuDe, String noiDung) {
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(tieuDe,"UTF-8");

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))
            // Nội dung
            msg.setContent(noiDung, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
       // test chế độ spam
        for (int i = 0; i < 10; i++) {
            Email.sendEmail("nguyenhung080803@gmail.com", "tống tiền", "<h1>tài khoản ngân hàng của bạn đã bị đóng băng, vui lòng liên hệ với Thịnh Nguyễn để được lừa cho phát nữa</h1><br>  <img src=\"https://scontent.fhan18-1.fna.fbcdn.net/v/t39.30808-1/196873988_1200725220371047_4855568514694370533_n.jpg?stp=dst-jpg_s200x200&_nc_cat=103&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeF2cI-akk1a261p8Tt1XqFrRnlgbNFQbBtGeWBs0VBsG0lYwTicInqcWknyb0EGz9jGYQRTUcwdPPbO-2L_Z7xz&_nc_ohc=csVGZEskzocQ7kNvgHm5D2a&_nc_ht=scontent.fhan18-1.fna&oh=00_AYDCZ3l4SnWvobUm5HpOr-n-LBDISbhlaPqKRe81Ou0_xA&oe=6683815D\" alt=\"\"> Đây chỉ là mail test cho cái hệ thống thôi ");
        }

    }

}
