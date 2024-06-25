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
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Apartment_Post;
import model.Apartment_type;
import model.Payment_method;
import model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "ApartmentPostForLandlord", urlPatterns = {"/ApartmentPostForLandlord"})
public class ApartmentPostListForLandlord extends HttpServlet {

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
            out.println("<title>Servlet ApartmentPostForLandlord</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApartmentPostForLandlord at " + request.getContextPath() + "</h1>");
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
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        HttpSession session = request.getSession();
        String message = (String) session.getAttribute("message");

        session.removeAttribute("message");
        // get user using session 
        User user_Data = (User) session.getAttribute("user_Data");

        if (user_Data == null) {
            request.getRequestDispatcher("Login").forward(request, response);
        }

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
        String page_index = request.getParameter("page_index");
        String status_raw = request.getParameter("status");
        String post_type_raw = request.getParameter("post_type");

        int post_type = (post_type_raw == null || post_type_raw.isEmpty()) ? 0 : Integer.parseInt(post_type_raw);
        int Apartment_type = (apartment_type == null || apartment_type.isEmpty()) ? 0 : Integer.parseInt(apartment_type);
        int bedroom = (numberOfBedroom == null || numberOfBedroom.isEmpty()) ? 0 : Integer.parseInt(numberOfBedroom);
        int type_sort = (type_raw == null || type_raw.isEmpty()) ? 0 : Integer.parseInt(type_raw);
        double priceUp = (moneyUp == null || moneyUp.isEmpty()) ? 0 : Double.parseDouble(moneyUp) * 1000000;
        double priceDown = (moneyDown == null || moneyDown.isEmpty()) ? 0 : Double.parseDouble(moneyDown) * 1000000;
        double area_up = (areaUp == null || areaUp.isEmpty()) ? 0 : Double.parseDouble(areaUp);
        double area_down = (areaDown == null || areaDown.isEmpty()) ? 0 : Double.parseDouble(areaDown);
        int pageIndex = (page_index == null || page_index.isEmpty()) ? 1 : Integer.parseInt(page_index);
        int status = (status_raw == null || status_raw.isEmpty()) ? 0 : Integer.parseInt(status_raw);
        List<Payment_method> payment_methods_list = apartmentDao.getPayment_method_list();
        List<Apartment_type> apartment_types_list = apartmentDao.getApartment_type_list();
        //list
        request.setAttribute("apartment_types_list", apartment_types_list);
        request.setAttribute("payment_methods_list", payment_methods_list);

        int totalSize = apartmentPostDao.getApartmentPostSize(
                (title_name == null || title_name.isEmpty()) ? null : title_name,
                (tinh == null || tinh.isEmpty()) ? null : tinh,
                (quan == null || quan.isEmpty()) ? null : quan,
                (phuong == null || phuong.isEmpty()) ? null : phuong,
                area_up, area_down, priceUp, priceDown, bedroom, Apartment_type, status,
                user_Data.getId(), post_type, null);
        int pageSize = 6;
        int totalPages = (int) Math.ceil((double) totalSize / pageSize);
        List<Integer> pagelist = new ArrayList<>();
        for (int i = 1; i <= totalPages; i++) {
            pagelist.add(i);
        }

        LocalDate today = LocalDate.now();
        Date current = Date.valueOf(today);

        List<Apartment_Post> apartment_Posts = apartmentPostDao.getAllByLandlordId(user_Data.getId(), current);
        
        Apartment_Post ap_status = new Apartment_Post();
        for(Apartment_Post apost:apartment_Posts){
            ap_status = apost;
            ap_status.setPost_status(4);
            apartmentPostDao.updateApartmentPost(ap_status, ap_status.getId());
        }

        List<Apartment_Post> apartmentPostList = apartmentPostDao.getApartment_Post_List2(
                (title_name == null || title_name.isEmpty()) ? null : title_name,
                (tinh == null || tinh.isEmpty()) ? null : tinh,
                (quan == null || quan.isEmpty()) ? null : quan,
                (phuong == null || phuong.isEmpty()) ? null : phuong,
                area_up, area_down, priceUp, priceDown, bedroom, Apartment_type, type_sort, status, pageIndex, pageSize, post_type, user_Data.getId()
        );

        request.setAttribute("post_type", post_type);
        request.setAttribute("pageList", pagelist);
        request.setAttribute("apartmentPostList", apartmentPostList);
        request.setAttribute("page_index", pageIndex);
        request.setAttribute("name", title_name);
        request.setAttribute("apartmentType", apartment_type);
        request.setAttribute("tinh", tinh);
        request.setAttribute("quan", quan);
        request.setAttribute("phuong", phuong);
        request.setAttribute("moneyUp", moneyUp);
        request.setAttribute("moneyDown", moneyDown);
        request.setAttribute("bedroom", numberOfBedroom);
        request.setAttribute("areaUp", areaUp);
        request.setAttribute("areaDown", areaDown);
        request.setAttribute("type", type_raw);
        request.setAttribute("status", status);
        request.setAttribute("message", message);
        request.getRequestDispatcher("ApartmentPostListForLandlord.jsp").forward(request, response);
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
        ApartmentPostDao apd = new ApartmentPostDao();
        String delete_id = request.getParameter("delete_id");
        apd.deleteApartmentPost((delete_id == null || delete_id.isEmpty()) ? 0 : Integer.parseInt(delete_id));
        response.sendRedirect("ApartmentPostForLandlord");
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
