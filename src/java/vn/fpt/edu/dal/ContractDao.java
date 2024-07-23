/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vn.fpt.edu.model.Apartment;
import vn.fpt.edu.model.Contract;
import vn.fpt.edu.model.User;

/**
 *
 * @author thinh
 */
public class ContractDao extends DBContext {

    private static final UserDao UD = new UserDao();
    private static final ApartmentDao AD = new ApartmentDao();

    //add contract
    public void addContract(Contract c) {
        String sql = "INSERT INTO [dbo].[Contract]\n"
                + "           ([tenant_id]\n"
                + "           ,[landlord_id]\n"
                + "           ,[apartment_id]\n"
                + "           ,[status]\n"
                + "           ,[phone]\n"
                + "           ,[full_name]\n"
                + "           ,[email]\n"
                + "           ,[city]\n"
                + "           ,[district]\n"
                + "           ,[commune]\n"
                + "           ,[address]\n"
                + "           ,[note]\n"
                + "           ,[cccd]\n"
                + "           ,[current_living]\n"
                + "           ,[tenant_avatar]\n"
                + "           ,[cccd_civil_card_front]\n"
                + "           ,[cccd_civil_card_back]\n"
                + "           ,[dob]\n"
                + "           ,[cccd_receive_date]\n"
                + "           ,[office_name])\n"
                + "     VALUES\n"
                + "          (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getTenant_id().getId());
            st.setInt(2, c.getLandlord_id().getId());
            st.setInt(3, c.getApartment_id().getId());
            st.setInt(4, c.getStatus());
            st.setString(5, c.getPhone());
            st.setString(6, c.getFull_name());
            st.setString(7, c.getEmail());
            st.setString(8, c.getCity());
            st.setString(9, c.getDistrict());
            st.setString(10, c.getCommune());
            st.setString(11, c.getAddress());
            st.setString(12, c.getNote());
            st.setString(13, c.getCccd());
            st.setString(14, c.getCurrent_living());
            st.setString(15, c.getTenant_avatar());
            st.setString(16, c.getCccd_civil_card_front());
            st.setString(17, c.getCccd_civil_card_back());
            st.setDate(18, c.getDob());
            st.setDate(19, c.getCccd_receive_date());
            st.setString(20, c.getOffice_name());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // update information
    public void updateContract(Contract c) {
        String sql = "UPDATE [dbo].[Contract]\n"
                + "   SET [tenant_id] = ?\n"
                + "      ,[landlord_id] = ?\n"
                + "      ,[apartment_id] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[full_name] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[city] = ?\n"
                + "      ,[district] = ?\n"
                + "      ,[commune] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[note] = ?\n"
                + "      ,[cccd] = ?\n"
                + "      ,[current_living] =?\n"
                + "      ,[tenant_avatar] = ?\n"
                + "      ,[cccd_civil_card_front] = ?\n"
                + "      ,[cccd_civil_card_back] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[cccd_receive_date] = ?\n"
                + "      ,[office_name] = ?\n"
                + " WHERE [id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getTenant_id().getId());
            st.setInt(2, c.getLandlord_id().getId());
            st.setInt(3, c.getApartment_id().getId());
            st.setInt(4, c.getStatus());
            st.setString(5, c.getPhone());
            st.setString(6, c.getFull_name());
            st.setString(7, c.getEmail());
            st.setString(8, c.getCity());
            st.setString(9, c.getDistrict());
            st.setString(10, c.getCommune());
            st.setString(11, c.getAddress());
            st.setString(12, c.getNote());
            st.setString(13, c.getCccd());
            st.setString(14, c.getCurrent_living());
            st.setString(15, c.getTenant_avatar());
            st.setString(16, c.getCccd_civil_card_front());
            st.setString(17, c.getCccd_civil_card_back());
            st.setDate(18, c.getDob());
            st.setDate(19, c.getCccd_receive_date());
            st.setString(20, c.getOffice_name());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // get Contract
    public Contract getContract(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[tenant_id]\n"
                + "      ,[landlord_id]\n"
                + "      ,[apartment_id]\n"
                + "      ,[status]\n"
                + "      ,[phone]\n"
                + "      ,[full_name]\n"
                + "      ,[email]\n"
                + "      ,[city]\n"
                + "      ,[district]\n"
                + "      ,[commune]\n"
                + "      ,[address]\n"
                + "      ,[note]\n"
                + "      ,[cccd]\n"
                + "      ,[current_living]\n"
                + "      ,[tenant_avatar]\n"
                + "      ,[cccd_civil_card_front]\n"
                + "      ,[cccd_civil_card_back]\n"
                + "      ,[dob]\n"
                + "      ,[cccd_receive_date]\n"
                + "      ,[office_name]\n"
                + "  FROM [dbo].[Contract] where [apartment_id] = ? ";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Contract c = new Contract();
                User ten = UD.getUser(rs.getInt("tenant_id"));
                User lan = UD.getUser(rs.getInt("landlord_id"));
                Apartment a = AD.getApartment(rs.getInt("apartment_id"));

                c.setTenant_id(ten);
                c.setLandlord_id(lan);
                c.setApartment_id(a);
                c.setStatus(rs.getInt("status"));
                c.setPhone(rs.getString("phone"));
                c.setFull_name(rs.getString("full_name"));
                c.setEmail(rs.getString("email"));
                c.setCity(rs.getString("city"));
                c.setDistrict(rs.getString("district"));
                c.setCommune(rs.getString("commune"));
                c.setAddress(rs.getString("address"));
                c.setNote(rs.getString("note"));
                c.setCccd(rs.getString("cccd"));
                c.setCurrent_living(rs.getString("current_living"));
                c.setTenant_avatar(rs.getString("tenant_avatar"));
                c.setCccd_civil_card_front(rs.getString("cccd_civil_card_front"));
                c.setCccd_civil_card_back(rs.getString("cccd_civil_card_back"));
                c.setDob(rs.getDate("dob"));
                c.setCccd_receive_date(rs.getDate("cccd_receive_date"));
                c.setOffice_name(rs.getString("office"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
