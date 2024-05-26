/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DuyThai
 */
public class CommunityPostDao extends DBContext{
    Connection con = null;
    PreparedStatement statement= null;
    ResultSet rs = null;
    
    public void addPost(String title,String context, int userId){
        
        String sql = "insert into Community_post(tittle,context,user_id) values(?,?,?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, context);
            statement.setInt(3, userId);
            
            statement.executeUpdate();
            
         
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}