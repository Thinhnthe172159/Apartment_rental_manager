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
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Incident incident = new Incident();
                    incident.setId(resultSet.getInt("id"));
                    UserDao userDao = new UserDao(); // Tạo mới UserDao (hoặc sử dụng dependency injection)
                    User tenant = userDao.getUser(resultSet.getInt("tenant_id"));
                    User landlord = userDao.getUser(resultSet.getInt("landlord_id"));
                    incident.setTenant_id(tenant);
                    incident.setLandlord_id(landlord);
                    incident.setContext(resultSet.getString("context"));
                    incident.setImage(resultSet.getString("image"));
                    incident.setStatus(resultSet.getString("status"));
                    incident.setDate(resultSet.getDate("date"));
                    return incident;
                }
            }
        } catch (SQLException e) {
            // Xử lý hoặc ghi nhận ngoại lệ ở đây
        }
        return null;
    }

    public void updateIncidentReport(Incident report) throws SQLException {
        String query = "UPDATE Incident SET context = ?, image = ?, status = ?, date = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, report.getContext());
            statement.setString(2, report.getImage());
            statement.setString(3, report.getStatus());
            statement.setDate(4, new java.sql.Date(report.getDate().getTime()));
            statement.setInt(5, report.getId());
            statement.executeUpdate();
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

    public List<Incident> getAllIncidentReports() throws SQLException {
        List<Incident> incidents = new ArrayList<>();
        String query = "SELECT * FROM Incident";
        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Incident incident = new Incident();
                incident.setId(resultSet.getInt("id"));
                User tenant = userDao.getUser(resultSet.getInt("tenant_id"));
                incident.setTenant_id(tenant);
                User landlord = userDao.getUser(resultSet.getInt("landlord_id"));
                incident.setLandlord_id(landlord);
                incident.setContext(resultSet.getString("context"));
                incident.setImage(resultSet.getString("image"));
                incident.setStatus(resultSet.getString("status"));
                incident.setDate(resultSet.getDate("date"));
                incidents.add(incident);
            }
        }
        return incidents;
    }

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        IncidentReportDao incidentReportDao = new IncidentReportDao(dbContext);

        try {
            List<Incident> incidentList = incidentReportDao.getAllIncidentReports();
            for (Incident incident : incidentList) {
                System.out.println("Incident ID: " + incident.getId());
                System.out.println("Tenant: " + incident.getTenant_id().getFirst_name() + " " + incident.getTenant_id().getLast_name());
                System.out.println("Landlord: " + incident.getLandlord_id().getFirst_name() + " " + incident.getLandlord_id().getLast_name());
                System.out.println("Context: " + incident.getContext());
                System.out.println("Image: " + incident.getImage());
                System.out.println("Status: " + incident.getStatus());
                System.out.println("Date: " + incident.getDate());
                System.out.println("---------------------------------");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
