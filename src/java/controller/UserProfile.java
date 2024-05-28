/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeParseException;
import model.User;

/**
 *
 * @author ASUS
 */
@MultipartConfig
@WebServlet(name = "UserProfile", urlPatterns = {"/UserProfile"})
public class UserProfile extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user_ID") != null) {
            UserDao user_DAO = new UserDao();
            User user_Data = user_DAO.getUser((int) session.getAttribute("user_ID"));
            request.setAttribute("user_Data", user_Data);
            request.getRequestDispatcher("User-Profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login");
        }
    }

    private static final String uploadFolder = "img/User";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost called " + request.getParameter("userid"));

        String firstname = request.getParameter("first-name");
        String lastname = request.getParameter("last-name");
        String email = request.getParameter("email");
        String dobStr = request.getParameter("dob");

        String currentpassword = request.getParameter("current-password");
        String newpassword = request.getParameter("new-password");
        String repassword = request.getParameter("re-password");
        int user_ID = Integer.parseInt(request.getParameter("userid"));

        UserDao userdao = new UserDao();

        Date dob = null;
        try {
            dob = Date.valueOf(dobStr);
            LocalDate dobLocal = dob.toLocalDate();
            LocalDate today = LocalDate.now();
            if (Period.between(dobLocal, today).getYears() < 18) {
                // User is less than 18 years old
                request.setAttribute("message6", "You must be at least 18 years old to register.");
            }
        } catch (DateTimeParseException | IllegalArgumentException e) {
            // Invalid date format or null value
            request.setAttribute("message6", "Invalid date of birth format.");
        }

        //path to upload folder
        String path = request.getServletContext().getRealPath("") + uploadFolder;
        //check folder existed
        File uploadFolder = new File(path);
        if (!uploadFolder.exists()) {
            uploadFolder.mkdir();
        }
        //get part from request
        Part part = request.getPart("avatar");
        String fileName = getFileName(part);
        //write file to upload folder
        String filePath = path + File.separator + fileName;
        //if avatar not change
        boolean isFileUploaded = (part != null && part.getSize() > 0);
        if (isFileUploaded) {
            part.write(filePath);
        } else {
            User existingUser = userdao.getUser(user_ID);
            fileName = existingUser.getImage(); // Use existing image if no new file is uploaded
        }

        if (request.getParameter("button").equals("general")) {
            userdao.UpdateGeneralProfile(email, firstname, lastname, dob, fileName, user_ID);
//            part.write(filePath);
        }

        response.sendRedirect("UserProfile");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
}
