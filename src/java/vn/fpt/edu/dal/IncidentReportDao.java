/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import vn.fpt.edu.model.Incident;
import vn.fpt.edu.model.User;

/**
 *
 * @author vumin
 */
public class IncidentReportDao extends DBContext {

    private DBContext dbContext;
    private UserDao userDao;

    public IncidentReportDao(DBContext dbContext) {
        this.dbContext = dbContext;
        this.userDao = new UserDao();
    }

    public void addIncidentReport(Incident report) throws SQLException {
        String query = "INSERT INTO [dbo].[Incident]\n"
                + "           ([tenant_id]\n"
                + "           ,[landlord_id]\n"
                + "           ,[context]\n"
                + "           ,[image]\n"
                + "           ,[status]\n"
                + "           ,[date])\n"
                + "     VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);

            statement.setInt(1, report.getTenant_id().getId());
            statement.setInt(2, report.getLandlord_id().getId());
            statement.setString(3, report.getContext());
            statement.setString(4, report.getImage());
            statement.setInt(5, report.getStatus());
            statement.setDate(6, report.getDate());
            statement.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public Incident getIncidentReport(int id) throws SQLException {
        String query = "SELECT * FROM Incident\n"
                      + " WHERE id = ?";
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
                    incident.setStatus(resultSet.getInt("status"));
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
            statement.setInt(3, report.getStatus());
            statement.setDate(4, new java.sql.Date(report.getDate().getTime()));
            statement.setInt(5, report.getId());
            statement.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("updateIncidentReport: " + e.getMessage());
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
                incident.setStatus(resultSet.getInt("status"));
                incident.setDate(resultSet.getDate("date"));
                incidents.add(incident);
            }
        }
        return incidents;
    }

    public List<Incident> getPaginatedIncidentReports(int pageNo, int pageSize) throws SQLException {
        List<Incident> incidents = new ArrayList<>();
        String query = "SELECT * FROM Incident LIMIT ? OFFSET ?";
        int offset = (pageNo - 1) * pageSize;
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, pageSize);
            statement.setInt(2, offset);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Incident incident = new Incident();
                    // Lấy thông tin về sự cố từ ResultSet và thêm vào danh sách
                    incidents.add(incident);
                }
            }
        }
        return incidents;
    }

    public int getTotalIncidentCount() throws SQLException {
        String query = "SELECT COUNT(*) FROM Incident";
        try (PreparedStatement statement = connection.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        }
        return 0;
    }

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        IncidentReportDao incidentReportDao = new IncidentReportDao(dbContext);

        try {
            List<Incident> incidentList = incidentReportDao.getAllIncidentReports();
            for (Incident incident : incidentList) {
                System.out.println(incident);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
