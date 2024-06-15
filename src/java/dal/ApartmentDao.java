/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import org.apache.tomcat.util.http.fileupload.ParameterParser;

/**
 *
 * @author thinh
 */
public class ApartmentDao extends DBContext {

    private UserDao userDao = new UserDao();

    //input apartment property
    public void input_ApartApartment_properties(int apartment_id, int property_id) {
        String sql = "INSERT INTO [dbo].[Apartment_room]\n"
                + "           ([apartment_id]\n"
                + "           ,[property_id])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, apartment_id);
            st.setInt(2, property_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }

    }

    // get list property 
    public List<Apartment_properties> get_apartment_properties_list_by_id(int id) {
        List<Apartment_properties> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[apartment_id]\n"
                + "      ,[property_id]\n"
                + "  FROM [dbo].[Apartment_room] where [apartment_id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment_properties apartment_properties = new Apartment_properties();
                Apartment a = getApartment(rs.getInt("apartment_id"));
                Property p = getProperty(rs.getInt("property_id"));
                apartment_properties.setApartment_id(a);
                apartment_properties.setProperty_id(p);
                list.add(apartment_properties);
            }

        } catch (SQLException e) {

        }
        return list;
    }

    // get Apartment property
    public Apartment_properties get_apartment_properties_by_id(int id) {
        List<Apartment_properties> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[apartment_id]\n"
                + "      ,[property_id]\n"
                + "  FROM [dbo].[Apartment_room] where [id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment_properties apartment_properties = new Apartment_properties();
                Apartment a = getApartment(rs.getInt("apartment_id"));
                Property p = getProperty(rs.getInt("property_id"));
                apartment_properties.setApartment_id(a);
                apartment_properties.setProperty_id(p);
                return apartment_properties;
            }

        } catch (SQLException e) {

        }
        return null;
    }

    //get all apartment properties
    //select room  
    public Room getRoom(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Room]"
                + "where [id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Room r = new Room(rs.getInt("id"), rs.getString("name"));
                return r;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // get room list
    public List<Room> getRoomList() {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Room]"
                + "where 1=1  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room r = new Room(rs.getInt("id"), rs.getString("name"));
                list.add(r);
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // get Property
    public Property getProperty(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[room_id]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Property]"
                + "where [id] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Property p = new Property(rs.getInt("id"), rs.getString("name"), getRoom(rs.getInt("room_id")), rs.getString("image"));
                return p;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    //get property list
    public List<Property> getPropertyList(int id) {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[room_id]\n"
                + "      ,[image]\n"
                + "  FROM [dbo].[Property]"
                + "where 1=1 ";
        sql += "and [room_id] =" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Property p = new Property(rs.getInt("id"), rs.getString("name"), getRoom(rs.getInt("room_id")), rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    // get all properties list 
    public List<Property> getPropertyList() {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Property]"
                + "where 1=1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Property p = new Property(rs.getInt("id"), rs.getString("name"), getRoom(rs.getInt("room_id")), rs.getString("image"));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    //delete properties
    public void deleteApartmentProperties(int apartment_id) {
        String sql = "DELETE FROM [dbo].[Apartment_room]\n"
                + "      WHERE [apartment_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, apartment_id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    //Apartment type
    public Apartment_type getApartment_type(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Apartment_type] where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment_type at = new Apartment_type(rs.getInt("id"), rs.getString("name"));
                return at;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    //Apartment type list
    public List<Apartment_type> getApartment_type_list() {
        List<Apartment_type> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Apartment_type] where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment_type at = new Apartment_type(rs.getInt("id"), rs.getString("name"));
                list.add(at);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    //payment_type_select
    public Payment_method getPayment_method(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[week]\n"
                + "  FROM [dbo].[Payement_method] where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Payment_method pm = new Payment_method(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getDouble("price"), rs.getInt("week"));
                return pm;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    //payment list
    public List<Payment_method> getPayment_method_list() {
        List<Payment_method> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[week]\n"
                + "  FROM [dbo].[Payement_method] where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment_method pm = new Payment_method(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getDouble("price"), rs.getInt("week"));
                list.add(pm);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //image insert
    public void insertApartmentImage(Apartment_image ai) {
        String sql = "INSERT INTO [dbo].[Apartment_image]\n"
                + "           ([image]\n"
                + "           ,[Apartment_id])\n"
                + "     VALUES\n"
                + "           (?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ai.getImage());
            st.setInt(2, ai.getApartment_id().getId());
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    // get first image
    public Apartment_image get_First_Apartment_Image(int id) {
        String sql = "SELECT top 1 [id]\n"
                + "      ,[image]\n"
                + "      ,[Apartment_id]\n"
                + "  FROM [dbo].[Apartment_image]\n"
                + "    where [Apartment_id] = ? order by [id]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment_image ai = new Apartment_image();
                ai.setId(rs.getInt("id"));
                ai.setImage(rs.getString("image"));
                Apartment a = getApartment(rs.getInt("Apartment_id"));
                ai.setApartment_id(a);
                return ai;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // get image by id
    public Apartment_image getApartmentImage(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[image]\n"
                + "      ,[Apartment_id]\n"
                + "  FROM [dbo].[Apartment_image]\n"
                + "    where [id] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment a = getApartment(rs.getInt("Apartment_id"));
                Apartment_image ai = new Apartment_image(rs.getInt("id"), rs.getString("image"), a);
                return ai;
            }

        } catch (Exception e) {
        }
        return null;
    }

    //get all image each apartment
    public List<Apartment_image> getAllApartmentImageList(int id) {
        List<Apartment_image> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[image]\n"
                + "      ,[Apartment_id]\n"
                + "  FROM [dbo].[Apartment_image] where [Apartment_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment_image ai = new Apartment_image();
                ai.setId(rs.getInt("id"));
                ai.setImage(rs.getString("image"));
                Apartment a = getApartment(rs.getInt("Apartment_id"));
                ai.setApartment_id(a);
                list.add(ai);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    //get all image
    public List<Apartment_image> getAllApartmentImageList() {
        List<Apartment_image> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[image]\n"
                + "      ,[Apartment_id]\n"
                + "  FROM [dbo].[Apartment_image] where 1=1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment_image ai = new Apartment_image();
                ai.setId(rs.getInt("id"));
                ai.setImage(rs.getString("image"));
                Apartment a = getApartment(rs.getInt("Apartment_id"));
                ai.setApartment_id(a);
                list.add(ai);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    // delete image 
    public void deleteImageById(int id) {
        String sql = "Delete FROM [dbo].[Apartment_image]\n"
                + "where [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // Apartment insert
    public void insertApartment(Apartment a) {
        String sql = "INSERT INTO [dbo].[Aparment]\n"
                + "           ([name]\n"
                + "           ,[type_id]\n"
                + "           ,[address]\n"
                + "           ,[city]\n"
                + "           ,[district]\n"
                + "           ,[commune]\n"
                + "           ,[price]\n"
                + "           ,[area]\n"
                + "           ,[number_of_bedroom]\n"
                + "           ,[status_apartment]\n"
                + "           ,[landlord_id]\n"
                + "           ,[tenant_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, a.getName());
            st.setInt(2, a.getType_id().getId());
            st.setString(3, a.getAddress());
            st.setString(4, a.getCity());
            st.setString(5, a.getDistrict());
            st.setString(6, a.getCommune());
            st.setDouble(7, a.getPrice());
            st.setDouble(8, a.getArea());
            st.setInt(9, a.getNumber_of_bedroom());
            st.setInt(10, a.getStatus_apartment());
            st.setInt(11, a.getLandLord_id().getId());
            st.setInt(12, a.getTenant_id().getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error inserting apartment: " + e.getMessage());
        }

    }

    //get Apartment
    public Apartment getApartment(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[type_id]\n"
                + "      ,[address]\n"
                + "      ,[city]\n"
                + "      ,[district]\n"
                + "      ,[commune]\n"
                + "      ,[price]\n"
                + "      ,[area]\n"
                + "      ,[number_of_bedroom]\n"
                + "      ,[status_apartment]\n"
                + "      ,[landlord_id]\n"
                + "      ,[tenant_id]\n"
                + "  FROM [dbo].[Aparment]"
                + " where [id] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment a = new Apartment();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                Apartment_type at = getApartment_type(rs.getInt("type_id"));
                a.setType_id(at);
                a.setAddress(rs.getString("address"));
                a.setCity(rs.getString("city"));
                a.setDistrict(rs.getString("district"));
                a.setCommune(rs.getString("commune"));
                a.setPrice(rs.getDouble("price"));
                a.setArea(rs.getDouble("area"));
                a.setNumber_of_bedroom(rs.getInt("number_of_bedroom"));
                a.setStatus_apartment(rs.getInt("status_apartment"));
                User landlord = userDao.getUser(rs.getInt("landlord_id"));
                User tenant = userDao.getUser(rs.getInt("tenant_id"));
                a.setLandLord_id(landlord);
                a.setTenant_id(tenant);
                return a;
            }
        } catch (SQLException e) {

        }

        return null;
    }

    //List Apartment search
    public List<Apartment> getApartmentList(int landlord_id) {

        List<Apartment> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[type_id]\n"
                + "      ,[address]\n"
                + "      ,[city]\n"
                + "      ,[district]\n"
                + "      ,[commune]\n"
                + "      ,[price]\n"
                + "      ,[area]\n"
                + "      ,[number_of_bedroom]\n"
                + "      ,[status_apartment]\n"
                + "      ,[landlord_id]\n"
                + "      ,[tenant_id]\n"
                + "  FROM [dbo].[Aparment]"
                + " where 1=1";
        if (landlord_id != 0) {
            sql += " and [landlord_id] = " + landlord_id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Apartment a = new Apartment();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                Apartment_type at = getApartment_type(rs.getInt("type_id"));
                a.setType_id(at);
                a.setAddress(rs.getString("address"));
                a.setCity(rs.getString("city"));
                a.setDistrict(rs.getString("district"));
                a.setCommune(rs.getString("commune"));
                a.setPrice(rs.getDouble("price"));
                a.setArea(rs.getDouble("area"));
                a.setNumber_of_bedroom(rs.getInt("number_of_bedroom"));
                a.setStatus_apartment(rs.getInt("status_apartment"));
                User landlord = userDao.getUser(rs.getInt("landlord_id"));
                User tenant = userDao.getUser(rs.getInt("tenant_id"));
                a.setLandLord_id(landlord);
                a.setTenant_id(tenant);
                list.add(a);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    // paging search
    public List<Apartment> getApartmentList(int landlord_id, String name, int apartment_type_id, String city, String district, String commune, int status, int pageNumber, int pageSize) {

        List<Apartment> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[type_id]\n"
                + "      ,[address]\n"
                + "      ,[city]\n"
                + "      ,[district]\n"
                + "      ,[commune]\n"
                + "      ,[price]\n"
                + "      ,[area]\n"
                + "      ,[number_of_bedroom]\n"
                + "      ,[status_apartment]\n"
                + "      ,[landlord_id]\n"
                + "      ,[tenant_id]\n"
                + "  FROM [dbo].[Aparment]"
                + " where 1=1";

        if (landlord_id != 0) {
            sql += " AND [landlord_id] = ?";
        }
        if (name != null && !name.isEmpty()) {
            sql += " AND [name] LIKE ?";
        }
        if (apartment_type_id != 0) {
            sql += " AND [type_id] = ?";
        }
        if (city != null) {
            sql += " AND [city] LIKE ?";
        }
        if (district != null) {
            sql += " AND [district] LIKE ?";
        }
        if (commune != null) {
            sql += " AND [commune] LIKE ?";
        }
        if (status != 0) {
            sql += " and [status_apartment] = ?";
        }
        sql += " ORDER BY [id] DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int paramIndex = 1;

            if (landlord_id != 0) {
                st.setInt(paramIndex++, landlord_id);
            }
            if (name != null ) {
                st.setString(paramIndex++, "%" + name + "%");
            }
            if (apartment_type_id != 0) {
                st.setInt(paramIndex++, apartment_type_id);
            }
            if (city != null ) {
                st.setString(paramIndex++, "%" + city + "%");
            }
            if (district != null ) {
                st.setString(paramIndex++, "%" + district + "%");
            }
            if (status != 0) {
                st.setInt(paramIndex++, status);
            }
            if (commune != null ) {
                st.setString(paramIndex++, "%" + commune + "%");
            }
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(paramIndex++, offset);
            st.setInt(paramIndex++, pageSize);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Apartment a = new Apartment();
                    a.setId(rs.getInt("id"));
                    a.setName(rs.getString("name"));
                    Apartment_type at = getApartment_type(rs.getInt("type_id"));
                    a.setType_id(at);
                    a.setAddress(rs.getString("address"));
                    a.setCity(rs.getString("city"));
                    a.setDistrict(rs.getString("district"));
                    a.setCommune(rs.getString("commune"));
                    a.setPrice(rs.getDouble("price"));
                    a.setArea(rs.getDouble("area"));
                    a.setNumber_of_bedroom(rs.getInt("number_of_bedroom"));
                    a.setStatus_apartment(rs.getInt("status_apartment"));
                    User landlord = userDao.getUser(rs.getInt("landlord_id"));
                    User tenant = userDao.getUser(rs.getInt("tenant_id"));
                    a.setLandLord_id(landlord);
                    a.setTenant_id(tenant);
                    list.add(a);
                }
            }
        } catch (SQLException e) {

        }

        return list;
    }

    //list size paging
    public int getApartmentListSize(int landlord_id, String name, int apartment_type_id, String city, String district, String commune, int status) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS total FROM [dbo].[Aparment] WHERE 1=1";

        if (landlord_id != 0) {
            sql += " AND [landlord_id] = ?";
        }
        if (name != null ) {
            sql += " AND [name] LIKE ?";
        }
        if (apartment_type_id != 0) {
            sql += " AND [type_id] = ?";
        }
        if (city != null ) {
            sql += " AND [city] LIKE ?";
        }
        if (district != null ) {
            sql += " AND [district] LIKE ?";
        }
        if (commune != null ) {
            sql += " AND [commune] LIKE ?";
        }
        if (status != 0) {
            sql += " and [status_apartment] = ?";
        }

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int paramIndex = 1;

            if (landlord_id != 0) {
                st.setInt(paramIndex++, landlord_id);
            }
            if (name != null ) {
                st.setString(paramIndex++, "%" + name + "%");
            }
            if (apartment_type_id != 0) {
                st.setInt(paramIndex++, apartment_type_id);
            }
            if (city != null ) {
                st.setString(paramIndex++, "%" + city + "%");
            }
            if (district != null ) {
                st.setString(paramIndex++, "%" + district + "%");
            }
            if (commune != null ) {
                st.setString(paramIndex++, "%" + commune + "%");
            }
            if (status != 0) {
                st.setInt(paramIndex++, status);
            }

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    // get newest apartment
    public Apartment getLatedApartment() {
        String sql = "SELECT top 1 * from [dbo].[Aparment]\n"
                + "order by [id] desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Apartment a = new Apartment();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                Apartment_type at = getApartment_type(rs.getInt("type_id"));
                a.setType_id(at);
                a.setAddress(rs.getString("address"));
                a.setCity(rs.getString("city"));
                a.setDistrict(rs.getString("district"));
                a.setCommune(rs.getString("commune"));
                a.setPrice(rs.getDouble("price"));
                a.setArea(rs.getDouble("area"));
                a.setNumber_of_bedroom(rs.getInt("number_of_bedroom"));
                a.setStatus_apartment(rs.getInt("status_apartment"));
                User landlord = userDao.getUser(rs.getInt("landlord_id"));
                User tenant = userDao.getUser(rs.getInt("tenant_id"));
                a.setLandLord_id(landlord);
                a.setTenant_id(tenant);
                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    // update date apartment information
    public void updateApartment(Apartment a, int id) {
        String sql = "UPDATE [dbo].[Aparment]\n"
                + "   SET [name] = ?\n"
                + "      ,[type_id] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[city] = ?\n"
                + "      ,[district] =?\n"
                + "      ,[commune] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[area] = ?\n"
                + "      ,[number_of_bedroom] =?\n"
                + "      ,[status_apartment] = ?\n"
                + "      ,[landlord_id] = ?\n"
                + "      ,[tenant_id] = ?\n"
                + " WHERE [id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getName());
            st.setInt(2, a.getType_id().getId());
            st.setString(3, a.getAddress());
            st.setString(4, a.getCity());
            st.setString(5, a.getDistrict());
            st.setString(6, a.getCommune());
            st.setDouble(7, a.getPrice());
            st.setDouble(8, a.getArea());
            st.setInt(9, a.getNumber_of_bedroom());
            st.setInt(10, a.getStatus_apartment());
            st.setInt(11, a.getLandLord_id().getId());
            st.setInt(12, a.getTenant_id().getId());
            st.setInt(13, id);
            st.executeUpdate();
        } catch (SQLException e) {

        }
    }

    //delete apartment
    public void removeApartment(int id_apartment) {
        String sql = "DELETE FROM [dbo].[Apartment_room]\n"
                + "where apartment_id = ? ;\n"
                + "DELETE FROM [dbo].[Apartment_Posts]\n"
                + "where [apartment_id] = ? ;\n"
                + "Delete FROM [dbo].[Apartment_image]\n"
                + "where [Apartment_id] = ? ;\n"
                + "DELETE FROM [dbo].[Aparment]\n"
                + "      WHERE [id] = ? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id_apartment);
            st.setInt(2, id_apartment);
            st.setInt(3, id_apartment);
            st.setInt(4, id_apartment);
            st.executeUpdate();
        } catch (SQLException e) {

        }

    }

    public static void main(String[] args) {
        ApartmentDao apartmentDao = new ApartmentDao();
        Apartment_image a = apartmentDao.get_First_Apartment_Image(51);
        Apartment_image b = apartmentDao.get_First_Apartment_Image(51);
        System.out.println(a);
        System.out.println(b);
    }

}
