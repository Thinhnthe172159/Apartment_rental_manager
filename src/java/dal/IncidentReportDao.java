/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Incident;
import model.User;

/**
 *
 * @author vumin
 */
public class IncidentReportDao extends DBContext {
    
    private DBContext dBContext;
    private UserDao userDao;

    public IncidentReportDao(DBContext dbContext) {
        this.dBContext = dbContext;
        this.userDao = new UserDao();
    }
    
    public void addIncidentReport(Incident report) throws SQLException {
        String query = "INSERT INTO Incident (tenant_id, landlord_id, context, image, status, date) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            
            statement.setInt(1, report.getTenant_id().getId());
            statement.setInt(2, report.getLandlord_id().getId());
            statement.setString(3, report.getContext());
            statement.setString(4, report.getImage());
            statement.setString(5, report.getStatus());
            statement.setDate(6, report.getDate());
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
    }
    
    public Incident getIncidentReport(int id) throws SQLException {
        String query = "SELECT * FROM Incident WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Incident incident = new Incident();
                incident.setId(resultSet.getInt(id));
                User u = userDao.getUser(resultSet.getInt("laandlord_id"));
                incident.setLandlord_id(u);
                User u1 = userDao.getUser(resultSet.getInt("tenant_id"));
                incident.setTenant_id(u1);
                incident.setContext(resultSet.getString("context"));
                incident.setImage(resultSet.getString("image"));
                
            }
        } catch (SQLException e) {
            
        }
        return null;
    }
    
    public void updateIncidentReport(Incident report) throws SQLException {
        String query = "UPDATE [dbo].[Incident]\n"
                + "   SET [context] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[date] = ?\n"
                + " WHERE [id] = ? ";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, report.getContext());
            statement.setString(2, report.getImage());
            statement.setString(3, report.getStatus());
            statement.setDate(4, report.getDate());
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
    }
    
    public void deleteIncidentReport(int id) throws SQLException {
        String query = "DELETE FROM Incident WHERE id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
        
    }
    
}
