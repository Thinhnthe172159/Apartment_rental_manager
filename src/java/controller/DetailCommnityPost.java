/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CommunityPostDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.CommunityPost;
import model.LikePost;
import model.Post_image;
import model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "DetailCommnityPost", urlPatterns = {"/DetailCommnityPost"})
public class DetailCommnityPost extends HttpServlet {

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
            out.println("<title>Servlet DetailCommnityPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailCommnityPost at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");
        CommunityPostDao cpd = new CommunityPostDao();
        List<LikePost> likePosts = new ArrayList<>();
        String postIdRaw = request.getParameter("post_id");

        int postId = (postIdRaw == null || postIdRaw.isEmpty()) ? 0 : Integer.parseInt(postIdRaw);
        CommunityPost cPost = cpd.getCommunityPost(postId);
        List<Post_image> post_images = cpd.getPostImageByPostId(postId);
        likePosts = cpd.getListLIkedPost((user == null) ? 0 : user.getId());
        List<Integer> listPostIdLiked = new ArrayList<>();
        for (LikePost index : likePosts) {
            listPostIdLiked.add(index.getPost_id().getId());
        }
        request.setAttribute("page", 3);
        request.setAttribute("likePost", listPostIdLiked);
        request.setAttribute("Cpost", cPost);
        request.setAttribute("listImage", post_images);
        request.getRequestDispatcher("DetailCommunityPost.jsp").forward(request, response);
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
        processRequest(request, response);
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
