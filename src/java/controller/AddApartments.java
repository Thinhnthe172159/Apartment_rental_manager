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
import model.Apartment_image;
import model.Apartment_type;
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
        
        int page = 3;
        request.setAttribute("page", page);

        request.getRequestDispatcher("AddApartment.jsp").forward(request, response);
    }

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
        if (property !=null) {
            for (String item : property) {
                 out.print(item);
                 apartmentDao.input_ApartApartment_properties(ap.getId(),Integer.parseInt(item));
            }
        }

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        Collection<Part> parts = request.getParts();
        Apartment_image ai;
        for (Part part : parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                fileName = ap.getId()+"_"+ap.getLandLord_id().getId()+"_"+fileName;
                part.write(uploadFilePath + File.separator + fileName);
                ai = new Apartment_image(0, fileName, ap);
                apartmentDao.insertApartmentImage(ai);
            }
        }
        response.sendRedirect("HomePage");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
