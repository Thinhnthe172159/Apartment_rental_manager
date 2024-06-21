/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
            String strSQL = "INSERT INTO [User](email, password, role_id, status, first_name, last_name, dob, image, money) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, user.getEmail());
            pstm.setString(2, user.getPassword());
            pstm.setInt(3, user.getRole_id().getId());
            pstm.setInt(4, user.getStatus());
            pstm.setString(5, user.getFirst_name());
            pstm.setString(6, user.getLast_name());
            pstm.setDate(7, user.getDob());
            pstm.setString(8, user.getImage());
            pstm.setDouble(9, user.getMoney());
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
    public boolean checkLogin(String email, String password) {
        try {
            String strSQL = "SELECT * FROM [dbo].[User] WHERE [email] = ? and [password] = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            pstm.setString(2, password);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("checkLogin:" + e.getMessage());
        }
        return false;
    }

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
                + "      ,[money]\n"
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
                u.setMoney(rs.getDouble("money"));
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
                + "      ,[money]\n"
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
                u.setMoney(rs.getDouble("money"));
                return u;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public boolean UpdateGeneralProfile(String email, String first_name, String last_name, Date dob, String image, int id) {
        try {
            String strSQL = "UPDATE [dbo].[User]\n"
                    + "   SET [email] = ?\n"
                    + "      ,[first_name] = ?\n"
                    + "      ,[last_name] = ?\n"
                    + "      ,[dob] = ?\n"
                    + "      ,[image] = ?\n"
                    + " WHERE [id] = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            pstm.setString(2, first_name);
            pstm.setString(3, last_name);
            pstm.setDate(4, new java.sql.Date(dob.getTime())); // Convert java.util.Date to java.sql.Date
            pstm.setString(5, image);
            pstm.setInt(6, id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("UpdateGeneralProfile:" + e.getMessage());
        }
        return false;
    }

    public User getUserByEmail(String Email) {
        String sql = "SELECT [id]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[status]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[dob]\n"
                + "      ,[image]\n"
                + "      ,[money]\n"
                + "  FROM [dbo].[User]"
                + " Where [email] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, Email);
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
                u.setMoney(rs.getDouble("money"));
                return u;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void updateUser(User user) {
        String sql = "UPDATE [dbo].[User] SET [first_name] = ?, [last_name] = ?, [dob] = ?, [image] = ? WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFirst_name());
            st.setString(2, user.getLast_name());
            st.setDate(3, user.getDob());
            st.setString(4, user.getImage());
            st.setString(5, user.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean changePassword(String password, int user_ID) {
        try {
            String strSQL = "UPDATE [dbo].[User] SET [password] = ? WHERE [id] = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, password);
            pstm.setInt(2, user_ID);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("changePassword:" + e.getMessage());
        }
        return false;
    }

public ArrayList<User> getUserList() {
    ArrayList<User> user_List = new ArrayList<>();
    try {
        String strSQL = "SELECT u.id, u.email, u.password, u.role_id, u.status, u.first_name, u.last_name, u.dob, u.image, u.money, r.role_name "
                      + "FROM [ams].[dbo].[User] u "
                      + "JOIN [ams].[dbo].[Role] r ON u.role_id = r.id "
                      + "WHERE u.role_id != 1";
        pstm = cnn.prepareStatement(strSQL);
        rs = pstm.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String email = rs.getString("email");
            int roleId = rs.getInt("role_id");
            String roleName = rs.getString("role_name");
            int status = rs.getInt("status");
            String first_name = rs.getString("first_name");
            String last_name = rs.getString("last_name");
            Date dob = rs.getDate("dob");
            String image = rs.getString("image");
            double money = rs.getDouble("money");
            Role role = new Role(roleId, roleName);
            user_List.add(new User(id, email, role, status, first_name, last_name, dob, image, money));
        }
    } catch (SQLException e) {
        System.out.println("getUserList: " + e.getMessage());
    }
    return user_List;
}


    // nạp vip
    public void UserMoneyChange(User u) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET \n"
                + "      [money] = ?\n"
                + " WHERE [id] = ?";
        try {
            pstm = cnn.prepareStatement(sql);
            pstm.setDouble(1, u.getMoney());
            pstm.setInt(2, u.getId());
            pstm.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateAccountStatus(int user_ID) {
        try {
            String strSQL = "UPDATE [dbo].[User] SET [status] = (CASE WHEN [status] = 1 THEN 0 ELSE 1 END) WHERE [id] = ?";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, user_ID);
            pstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateAccountStatus:" + e.getMessage());
        }
    }

    public boolean Admin_EditUser(String email, int role_id, String first_name, String last_name, String password, Date dob, double money, int id) {
        try {
            String strSQL = "UPDATE [dbo].[User]\n"
                    + "   SET [email] = ?\n"
                    + "      ,[role_id] = ?\n"
                    + "      ,[first_name] = ?\n"
                    + "      ,[last_name] = ?\n"
                    + "      ,[password] = ?\n"
                    + "      ,[dob] = ?\n"
                    + "      ,[money] = ?\n"
                    + " WHERE [id] = ?;";
            pstm = cnn.prepareStatement(strSQL);
            pstm.setString(1, email);
            pstm.setInt(2, role_id);
            pstm.setString(3, first_name);
            pstm.setString(4, last_name);
            pstm.setString(5, password);
            pstm.setDate(6, new java.sql.Date(dob.getTime())); // Convert java.util.Date to java.sql.Date
            pstm.setDouble(7, money);
            pstm.setInt(8, id);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("Admin_EditUser:" + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        UserDao ud = new UserDao();
        RoleDao rd = new RoleDao();
        User u = ud.loginUser("LeHUy1991@gmail.com", "123");
        System.out.println(u);
        ud.registerUser(u);
    }
}
