/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Collection;
import vn.fpt.edu.dal.ApartmentDao;
import vn.fpt.edu.dal.ContractDao;
import vn.fpt.edu.dal.NotificationDao;
import vn.fpt.edu.dal.UserDao;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.Apartment_image;
import vn.fpt.edu.model.Contract;
import vn.fpt.edu.model.Notification;
import vn.fpt.edu.model.User;

/**
 *
 * @author thinh
 */
@MultipartConfig()
@WebServlet(name = "Contract", urlPatterns = {"/AddContract"})
public class AddContract extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "contract";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Contract</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Contract at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ApartmentDao ad = new ApartmentDao();
        UserDao ud = new UserDao();

        User user = (User) session.getAttribute("user_Data");

        String landlord = request.getParameter("landlord_id");
        String apartment = request.getParameter("apartment");
        String noti = request.getParameter("notification");
      


       
        try {
            request.setAttribute("notification", noti);
            request.setAttribute("apartment", apartment);
            request.setAttribute("landlord", landlord);
        } catch (NumberFormatException e) {

        }
        if (user == null) {
           response.sendRedirect("Login");
        }
        if (user != null) {
            request.getRequestDispatcher("Contract.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        ApartmentDao ad = new ApartmentDao();
        UserDao ud = new UserDao();
        ContractDao cd = new ContractDao();
        NotificationDao nd = new NotificationDao();

        User tenant = (User) session.getAttribute("user_Data");
        if (tenant == null) {
            request.getRequestDispatcher("Login").forward(request, response);
            return;
        }

        String notifi_id = request.getParameter("notification");

        int notifiId = (notifi_id == null || notifi_id.isEmpty()) ? 0 : Integer.parseInt(notifi_id);

        String landlord_id = request.getParameter("landlord_id");
        String apartmentId = request.getParameter("apartmentId");
        String phone = request.getParameter("phone");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String commune = request.getParameter("commune");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        String cccd = request.getParameter("cccd");
        String current_living = request.getParameter("current_living");
        String dob = request.getParameter("dob");
        String cccd_receive_date = request.getParameter("cccd_receive_date");
        String office_name = request.getParameter("office_name");

        // Upload image
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part customerAvatarFile = request.getPart("customer-avatar-file");
        String customerAvatarFileName = handleFileUpload(customerAvatarFile, uploadDir);
        Part idFrontFile = request.getPart("id-front-file");
        String idFrontFileName = handleFileUpload(idFrontFile, uploadDir);
        Part idBackFile = request.getPart("id-back-file");
        String idBackFileName = handleFileUpload(idBackFile, uploadDir);
        
        int ap_id = (apartmentId == null || apartmentId.isEmpty()) ? 0 : Integer.parseInt(apartmentId);

        User landlord = ud.getUser((landlord_id == null) ? 0 : Integer.parseInt(landlord_id));
        Apartment apartment = ad.getApartment(ap_id);

        Date dateOfBirth = Date.valueOf(dob);
        Date releasedCccdDate = Date.valueOf(cccd_receive_date);
        LocalDate now = LocalDate.now();
        Date sign_date = Date.valueOf(now);
//        out.print(ap_id);
//        out.print(apartment);
        Contract contract = new Contract(0, tenant, landlord, apartment, 1, phone, full_name, email, city, district, commune, address, note, cccd, current_living, UPLOAD_DIR + "/" + customerAvatarFileName, UPLOAD_DIR + "/" + idFrontFileName, UPLOAD_DIR + "/" + idBackFileName, dateOfBirth, releasedCccdDate, office_name, sign_date);
        cd.addContract(contract);

        Notification notification = nd.getNotification(notifiId);
        notification.setMessage("<br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang <a href=\"#\">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là<br> đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br><br> Hợp đồng đã được gửi đến chủ nhà và chờ họ phản hồi lại");
        nd.updateNotification(notification);

        request.setAttribute("contract", contract);

        request.getRequestDispatcher("contractDetail.jsp").forward(request, response);
    }

    private String handleFileUpload(Part filePart, File uploadDir) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            File file = new File(uploadDir, fileName);
            filePart.write(file.getAbsolutePath());
            return fileName;
        }
        return null;
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
