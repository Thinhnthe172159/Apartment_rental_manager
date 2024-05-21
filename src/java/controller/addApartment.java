/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ApartmentDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Apartment;
import model.Apartment_type;

/**
 *
 * @author thinh
 */
public class addApartment extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet addApartment</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addApartment at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ApartmentDao apartmentDao = new ApartmentDao();
        String name_apartment = request.getParameter("name_apartment");
        String apartment_type = request.getParameter("apartment_type");
        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String address = request.getParameter("address");
        String price = request.getParameter("price");
        String area = request.getParameter("area");
        String number_of_bedroom = request.getParameter("number_of_bedroom");
        String title = request.getParameter("title");
        String describe = request.getParameter("describe");
        String image = request.getParameter("image");
        Apartment_type at = apartmentDao.getApartment_type((apartment_type == null)?0:Integer.parseInt(apartment_type));
        Apartment apartment = new Apartment();
        apartment.setName(name_apartment);
        apartment.setType_id(at);
        apartment.setCity(tinh);
        apartment.setDistrict(quan);
        apartment.setCommune(phuong);
        apartment.setAddress(address);
        apartment.setPrice((price == null)?0:Double.parseDouble(price));
        apartment.setNumber_of_bedroom((number_of_bedroom == null)?0:Integer.parseInt(number_of_bedroom));
        
        
        String []property = request.getParameterValues("property");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
