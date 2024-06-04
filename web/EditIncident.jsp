<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Incident</title>
        <!-- Include Bootstrap CSS for styling -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f7f7f7;
            }
            .container {
                margin-top: 50px;
                background: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 15px;
            }
            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .text-center {
                color: #007bff;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Edit Incident</h1>

            <%-- Check for error message and display if present --%>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>

            <%-- Check for success message and display if present --%>
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>

            <%-- Display the incident details in a form --%>
            <form action="EditIncident" method="post">
                <input type="hidden" name="id" value="${requestScope.incident.id}">

                <div class="form-group">
                    <label for="tenantEmail">Tenant Email:</label>
                    <input type="text" id="tenantEmail" name="tenantEmail" class="form-control" value="${requestScope.incident.tenant_id.email}" >
                </div>

                <div class="form-group">
                    <label for="landlordEmail">Landlord Email:</label>
                    <input type="text" id="landlordEmail" name="landlordEmail" class="form-control" value="${requestScope.incident.landlord_id.email}">
                </div>

                <div class="form-group">
                    <label for="context">Context:</label>
                    <textarea id="context" name="context" class="form-control">${requestScope.incident.context}</textarea>
                </div>

                <div class="form-group">
                    <label for="status">Status:</label>
                    <select id="status" name="status" class="form-control">
                        <option value="Open" ${requestScope.incident.status == 'Open' ? 'selected' : ''}>Open</option>
                        <option value="In Progress" ${requestScope.incident.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                        <option value="Closed" ${requestScope.incident.status == 'Closed' ? 'selected' : ''}>Closed</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" id="date" name="date" class="form-control" value="${requestScope.incident.date}">
                </div>

                <a href="listincidentreport?id"=${incident.id} class="btn btn-primary">Update</a>
                
            </form>
            <br>
            <a href="listincidentreport?id"=${incident.id} class="btn btn-secondary">Back to List</a>
        </div>

        <!-- Include Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
