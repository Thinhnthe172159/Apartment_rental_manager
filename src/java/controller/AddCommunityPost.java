/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CommunityPostDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.Collection;
import model.CommunityPost;
import model.Post_image;
import model.User;

/**
 *
 * @author DuyThai
 */
@MultipartConfig()
@WebServlet(name = "addCommunityPost", urlPatterns = {"/addCommunityPost"})
public class AddCommunityPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads";
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        CommunityPostDao cpd = new CommunityPostDao();
        UserDao ud = new UserDao();
        
        String title = request.getParameter("t");
        String context = request.getParameter("c");

        User user = ud.getUser(1);
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUser_id(user);
        communityPost.setTitle(title);
        communityPost.setContext(context);
       cpd.addPost(communityPost);
       out.print(context);
                request.getRequestDispatcher("createPost.jsp").forward(request, response);

        communityPost.setUser_id(user);
        communityPost.setTitle(title);
        communityPost.setContext(context);
       cpd.addPost(communityPost);
       
       CommunityPost communityPost1 = cpd.getNewesPost();
       
       // Get the absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // Construct the directory path to save the uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Create the directory if it does not exist
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        StringBuilder fileNames = new StringBuilder();

        // Get all parts from the request (images)
        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            // Get the submitted file name
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                // Save the file to the specified directory
                part.write(uploadFilePath + File.separator + fileName);
                Post_image img = new Post_image(0, fileName, communityPost1);
                  cpd.addPostImage(img);
                
            }
        }

        // Respond with the names of the uploaded files
        response.setContentType("text/plain");
        response.getWriter().write("Files uploaded successfully: " + fileNames.toString());
        
       
        
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
