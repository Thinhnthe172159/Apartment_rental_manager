/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Role;

/**
 *
 * @author thinh
 */
public class UserDao extends DBContext {

    private RoleDao roleDao;

    // register user fuction
    Connection cnn;
    Statement stm;
    ResultSet rs;
    PreparedStatement pstm;

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    public UserDao() {
        connect();
    }

    public boolean registerUser(User user) {
        try {
            String strSQL = "INSERT INTO [User](email, password, role_id, status, first_name, last_name, dob, image) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, user.getEmail());
            pstm.setString(2, user.getPassword());
            pstm.setInt(3, user.getRole_id().getId());
            pstm.setInt(4, user.getStatus());
            pstm.setString(5, user.getFirst_name());
            pstm.setString(6, user.getLast_name());
            pstm.setDate(7, user.getDob());
            pstm.setString(8, user.getImage());
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("RegisterUser: " + e.getMessage());
        }
        return false;
    }

    //check email
    public boolean checkEmail(String email) {
        try {
            String strSQL = "SELECT * FROM [dbo].[User] WHERE email = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkEmail" + e.getMessage());
        }
        return false;
    }

    //login function
    public User loginUser(String email, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[status]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[dob]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[User]"
                + " Where [email] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                roleDao = new RoleDao();
                Role r = roleDao.getRole(rs.getInt("role_id"));
                u.setRole_id(r);
                u.setStatus(rs.getInt("status"));
                u.setFirst_name(rs.getString("first_name"));
                u.setLast_name(rs.getString("last_name"));
                u.setDob(rs.getDate("dob"));
                u.setImage(rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // getUser
    public User getUser(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[status]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[dob]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[User]"
                + " Where [id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                roleDao = new RoleDao();
                Role r = roleDao.getRole(rs.getInt("role_id"));
                u.setRole_id(r);
                u.setStatus(rs.getInt("status"));
                u.setFirst_name(rs.getString("first_name"));
                u.setLast_name(rs.getString("last_name"));
                u.setDob(rs.getDate("dob"));
                u.setImage(rs.getString("image"));
                return u;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public static void main(String[] args) {
        UserDao ud = new UserDao();
        RoleDao rd = new RoleDao();
        User u = ud.loginUser("LeHUy1991@gmail.com", "123");
        System.out.println(u);
        ud.registerUser(u);
    }
}
