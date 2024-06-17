/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ApartmentDao;
import dal.ApartmentPostDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Apartment_image;
import model.Payment_method;
import model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "UpdateApartmentPost", urlPatterns = {"/UpdateApartmentPost"})
public class UpdateApartmentPost extends HttpServlet {

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
            out.println("<title>Servlet UpdateApartmentPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateApartmentPost at " + request.getContextPath() + "</h1>");
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
        // xử lý phần user

        //
        ApartmentPostDao apd = new ApartmentPostDao();
        ApartmentDao ad = new ApartmentDao();
        String apartmentPostId = request.getParameter("post_id");
        Apartment_Post post = apd.getApartment_Post((apartmentPostId == null || apartmentPostId.isEmpty()) ? 0 : Integer.parseInt(apartmentPostId));
        List<Apartment> apartments_list = ad.getApartmentList(0);
        List<Payment_method> payment_methods_list = ad.getPayment_method_list();

        Date sqlDate = post.getPost_start();

        request.setAttribute("post_start", sqlDate);
        request.setAttribute("post", post);
        request.setAttribute("payment_methods_list", payment_methods_list);
        request.setAttribute("apartmentList", apartments_list);
        request.getRequestDispatcher("UpdateApartmentPost.jsp").forward(request, response);
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
        ApartmentDao apartmentDao = new ApartmentDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        UserDao userDao = new UserDao();

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String apartment_id = request.getParameter("apartment");
        String payment_id = request.getParameter("payment_method");
        String post = request.getParameter("post");
        String week_raw = request.getParameter("week");
        String postStart = request.getParameter("Post_start");
        String postEnd = request.getParameter("Post_end");
        String submit = request.getParameter("submit");

        int week = (week_raw == null || week_raw.isEmpty()) ? 0 : Integer.parseInt(week_raw);

        Apartment_Post ap = apartmentPostDao.getApartment_Post((post == null || post.isEmpty()) ? 0 : Integer.parseInt(post));
        ap.setTitle(title);
        ap.setDescription(description);
        Apartment a = apartmentDao.getApartment((apartment_id == null) ? 0 : Integer.parseInt(apartment_id));
        ap.setApartment_id(a);
        Payment_method pm = apartmentDao.getPayment_method((payment_id == null) ? 0 : Integer.parseInt(payment_id));
        ap.setPayment_id(pm);
        User user = userDao.getUser(a.getLandLord_id().getId());
        ap.setLandlord_id(user);
        Apartment_image ai = apartmentDao.get_First_Apartment_Image(a.getId());
        if (ai != null) {
            ap.setFirst_image(ai.getImage());
        }
        ap.setCity(a.getCity());
        ap.setDistrict(a.getDistrict());
        ap.setCommune(a.getCommune());
        ap.setArea(a.getArea());
        ap.setPrice(a.getPrice());
        ap.setNumber_of_bedroom(a.getNumber_of_bedroom());
        ap.setApartment_type(a.getType_id());
        ap.setApartment_name(a.getName());
        List<Apartment_image> imageList = apartmentDao.getAllApartmentImageList(a.getId());
        ap.setTotal_image(imageList.size());

        Date post_Start, post_End;
        if (week != 0) {
            post_End = Date.valueOf(postEnd);
            post_Start = Date.valueOf(postStart);
            ap.setPost_start(post_Start);
            ap.setPost_end(post_End);
            ap.setWeek(week);
            ap.setPaid_for_post(pm.getPrice() * week);
        } else {
            ap.setPost_start(ap.getPost_start());
            ap.setPost_end(ap.getPost_end());
            ap.setPaid_for_post(ap.getPaid_for_post());
            ap.setWeek(ap.getWeek());
        }
        
       
        if (submit.equals("Cập Nhật")) {
            ap.setPost_status(ap.getPost_status());
        } else {
            ap.setPost_status(2);
        }

        apartmentPostDao.updateApartmentPost(ap, ap.getId());
        response.sendRedirect("ApartmentPostForLandlord");

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
