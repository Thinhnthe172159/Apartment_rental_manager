<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Incident Report Details</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <h1>Incident Report Details</h1>

    <c:if test="${not empty incident}">
        <table>
            <tr>
                <th>ID</th>
                <td>${incident.id}</td>
            </tr>
            <tr>
                <th>Tenant</th>
                <td>${incident.tenant.firstName} ${incident.tenant.lastName} (ID: ${incident.tenant.id})</td>
            </tr>
            <tr>
                <th>Landlord</th>
                <td>${incident.landlord.firstName} ${incident.landlord.lastName} (ID: ${incident.landlord.id})</td>
            </tr>
            <tr>
                <th>Context</th>
                <td>${incident.context}</td>
            </tr>
            <tr>
                <th>Image</th>
                <td><img src="${incident.image}" alt="Incident Image" style="max-width:400px; max-height:400px;"/></td>
            </tr>
            <tr>
                <th>Status</th>
                <td>${incident.status}</td>
            </tr>
            <tr>
                <th>Date</th>
                <td>${incident.date}</td>
            </tr>
        </table>
        <a href="incidentList.jsp">Back to Incident List</a> <!-- Link to navigate back to the incident list -->
    </c:if>

    <c:if test="${empty incident}">
        <p>No incident report found.</p>
        <a href="incidentList.jsp">Back to Incident List</a> <!-- Link to navigate back to the incident list -->
    </c:if>
</body>
</html>
