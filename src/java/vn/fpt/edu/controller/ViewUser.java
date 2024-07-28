/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.RoleDao;
import vn.fpt.edu.dal.UserDao;
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
import java.time.Period;
import java.time.format.DateTimeParseException;
import java.util.List;
import vn.fpt.edu.model.Role;
import vn.fpt.edu.model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ViewUser", urlPatterns = {"/ViewUser"})
public class ViewUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_ID = request.getParameter("userId");
        UserDao user_DAO = new UserDao();
        User user = user_DAO.getUser(Integer.parseInt(user_ID));
        RoleDao roleDao = new RoleDao();
        List<Role> role_List = roleDao.getRoleListExpectAdmin();
        request.setAttribute("role_List", role_List);
        request.setAttribute("specific_user_data", user);

        request.getRequestDispatcher("DashboardViewUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user_ID = request.getParameter("userId");
        int Id = Integer.parseInt(user_ID);

        String firstname = request.getParameter("first-name");
        String lastname = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("re-password");
        String dobStr = request.getParameter("dob");
        int role = Integer.parseInt(request.getParameter("role"));
        double money = Double.parseDouble(request.getParameter("money").trim());
        UserDao user_DAO = new UserDao();
        User user = user_DAO.getUser(Integer.parseInt(user_ID));
        boolean isValid = true;
        String nameRegex = "^[\\p{L}]+(?:[ '\\-][\\p{L}]+)*$";
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$";
        if (!firstname.matches(nameRegex)) {
            request.setAttribute("messagefirstname", "Invalid first name. Only alphabetic characters, hyphens, and apostrophes are allowed.");
            isValid = false;
        }
        if (!lastname.matches(nameRegex)) {
            request.setAttribute("messagelastname", "Invalid last name. Only alphabetic characters, hyphens, and apostrophes are allowed.");
            isValid = false;
        }
        if (!email.matches(emailRegex)) {
            request.setAttribute("messageemail", "Invalid email format. Please enter a valid email address.");
            isValid = false;
        }
        if (!email.equals(user.getEmail()) && user_DAO.checkEmail(email)) {
            request.setAttribute("messageemail", "Email address already exists. Please use a different email.");
            isValid = false;
        }
        if (password.length() < 8 || !hasUpperCase(password) || !hasNumber(password)) {
            request.setAttribute("messagepassword", "Password must have at least 8 characters, 1 uppercase letter, and 1 number.");
            isValid = false;
        }
        if (!password.equals(repassword)) {
            request.setAttribute("messagerepassword", "Repeat password not match.");
            isValid = false;
        }
        Date dob = null;
        try {
            dob = Date.valueOf(dobStr);
            LocalDate dobLocal = dob.toLocalDate();
            LocalDate today = LocalDate.now();
            if (Period.between(dobLocal, today).getYears() < 18) {
                // User is less than 18 years old
                request.setAttribute("messageDob", "You must be at least 18 years old to register.");
                isValid = false;
            }
            if (Period.between(dobLocal, today).getYears() > 120) {
                // User is less than 18 years old
                request.setAttribute("messageDob", "Date of birth must be within a reasonable range.");
                isValid = false;
            }
        } catch (DateTimeParseException | IllegalArgumentException e) {
            // Invalid date format or null value
            request.setAttribute("messageDob", "Invalid date of birth format.");
            isValid = false;
        }

        if (!isValid) {
            doGet(request, response);
        } else {
            if (user_DAO.Admin_EditUser(email, role, firstname, lastname, password, dob, money, Id)) {
                session.setAttribute("messagesuccess", "Change profile successfully!");
                response.sendRedirect("DashboardUser");
            } else {
                session.setAttribute("messagedanger", "Change profile fail!");
                response.sendRedirect("DashboardUser");
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
