/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Role;

/**
 *
 * @author thinh
 */
public class UserDao extends DBContext {
    private RoleDao roleDao ;

    // register user fuction
    public void registerUser(User u) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([email]\n"
                + "           ,[password]\n"
                + "           ,[role_id]\n"
                + "           ,[status]\n"
                + "           ,[first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[dob]\n"
                + "           ,[image])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getEmail());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRole_id().getId());
            st.setInt(4, u.getStatus());
            st.setString(5, u.getFirst_name());
            st.setString(6, u.getLast_name());
            st.setDate(7, u.getDob());
            st.setString(8, u.getImage());
            st.executeUpdate();
        } catch (SQLException e) {

        }
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
                + " Where [email] = ? and [password] = ?" ;
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
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
        }catch(SQLException e){
            
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
