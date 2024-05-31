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
            .pagination {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .page-item {
                margin: 0 5px;
                list-style: none;
            }

            .page-link {
                padding: 5px 10px;
                background-color: #007bff;
                border: 1px solid #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 3px;
                transition: background-color 0.3s ease;
            }

            .page-link:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            .page-item.disabled .page-link {
                opacity: 0.5;
                pointer-events: none;
            }

            .page-item.active .page-link {
                background-color: #0056b3;
                border-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>

        <div class="container">
            <h2 class="text-center mb-4">List of Incidents</h2>
            <div class="text-right mb-3">
                <a href="AddIncidentReport.jsp" class="btn btn-custom">Add New Incident</a>
            </div>
            <% String errorMessage = request.getParameter("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
            <% } %>


            <% String successMessage = request.getParameter("successMessage");
        if (successMessage != null && !successMessage.isEmpty()) { %>
            <div class="alert alert-success"><%= successMessage %></div>
            <% } %>
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
                            <a href="DeleteIncident?id=${incident.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this incident?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="ListIncidentReport?pageNo=1&pageSize=${pageSize}" aria-label="First">
                            <span aria-hidden="true">&laquo;&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="ListIncidentReport?pageNo=${currentPage - 1}&pageSize=${pageSize}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="ListIncidentReport?pageNo=${i}&pageSize=${pageSize}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="ListIncidentReport?pageNo=${currentPage + 1}&pageSize=${pageSize}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="ListIncidentReport?pageNo=${totalPages}&pageSize=${pageSize}" aria-label="Last">
                            <span aria-hidden="true">&raquo;&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>


        </div>
        <jsp:include page="Footer.jsp"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
