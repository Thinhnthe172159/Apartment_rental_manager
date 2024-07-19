/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Notification;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Apartment_properties;
import model.Apartment_type;
import model.Payment_method;
import model.Property;
import model.Room;
import model.Apartment_image;
import model.User;

/**
 *
 * @author thinh
 */
public class NotificationDao extends DBContext {

    private UserDao ud = new UserDao();

    // add notification 
    public void addNotification(Notification n) {
        String sql = "INSERT INTO [dbo].[Notification]\n"
                + "           ([From_user_id]\n"
                + "           ,[To_user_id]\n"
                + "           ,[message]\n"
                + "           ,[title],[status],[time])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, n.getFrom_user_id().getId());
            st.setInt(2, n.getTo_user_id().getId());
            st.setString(3, n.getMessage());
            st.setString(4, n.getTitle());
            st.setInt(5, n.getStatus());
            Timestamp timestamp = Timestamp.valueOf(n.getTime());
            st.setTimestamp(6, timestamp);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // update notification 
    public void updateNotification(Notification n) {
        String sql = "UPDATE [dbo].[Notification]\n"
                + "   SET [From_user_id] = ?\n"
                + "      ,[To_user_id] = ?\n"
                + "      ,[message] = ?\n"
                + "      ,[title] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, n.getFrom_user_id().getId());
            st.setInt(2, n.getTo_user_id().getId());
            st.setString(3, n.getMessage());
            st.setString(4, n.getTitle());
            st.setInt(5, n.getStatus());
            st.setInt(6, n.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // get Notification
    public Notification getNotification(int notfiId) {
        String sql = "SELECT [id]\n"
                + "      ,[From_user_id]\n"
                + "      ,[To_user_id]\n"
                + "      ,[message]\n"
                + "      ,[title],[status],[time]\n"
                + "  FROM [dbo].[Notification] where [id] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, notfiId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                User u = ud.getUser(rs.getInt("From_user_id"));
                User u2 = ud.getUser(rs.getInt("To_user_id"));
                n.setFrom_user_id(u);
                n.setTo_user_id(u2);
                n.setMessage(rs.getString("message"));
                n.setTitle(rs.getString("title"));
                n.setStatus(rs.getInt("status"));
                Timestamp timestamp = rs.getTimestamp("time");
                n.setTime(timestamp.toLocalDateTime());
                return n;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // list search notification 
    public List<Notification> getListNotificationList(int userTo, String search) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    n.[id],\n"
                + "    n.[From_user_id],\n"
                + "    n.[To_user_id],\n"
                + "    n.[message],\n"
                + "    n.[title],\n"
                + "    n.[status],\n"
                + "    n.[time]\n"
                + "FROM \n"
                + "    [dbo].[Notification] as n \n"
                + "JOIN \n"
                + "    [dbo].[User] as u \n"
                + "ON \n"
                + "    n.From_user_id = u.id\n"
                + "WHERE \n"
                + "    n.[To_user_id] = ?\n";

        if (search != null) {
            sql += "AND (u.last_name LIKE N'%"+search+"%' OR u.first_name LIKE N'%"+search+"%' OR n.title LIKE N'%"+search+"%') ";
        }

        sql += "ORDER BY [time] DESC";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userTo);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("id"));
                User u = ud.getUser(rs.getInt("From_user_id"));
                User u2 = ud.getUser(rs.getInt("To_user_id"));
                n.setFrom_user_id(u);
                n.setTo_user_id(u2);
                n.setMessage(rs.getString("message"));
                n.setTitle(rs.getString("title"));
                n.setStatus(rs.getInt("status"));
                Timestamp timestamp = rs.getTimestamp("time");
                n.setTime(timestamp.toLocalDateTime());
                list.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // count not read notification
    public int countNotificationNotRead(int ToUserId) {
        String sql = "SELECT count([id]) as not_read\n"
                + "  FROM [dbo].[Notification] where [status] = 1 and [To_user_id] = ?";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ToUserId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("not_read");
            }
        } catch (SQLException e) {

        }
        return count;
    }
    // test

    public static void main(String[] args) {
        NotificationDao nd = new NotificationDao();
//        User user = ud.getUser(13);
//        User user2 = ud.getUser(2);
//        Notification n = new Notification();
//        n.setFrom_user_id(user);
//        n.setTo_user_id(user2);
//        n.setMessage("hello");
//        n.setTitle("xin chao");
//        n.setStatus(1);
//        n.setTime(LocalDateTime.now());
//         nd.addNotification(n);
        Notification n = nd.getNotification(1);
        System.out.println(n);
    }

}
