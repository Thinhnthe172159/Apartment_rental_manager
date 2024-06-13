<%-- 
    Document   : AddApartmentPost
    Created on : May 27, 2024, 12:38:22 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="img/logoWeb.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <title>Tạo bài đăng căn hộ</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
        <style>
          
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
        <br><br><br><br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <span class="breadcrumb"><a href="#">Apartment</a></span>
                        <h3>ADD POST</h3>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        <div class="container">

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
                <tbody><c:set var="index"  value="0"/>
                    <c:forEach var="incident" items="${incidentList}">
                        <c:set var="index" value="${index + 1}"/>
                        <tr>
                            <td>${index}</td>
                            <td>${incident.tenant_id.email}</td>
                            <td>${incident.landlord_id.email}</td>
                            <td>${incident.context}</td>
                            <td><img src="Incident_image/${incident.image}" alt="Image" style="width: 100px; height: auto;"></td>
                            <td>${incident.status}</td>
                            <td>${incident.date}</td>
                            <td>
                                <a href="viewincident?id=${incident.id}" class="btn btn-info btn-sm">View</a>
                                <a href="editincident?id=${incident.id}" class="btn btn-warning btn-sm">Edit</a>
                                <a href="deleteincident?id=${incident.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this incident?')">Delete</a>
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
    </body>

</html>
