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
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Payment_method;
import model.User;

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
        HttpSession session = request.getSession();

        User user_Data = (User) session.getAttribute("user_Data");

        if (user_Data == null) {
            request.getRequestDispatcher("Login").forward(request, response);
        }
        ApartmentDao apartmentDao = new ApartmentDao();
        List<Apartment> apartmentList = apartmentDao.getApartmentList(user_Data.getId());
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
        HttpSession session = request.getSession();
        ApartmentDao apartmentDao = new ApartmentDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        UserDao userDao = new UserDao();
        User user_Data;
        user_Data = (User) session.getAttribute("user_Data");

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String apartment_id = request.getParameter("apartment");
        String payment_id = request.getParameter("payment_method");
        String submit = request.getParameter("submit");
        String week_raw = request.getParameter("week");
        String postStart = request.getParameter("Post_start");
        String postEnd = request.getParameter("Post_end");

        int week = (week_raw == null || week_raw.isEmpty()) ? 0 : Integer.parseInt(week_raw);

        Apartment_Post ap = new Apartment_Post();
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
        if (submit.equals("Đăng Bài")) {
            if (user_Data.getMoney() >= (pm.getPrice()*week)) {
                Date PostStart = Date.valueOf(postStart);
                Date PostEnd = Date.valueOf(postEnd);
                ap.setPost_end(PostEnd);
                ap.setPost_start(PostStart);
                ap.setWeek(week);
                ap.setPaid_for_post(pm.getPrice() * week);
                ap.setPost_status(2);
                double money = user_Data.getMoney() - ap.getPaid_for_post();
                user_Data.setMoney(money);
                userDao.UserMoneyChange(user_Data);
                session.setAttribute("message", "a");
            }

            if (user_Data.getMoney() < (pm.getPrice()*week)) {
                ap.setPost_status(1);
                session.setAttribute("message", "b");
            }
            
        } else {
            ap.setPost_status(1);
            session.setAttribute("message", "c");

        }
        apartmentPostDao.addApartmentPost(ap);
        request.getRequestDispatcher("ApartmentPostForLandlord").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
