package controller;

import dal.CommunityPostDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteCommunityPost extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Lấy ID của bài viết từ tham số yêu cầu
        int postId = Integer.parseInt(request.getParameter("id"));
        
        // Tạo đối tượng CommunityPostDao và xóa bài viết
        CommunityPostDao cpd = new CommunityPostDao();
        cpd.deletePost(postId);
        
        // Chuyển hướng trở lại trang danh sách bài viết
        response.sendRedirect("listpost");
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet to delete a community post";
    }
}
