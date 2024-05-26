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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CommunityPost;
import model.User;

/**
 *
 * @author DuyThai
 */
@WebServlet(name = "addCommunityPost", urlPatterns = {"/addCommunityPost"})
public class AddCommunityPost extends HttpServlet {
   
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
        communityPost.setConetext(context);
       cpd.addPost(communityPost);
       out.print(context);
        
        
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
        
        CommunityPostDao cpd = new CommunityPostDao();
        UserDao ud = new UserDao();
        
        String title = request.getParameter("t");
        String context = request.getParameter("c");

        User user = ud.getUser(1);
        CommunityPost communityPost = new CommunityPost();
        communityPost.setUser_id(user);
        communityPost.setTitle(title);
        communityPost.setConetext(context);
       cpd.addPost(communityPost);
        
        
        
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
