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
import model.Apartment_room;
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
public class ApartmentDao extends DBContext {

    private UserDao userDao = new UserDao();

    //input apartment room
    public void input_ApartApartment_room(int apartment_id, int property_id) {
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
                + "  FROM [dbo].[Property]"
                + "where [id] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Property p = new Property(rs.getInt("id"), rs.getString("name"), getRoom(rs.getInt("room_id")));
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
                + "  FROM [dbo].[Property]"
                + "where 1=1 ";
        sql += "and [room_id] =" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Property p = new Property(rs.getInt("id"), rs.getString("name"), getRoom(rs.getInt("room_id")));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Property> getPropertyList() {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[room_id]\n"
                + "  FROM [dbo].[Property]"
                + "where 1=1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Property p = new Property(rs.getInt("id"), rs.getString("name"), getRoom(rs.getInt("room_id")));
                list.add(p);
            }
        } catch (SQLException e) {

        }
        return list;
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
                + "  FROM [dbo].[Payement_method] where id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Payment_method pm = new Payment_method(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getDouble("price"));
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
                + "  FROM [dbo].[Payement_method] where 1=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Payment_method pm = new Payment_method(rs.getInt("id"), rs.getString("name"), rs.getString("description"), rs.getDouble("price"));
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

    //List Apartment
    public List<Apartment> getApartment() {

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

    public static void main(String[] args) {
        ApartmentDao apartmentDao = new ApartmentDao();
        Apartment a = apartmentDao.getLatedApartment();
        System.out.println(a);
        List<Property> list = apartmentDao.getPropertyList();
        for (Property i : list) {
            System.out.println(i);
        }
    }

}
