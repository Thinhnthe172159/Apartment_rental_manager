/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import vn.fpt.edu.dal.ApartmentDao;
import vn.fpt.edu.dal.ContractDao;
import vn.fpt.edu.dal.NotificationDao;
import vn.fpt.edu.dal.UserDao;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.Contract;
import vn.fpt.edu.model.Notification;
import vn.fpt.edu.model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "ViewContractDetail", urlPatterns = {"/ViewContractDetail"})
public class ViewContractDetail extends HttpServlet {

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
            out.println("<title>Servlet ViewContractDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewContractDetail at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
            return;
        }
        ContractDao cd = new ContractDao();
        String contract_id = request.getParameter("contract_id");
        int id = (contract_id == null || contract_id.isEmpty()) ? 0 : Integer.parseInt(contract_id);
        Contract contract = cd.getContract(id);
        request.setAttribute("contract", contract);
        request.getRequestDispatcher("contractDetail.jsp").forward(request, response);
        
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
        NotificationDao nd = new NotificationDao();
        ContractDao cd = new ContractDao();
        ApartmentDao ad = new ApartmentDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
            return;
        }
        String message = request.getParameter("message");
        if (message == null) {
            message = null;
        }
        String action = request.getParameter("action");
        String contractId = request.getParameter("contract_id");
        int contract_id = (contractId == null || contractId.isEmpty()) ? 0 : Integer.parseInt(contractId);
        Contract contract = cd.getContract(contract_id);
        LocalDateTime now = LocalDateTime.now();
        Apartment apartment = contract.getApartment_id();
        User tenanUser = contract.getTenant_id();
        if (action.equals("1")) {
            User tUser = contract.getLandlord_id();
            sendNotification3(user, tUser, nd, now, message);
        }
        if (action.equals("2")) {
            contract.setStatus(3);
            sendNotification2(user, tenanUser, nd, now, message);
            apartment.setStatus_apartment(1);
            apartment.setTenant_id(null);
            ad.updateApartment2(apartment);
            cd.updateContract(contract);
        }
        if (action.equals("3")) {
            contract.setStatus(2);
            apartment.setStatus_apartment(2);
            sendNotification1(user, tenanUser, nd, now, message);
            cd.updateContract(contract);
            apartment.setTenant_id(tenanUser);
            ad.updateApartment2(apartment);
            
        }
        response.sendRedirect("contractList");
    }
    
    private void sendNotification1(User fromUser, User toUser, NotificationDao nd, LocalDateTime now, String message) {
        Notification n = new Notification();
        n.setFrom_user_id(fromUser);
        n.setTo_user_id(toUser);
        n.setStatus(1);
        n.setTitle("Phản hồi của chủ nhà về hợp đồng");
        if (message != null) {
            n.setMessage(message);
        }
        if (message == null) {
            n.setMessage("   <div style=\"font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px;\">\n"
                    + "        <div style=\"max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">\n"
                    + "            <h1 style=\"color: #333333;\">Thông báo cảm ơn</h1>\n"
                    + "            <p>Chào " + toUser.getFirst_name() + " " + toUser.getLast_name() + ",</p>\n"
                    + "            <p>Chúng tôi xin chân thành cảm ơn bạn đã hoàn thành hợp đồng thuê nhà. Sự tin tưởng và ủng hộ của bạn là nguồn động viên lớn đối với chúng tôi.</p>\n"
                    + "            <p>Chúng tôi hy vọng rằng bạn đã có một trải nghiệm sống tuyệt vời tại căn nhà của chúng tôi. Nếu bạn có bất kỳ phản hồi hoặc góp ý nào, vui lòng chia sẻ để chúng tôi có thể cải thiện dịch vụ tốt hơn nữa.</p>\n"
                    + "            <p>Rất mong sẽ được tiếp tục phục vụ bạn trong tương lai.</p>\n"
                    + "            <p>Trân trọng,</p>\n"
                    + "            <p>" + fromUser.getFirst_name() + " " + fromUser.getLast_name() + "</p>\n"
                    + "        </div>\n"
                    + "    </div>\n");
            message = n.getMessage();
        }
        n.setTime(now);
        nd.addNotification(n);
        vn.fpt.edu.util.Email.sendEmail(toUser.getEmail(), "Phản hồi của chủ nhà về hợp đồng", message);
    }
    
    private void sendNotification2(User fromUser, User toUser, NotificationDao nd, LocalDateTime now, String message) {
        Notification n = new Notification();
        n.setFrom_user_id(fromUser);
        n.setTo_user_id(toUser);
        n.setStatus(1);
        n.setTitle("Phản hồi của chủ nhà về hợp đồng");
        if (message != null) {
            n.setMessage(message);
        }
        if (message == null) {
            n.setMessage("<h2>Thông báo hợp đồng bị hủy<h2><br>Chúng tôi rất tiếc vì không thể tiếp nhận hợp đồng này, mong bạn thông cảm.");
            message = n.getMessage();
        }
        n.setTime(now);
        nd.addNotification(n);
        vn.fpt.edu.util.Email.sendEmail(toUser.getEmail(), "Phản hồi của chủ nhà về hợp đồng", message);
    }
    
    private void sendNotification3(User fromUser, User toUser, NotificationDao nd, LocalDateTime now, String message) {
        Notification n = new Notification();
        n.setFrom_user_id(fromUser);
        n.setTo_user_id(toUser);
        n.setStatus(1);
        n.setTitle("Yêu cầu kết thúc hợp đồng thuê nhà");
        if (message != null) {
            n.setMessage("<h2>Kết thúc hợp đồng thuê nhà<h2><br>" + message);
        }
        if (message == null) {
            n.setMessage("<h2>Yêu cầu kết thúc hợp đồng thuê nhà từ khách hàng " + fromUser.getFirst_name() + " " + fromUser.getLast_name() + "<h2><br>");
        }
        n.setTime(now);
        nd.addNotification(n);
        vn.fpt.edu.util.Email.sendEmail(toUser.getEmail(), "Phản hồi của chủ nhà về hợp đồng", message);
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
