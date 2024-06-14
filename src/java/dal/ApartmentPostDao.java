/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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

    // get apartment post (lấy hàm này để lấy dữ liệu)
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

    //get Apartment post by apartment id
    public List<Apartment_Post> getApartment_Post_list_by_apartment_id(int id) {
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
                + "  FROM [dbo].[apartment_id] where [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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

    // list apartment size
    public int getApartmentPostSize(String name,
            String city,
            String district,
            String commune,
            double areaUp,
            double areaDown,
            double priceUp,
            double priceDown,
            int numberOfBedroom,
            int apartment_type,
            int status) {
        int result = 0;
        String sql = "SELECT COUNT([id]) AS list_size\n"
                + "FROM [ams].[dbo].[Apartment_Posts]\n"
                + "where 1=1 ";

        if (name != null) {
            sql += " and [title] LIKE N'%" + name + "%' ";
        }
        if (city != null) {
            sql += " and [city] LIKE N'%" + city + "%' ";
        }
        if (district != null) {
            sql += " and [district] LIKE N'%" + district + "%' ";
        }
        if (commune != null) {
            sql += " and [commune] LIKE N'%" + commune + "%' ";
        }
        if (areaUp != 0) {
            sql += " and [area] >= " + areaUp;
        }
        if (areaDown != 0) {
            sql += " and [area] <= " + areaDown;
        }
        if (priceUp != 0) {
            sql += " and [price] >= " + priceUp;
        }
        if (priceDown != 0) {
            sql += " and [price] <= " + priceDown;
        }
        if (numberOfBedroom != 0) {
            sql += " and [number_of_bedroom] =" + numberOfBedroom;
        }

        if (apartment_type != 0) {
            sql += " And [apartment_type] =" + apartment_type;
        }

        if (status != 0) {
            sql += " and [post_status] = " + status;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                result = rs.getInt("list_size");
                return result;
            }
        } catch (SQLException e) {

        }
        return 0;
    }

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
            int type,
            int status,
            int pageNumber,
            int pageSize, int payment_id) {
        List<Apartment_Post> list = new ArrayList<>();
        String sql = "SELECT [id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image] ";
        sql += "FROM [dbo].[Apartment_Posts] ";
        sql += "WHERE 1=1 ";

        if (name != null) {
            sql += "AND [title] LIKE N'%" + name + "%' ";
        }
        if (city != null) {
            sql += "AND [city] LIKE N'%" + city + "%' ";
        }
        if (district != null) {
            sql += "AND [district] LIKE N'%" + district + "%' ";
        }
        if (commune != null) {
            sql += "AND [commune] LIKE N'%" + commune + "%' ";
        }
        if (areaUp != 0) {
            sql += "AND [area] >= " + areaUp;
        }
        if (areaDown != 0) {
            sql += "AND [area] <= " + areaDown;
        }
        if (priceUp != 0) {
            sql += "AND [price] >= " + priceUp;
        }
        if (priceDown != 0) {
            sql += "AND [price] <= " + priceDown;
        }
        if (numberOfBedroom != 0) {
            sql += "AND [number_of_bedroom] =" + numberOfBedroom;
        }
        if (apartment_type != 0) {
            sql += "AND [apartment_type] =" + apartment_type;
        }
        if (status != 0) {
            sql += "AND [post_status] = " + status;
        }
        if (payment_id != 0) {
            sql += " and [payment_id] = " + payment_id;
        }

        switch (type) {
            case 1 ->
                sql += "ORDER BY [price]  ";
            case 2 ->
                sql += "ORDER BY [price] desc ";
            default ->
                sql += " order by [payment_id] desc, [post_start] DESC  , [id] DESC ";
        }

        int offset = (pageNumber - 1) * pageSize;

        sql += "OFFSET " + offset + " ROWS ";
        sql += "FETCH NEXT " + pageSize + " ROWS ONLY ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment_Post ap = new Apartment_Post();
                ap.setId(rs.getInt("id"));
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
        System.out.println(sql);
        return list;
    }

    // update Apartment post
    public void updateApartmentPost(Apartment_Post ap, int id) {
        String sql = "UPDATE [dbo].[Apartment_Posts]\n"
                + "   SET [title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[post_status] = ?\n"
                + "      ,[post_start] = ?\n"
                + "      ,[post_end] = ?\n"
                + "      ,[apartment_id] = ?\n"
                + "      ,[payment_id] = ?\n"
                + "      ,[landlord_id] = ?\n"
                + "      ,[first_image] = ?\n"
                + "      ,[city] = ?\n"
                + "      ,[district] = ?\n"
                + "      ,[commune] = ?\n"
                + "      ,[area] = ?\n"
                + "      ,[number_of_bedroom] = ?\n"
                + "      ,[apartment_name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[apartment_type] = ?\n"
                + "      ,[total_image] = ?\n"
                + " WHERE [id]= ? ";
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
            st.setInt(19, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    // update Apartment post by apartment id
    public void updateApartmentPostByApartmentId(Apartment_Post ap, int id) {
        String sql = "UPDATE [dbo].[Apartment_Posts]\n"
                + "   SET [apartment_id] = ?\n"
                + "      ,[landlord_id] = ?\n"
                + "      ,[first_image] = ?\n"
                + "      ,[city] = ?\n"
                + "      ,[district] = ?\n"
                + "      ,[commune] = ?\n"
                + "      ,[area] = ?\n"
                + "      ,[number_of_bedroom] = ?\n"
                + "      ,[apartment_name] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[apartment_type] = ?\n"
                + "      ,[total_image] = ?\n"
                + " WHERE [apartment_id]= ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ap.getApartment_id().getId());
            st.setInt(2, ap.getLandlord_id().getId());
            st.setString(3, ap.getFirst_image());
            st.setString(4, ap.getCity());
            st.setString(5, ap.getDistrict());
            st.setString(6, ap.getCommune());
            st.setDouble(7, ap.getArea());
            st.setInt(8, ap.getNumber_of_bedroom());
            st.setString(9, ap.getApartment_name());
            st.setDouble(10, ap.getPrice());
            st.setInt(11, ap.getApartment_type().getId());
            st.setInt(12, ap.getTotal_image());
            st.setInt(13, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public static void main(String[] args) {
        ApartmentDao apartmentDao = new ApartmentDao();
        UserDao userDao = new UserDao();
        ApartmentPostDao apartmentPostDao = new ApartmentPostDao();
        Apartment_Post ap = apartmentPostDao.getApartment_Post(7);
        ap.setCity("HO Chi Minh city");
        ap.setDistrict("Quan 7");
        ap.setFirst_image("quan.jpg");
        apartmentPostDao.updateApartmentPost(ap, 7);

    }
}
