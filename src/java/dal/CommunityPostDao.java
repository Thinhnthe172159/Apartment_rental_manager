/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CommunityPost;
import model.Post_image;
import model.User;
import java.sql.SQLException;



/**
 *
 * @author DuyThai
 */
public class CommunityPostDao extends DBContext {

    private DBContext dBContext;
    private UserDao userDao;

    public CommunityPostDao(DBContext dBContext) {
        this.dBContext = dBContext;
        this.userDao = new UserDao();
    }

    public void addPost(CommunityPost cp) throws SQLException {
        String query = "INSERT INTO [dbo].[Community_post]\n"
                + "           ([tittle]\n"
                + "           ,[context]\n"
                + "           ,[user_id]\n"
                + "           ,[time])\n"
                + " VALUES    (?,?,?,?)";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, cp.getTitle());
            statement.setString(2, cp.getContext());
            statement.setInt(3, cp.getUser_id().getId());
            statement.setDate(4, cp.getTime());
        }catch(SQLException){
            
        }
    }

    public void deletePost(int postId) {
        String sql = "DELETE FROM Community_post WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, postId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<CommunityPost> getAllPosts() {
        List<CommunityPost> posts = new ArrayList<>();
        String sql = "SELECT * FROM Community_post";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                int postId = rs.getInt("id");
                String title = rs.getString("tittle");
                String context = rs.getString("context");
                int userId = rs.getInt("user_id");
                User user = userDao.getUser(userId);
                CommunityPost post = new CommunityPost(postId, title, context, user, rs.getDate("time"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public void updatePost(CommunityPost post) {
        String sql = "UPDATE Community_post SET tittle = ?, context = ? WHERE id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContext());
            statement.setInt(3, post.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public CommunityPost getNewesPost() {
        String sql = " SELECT TOP (1) [id], [tittle], [context], [user_id], [time]\n"
                + "  FROM [dbo].[Community_post] ORDER BY id DESC";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {
            if (rs.next()) {
                CommunityPost post = new CommunityPost();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("tittle"));
                post.setContext(rs.getString("context"));
                User user = userDao.getUser(rs.getInt("user_id"));
                post.setUser_id(user);
                post.setTime(rs.getDate("time"));
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addPostImage(Post_image post_image) {
        String sql = "INSERT INTO [dbo].[Image_post] ([image], [post_id]) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, post_image.getImage());
            statement.setInt(2, post_image.getPost_id().getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CommunityPostDao cpd = new CommunityPostDao();
        UserDao userDao = new UserDao();

        // Add a post first
        User user = userDao.getUser(1); // Assume user with ID 1 exists
        CommunityPost newPost = new CommunityPost();
        newPost.setTitle("Sample Title");
        newPost.setContext("Sample Context");
        newPost.setUser_id(user);
        newPost.setTime(new java.sql.Date(System.currentTimeMillis()));
        cpd.addPost(newPost);

        // Then get the newest post and add an image to it
        CommunityPost communityPost = cpd.getNewesPost();
        Post_image post_image = new Post_image(0, "abc", communityPost);
        cpd.addPostImage(post_image);
    }

    public CommunityPost getPostId(int postId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public CommunityPost getPostById(int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
