/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommunityPostDao;
import dal.DBContext;
import dal.IncidentReportDao;
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
import java.time.LocalDate;
import java.util.Collection;
import java.sql.Date;
import model.CommunityPost;
import model.Post_image;
import model.User;

/**
 *
 * @author vumin
 */
@MultipartConfig()
@WebServlet(name = "AddCommunityPost", urlPatterns = {"/addCommunityPost"})
public class AddCommunityPost extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "post_image";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCommunityPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCommunityPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
        } else {
            request.getRequestDispatcher("AddCommunityPost.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommunityPostDao communityPostDao = new CommunityPostDao();

        String title = request.getParameter("post-title");
        String context = request.getParameter("post-desc");
        try {

            HttpSession session = request.getSession();

            User user = (User) session.getAttribute("user_Data");

            LocalDate now = LocalDate.now();
            Date timePost = Date.valueOf(now);
            CommunityPost cp = new CommunityPost();
            cp.setUser_id(user);
            cp.setTitle(title);
            cp.setContext(context);
            cp.setTime(timePost);
            communityPostDao.addPost(cp);

            String applicationPath = request.getServletContext().getRealPath("");

            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadFilePath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            StringBuilder fileNames = new StringBuilder();

            
            CommunityPost post = communityPostDao.getNewesPost(user.getId());

            int countImage = 0;
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                String fileName = part.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) {
                    if (countImage <= 5) {
                        Post_image post_image = new Post_image();
                        post_image = new Post_image(0, UPLOAD_DIR+"/" +fileName.trim(), post);
                        part.write(uploadFilePath + File.separator + fileName);
                        communityPostDao.addPostImage(post_image);
                        countImage++;
                    }
                }
            }

            CommunityPost post1 = communityPostDao.getNewesPost(user.getId());

            Post_image post_image1 = communityPostDao.getFirstPostImage(post.getId());
            post1.setFirst_image(post_image1.getImage());
            communityPostDao.updatePost(post1);
            response.sendRedirect("CommunityPostList");
        } catch (Exception e) {
            e.printStackTrace();
           
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
