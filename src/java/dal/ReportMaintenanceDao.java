/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Apartment;
import model.ReportMaintain;
import model.User;

/**
 *
 * @author ASUS
 */
public class ReportMaintenanceDao extends DBContext {

    private ApartmentDao apartmentDao;
    private UserDao userDao;

    Connection cnn;
    Statement stm;
    ResultSet rs;
    PreparedStatement pstm;

    private void connect() {
        cnn = super.connection;
        if (cnn != null) {
            System.out.println("Connect success");
        } else {
            System.out.println("Connect fail");
        }
    }

    public ReportMaintenanceDao() {
        connect();
    }

    public boolean addReport(ReportMaintain report) {
        String strSQL = "INSERT INTO [ams].[dbo].[Report_maintain] "
                + "(apartment_id, tenant_id, landlord_id, context, status, date_post, image1, image2, image3) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, report.getApartmentId().getId());
            pstm.setInt(2, report.getTenantId().getId());
            pstm.setInt(3, report.getLandlordId().getId());
            pstm.setString(4, report.getContext());
            pstm.setString(5, report.getStatus());
            pstm.setDate(6, report.getDatePost());
            pstm.setString(7, report.getImage1());
            pstm.setString(8, report.getImage2());
            pstm.setString(9, report.getImage3());
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println("addReport: " + e.getMessage());
        }
        return false;
    }

    public List<ReportMaintain> getReportsForLandlord(int landlordId) {
        List<ReportMaintain> reports = new ArrayList<>();
        String strSQL = "SELECT rm.*, a.name as apartment_name, t.first_name as tenant_first_name, t.last_name as tenant_last_name, t.image "
                + "FROM Report_maintain rm "
                + "JOIN Aparment a ON rm.apartment_id = a.id "
                + "JOIN [dbo].[User] t ON rm.tenant_id = t.id "
                + "WHERE rm.landlord_id = ?";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, landlordId);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Apartment apartment = new Apartment();
                apartment.setId(rs.getInt("apartment_id"));
                apartment.setName(rs.getString("apartment_name"));

                User tenant = new User();
                tenant.setId(rs.getInt("tenant_id"));
                tenant.setFirst_name(rs.getString("tenant_first_name"));
                tenant.setLast_name(rs.getString("tenant_last_name"));
                tenant.setImage(rs.getString("image"));

                ReportMaintain report = new ReportMaintain();
                report.setId(rs.getInt("id"));
                report.setApartmentId(apartment);
                report.setTenantId(tenant);
                report.setContext(rs.getString("context"));
                report.setStatus(rs.getString("status"));
                report.setDatePost(rs.getDate("date_post"));
                report.setImage1(rs.getString("image1"));
                report.setImage2(rs.getString("image2"));
                report.setImage3(rs.getString("image3"));

                reports.add(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }

    public ReportMaintain getReportById(int reportId) {
        ReportMaintain report = null;
        String strSQL = "SELECT rm.*, a.name as apartment_name, t.first_name as tenant_first_name, t.last_name as tenant_last_name, t.image as tenant_image "
                + "FROM Report_maintain rm "
                + "JOIN Aparment a ON rm.apartment_id = a.id "
                + "JOIN [User] t ON rm.tenant_id = t.id "
                + "WHERE rm.id = ?";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, reportId);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Apartment apartment = new Apartment();
                apartment.setId(rs.getInt("apartment_id"));
                apartment.setName(rs.getString("apartment_name"));

                User tenant = new User();
                tenant.setId(rs.getInt("tenant_id"));
                tenant.setFirst_name(rs.getString("tenant_first_name"));
                tenant.setLast_name(rs.getString("tenant_last_name"));
                tenant.setImage(rs.getString("tenant_image"));

                report = new ReportMaintain();
                report.setId(rs.getInt("id"));
                report.setApartmentId(apartment);
                report.setTenantId(tenant);
                report.setContext(rs.getString("context"));
                report.setStatus(rs.getString("status"));
                report.setDatePost(rs.getDate("date_post"));
                report.setImage1(rs.getString("image1"));
                report.setImage2(rs.getString("image2"));
                report.setImage3(rs.getString("image3"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return report;
    }

    public boolean updateReportStatus(int reportId, int newStatus) {
        String strSQL = "UPDATE Report_maintain SET status = ? WHERE id = ?";
        try {
            pstm = cnn.prepareStatement(strSQL);
            pstm.setInt(1, newStatus);
            pstm.setInt(2, reportId);
            pstm.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
