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
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DashboardAddUser", urlPatterns = {"/DashboardAddUser"})
public class DashboardAddUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            UserDao user_DAO = new UserDao();
            User user_Data = user_DAO.getUser((int) session.getAttribute("user_ID"));
            ArrayList<User> user_List = user_DAO.getUserList();
            RoleDao roleDao = new RoleDao();
            List<Role> role_List = roleDao.getRoleListExpectAdmin();
            request.setAttribute("role_List", role_List);
            request.getRequestDispatcher("DashboardAddUser.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String firstname = request.getParameter("first-name");
        String lastname = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("re-password");
        String image = "default-avatar.jpg";
        String dobStr = request.getParameter("dob");
        int roleid = Integer.parseInt(request.getParameter("role"));
        Role role = new Role(roleid);
        double money = Double.parseDouble(request.getParameter("money").trim());

        UserDao user_DAO = new UserDao();
        boolean isValid = true;
        boolean isValidpass = true;

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
        if (user_DAO.checkEmail(email)) {
            request.setAttribute("messageemail", "Email address already exists. Please use a different email.");
            isValid = false;
        }
        if (password.length() < 8 || !hasUpperCase(password) || !hasNumber(password)) {
            request.setAttribute("messagepassword", "Password must have at least 8 characters, 1 uppercase letter, and 1 number.");
            isValid = false;
            isValidpass = false;
        }
        if (!password.equals(repassword) && isValidpass) {
            request.setAttribute("messagerepassword", "Repeat password does not match.");
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
        } catch (DateTimeParseException | IllegalArgumentException e) {
            // Invalid date format or null value
            request.setAttribute("messageDob", "Invalid date of birth format.");
            isValid = false;
        }

        if (!isValid) {
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("re-password", repassword);
            request.setAttribute("dob", dobStr);
            request.setAttribute("role", roleid);
            request.setAttribute("money", money);
            doGet(request, response);
        } else {
            // All validations passed, proceed with registration
            User user = new User(email, password, role, 0, firstname, lastname, dob, image, money);
            if (user_DAO.registerUser(user)) {
                session.setAttribute("messagesuccess", "Add user successfully!");
                response.sendRedirect("DashboardUser");
            } else {
                session.setAttribute("messagedanger", "Fail to add user!");
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
