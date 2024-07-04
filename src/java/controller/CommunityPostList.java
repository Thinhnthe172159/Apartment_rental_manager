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
import java.util.List;
import model.CommunityPost;

/**
 *
 * @author DuyThai
 */
@WebServlet(name = "ListCommunityPost", urlPatterns = {"/CommunityPostList"})
public class CommunityPostList extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListCommunityPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCommunityPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 3;
        request.setAttribute("page", page);
        
        CommunityPostDao cpd = new CommunityPostDao();
        List<CommunityPost> postList = cpd.getAllPosts();//searchCommunityPostsList(null, 1, 6); // Lấy danh sách bài đăng từ DAO
        request.setAttribute("postList", postList); // Lưu danh sách vào request
        request.getRequestDispatcher("CommunityPostList.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    public String getServletInfo() {
        return "Short description";
        
    }

}
