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
import java.util.List;
import model.Apartment_Post;
import model.Apartment_type;

/**
 *
 * @author thinh
 */
@WebServlet(name = "ApartmentPostList", urlPatterns = {"/ApartmentPostList"})
public class ApartmentPostList extends HttpServlet {

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
            out.println("<title>Servlet ApartmentPostList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApartmentPostList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ApartmentDao apartmentDao = new ApartmentDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        String apartment_name = request.getParameter("name");
        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String moneyUp = request.getParameter("moneyUp");
        String moneyDown = request.getParameter("moneyDown");
        String numberOfBedroom = request.getParameter("bedroom");
        String areaUp = request.getParameter("areaUp");
        String areaDown = request.getParameter("areaDown");
        String type_raw = request.getParameter("type");
        String apartment_type = request.getParameter("apartmentType");
        List<Apartment_type> apartment_types_list = apartmentDao.getApartment_type_list();
        request.setAttribute("apartment_types_list", apartment_types_list);
        try {

            List<Apartment_Post> apartmentPostList = apartmentPostDao.getApartment_Post_List(apartment_name,
                     tinh,
                     quan,
                     phuong,
                     (areaUp == null) ? 0 : Double.parseDouble(areaUp),
                     (areaDown == null) ? 0 : Double.parseDouble(areaDown),
                     (moneyUp == null) ? 0 : Double.parseDouble(moneyUp),
                     (moneyDown == null) ? 0 : Double.parseDouble(moneyDown),
                     (numberOfBedroom == null) ? 0 : Integer.parseInt(numberOfBedroom),
                     (apartment_type == null) ? 0 : Integer.parseInt(apartment_type),
                     (type_raw == null) ? 0 : Integer.parseInt(type_raw), 1);
            request.setAttribute("apartmentPostList", apartmentPostList);
            
        } catch (NumberFormatException e) {

        }
        request.getRequestDispatcher("ApartmentPostList.jsp").forward(request, response);
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
