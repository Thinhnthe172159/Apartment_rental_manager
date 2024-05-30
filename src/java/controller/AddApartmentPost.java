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
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Payment_method;
import model.User;
import java.time.LocalDate;

import model.Apartment_image;

/**
 *
 * @author thinh
 */
@WebServlet(name = "AddApartmentPost", urlPatterns = {"/AddApartmentPost"})
public class AddApartmentPost extends HttpServlet {

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
            out.println("<title>Servlet AddApartmentPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddApartmentPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApartmentDao apartmentDao = new ApartmentDao();
        List<Apartment> apartmentList = apartmentDao.getApartmentList(0);
        List<Payment_method> payment_methodsList = apartmentDao.getPayment_method_list();
        request.setAttribute("apartmentList", apartmentList);
        request.setAttribute("payment_methodsList", payment_methodsList);
        int page = 3;
        request.setAttribute("page", page);
        request.getRequestDispatcher("AddApartmentPost.jsp").forward(request, response);
    }

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
        String submit = request.getParameter("submit");

        Apartment_Post ap = new Apartment_Post();
        ap.setTitle(title);
        ap.setDescription(description);
        Apartment a = apartmentDao.getApartment((apartment_id == null) ? 0 : Integer.parseInt(apartment_id));
        ap.setApartment_id(a);
        Payment_method pm = apartmentDao.getPayment_method((payment_id == null) ? 0 : Integer.parseInt(payment_id));
        ap.setPayment_id(pm);
        User user = userDao.getUser(a.getLandLord_id().getId());
        ap.setLandlord_id(user);
        Apartment_image ai = apartmentDao.get_First_Apartment_Post(a.getId());
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
        List<Apartment_image> imageList = apartmentDao.getAllApartmentList(a.getId());
        ap.setTotal_image(imageList.size());
        if (submit.equals("Đăng Bài")) {
            ap.setPost_status(1);
            LocalDate currentDate = LocalDate.now();
            Date sqlDate = Date.valueOf(currentDate);
            ap.setPost_start(sqlDate);
            currentDate = currentDate.plusWeeks(pm.getWeek());
            Date sqlDate1 = Date.valueOf(currentDate);
            ap.setPost_end(sqlDate1);
        }
        apartmentPostDao.addApartmentPost(ap);
        response.sendRedirect("HomePage");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
