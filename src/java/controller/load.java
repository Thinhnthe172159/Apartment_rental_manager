/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.ApartmentDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Apartment_type;
import model.Property;

/**
 *
 * @author thinh
 */
@WebServlet(name="load", urlPatterns={"/load"})
public class load extends HttpServlet {
   
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
            out.println("<title>Servlet load</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet load at " + request.getContextPath () + "</h1>");
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
        List<Apartment_type> apartment_types_list = apartmentDao.getApartment_type_list();
        List<Property> propertys_List_livingroom = apartmentDao.getPropertyList(1);
        List<Property> propertys_List_bedroom = apartmentDao.getPropertyList(2);
        List<Property> propertys_List_bathroom = apartmentDao.getPropertyList(3);
        List<Property> propertys_List_kitchen = apartmentDao.getPropertyList(4);
        
        request.setAttribute("apartment_types_list", apartment_types_list);
        request.setAttribute("propertys_List_livingroom", propertys_List_livingroom);
        request.setAttribute("propertys_List_bedroom", propertys_List_bedroom);
        request.setAttribute("propertys_List_bathroom", propertys_List_bathroom);
        request.setAttribute("propertys_List_kitchen", propertys_List_kitchen);
        
        request.getRequestDispatcher("postApartment.jsp").forward(request, response);
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
