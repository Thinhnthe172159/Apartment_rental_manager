/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommunityPostDao;
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
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import model.CommunityPost;
import model.Post_image;

/**
 *
 * @author thinh
 */
@MultipartConfig()
@WebServlet(name = "UpdateCommnunityPost", urlPatterns = {"/UpdateCommnunityPost"})
public class UpdateCommnunityPost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "post_image";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateCommnunityPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCommnunityPost at " + request.getContextPath() + "</h1>");
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
        CommunityPostDao cpd = new CommunityPostDao();
        String post_id = request.getParameter("Post_id");

        int PostId = (post_id == null || post_id.isEmpty()) ? 0 : Integer.parseInt(post_id);

        CommunityPost cp = cpd.getCommunityPost(PostId);

        request.setAttribute("CommunityPost", PostId);
        request.setAttribute("title", cp.getTitle());
        request.setAttribute("context", cp.getContext());
        request.getRequestDispatcher("UpdateCommunityPost.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        CommunityPostDao cpd = new CommunityPostDao();

        String post_id_raw = request.getParameter("id");
        String context = request.getParameter("context");
        String title = request.getParameter("title");

        int post_id = (post_id_raw == null || post_id_raw.isEmpty()) ? 0 : Integer.parseInt(post_id_raw);

        CommunityPost communityPost = cpd.getCommunityPost(post_id);
        communityPost.setTitle(title);
        communityPost.setContext(context);
        String applicationPath = request.getServletContext().getRealPath("");

        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        int countImage = 0;
        List<String> image = new ArrayList<>();

        Collection<Part> parts = request.getParts();
        for (Part part : parts) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                if (countImage <= 5) {
                    image.add(fileName);
                    out.print(fileName);
                    part.write(uploadFilePath + File.separator + fileName);
                    countImage++;
                }
            }
        }

        if (image.size() > 0) {
            cpd.deleteAllImageOfAPost(post_id);
            for (String img : image) {
                Post_image post_image = new Post_image();
                post_image = new Post_image(0, UPLOAD_DIR + "/" + img.trim(), communityPost);
                cpd.addPostImage(post_image);
            }
            Post_image postImage = cpd.getFirstPostImage(post_id);
            communityPost.setFirst_image(postImage.getImage());
        } 

        cpd.updatePost2(communityPost);
        response.sendRedirect("CommunityPostList?post_id=" + post_id);
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
