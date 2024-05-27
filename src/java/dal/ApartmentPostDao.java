/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Apartment;
import model.Apartment_Post;
import model.Payment_method;
import model.User;

/**
 *
 * @author thinh
 */
public class ApartmentPostDao extends DBContext {

    private ApartmentDao apartmentDao = new ApartmentDao();
    private UserDao userDao = new UserDao();

    public void addApartmentPost(Apartment_Post ap) {
        String sql = "INSERT INTO [dbo].[Apartment_Posts]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[post_status]\n"
                + "           ,[post_start]\n"
                + "           ,[post_end]\n"
                + "           ,[apartment_id]\n"
                + "           ,[payment_id]\n"
                + "           ,[landlord_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ap.getTitle());
            st.setString(2, ap.getDescription());
            st.setInt(3, ap.getPost_status());
            st.setDate(4, ap.getPost_start());
            st.setDate(5, ap.getPost_end());
            st.setInt(6, ap.getApartment_id().getId());
            st.setInt(7, ap.getPayment_id().getId());
            st.setInt(8, ap.getLandlord_id().getId());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    // get apartment post
    public Apartment_Post getApartment_Post(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[post_status]\n"
                + "      ,[post_start]\n"
                + "      ,[post_end]\n"
                + "      ,[apartment_id]\n"
                + "      ,[payment_id]\n"
                + "      ,[landlord_id]\n"
                + "  FROM [dbo].[Apartment_Posts] where [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment_Post ap = new Apartment_Post();
                ap.setTitle(rs.getString("title"));
                ap.setDescription(rs.getString("description"));
                ap.setPost_status(rs.getInt("post_status"));
                ap.setPost_start(rs.getDate("post_start"));
                ap.setPost_end(rs.getDate("post_end"));
                Apartment a = apartmentDao.getApartment(rs.getInt("apartment_id"));
                ap.setApartment_id(a);
                Payment_method pm = apartmentDao.getPayment_method(rs.getInt("payment_id"));
                ap.setPayment_id(pm);
                User u = userDao.getUser(rs.getInt("landlord_id"));
                ap.setLandlord_id(u);
                return ap;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // list apartment
    public List<Apartment_Post> getApartment_Post_List() {
        List<Apartment_Post> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[post_status]\n"
                + "      ,[post_start]\n"
                + "      ,[post_end]\n"
                + "      ,[apartment_id]\n"
                + "      ,[payment_id]\n"
                + "      ,[landlord_id]\n"
                + "  FROM [dbo].[Apartment_Posts] where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment_Post ap = new Apartment_Post();
                ap.setTitle(rs.getString("title"));
                ap.setDescription(rs.getString("description"));
                ap.setPost_status(rs.getInt("post_status"));
                ap.setPost_start(rs.getDate("post_start"));
                ap.setPost_end(rs.getDate("post_end"));
                Apartment a = apartmentDao.getApartment(rs.getInt("apartment_id"));
                ap.setApartment_id(a);
                Payment_method pm = apartmentDao.getPayment_method(rs.getInt("payment_id"));
                ap.setPayment_id(pm);
                User u = userDao.getUser(rs.getInt("landlord_id"));
                ap.setLandlord_id(u);
                list.add(ap);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ApartmentDao apartmentDao = new  ApartmentDao();
        UserDao userDao = new UserDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        Apartment_Post ap = new Apartment_Post();
        ap.setTitle("asdsad");
        ap.setDescription("asdasdasdsad");
        Apartment a;
        a = apartmentDao.getApartment(1);
        ap.setApartment_id(a);
        Payment_method pm = apartmentDao.getPayment_method(2);
        ap.setPayment_id(pm);
        User user = userDao.getUser(1);
        ap.setLandlord_id(user);
        apartmentPostDao.addApartmentPost(ap);
        System.out.println(apartmentPostDao.getApartment_Post(1));
    }
}
