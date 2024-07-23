/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.ApartmentDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.Apartment_image;
import vn.fpt.edu.model.Apartment_type;
import vn.fpt.edu.model.User;

@WebServlet(name = "AparmentListForTenant", urlPatterns = {"/AparmentListForTenant"})
public class AparmentListForTenant extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user_Data = (User) session.getAttribute("user_Data");

        if (user_Data == null) {
            request.getRequestDispatcher("Login").forward(request, response);
        }

        String successMessage = (String) session.getAttribute("messagesuccess");
        String errorMessage = (String) session.getAttribute("messagedanger");
        if (successMessage != null) {
            request.setAttribute("messagesuccess", successMessage);
            session.removeAttribute("messagesuccess");
        }
        if (errorMessage != null) {
            request.setAttribute("messagedanger", errorMessage);
            session.removeAttribute("messagedanger");
        }

        ApartmentDao apartmentDao = new ApartmentDao();
        String page_index = request.getParameter("page_index");
        String name = request.getParameter("name");
        String Apartment_type_raw = request.getParameter("Apartment_type");
        String status_raw = request.getParameter("status");
        String city = request.getParameter("tinh");
        String district = request.getParameter("quan");
        String commune = request.getParameter("phuong");
        String names = (name == null || name.isEmpty()) ? null : name;
        String tinh = (city == null || city.isEmpty()) ? null : city;
        String quan = (district == null || district.isEmpty()) ? null : district;
        String huyen = (commune == null || commune.isEmpty()) ? null : commune;

        int pageIndex = (page_index == null || page_index.isEmpty()) ? 1 : Integer.parseInt(page_index);
        int pageSize = 6;
        int totalSize = apartmentDao.getApartmentListSize(user_Data.getId(), names, (Apartment_type_raw == null || Apartment_type_raw.isEmpty()) ? 0 : Integer.parseInt(Apartment_type_raw), tinh, quan, huyen, (status_raw == null || status_raw.isEmpty()) ? 0 : Integer.parseInt(status_raw));
        int totalPages = (int) Math.ceil((double) totalSize / pageSize);
        List<Apartment_type> apartment_types_list = apartmentDao.getApartment_type_list();
        List<Integer> pagelist = new ArrayList<>();
        for (int i = 1; i <= totalPages; i++) {
            pagelist.add(i);
        }
        List<Apartment> apartmentList = apartmentDao.getApartmentListForTenant(user_Data.getId(), names, (Apartment_type_raw == null || Apartment_type_raw.isEmpty()) ? 0 : Integer.parseInt(Apartment_type_raw), tinh, quan, huyen, (status_raw == null || status_raw.isEmpty()) ? 0 : Integer.parseInt(status_raw), pageIndex, pageSize);
        request.setAttribute("apartmentList", apartmentList);
        request.setAttribute("name", names);
        request.setAttribute("Apartment_type", Apartment_type_raw);
        request.setAttribute("pagelist", pagelist);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("apartment_types_list", (Apartment_type_raw == null || Apartment_type_raw.isEmpty()) ? 0 : Integer.parseInt(Apartment_type_raw));
        request.setAttribute("status", (status_raw == null || status_raw.isEmpty()) ? 0 : Integer.parseInt(status_raw));
        request.setAttribute("tinh", tinh);
        request.setAttribute("quan", quan);
        request.setAttribute("phuong", huyen);
        request.setAttribute("apartment_types_list", apartment_types_list);
        request.getRequestDispatcher("ApartmentListForTenant.jsp").forward(request, response);
    }

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

        response.sendRedirect("AparmentListForTenant");
    }
}
