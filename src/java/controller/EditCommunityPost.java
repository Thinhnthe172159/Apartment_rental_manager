/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;
import dal.CommunityPostDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CommunityPost;
/**
 *
 * @author DuyThai
 */
@WebServlet(name = "EditCommunityPost", urlPatterns = {"/editpost"})
public class EditCommunityPost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id")); 
        CommunityPostDao cpd = new CommunityPostDao();
        CommunityPost post; 
        post = cpd.getPostId(postId);
        request.setAttribute("post", post); 
        request.getRequestDispatcher("editPost.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));
        String title = request.getParameter("title");
        String context = request.getParameter("context");

        CommunityPostDao cpd = new CommunityPostDao();
        CommunityPost post = new CommunityPost(postId, title, context, null); 
        cpd.updatePost(post); 

        request.setAttribute("success", "Bài viết đã được cập nhật!");
        request.getRequestDispatcher("editPost.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}