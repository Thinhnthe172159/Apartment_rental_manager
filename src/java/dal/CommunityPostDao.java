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
import java.util.ArrayList;
import java.util.List;
import model.CommunityPost;
import model.User;

/**
 *
 * @author DuyThai
 */
public class CommunityPostDao extends DBContext{
    private UserDao userDao = new UserDao();
            
    Connection con = null;
    PreparedStatement statement= null;
    ResultSet rs = null;
    
    
    public void addPost(CommunityPost cp){
        
        String sql = "INSERT INTO [dbo].[Community_post]\n" +
"           ([tittle]\n" +
"           ,[context]\n" +
"           ,[user_id])\n" +
"     VALUES\n" +
"           (?, ?, ?)";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,cp.getTitle());
            statement.setString(2, cp.getConetext());
            statement.setInt(3, cp.getUser_id().getId());
            
            statement.executeUpdate();
            
         
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
    
    public static void main(String[] args) {
        CommunityPostDao cpd = new CommunityPostDao();
        UserDao userDao = new UserDao();
        
        User user = userDao.getUser(1);
        CommunityPost communityPost = new CommunityPost(1, "toi la", "thinnh", user);
        cpd.addPost(communityPost);
        
    }

   public List<CommunityPost> getAllPosts() {
        List<CommunityPost> posts = new ArrayList<>();
        String sql = "SELECT * FROM Community_post";
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postId = rs.getInt("id");
                String title = rs.getString("tittle");
                String context = rs.getString("context");
                int userId = rs.getInt("user_id");
                User user = userDao.getUser(userId);
                CommunityPost post = new CommunityPost(postId, title, context, user);
                posts.add(post);
            }
        } catch (SQLException e) {
           
        }
        return posts;
    }
  

    public void updatePost(CommunityPost post) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}