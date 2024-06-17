/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommunityPostDao;
import dal.UserDao;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.CommunityPost;
import model.Post_image;
import model.User;

@WebServlet(name = "AddCommunityPost", urlPatterns = {"/addCommunityPost"})
@MultipartConfig
public class AddCommunityPost extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement processing logic if needed
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET requests if needed
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommunityPostDao cpd = new CommunityPostDao();
        UserDao ud = new UserDao();

        String title = request.getParameter("t");
        String context = request.getParameter("c");

        User user = ud.getUser(1); // Replace 1 with actual user ID retrieval logic
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUser_id(user);
        communityPost.setTitle(title);
        communityPost.setContext(context);
        cpd.addPost(communityPost);

        CommunityPost newPost = cpd.getNewestPost();

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            if (part.getContentType() != null && part.getContentType().startsWith("image")) {
                String fileName = extractFileName(part);
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(uploadPath + File.separator + fileName);
                    Post_image img = new Post_image(0, fileName, newPost);
                    cpd.addPostImage(img);
                }
            }
        }

        // Redirect to a success page or handle response as needed
        response.sendRedirect("createPost.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
