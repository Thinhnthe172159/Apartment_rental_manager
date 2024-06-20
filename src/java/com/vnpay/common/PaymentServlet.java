/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vnpay.common;

import dal.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        UserDao userDao = new UserDao();
        User u = (User) session.getAttribute("user_Data");
        
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }
        
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                String id = request.getParameter("vnp_TxnRef");
                String moneyStr = request.getParameter("vnp_Amount");
                Double money = Double.parseDouble(moneyStr);
                money=money/100;
                
                response.getWriter().print(request.getParameter("vnp_OrderInfo"));
                //PaymentDAO paymentDAO = new PaymentDAO();
                //int check = paymentDAO.insertPayment(id, user.getId(), money/100);
                
                if(money >= 1000000){
                     u.setMoney(u.getMoney() + money+(money*0.02));
                }
                if(money >= 2000000){
                    u.setMoney(u.getMoney() + money+(money*0.03));
                }
                if(money >= 5000000){
                    u.setMoney(u.getMoney() + money+(money*0.05));
                }
                if(money >= 10000000){
                    u.setMoney(u.getMoney() + money+(money*0.1));
                }
                if(money >= 20000000){
                    u.setMoney(u.getMoney() + money+(money*0.2));
                }
                if(money>= 50000 && money < 1000000){
                    u.setMoney(u.getMoney()+money);
                }
               
                userDao.UserMoneyChange(u);
                System.out.println("Da add giao dich vao data");
                request.setAttribute("message","a");
                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "b");
                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
            }
            
        } else {
            response.getWriter().print("invalid signature");
        }
        
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
    
}
