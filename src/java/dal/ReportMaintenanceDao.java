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
}
