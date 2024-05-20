/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Role;

/**
 *
 * @author thinh
 */
public class RoleDao extends DBContext {

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

    public static void main(String[] args) {
        RoleDao rd = new RoleDao();
        Role r = rd.getRole(1);
        System.out.println(r.getRole_name());
    }
}
