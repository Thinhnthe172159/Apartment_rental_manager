/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ApartmentDao;
import dal.ApartmentPostDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Apartment_image;
import model.Apartment_properties;

/**
 *
 * @author thinh
 */
@WebServlet(name = "ApartmentDetail", urlPatterns = {"/ApartmentDetail"})
public class ApartmentDetail extends HttpServlet {

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
            out.println("<title>Servlet ApartmentDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApartmentDetail at " + request.getContextPath() + "</h1>");
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
        ApartmentDao apartmentDao = new ApartmentDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        String Apartment_id = request.getParameter("Apartment_id");
        String apartment_post_id = request.getParameter("apartment_post_id");
        List<Apartment_image> apartment_images_list = new ArrayList<>();
        List<Apartment_properties> apartment_propertieses_list = new ArrayList<>();
        List<Apartment_Post> apartment_Posts_popular = apartmentPostDao.getApartment_Post_List(null, null, null, null, 0, 0, 0, 0, 0, 0, 0, 0, 1, 10, 4);

        int apartment_id;
        int apartmentPost_id;

        try {
            apartment_id = (Apartment_id == null) ? 0 : Integer.parseInt(Apartment_id);
            apartmentPost_id = (apartment_post_id == null) ? 0 : Integer.parseInt(apartment_post_id);
            apartment_images_list = apartmentDao.getAllApartmentImageList(apartment_id);
            apartment_propertieses_list = apartmentDao.get_apartment_properties_list_by_id(apartment_id);
            Apartment_Post apartment_Post = apartmentPostDao.getApartment_Post(apartmentPost_id);
            Apartment a = apartmentDao.getApartment(apartment_id);
            List<Apartment_Post> apartment_Post_nearby_list = apartmentPostDao.getApartment_Post_List(null, a.getCity(), null, null, 0, 0, 0, 0, 0, 0, 0, 1, 1, 10, 0);
            int page = 2;
            request.setAttribute("page", page);
            request.setAttribute("Apartment", a);
            request.setAttribute("apartment_Post", apartment_Post);
            request.setAttribute("apartment_Posts_popular", apartment_Posts_popular);
            request.setAttribute("apartment_propertieses_list", apartment_propertieses_list);
            request.setAttribute("apartment_images_list", apartment_images_list);
            request.setAttribute("apartment_Post_nearby_list", apartment_Post_nearby_list);
            request.getRequestDispatcher("ApartmentDetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }



}
