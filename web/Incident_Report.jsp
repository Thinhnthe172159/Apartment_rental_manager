<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Incident Report Management</title>
</head>
<body>
    <h1>Incident Report Management</h1>

    <h2>Add Incident Report</h2>
    <form action="addIncidentReport" method="post">
        <label for="tenantId">Tenant ID:</label><br>
        <input type="number" id="tenantId" name="tenantId" required><br>

        <label for="landlordId">Landlord ID:</label><br>
        <input type="number" id="landlordId" name="landlordId" required><br>

        <label for="context">Context:</label><br>
        <textarea id="context" name="context" required></textarea><br>

        <label for="image">Image URL:</label><br>
        <input type="text" id="image" name="image"><br>

        <label for="status">Status:</label><br>
        <input type="text" id="status" name="status" required><br>

        <label for="date">Date:</label><br>
        <input type="date" id="date" name="date" required><br><br>

        <input type="submit" value="Add Incident Report">
    </form>

    <h2>Get Incident Report</h2>
    <form action="getIncidentReport" method="get">
        <label for="id">Incident Report ID:</label><br>
        <input type="number" id="id" name="id" required><br><br>

        <input type="submit" value="Get Incident Report">
    </form>

    <h2>Incident Report Details</h2>
    <div>
        <%
            String id = request.getParameter("id");
            if (id != null) {
                IncidentReportDAO incidentReportDAO = new IncidentReportDAO(new DatabaseUtility());
                try {
                    int reportId = Integer.parseInt(id);
                    IncidentReport report = incidentReportDAO.getIncidentReport(reportId);
                    if (report != null) {
        %>
                        <p><strong>ID:</strong> <%= report.getId() %></p>
                        <p><strong>Tenant ID:</strong> <%= report.getTenantId() %></p>
                        <p><strong>Landlord ID:</strong> <%= report.getLandlordId() %></p>
                        <p><strong>Context:</strong> <%= report.getContext() %></p>
                        <p><strong>Image:</strong> <%= report.getImage() %></p>
                        <p><strong>Status:</strong> <%= report.getStatus() %></p>
                        <p><strong>Date:</strong> <%= report.getDate() %></p>
        <%
                    } else {
        %>
                        <p>Incident report not found!</p>
        <%
                    }
                } catch (Exception e) {
                    out.println("<p>Error retrieving incident report: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
</body>
</html>
