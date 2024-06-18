/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.RoleDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "EditUser", urlPatterns = {"/EditUser"})
public class EditUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_ID = request.getParameter("userId");
        UserDao user_DAO = new UserDao();
        User user = user_DAO.getUser(Integer.parseInt(user_ID));
        RoleDao roleDao = new RoleDao();
        List<Role> role_List = roleDao.getRoleList();
        request.setAttribute("role_List", role_List);
        request.setAttribute("specific_user_data", user);

        request.getRequestDispatcher("DashboardUserEdit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_ID = request.getParameter("userId");
        int Id = Integer.parseInt(user_ID);

        String firstname = request.getParameter("first-name");
        String lastname = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dobStr = request.getParameter("dob");
        int role = Integer.parseInt(request.getParameter("role"));
        double money = Double.parseDouble(request.getParameter("money").trim());
        UserDao user_DAO = new UserDao();
        User user = user_DAO.getUser(Integer.parseInt(user_ID));
        boolean isValid = true;
        String nameRegex = "^[\\p{L}]+(?:[ '\\-][\\p{L}]+)*$";
        if (!firstname.matches(nameRegex)) {
            request.setAttribute("message1", "Invalid first name. Only alphabetic characters, hyphens, and apostrophes are allowed.");
            System.out.println("1");
            isValid = false;
        }
        if (!lastname.matches(nameRegex)) {
            request.setAttribute("message2", "Invalid last name. Only alphabetic characters, hyphens, and apostrophes are allowed.");
            System.out.println("2");
            isValid = false;
        }
        if (!email.equals(user.getEmail()) && user_DAO.checkEmail(email)) {
            request.setAttribute("message3", "Email address already exists. Please use a different email.");
            System.out.println("3");
            isValid = false;
        }
        if (password.length() < 8 || !hasUpperCase(password) || !hasNumber(password)) {
            request.setAttribute("message4", "Password must have at least 8 characters, 1 uppercase letter, and 1 number.");
            System.out.println("4");
            isValid = false;
        }
        Date dob = null;
        try {
            dob = Date.valueOf(dobStr);
            LocalDate dobLocal = dob.toLocalDate();
            LocalDate today = LocalDate.now();
            if (Period.between(dobLocal, today).getYears() < 18) {
                // User is less than 18 years old
                request.setAttribute("message4", "You must be at least 18 years old to register.");
                System.out.println("5");
                isValid = false;
            }
        } catch (DateTimeParseException | IllegalArgumentException e) {
            // Invalid date format or null value
            request.setAttribute("message4", "Invalid date of birth format.");
            System.out.println("5");
            isValid = false;
        }

        if (!isValid) {
            doGet(request, response);
        } else {
            request.setAttribute("messagesuccess", "Change your profile successfully!");
            user_DAO.Admin_EditUser(email, role, firstname, lastname, password, dob, money, Id);
        }

        response.sendRedirect("DashboardUser");
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
