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
        PrintWriter out = response.getWriter();
        ApartmentDao apartmentDao = new ApartmentDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();

        String title_name = request.getParameter("name");
        String apartment_type = request.getParameter("apartmentType");
        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String moneyUp = request.getParameter("moneyUp");
        String moneyDown = request.getParameter("moneyDown");
        String numberOfBedroom = request.getParameter("bedroom");
        String areaUp = request.getParameter("areaUp");
        String areaDown = request.getParameter("areaDown");
        String type_raw = request.getParameter("type");

        List<Apartment_type> apartment_types_list = apartmentDao.getApartment_type_list();
        request.setAttribute("apartment_types_list", apartment_types_list);

        int Apartment_type, bedroom, type_sort;
        double priceUp, priceDown, area_up, area_down;
        List<Apartment_Post> apartmentPostList = new ArrayList<>();

        try {
            Apartment_type = (apartment_type == null || apartment_type.isEmpty()) ? 0 : Integer.parseInt(apartment_type);
            bedroom = (numberOfBedroom == null || numberOfBedroom.isEmpty()) ? 0 : Integer.parseInt(numberOfBedroom);
            type_sort = (type_raw == null || type_raw.isEmpty()) ? 0 : Integer.parseInt(type_raw);
            priceUp = (moneyUp == null || moneyUp.isEmpty()) ? 0 : Double.parseDouble(moneyUp);
            priceDown = (moneyDown == null || moneyDown.isEmpty()) ? 0 : Double.parseDouble(moneyDown);
            area_up = (areaUp == null || areaUp.isEmpty()) ? 0 : Double.parseDouble(areaUp);
            area_down = (areaDown == null || areaDown.isEmpty()) ? 0 : Double.parseDouble(areaDown);
            apartmentPostList = apartmentPostDao.getApartment_Post_List((title_name == null||title_name.isEmpty())?null:title_name,
                    (tinh == null||tinh.isEmpty())?null:tinh,
                    (quan == null||quan.isEmpty())?null:quan,
                    (phuong == null||phuong.isEmpty())?null:phuong,
                    area_up, area_down, priceUp, priceDown, bedroom, Apartment_type, type_sort, 1);
            request.setAttribute("apartmentPostList", apartmentPostList);

        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        int page = 2;
        request.setAttribute("page", page);
        request.getRequestDispatcher("ApartmentPostList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
