/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.UserDao;
import model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import model.Role;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/Register"})
public class RegisterController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Register.jsp").forward(request, response);
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
        String firstname = request.getParameter("first-name");
        String lastname = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("psw");
        String re_password = request.getParameter("psw-repeat");
        String image = "default-avatar.jpg";
        String dobStr = request.getParameter("dob");
        Date dob = Date.valueOf(dobStr);

        int roleId = 4;
        Role role = new Role(roleId);

        User user = new User(email, password, role, 0, firstname, lastname, dob, image);
        UserDao user_DAO = new UserDao();

        boolean isValid = true;

        String nameRegex = "^[A-Za-z]+([-'][A-Za-z]+)*$";
        if (!firstname.matches(nameRegex)) {
            request.setAttribute("message1", "Invalid first name. Only alphabetic characters, hyphens, and apostrophes are allowed.");
            isValid = false;
        }
        if (!lastname.matches(nameRegex)) {
            request.setAttribute("message2", "Invalid last name. Only alphabetic characters, hyphens, and apostrophes are allowed.");
            isValid = false;
        }
        if (user_DAO.checkEmail(email)) {
            request.setAttribute("message3", "Email address already exists. Please use a different email.");
            isValid = false;
        }
        if (password.length() < 8 || !hasUpperCase(password) || !hasNumber(password)) {
            request.setAttribute("message4", "Password must have at least 8 characters, 1 uppercase letter, and 1 number.");
            isValid = false;
        }
        if (!password.equals(re_password)) {
            request.setAttribute("message5", "Repeat password does not match.");
            isValid = false;
        }

        if (!isValid) {
            doGet(request, response);
        } else {
            // Perform registration if all validations pass
            if (user_DAO.registerUser(user)) {
                request.getRequestDispatcher("Success.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("Fail.jsp").forward(request, response);
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
