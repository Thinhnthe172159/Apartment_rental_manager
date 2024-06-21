/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DashboardUser", urlPatterns = {"/DashboardUser"})
public class DashboardUser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if (session.getAttribute("user_ID") != null) {
            UserDao user_DAO = new UserDao();
            User user_Data = user_DAO.getUser((int) session.getAttribute("user_ID"));
            ArrayList<User> user_List = user_DAO.getUserList();

            session.setAttribute("user_Data", user_Data);
            request.setAttribute("user_List", user_List);
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
            request.getRequestDispatcher("DashboardUser.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
