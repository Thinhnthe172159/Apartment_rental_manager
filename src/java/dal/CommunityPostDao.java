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
import model.CommentPost;
import model.LikePost;
import org.apache.tomcat.util.http.fileupload.ParameterParser;


public class CommunityPostDao extends DBContext {

    private UserDao userDao = new UserDao();

    public void addPost(CommunityPost cp) {
        String query = "INSERT INTO [dbo].[Community_post]\n"
                + "           ([tittle]\n"
                + "           ,[context]\n"
                + "           ,[user_id]\n"
                + "           ,[time],[first_image])\n"
                + " VALUES    (?,?,?,?,?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, cp.getTitle());
            statement.setString(2, cp.getContext());
            statement.setInt(3, cp.getUser_id().getId());
            statement.setDate(4, cp.getTime());
            statement.setString(5, cp.getFirst_image());

            statement.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }

    // Hàm này sẽ xóa bài đăng thuộc về 1 user nào đó
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

    // get add post
    public List<CommunityPost> getAllPosts() {
        List<CommunityPost> posts = new ArrayList<>();
        String query = "SELECT * FROM Community_post order by [time] desc , [id] desc ";
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
                cp.setNum_of_view(rs.getInt("num_of_view"));
                cp.setNum_of_like(rs.getInt("num_of_like"));
                cp.setNum_of_comment(rs.getInt("num_of_comment"));
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
        String sql = "SELECT * FROM [dbo].[Community_post] WHERE 1 = 1 ";

        if (title != null) {
            sql += " and [tittle] like '%" + title + "%'";
        }
        sql += "   ORDER BY [time] DESC ";
        int offset = (pageNumber - 1) * pageSize;

        sql += "OFFSET " + offset + " ROWS ";
        sql += "FETCH NEXT " + pageSize + " ROWS ONLY";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                cp.setNum_of_like(rs.getInt("num_of_like"));
                cp.setNum_of_view(rs.getInt("num_of_view"));
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
        String sql = "SELECT COUNT(*) AS list_size\n"
                + "FROM [ams].[dbo].[Community_post]\n"
                + "where 1=1 ";
        
        if (title != null) {
            sql += " and [tittle] like '%" + title + "%'";
        }

        int result = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
        String query = "UPDATE [dbo].[Community_post]\n"
                + "   SET [tittle] = ?\n"
                + "      ,[context] = ?\n"
                + "      ,[user_id] = ?\n"
                + "      ,[time] = ?\n"
                + "      ,[num_of_view] = ?\n"
                + "      ,[num_of_like] = ?\n"
                + "      ,[num_of_comment] = ?\n"
                + " WHERE [id] = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContext());
            statement.setInt(3, post.getUser_id().getId());
            statement.setDate(4, post.getTime());
            statement.setInt(5, post.getNum_of_view());
            statement.setInt(6, post.getNum_of_like());
            statement.setInt(7, post.getNum_of_comment());
            statement.setInt(8, post.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }// check

    // lấy ra bài post mới nhất thuộc về 1 user nào đó
    public CommunityPost getNewesPost(int user_id) {
        String sql = "  SELECT TOP (1)*\n"
                + "  FROM [dbo].[Community_post] where [user_id] = ?  order by [id] desc ";
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
                + "  FROM [dbo].[Image_post] where [post_id] = ? order by [id] desc";
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

    // hàm thêm lượt thích
    public void addLikePost(LikePost likePost) {
        String sql = "INSERT INTO [dbo].[List_of_post_liked]\n"
                + "           ([post_id]\n"
                + "           ,[user_id])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, likePost.getPost_id().getId());
            st.setInt(2, likePost.getUser_id().getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm hủy lượt thích
    public void deleteLikePost(int id, int userId) {
        String sql = "DELETE FROM [dbo].[List_of_post_liked]\n"
                + "      WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm đếm số lượng like 
    public int countLikedPost(int postId) {
        int count = 0;
        String sql = "SELECT count(*) as total FROM [dbo].[List_of_post_liked] WHERE [post_id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, postId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // hàm kiểm tra xem người nào đã like bài đăng hay chưa
    public LikePost chechLikePost(int post_id, int user_id) {
        String sql = "select * FROM [dbo].[List_of_post_liked] where [user_id] = ? and [post_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setInt(2, post_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                LikePost likePost = new LikePost();
                likePost.setId(rs.getInt("id"));
                User u = userDao.getUser(rs.getInt("user_id"));
                CommunityPost commentPost = getCommunityPost(rs.getInt("post_id"));
                likePost.setPost_id(commentPost);
                return likePost;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    // hàm lấy ra danh sách mà 1 cá nhân đã like
    public List<LikePost> getListLIkedPost(int user_id) {
        List<LikePost> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[post_id]\n"
                + "      ,[user_id]\n"
                + "  FROM [dbo].[List_of_post_liked] where [user_id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LikePost likePost = new LikePost();
                likePost.setId(rs.getInt("id"));
                CommunityPost cp = getCommunityPost(rs.getInt("post_id"));
                User u = userDao.getUser(rs.getInt("user_id"));
                likePost.setPost_id(cp);
                likePost.setUser_id(u);
                list.add(likePost);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // hàm add commment 
    public void addComment(CommentPost commentPost) {
        String sql = "INSERT INTO [dbo].[Comment]\n"
                + "           ([message]\n"
                + "           ,[user_id]\n"
                + "           ,[post_id])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, commentPost.getMassgee());
            st.setInt(2, commentPost.getUser_id().getId());
            st.setInt(3, commentPost.getPost_id().getId());
            st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm xóa commment
    public void deleteComment(int PostId, int userId) {
        String sql = "DELETE FROM [dbo].[Comment]\n"
                + "      WHERE [id] = ? and [user_id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, PostId);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm sửa commment
    public void updateComment(CommentPost commentPost, int messageId, int userid) {
        String sql = "UPDATE [dbo].[Comment]\n"
                + "   SET [message] = ?\n"
                + "      ,[user_id] = ?\n"
                + "      ,[post_id] = ?\n"
                + " WHERE [id] = ? and [user_id]= ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, commentPost.getMassgee());
            st.setInt(2, commentPost.getUser_id().getId());
            st.setInt(3, commentPost.getPost_id().getId());
            st.setInt(4, messageId);
            st.setInt(5, userid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // hàm đếm số lượng comment
    public int countCommentEachPost(int post_id) {
        int count = 0;
        String sql = "SELECT count(*) as total \n"
                + "  FROM [dbo].[Comment] where [post_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, post_id);
            ResultSet rs = st.executeQuery();

            count = rs.getInt("total");

        } catch (SQLException e) {

        }
        return count;
    }

    public static void main(String[] args) {
        CommunityPostDao cpd = new CommunityPostDao();
//        Post_image p = cpd.getFirstPostImage(18);
//        System.out.println(p.getImage());
//
//        CommunityPost cp = cpd.getCommunityPost(25);
//        cp.setNum_of_like(14);
//        cpd.updatePost(cp);
//        CommunityPost cp22 = cpd.getCommunityPost(25);
//        System.out.println(cp22.getNum_of_like());

        List<CommunityPost> list = cpd.searchCommunityPostsList("", 1, 6);
        for (CommunityPost item : list) {
            System.out.println(item);
        }
        System.out.println(cpd.getSizeOfListSearch(""));
    }
}
