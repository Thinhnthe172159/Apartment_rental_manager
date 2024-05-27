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

/**
 *
 * @author vumin
 */
public class IncidentReportDao extends DBContext {

    public IncidentReportDao(DBContext dbContext) {
    }

    public void addIncidentReport(Incident report) throws SQLException {
        String query = "INSERT INTO Incident (tenant_id, landlord_id, context, image, status, date) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, report.getTenant_id());
            statement.setInt(2, report.getLandlord_id());
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
                return new Incident(
                        resultSet.getInt("id"),
                        resultSet.getInt("tenant_id"),
                        resultSet.getInt("landlord_id"),
                        resultSet.getString("context"),
                        resultSet.getString("image"));
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public List<Incident> getAllIncidentReports() throws SQLException {
        List<Incident> reports = new ArrayList<>();
        String query = "SELECT * FROM Incident";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Incident report = new Incident(
                        resultSet.getInt("id"),
                        resultSet.getInt("tenant_id"),
                        resultSet.getInt("landlord_id"),
                        resultSet.getString("context"),
                        resultSet.getString("image"));
                reports.add(report);
            }
        } catch (SQLException e) {

        }
        return reports;
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
