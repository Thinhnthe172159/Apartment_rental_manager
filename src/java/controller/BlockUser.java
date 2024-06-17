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
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "BlockUser", urlPatterns = {"/BlockUser"})
public class BlockUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountIdParam = request.getParameter("userId");
        if (accountIdParam != null && !accountIdParam.isEmpty()) {
            int user_ID = Integer.parseInt(accountIdParam);
            UserDao user_DAO = new UserDao();
            User user = user_DAO.getUser(user_ID);

            if (user != null && user.getRole_id().getId() != 1) {
                if (user.getStatus() == 0) {
                    // Block the account
                    user.setStatus(1);
                    user_DAO.updateAccountStatus(user_ID);
                    request.setAttribute("SuccessMessage", "Account blocked successfully.");

                } else if (user.getStatus() == 1) {
                    // Unblock the account
                    user.setStatus(0);
                    user_DAO.updateAccountStatus(user_ID);
                    request.setAttribute("SuccessMessage", "Account unblocked successfully.");
                }
            } else {
                request.setAttribute("ErrorMessage", "You cannot block an admin.");
            }
        }
        request.getRequestDispatcher("DashboardUser").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
