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
import model.Apartment;
import model.Apartment_image;
import model.Apartment_properties;

/**
 *
 * @author thinh
 */
@WebServlet(name="ViewApartmentDetail", urlPatterns={"/ViewApartmentDetail"})
public class ViewApartmentDetail extends HttpServlet {
   
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
            out.println("<title>Servlet ViewApartmentDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewApartmentDetail at " + request.getContextPath () + "</h1>");
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
        ApartmentDao ad = new ApartmentDao();
        String Apartment_id = request.getParameter("apartment_id");
        Apartment a ;
        try{
            a = ad.getApartment((Apartment_id == null || Apartment_id.isEmpty())?0:Integer.parseInt(Apartment_id));
            List<Apartment_image> apartment_images = ad.getAllApartmentImageList(a.getId());
            List<Apartment_properties>apartment_propertieses = ad.get_apartment_properties_list_by_id(a.getId());
            request.setAttribute("apartment_images", apartment_images);
            request.setAttribute("apartment_propertieses_list", apartment_propertieses);
            request.setAttribute("Apartment", a);
            request.getRequestDispatcher("ApartmentDetai.jsp").forward(request, response);
        }catch(NumberFormatException e){
            
        }
                
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
