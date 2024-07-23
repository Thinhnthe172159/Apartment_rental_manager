/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package vn.fpt.edu.controller;

import vn.fpt.edu.dal.ApartmentDao;
import vn.fpt.edu.dal.ReportMaintenanceDao;
import vn.fpt.edu.dal.UserDao;
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
import java.util.Collection;
import java.sql.Date;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.ReportMaintain;
import vn.fpt.edu.model.User;

/**
 *
 * @author ASUS
 */
@MultipartConfig()
@WebServlet(name = "SendMaintenanceReport", urlPatterns = {"/SendMaintenanceReport"})
public class SendMaintenanceReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads";
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user_Data = (User) session.getAttribute("user_Data");

        if (user_Data == null) {
            request.getRequestDispatcher("Login").forward(request, response);
        }
        ApartmentDao apartmentDao = new ApartmentDao();
        String Apartment_id = request.getParameter("apartment_id");
        int apartment_id = (Apartment_id == null) ? 0 : Integer.parseInt(Apartment_id);
        Apartment a = apartmentDao.getApartment(apartment_id);
        request.setAttribute("Apartment", a);
        
        request.getRequestDispatcher("Send-Maintenance-Report.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int apartmentId = Integer.parseInt(request.getParameter("apartment_id"));
        int tenantId = Integer.parseInt(request.getParameter("tenant_id"));
        int landlordId = Integer.parseInt(request.getParameter("landlord_id"));
        String context = request.getParameter("context");
        String status = "1";
        Date datePost = new Date(System.currentTimeMillis());
        
        Part imagePart1 = request.getPart("image1");
        Part imagePart2 = request.getPart("image2");
        Part imagePart3 = request.getPart("image3");
        
        String path = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(path);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        String fileName1 = saveFile(imagePart1, path);
        String fileName2 = saveFile(imagePart2, path);
        String fileName3 = saveFile(imagePart3, path);
        
        ReportMaintenanceDao reportDao = new ReportMaintenanceDao();
        ApartmentDao apartmentDao = new ApartmentDao();
        UserDao userDao = new UserDao();
        ReportMaintain report = new ReportMaintain();
        Apartment Apartment = apartmentDao.getApartment(apartmentId);
        User landlord = userDao.getUser(landlordId);
        User tenant = userDao.getUser(tenantId);
        report.setApartmentId(Apartment);
        report.setTenantId(tenant);
        report.setLandlordId(landlord);
        report.setContext(context);
        report.setStatus(status);
        report.setDatePost(datePost);
        report.setImage1(fileName1);
        report.setImage2(fileName2);
        report.setImage3(fileName3);
        if (reportDao.addReport(report)) {
            session.setAttribute("messagesuccess", "Maintenance report sent successfully!");
            response.sendRedirect("AparmentListForTenant"); // Redirect to dashboard or appropriate page
        } else {
            session.setAttribute("messagedanger", "Failed to send maintenance report.");
            response.sendRedirect("AparmentListForTenant"); // Redirect to dashboard or appropriate page
        }
        
    }
    
    private String saveFile(Part part, String path) throws IOException {
        String fileName = "";
        if (part != null && part.getSize() > 0) {
            fileName = getFileName(part);
            String filePath = path + File.separator + fileName;
            part.write(filePath);
        }
        return fileName;
    }
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
}
