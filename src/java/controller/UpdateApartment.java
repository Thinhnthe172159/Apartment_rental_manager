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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Apartment_image;
import model.Apartment_properties;
import model.Apartment_type;
import model.Property;
import model.User;

/**
 *
 * @author thinh
 */
@MultipartConfig()
@WebServlet(name = "UpdateApartment", urlPatterns = {"/UpdateApartment"})
public class UpdateApartment extends HttpServlet {

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
            out.println("<title>Servlet UpdateApartment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateApartment at " + request.getContextPath() + "</h1>");
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
        ApartmentDao ad = new ApartmentDao();
        List<Apartment_type> apartment_types_list = ad.getApartment_type_list();
        String ap_id = request.getParameter("apartment_id");
        int ap_Id = (ap_id == null || ap_id.isEmpty()) ? 0 : Integer.parseInt(ap_id);
        Apartment ap = ad.getApartment(ap_Id);
        List<Apartment_image> apartment_images_list = ad.getAllApartmentImageList(ap_Id);
        List<Apartment_properties> apartment_propertieses_list = ad.get_apartment_properties_list_by_id(ap_Id);
        List<Property> propertys_List_livingroom = ad.getPropertyList(1);
        List<Property> propertys_List_bedroom = ad.getPropertyList(2);
        List<Property> propertys_List_bathroom = ad.getPropertyList(3);
        List<Property> propertys_List_kitchen = ad.getPropertyList(4);
        request.setAttribute("propertys_List_livingroom", propertys_List_livingroom);
        request.setAttribute("propertys_List_bedroom", propertys_List_bedroom);
        request.setAttribute("propertys_List_bathroom", propertys_List_bathroom);
        request.setAttribute("propertys_List_kitchen", propertys_List_kitchen);
        request.setAttribute("apartment_images_list", apartment_images_list);
        request.setAttribute("apartment", ap);
        request.setAttribute("apartment_propertieses_list", apartment_propertieses_list);
        request.setAttribute("apartment_types_list", apartment_types_list);
        request.getRequestDispatcher("UpdateApartment.jsp").forward(request, response);
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

        HttpSession session = request.getSession();

        User user_Data = (User) session.getAttribute("user_Data");

        String apartment_id_raw = request.getParameter("apartment_id");
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

        User landlord = userDao.getUser(user_Data.getId());
        apartment.setLandLord_id(landlord);
        apartment.setTenant_id(landlord);
        apartmentDao.updateApartment(apartment, (apartment_id_raw == null || apartment_id_raw.isEmpty()) ? 0 : Integer.parseInt(apartment_id_raw));

        String[] image_remove = request.getParameterValues("delete_image");

        List<Apartment_image> imageToDelete = new ArrayList<>();
        if (image_remove != null) {
            for (String imageDelete : image_remove) {
                Apartment_image apartment_image = apartmentDao.getApartmentImage(Integer.parseInt(imageDelete));
                imageToDelete.add(apartment_image);

            }
        }

        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + "uploads";
        for (Apartment_image image : imageToDelete) {
            File file = new File(uploadFilePath + File.separator + image.getImage());
            if (file.exists()) {
                file.delete();
            }
        }
        if (image_remove != null) {
            for (String imageDelete : image_remove) {
                apartmentDao.deleteImageById(Integer.parseInt(imageDelete));

            }
        }

        String[] property = request.getParameterValues("property");
        apartmentDao.deleteApartmentProperties(Integer.parseInt(apartment_id_raw));
        if (property != null) {
            for (String item : property) {
                apartmentDao.input_ApartApartment_properties(Integer.parseInt(apartment_id_raw), Integer.parseInt(item));
            }
        }

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        Apartment ap = apartmentDao.getApartment(Integer.parseInt(apartment_id_raw));
        Collection<Part> parts = request.getParts();
        Apartment_image ai;
        for (Part part : parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                fileName = ap.getId() + "_" + ap.getLandLord_id().getId() + "_" + fileName;
                part.write(uploadFilePath + File.separator + fileName);
                ai = new Apartment_image(0, fileName, ap);
                apartmentDao.insertApartmentImage(ai);
            }
        }
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        Apartment_Post post = new Apartment_Post();
        post.setApartment_id(ap);
        landlord = ap.getLandLord_id();
        post.setLandlord_id(landlord);
        Apartment_image ap_image = apartmentDao.get_First_Apartment_Image(ap.getId());
        post.setFirst_image(ap_image.getImage());
        post.setCity(ap.getCity());
        post.setDistrict(ap.getDistrict());
        post.setCommune(ap.getCommune());
        post.setNumber_of_bedroom(ap.getNumber_of_bedroom());
        post.setArea(ap.getArea());
        post.setApartment_name(ap.getName());
        post.setPrice(ap.getPrice());
        Apartment_type ap_type = ap.getType_id();
        post.setApartment_type(ap_type);
        post.setTotal_image(apartmentDao.getAllApartmentImageList(ap.getId()).size());
        apartmentPostDao.updateApartmentPostByApartmentId(post, ap.getId());

        response.sendRedirect("AparmentListForLandlord");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
