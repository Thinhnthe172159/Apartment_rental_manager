/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.ApartmentDao;
import vn.fpt.edu.dal.ApartmentPostDao;
import vn.fpt.edu.dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.Apartment_Post;
import vn.fpt.edu.model.Apartment_image;
import vn.fpt.edu.model.Payment_method;
import vn.fpt.edu.model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "UpdateApartmentPost1", urlPatterns = {"/UpdateApartmentPost1"})
public class UpdateApartmentPost1 extends HttpServlet {

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
            out.println("<title>Servlet UpdateApartmentPost1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateApartmentPost1 at " + request.getContextPath() + "</h1>");
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

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String apartment_id = request.getParameter("apartment");
        String payment_id = request.getParameter("payment_method");
        String post_id = request.getParameter("post");
        String week_raw = request.getParameter("week");
        String submit = request.getParameter("submit");
        String post_start = request.getParameter("");

        int postId = (post_id == null || post_id.isEmpty()) ? 0 : Integer.parseInt(post_id);
        int apartmentId = (apartment_id == null) ? 0 : Integer.parseInt(apartment_id);
        int paymentMethodId = (payment_id == null) ? 0 : Integer.parseInt(payment_id);
        int week = (week_raw == null || week_raw.isEmpty()) ? 0 : Integer.parseInt(week_raw);

        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        ApartmentDao apartmentDao = new ApartmentDao();
        UserDao userDao = new UserDao();

        Apartment_Post ap = apartmentPostDao.getApartment_Post(postId);
        ap.setTitle(title);
        ap.setDescription(description);

        Apartment apartment = apartmentDao.getApartment(apartmentId);
        ap.setApartment_id(apartment);

        Payment_method paymentMethod = apartmentDao.getPayment_method(paymentMethodId);
        User user = userDao.getUser(apartment.getLandLord_id().getId());

        ap.setLandlord_id(user);
        Apartment_image firstImage = apartmentDao.get_First_Apartment_Image(apartmentId);
        if (firstImage != null) {
            ap.setFirst_image(firstImage.getImage());
        }

        ap.setCity(apartment.getCity());
        ap.setDistrict(apartment.getDistrict());
        ap.setCommune(apartment.getCommune());
        ap.setArea(apartment.getArea());
        ap.setPrice(apartment.getPrice());
        ap.setNumber_of_bedroom(apartment.getNumber_of_bedroom());
        ap.setApartment_type(apartment.getType_id());
        ap.setApartment_name(apartment.getName());
        
        int check = -1;
        
        List<Apartment_image> imageList = apartmentDao.getAllApartmentImageList(apartmentId);
        ap.setTotal_image(imageList.size());

        if (week != 0 && !"Cập Nhật".equals(submit)) {
           check = processPayment(ap, paymentMethod, week, user, session, request);
        } else {
            check = 0;
            session.setAttribute("message", "d");// chỉ thông báo là đã cập nhật thành công mà không trừ đi khoản tiền vốn có của user
        }

        if ("Cập Nhật".equals(submit)) {
            ap.setPost_start(null);
            ap.setPost_end(null);
            ap.setWeek(0);
            ap.setPost_status(1);
        } else {
            if(check == 1){
              ap.setPost_status(2);  
            }else{
               ap.setPost_status(1);
            }
            
        }

        apartmentPostDao.updateApartmentPost(ap, ap.getId());
        request.getRequestDispatcher("ApartmentPostForLandlord").forward(request, response);
    }

    private int processPayment(Apartment_Post ap, Payment_method paymentMethod, int week, User user, HttpSession session, HttpServletRequest request) {
        UserDao userDao = new UserDao();
        double currentPayment = ap.getPaid_for_post();
        double newPayment = paymentMethod.getPrice() * week;

        if (user.getMoney() < newPayment) {
            session.setAttribute("message", "b");
            return 0;
        } else {
            ap.setPaid_for_post(currentPayment + newPayment);
            user.setMoney(user.getMoney() - newPayment);
            userDao.UserMoneyChange(user);

            session.setAttribute("user_Data", user);
            session.setAttribute("message", "a");

            ap.setPost_start(Date.valueOf(request.getParameter("Post_start")));
            ap.setPost_end(Date.valueOf(request.getParameter("Post_end")));
            ap.setWeek(week);
            ap.setPayment_id(paymentMethod);
            return 1;
        }
        
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
