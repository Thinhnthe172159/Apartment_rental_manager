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
import model.Apartment_type;
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
                + "           ,[landlord_id]\n"
                + "           ,[first_image]\n"
                + "           ,[city]\n"
                + "           ,[district]\n"
                + "           ,[commune]\n"
                + "           ,[area]\n"
                + "           ,[number_of_bedroom]\n"
                + "           ,[apartment_name]\n"
                + "           ,[price]\n"
                + "           ,[apartment_type] \n"
                + "           ,[total_image])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, ap.getTitle());
            st.setString(2, ap.getDescription());
            st.setInt(3, ap.getPost_status());
            st.setDate(4, ap.getPost_start());
            st.setDate(5, ap.getPost_end());
            st.setInt(6, ap.getApartment_id().getId());
            st.setInt(7, ap.getPayment_id().getId());
            st.setInt(8, ap.getLandlord_id().getId());
            st.setString(9, ap.getFirst_image());
            st.setString(10, ap.getCity());
            st.setString(11, ap.getDistrict());
            st.setString(12, ap.getCommune());
            st.setDouble(13, ap.getArea());
            st.setInt(14, ap.getNumber_of_bedroom());
            st.setString(15, ap.getApartment_name());
            st.setDouble(16, ap.getPrice());
            st.setInt(17, ap.getApartment_type().getId());
            st.setInt(18, ap.getTotal_image());
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
                + "      ,[first_image]\n"
                + "      ,[city]\n"
                + "      ,[district]\n"
                + "      ,[commune]\n"
                + "      ,[area]\n"
                + "      ,[number_of_bedroom]\n"
                + "      ,[apartment_name]\n"
                + "      ,[price]\n"
                + "      ,[apartment_type]\n"
                + "      ,[total_image]\n"
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
                ap.setFirst_image(rs.getString("first_image"));
                ap.setCity(rs.getString("city"));
                ap.setDistrict(rs.getString("district"));
                ap.setCommune(rs.getString("commune"));
                ap.setArea(rs.getDouble("area"));
                ap.setNumber_of_bedroom(rs.getInt("number_of_bedroom"));
                ap.setApartment_name(rs.getString("apartment_name"));
                ap.setPrice(rs.getDouble("price"));
                Apartment_type at = apartmentDao.getApartment_type(rs.getInt("apartment_type"));
                ap.setApartment_type(at);
                ap.setTotal_image(rs.getInt("total_image"));
                return ap;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // list apartment
    public List<Apartment_Post> getApartment_Post_List(String name,
            String city,
            String district,
            String commune,
            double areaUp,
            double areaDown,
            double priceUp,
            double priceDown,
            int numberOfBedroom,
            int apartment_type,
            int type) {
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
                + "      ,[first_image]\n"
                + "      ,[city]\n"
                + "      ,[district]\n"
                + "      ,[commune]\n"
                + "      ,[area]\n"
                + "      ,[number_of_bedroom]\n"
                + "      ,[apartment_name]\n"
                + "      ,[price]\n"
                + "      ,[apartment_type]\n"
                + "      ,[total_image]\n"
                + "  FROM [dbo].[Apartment_Posts] where 1=1 ";

        if (!name.isEmpty() && name != null) {
            sql += " and [apartment_name] LIKE '%" + name + "%' ";
        }
        if (!city.isEmpty() && city != null) {
            sql += " and [city] LIKE '%" + city + "%' ";
        }
        if (!district.isEmpty() && district != null) {
            sql += " and [district] LIKE '%" + district + "%' ";
        }
        if (!commune.isEmpty() && commune != null) {
            sql += " and [commune] LIKE '%" + commune + "%' ";
        }
        if (areaUp != 0) {
            sql += " and [area] =>" + areaUp;
        }
        if (areaDown != 0) {
            sql += " and [area] <=" + areaDown;
        }
        if (priceUp != 0) {
            sql += " and [price] >= " + priceUp;
        }
        if (priceDown != 0) {
            sql += " and [price] <= " + priceDown;
        }
        if (numberOfBedroom != 0) {
            sql += " and [number_of_bedroom] " + numberOfBedroom;
        }
        if (type != 0) {
            sql += " order by [price] desc ";
        }
        if (apartment_type != 0) {
            sql += " and [apartment_type] =" + apartment_type;
        }

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
                ap.setFirst_image(rs.getString("first_image"));
                ap.setCity(rs.getString("city"));
                ap.setDistrict(rs.getString("district"));
                ap.setCommune(rs.getString("commune"));
                ap.setArea(rs.getDouble("area"));
                ap.setNumber_of_bedroom(rs.getInt("number_of_bedroom"));
                ap.setApartment_name(rs.getString("apartment_name"));
                ap.setPrice(rs.getDouble("price"));
                Apartment_type at = apartmentDao.getApartment_type(rs.getInt("apartment_type"));
                ap.setApartment_type(at);
                ap.setTotal_image(rs.getInt("total_image"));
                list.add(ap);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public static void main(String[] args) {
        ApartmentDao apartmentDao = new ApartmentDao();
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
