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
 * @author vumin
 */
@WebServlet(name = "AddCommunityPost", urlPatterns = {"/addCommunityPost"})
public class AddCommunityPost extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "post_image";

    private CommunityPostDao communityPostDao;
    private UserDao userDao;

    public void init() throws ServletException {
        DBContext dbContext = new DBContext();
        this.communityPostDao = new CommunityPostDao();
        this.userDao = new UserDao();

    }

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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
        request.getRequestDispatcher("AddCommunityPost.jsp").forward(request, response);
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
        String context = request.getParameter("context");
        String title = request.getParameter("title");
        try {
            User userId = userDao.getUser(2);

            CommunityPost cp = new CommunityPost();
            cp.setUser_id(userId);
            cp.setTitle(title);
            cp.setContext(context);
            communityPostDao.addPost(cp);

            // Get the absolute path of the web application
            String applicationPath = request.getServletContext().getRealPath("");
            // Construct the directory path to save the uploaded file
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            // Create the directory if it does not exist
            File uploadDir = new File(uploadFilePath);
            String image;
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            StringBuilder fileNames = new StringBuilder();

            Post_image post_image = new Post_image();
            CommunityPost post = communityPostDao.getNewesPost(userId.getId());

            // Get all parts from the request (images)
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                // Get the submitted file name
                String fileName = part.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) {

                    part.write(uploadFilePath + File.separator + fileName);
                    post_image = new Post_image(0, fileName, post);
                    fileNames.append(fileName);
                    communityPostDao.addPostImage(post_image);
                }
            }
            post_image = communityPostDao.getFirstPostImage(post.getId());
            post.setFirst_image(post_image.getImage());
            communityPostDao.updatePost(post);
            response.setContentType("text/plain");
            response.getWriter().write("Files uploaded successfully: " + fileNames.toString());

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("AddCommunityPost.jsp").forward(request, response);
        }
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
