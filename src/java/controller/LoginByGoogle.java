/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import util.Constants;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginByGoogle", urlPatterns = {"/LoginByGoogle"})
public class LoginByGoogle extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        User user = getUserInfo(accessToken);
        RegisterOrUpdateUser(user);

        // Store user information in session
        HttpSession session = request.getSession();
        int user_ID = user.getId();
        session.setAttribute("user_ID", user_ID);
        UserDao user_DAO = new UserDao();
        User user_Data = user_DAO.getUser((int) session.getAttribute("user_ID"));
        session.setAttribute("user_Data", user_Data);
        // Redirect to a secured page
        response.sendRedirect("HomePage");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String email = jobj.get("email").getAsString();
        String firstName = jobj.has("given_name") ? jobj.get("given_name").getAsString() : "";
        String lastName = jobj.has("family_name") ? jobj.get("family_name").getAsString() : "";
        String picture = jobj.has("picture") ? jobj.get("picture").getAsString() : "";

        User googleUser = new User();
        googleUser.setEmail(email);
        googleUser.setFirst_name(firstName);
        googleUser.setLast_name(lastName);
        googleUser.setImage(picture);

        return googleUser;
    }

    private void RegisterOrUpdateUser(User user) {
        UserDao userDao = new UserDao();
        User existingUser = userDao.getUserByEmail(user.getEmail());
        if (!userDao.checkEmail(user.getEmail())) {
            Role role = new Role();
            role.setId(4);
            user.setRole_id(role);
            user.setStatus(0);
            userDao.registerUser(user);
        } else {
            user.setId(existingUser.getId());
            userDao.updateUser(user);
        }
    }
}
