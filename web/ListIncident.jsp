<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>List of Incidents</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .table thead th {
                background-color: #007bff;
                color: white;
            }
            .btn-custom {
                background-color: #007bff;
                color: white;
            }
            .btn-custom:hover {
                background-color: #0056b3;
                color: white;
            }
            .text-center {
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="text-center mb-4">List of Incidents</h2>
            <div class="text-right mb-3">
                <a href="AddIncidentReport.jsp" class="btn btn-custom">Add New Incident</a>
            </div>
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tenant</th>
                        <th>Landlord</th>
                        <th>Context</th>
                        <th>Image</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="incident" items="${incidentList}">
                    <tr>
                        <td>${incident.id}</td>
                        <td>${incident.tenant_id.email}</td>
                        <td>${incident.landlord_id.email}</td>
                        <td>${incident.context}</td>
                        <td><img src="${incident.image}" alt="Image" style="width: 100px; height: auto;"></td>
                        <td>${incident.status}</td>
                        <td>${incident.date}</td>
                        <td>
                            <a href="ViewIncident.jsp?id=${incident.id}" class="btn btn-info btn-sm">View</a>
                            <a href="EditIncident.jsp?id=${incident.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="DeleteIncidentServlet?id=${incident.id}" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="Footer.jsp"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
