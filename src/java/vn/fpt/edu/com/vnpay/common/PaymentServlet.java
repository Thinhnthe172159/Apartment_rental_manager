package vn.fpt.edu.com.vnpay.common;

import vn.fpt.edu.dal.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import vn.fpt.edu.model.User;
import vn.fpt.edu.util.Email;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDao userDao = new UserDao();
        User u = (User) session.getAttribute("user_Data");
        Email email = new Email();

        Set<String> processedTransactions = (Set<String>) session.getAttribute("processedTransactions");
        if (processedTransactions == null) {
            processedTransactions = new HashSet<>();
            session.setAttribute("processedTransactions", processedTransactions);
        }

        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        fields.remove("vnp_SecureHashType");
        fields.remove("vnp_SecureHash");
        String signValue = Config.hashAllFields(fields);

        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                String transactionId = request.getParameter("vnp_TxnRef");
                String moneyStr = request.getParameter("vnp_Amount");
                long money = Integer.parseInt(moneyStr) / 100;

                if (!processedTransactions.contains(transactionId)) {

                    if (money >= 20000000) {
                        u.setMoney(u.getMoney() + (money + 2900000));
                    } else if (money >= 10000000) {
                        u.setMoney(u.getMoney() + (money + 1800000));
                    } else if (money >= 5000000) {
                        u.setMoney(u.getMoney() + (money + 900000));
                    } else if (money >= 2000000) {
                        u.setMoney(u.getMoney() + (money + 300000));
                    } else if (money >= 50000 && money < 2000000) {
                        u.setMoney(u.getMoney() + money);
                    }

                    userDao.UserMoneyChange(u);

                    processedTransactions.add(transactionId);
                    vn.fpt.edu.util.Email.sendEmail(u.getEmail(), "Cảm ơn Quý khách đã sử dụng dịch vụ đăng bài của Easy rentals", "<h3>Kính gửi anh/chị "+u.getFirst_name()+" "+u.getLast_name()+"</h3><br>"
                            + "Chúng tôi xin chân thành cảm ơn Quý khách đã lựa chọn và sử dụng dịch vụ đăng bài của Easy_rentals<br>"
                            + "Chúng tôi rất vui mừng thông báo rằng chúng tôi đã nhận được thanh toán của Quý khách cho dịch vụ này<br><br>"
                            + "Sự tin tưởng và ủng hộ của Quý khách là nguồn động viên lớn đối với chúng tôi. Chúng tôi cam kết <br>"
                            + "sẽ nỗ lực hết mình để mang lại cho Quý khách những dịch vụ chất lượng và hiệu quả nhất.<br><br>"
                            + "Nếu Quý khách có bất kỳ thắc mắc hoặc cần hỗ trợ thêm, xin vui lòng liên hệ với chúng tôi qua 0987654321<br>"
                            + "hoặc email hỗ trợ thinhnthe172159@fpt.edu.vn .Chúng tôi luôn sẵn sàng phục vụ Quý khách.<br><br>"
                            + "Một lần nữa, xin chân thành cảm ơn Quý khách.<br><br>"
                            + "Trân trọng,<br><br>"
                            + "Thông tin giao dịch:<br>"
                            + "Người gửi:"+u.getFirst_name()+" "+u.getLast_name()+"<br>"
                            + "Số tiền thanh toán :"+money+".<br>"
                            + "<iframe src=\"https://drive.google.com/file/d/1O-2SjrxTmVxWRcHUnad12m5QrDZ0hixC/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>");

                    request.setAttribute("message", "a");
                } else {
                    request.setAttribute("message", "Transaction has already been processed.");
                }
            } else {
                request.setAttribute("message", "b");
            }
            request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
        } else {
            response.getWriter().print("invalid signature");
        }
    }
}
