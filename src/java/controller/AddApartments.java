/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ApartmentDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Collection;
import java.util.List;
import model.Apartment;
import model.Apartment_room;
import model.Apartment_type;
import model.Payment_method;
import model.Property;
import model.User;

/**
 *
 * @author thinh
 */
@MultipartConfig()
@WebServlet(name = "addApartment", urlPatterns = {"/addApartment"})

public class AddApartments extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet addApartment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addApartment at " + request.getContextPath() + "</h1>");
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

        request.getRequestDispatcher("AddApartment.jsp").forward(request, response);
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
        UserDao userDao = new UserDao();

        String name_apartment = request.getParameter("name_apartment");
        String apartment_type = request.getParameter("apartment_type");
        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String address = request.getParameter("address");
        String price = request.getParameter("price");
        String area = request.getParameter("area");
        String number_of_bedroom = request.getParameter("number_of_bedroom");

        Apartment_type at = apartmentDao.getApartment_type((apartment_type == null) ? 0 : Integer.parseInt(apartment_type));
        Apartment apartment = new Apartment();

        apartment.setName(name_apartment);
        apartment.setType_id(at);
        apartment.setCity(tinh);
        apartment.setDistrict(quan);
        apartment.setCommune(phuong);
        apartment.setAddress(address);
        apartment.setPrice((price == null) ? 0 : Double.parseDouble(price));
        apartment.setNumber_of_bedroom((number_of_bedroom == null) ? 0 : Integer.parseInt(number_of_bedroom));
        apartment.setArea((area == null) ? 0 : Double.parseDouble(area));

        User landlord = userDao.getUser(2);
        apartment.setLandLord_id(landlord);
        apartment.setTenant_id(landlord);
        apartmentDao.insertApartment(apartment);

        String[] property = request.getParameterValues("property");
        
        PrintWriter out = response.getWriter();
        Apartment ap = apartmentDao.getLatedApartment();
        out.print(ap);
        for (String item : property) {
            out.println(item);
            apartmentDao.input_ApartApartment_room(ap.getId(),Integer.parseInt(item));
        }
        // Get the absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // Construct the directory path to save the uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Create the directory if it does not exist
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        StringBuilder fileNames = new StringBuilder();

        // Get all parts from the request (images)
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            // Get the submitted file name
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // Save the file to the specified directory
                part.write(uploadFilePath + File.separator + fileName);
                fileNames.append(fileName).append(" ");
            }
        }

        // Respond with the names of the uploaded files
        response.setContentType("text/plain");
        response.getWriter().write("Files uploaded successfully: " + fileNames.toString());

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
