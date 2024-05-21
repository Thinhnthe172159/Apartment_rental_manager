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

/**
 *
 * @author thinh
 */
public class ApartmentDao extends DBContext {

    //input apartment room
    public void input_apartApartment_room(Apartment a, Room r, Property p) {
        String sql = "INSERT INTO [dbo].[Apartment_room]\n"
                + "           ([room_id]\n"
                + "           ,[aprartment_id]\n"
                + "           ,[property_id])\n"
                + "     VALUES"
                + "           (?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getId());
            st.setInt(2, r.getId());
            st.setInt(3, p.getId());
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
            + "           ([name],\n"
            + "           [type_id],\n"
            + "           [address],\n"
            + "           [city],\n"
            + "           [district],\n"
            + "           [commune],\n"
            + "           [price],\n"
            + "           [area],\n"
            + "           [title],\n"
            + "           [description],\n"
            + "           [number_of_bedroom],\n"
            + "           [payment_type_for_post_id],\n"
            + "           [status_apartment],\n"
            + "           [post_start],\n"
            + "           [post_end],\n"
            + "           [landlord_id],\n"
            + "           [tenant_id])\n"
            + "     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setString(1, a.getName());
        st.setInt(2, a.getType_id().getId());
        st.setString(3, a.getAddress());
        st.setString(4, a.getCity());
        st.setString(5, a.getDistrict());
        st.setString(6, a.getCommune());
        st.setDouble(7, a.getPrice());
        st.setDouble(8, a.getArea());
        st.setString(9, a.getTitle());
        st.setString(10, a.getDescription());
        st.setInt(11, a.getNumber_of_bedroom());
        st.setInt(12, a.getPayment_type_for_post_id().getId());
        st.setInt(13, a.getStatus_apartment());
        st.setDate(14, a.getPost_start());
        st.setDate(15, a.getPost_end());
        st.setInt(16, a.getLandLord_id().getId());
        st.setInt(17, a.getTenant_id().getId());

        st.executeUpdate();
    } catch (SQLException e) {
        System.err.println("Error inserting apartment: " + e.getMessage());
    }
}


    public static void main(String[] args) {
        ApartmentDao apartmentDao = new ApartmentDao();
        Apartment_type at = apartmentDao.getApartment_type(1);
        UserDao ud = new UserDao();

        Apartment a = new Apartment(0, "thinh", at, "ha noi", "ha noi", "dong anh", "dai mach", 110000, 0, "none", "none", 2, apartmentDao.getPayment_method(1), 0, null, null, ud.getUser(1), ud.getUser(1));
        apartmentDao.insertApartment(a);
    }

}
