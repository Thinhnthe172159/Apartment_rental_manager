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

    private UserDao userDao = new UserDao();

    // hàm cho phép chúng ta tạo ra bài đăng
    public void addPost(CommunityPost cp) throws SQLException {
        String query = "INSERT INTO [dbo].[Community_post]\n"
                + "           ([tittle]\n"
                + "           ,[context]\n"
                + "           ,[user_id]\n"
                + "           ,[time],[first_image])\n"
                + " VALUES    (?,?,?,?,?)";

        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, cp.getTitle());
            statement.setString(2, cp.getContext());
            statement.setInt(3, cp.getUser_id().getId());
            statement.setDate(4, cp.getTime());
            statement.setString(5, cp.getFirst_image());
        } catch (SQLException e) {

        }
    }

    // Hàm này sẽ xóa tất cả những bài đăng thuộc về 1 user nào đó
    public void deletePost(int postId, int user_id) {
        String query = "DELETE FROM Community_post WHERE [id] = ? and [user_id] = ? ";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, postId);
            statement.setInt(2, user_id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<CommunityPost> getAllPosts() {
        List<CommunityPost> posts = new ArrayList<>();
        String query = "SELECT * FROM Community_post";
        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                CommunityPost cp = new CommunityPost();
                cp.setId(rs.getInt("id"));
                cp.setContext(rs.getString("context"));
                cp.setTitle(rs.getString("tittle"));
                User userId = userDao.getUser(rs.getInt("user_id"));
                cp.setUser_id(userId);
                cp.setTime(rs.getDate("time"));
                cp.setFirst_image(rs.getString("first_image"));
                posts.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    // đây là list tìm kiếm có thể phân trang
    public List<CommunityPost> searchCommunityPostsList(String title, int pageNumber, int pageSize) {
        List<CommunityPost> list = new ArrayList<>();
        String sql = "SELECT * FROM Community_post where 1=1  ";

        if (title != null) {
            sql += " and [tittle] like ? ";
        }

        int offset = (pageNumber - 1) * pageSize;

        sql += "OFFSET " + offset + " ROWS ";
        sql += "FETCH NEXT " + pageSize + " ROWS ONLY ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                CommunityPost cp = new CommunityPost();
                cp.setId(rs.getInt("id"));
                cp.setContext(rs.getString("context"));
                cp.setTitle(rs.getString("tittle"));
                User userId = userDao.getUser(rs.getInt("user_id"));
                cp.setUser_id(userId);
                cp.setTime(rs.getDate("time"));
                cp.setFirst_image(rs.getString("first_image"));
                list.add(cp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // hàm này sẽ lấy ra được kích thước của list vừa mới search
    public int getSizeOfListSearch(String title) {
        List<CommunityPost> list = new ArrayList<>();
        String sql = "SELECT COUNT([id]) AS list_size\n"
                + "FROM [ams].[dbo].[Community_post]\n"
                + "where 1=1 ";

        if (title != null) {
            sql += " and [tittle] like ? ";
        }

        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt("list_size");
                return result;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // hàm này cho phép chúng ta có thể thay đổi thông tin của bài đăng của chính mình
    public void updatePost(CommunityPost post) {
        String query = "UPDATE Community_post SET tittle = ?, context = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContext());
            statement.setInt(3, post.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // lấy ra bài post mới nhất thuộc về 1 user nào đó
    public CommunityPost getNewesPost(int user_id) {
        String sql = " SELECT TOP (1)*\n"
                + "  FROM [dbo].[Community_post] where[id] = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, user_id);
            ResultSet rs = statement.executeQuery();
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

    // lấy ra 1 bài đăng bất kì
    public CommunityPost getCommunityPost(int id) {
        String sql = " SELECT *\n"
                + "  FROM [dbo].[Community_post] where[id] = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
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

    // thêm ảnh vào trong bài đăng
    public void addPostImage(Post_image post_image) {
        String query = "INSERT INTO [dbo].[Image_post] ([image], [post_id]) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, post_image.getImage());
            statement.setInt(2, post_image.getPost_id().getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //lấy ra bức ảnh đầu tiên thuộc về 1 bài đăng nào đó
    public Post_image getFirstPostImage(int post_id) {
        String query = "SELECT top 1 *\n"
                + "  FROM [dbo].[Image_post] where [post_id] = ? order by id desc";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, post_id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                CommunityPost communityPost = getCommunityPost(rs.getInt("post_id"));
                Post_image pi = new Post_image(rs.getInt("id"), rs.getString("image"), communityPost);
                return pi;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
