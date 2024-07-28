/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
                + "           ,[office_name],[sign_date])\n"
                + "     VALUES\n"
                + "          (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
            st.setDate(21, c.getSign_date());
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
                + "      ,[sign_date] = ? \n"
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
            st.setDate(21, c.getSign_date());
            st.setInt(22, c.getId());
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
                + "      ,[office_name],[sign_date]\n"
                + "  FROM [dbo].[Contract] where 1=1";
        if (id != 0) {
            sql += " and [id] = ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Contract c = new Contract();
                User ten = UD.getUser(rs.getInt("tenant_id"));
                User lan = UD.getUser(rs.getInt("landlord_id"));
                Apartment a = AD.getApartment(rs.getInt("apartment_id"));
                c.setId(rs.getInt("id"));
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
                c.setOffice_name(rs.getString("office_name"));
                c.setSign_date(rs.getDate("sign_date"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Contract> listContract(String tenantFullname, int landlord_id, int tenant_id) {
        List<Contract> list = new ArrayList<>();
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
                + "      ,[sign_date]\n"
                + "  FROM [dbo].[Contract] where 1 = 1 ";

        if (tenantFullname != null) {
            sql += " and [full_name] like N'%" + tenantFullname + "%' ";
        }
        if (landlord_id != 0) {
            sql += " and [landlord_id] = " + landlord_id;
        }
        if (tenant_id != 0) {
            sql += " and [tenant_id] = " + tenant_id;
        }
        sql += " order by [sign_date] desc ,[id] desc ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract c = new Contract();
                User ten = UD.getUser(rs.getInt("tenant_id"));
                User lan = UD.getUser(rs.getInt("landlord_id"));
                Apartment a = AD.getApartment(rs.getInt("apartment_id"));
                c.setId(rs.getInt("id"));
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
                c.setOffice_name(rs.getString("office_name"));
                c.setSign_date(rs.getDate("sign_date"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //lấy list Tenant
    public List<User> listTenant(int landlord_id) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "      [tenant_id]\n"
                + "     \n"
                + "  FROM [dbo].[Contract] where [landlord_id] = " + landlord_id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User tenant = UD.getUser(rs.getInt("tenant_id"));
                list.add(tenant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //Lấy List landlord
    public List<User> listlandlord(int tenant) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "      [tenant_id]\n"
                + "     \n"
                + "  FROM [dbo].[Contract] where [tenant_id] = " + tenant;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User landlord = UD.getUser(rs.getInt("tenant_id"));
                list.add(landlord);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ContractDao cd = new ContractDao();
        User user = UD.getUser(13);
        Apartment a = AD.getApartment(47);
//        List<Contract> list = cd.listContract(null, 2, 0);
//        for (Contract item : list) {
//            System.out.println(item);
//        }

        Contract c = cd.getContract(3);
        c.setPhone("111111111");
        cd.updateContract(c);
        //System.out.println(c);
    }
}
