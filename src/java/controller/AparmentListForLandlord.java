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
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import model.Apartment;
import model.Apartment_image;
import model.Apartment_type;

/**
 *
 * @author thinh
 */
@WebServlet(name = "AparmentListForLandlord", urlPatterns = {"/AparmentListForLandlord"})
public class AparmentListForLandlord extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

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
            out.println("<title>Servlet AparmentListForLandlord</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AparmentListForLandlord at " + request.getContextPath() + "</h1>");
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
        String page_index = request.getParameter("page_index");
        int pageIndex = (page_index == null || page_index.isEmpty()) ? 1 : Integer.parseInt(page_index);
        int pageSize = 6;
        int totalSize = apartmentDao.getApartmentListSize(2, null, 0, null, null, null);
        int totalPages = (int) Math.ceil((double) totalSize / pageSize);
        List<Apartment_type> apartment_types_list = apartmentDao.getApartment_type_list();
        List<Integer> pagelist = new ArrayList<>();
        for (int i = 1; i <= totalPages; i++) {
            pagelist.add(i);
        }
        List<Apartment> apartmentList = apartmentDao.getApartmentList(2, null, 0, null, null, null, pageIndex, pageSize);
        request.setAttribute("apartmentList", apartmentList);
        request.setAttribute("pagelist", pagelist);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("apartment_types_list", apartment_types_list);
        request.getRequestDispatcher("ApartmentListForLandlord.jsp").forward(request, response);
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
        ApartmentDao ad = new ApartmentDao();
        String id = request.getParameter("remove_id");
        int apartmentId = (id == null || id.isEmpty()) ? 0 : Integer.parseInt(id);

        // Retrieve the list of images before deleting the apartment
        List<Apartment_image> apartment_images_List = ad.getAllApartmentImageList(apartmentId);

        // Delete images from the filesystem
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        for (Apartment_image image : apartment_images_List) {
            File file = new File(uploadFilePath + File.separator + image.getImage());
            if (file.exists()) {
                file.delete();
            }
        }

        // Delete the apartment and its images from the database
        ad.removeApartment(apartmentId);

        response.sendRedirect("AparmentListForLandlord");
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
