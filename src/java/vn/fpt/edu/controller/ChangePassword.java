/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.fpt.edu.model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user_ID") != null) {
            UserDao user_DAO = new UserDao();
            User user_Data = user_DAO.getUser((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);
            request.getRequestDispatcher("User-Password.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int user_ID = Integer.parseInt(request.getParameter("userid"));

        String activeTab = "account-change-password"; // Set active tab to Change Password

        String currentpassword = request.getParameter("current-password");
        String newpassword = request.getParameter("new-password");
        String repassword = request.getParameter("re-password");

        UserDao userdao = new UserDao();

        if (newpassword.length() < 8 || !hasUpperCase(newpassword) || !hasNumber(newpassword)) {
            request.setAttribute("messagenewpassword", "Password must have at least 8 characters, 1 uppercase letter, and 1 number.");
        }

        User user_Data = userdao.getUser((int) session.getAttribute("user_ID"));
        if (request.getParameter("button").equals("ChangePassword")) {
            if (!currentpassword.equals(user_Data.getPassword()) || !newpassword.equals(repassword)) {
                if (!currentpassword.equals(user_Data.getPassword())) {
                    request.setAttribute("messagecurrentpassword", "Current password not correct.");
                    doGet(request, response);
                }
                if (!newpassword.equals(repassword)) {
                    request.setAttribute("messagerepassword", "Repeat password not match.");
                    doGet(request, response);
                }
            } else {
                if (userdao.changePassword(newpassword, user_ID)) {
                    request.setAttribute("messagesuccess", "Change password successfully!");
                    doGet(request, response);
                } else {
                    request.setAttribute("messagedanger", "Change password failed. Please try again.");
                    doGet(request, response);
                }
            }
        }
    }

    private boolean hasUpperCase(String password) {
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) {
                return true;
            }
        }
        return false;
    }

    private boolean hasNumber(String password) {
        for (char c : password.toCharArray()) {
            if (Character.isDigit(c)) {
                return true;
            }
        }
        return false;
    }
}
