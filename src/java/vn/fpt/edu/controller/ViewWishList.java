/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.DBContext;
import vn.fpt.edu.dal.UserDao;
import vn.fpt.edu.dal.WishListDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.sql.SQLException;
import vn.fpt.edu.model.User;
import vn.fpt.edu.model.WishList;


/**
 *
 * @author vumin
 */
@WebServlet(name = "ViewWishList", urlPatterns = {"/viewwishlist"})
public class ViewWishList extends HttpServlet {

    private WishListDao wishListDao;
    private UserDao userDao;

    public void init() throws ServletException {
        DBContext dBContext = new DBContext();
        this.wishListDao = new WishListDao(dBContext);
        this.userDao = new UserDao();
    }

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
            out.println("<title>Servlet WishList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WishList at " + request.getContextPath() + "</h1>");
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
        int userId = Integer.parseInt(request.getParameter("userId"));
        try {
            List<vn.fpt.edu.model.WishList> wishlist = wishListDao.getWishListByUserId(userId);
            request.setAttribute("wishlist", wishlist);
            request.getRequestDispatcher("WishList.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
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

        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("userId"));
        int apartmentId = Integer.parseInt(request.getParameter("apartmentId"));

        try {
            if ("add".equals(action)) {
                WishList wishlist = new WishList();
                User user = userDao.getUser(userId);
                wishlist.setUser_id(user);
                wishlist.setApartment_id(apartmentId);
                wishListDao.addWishList(wishlist);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                wishListDao.deleteWishList(id);
            }
            response.sendRedirect("wishlist?userId=" + userId);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

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
