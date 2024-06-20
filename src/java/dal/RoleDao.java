/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Role;

/**
 *
 * @author thinh
 */
public class RoleDao extends DBContext {

    java.sql.Connection cnn;
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

    public RoleDao() {
        connect();
    }
    
    public Role getRole(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[role_name]\n"
                + "  FROM [dbo].[Role] where id = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role r = new Role(rs.getInt("id"), rs.getString("role_name"));
                return r;
            }

        } catch (SQLException e) {

        }
        return null;
    }

    public List<Role> getRoleList() {
        List<Role> roleList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[Role]";
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt(1));
                role.setRole_name(rs.getString(2));

                roleList.add(role);
            }
        } catch (SQLException e) {
            System.out.println("getRoleList:" + e.getMessage());
        }
        return roleList;
    }
    public List<Role> getRoleListExpectAdmin() {
        List<Role> roleList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [dbo].[Role] Where [id] != 1";
            pstm = cnn.prepareStatement(sql);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt(1));
                role.setRole_name(rs.getString(2));

                roleList.add(role);
            }
        } catch (SQLException e) {
            System.out.println("getRoleList:" + e.getMessage());
        }
        return roleList;
    }

    public static void main(String[] args) {
        RoleDao rd = new RoleDao();
        Role r = rd.getRole(1);
        System.out.println(r.getRole_name());
    }
}
