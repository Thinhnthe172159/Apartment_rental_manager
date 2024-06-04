<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Incident</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #eef2f5;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 700px;
                margin: 30px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                color: #333;
                text-align: center;
                margin-bottom: 20px;
            }
            .incident-info {
                margin-bottom: 20px;
            }
            .incident-info p {
                font-size: 16px;
                line-height: 1.6;
                color: #555;
                margin: 10px 0;
            }
            .incident-info strong {
                color: #000;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                margin-top: 20px;
                background-color: #007bff;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                text-align: center;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            img {
                max-width: 100%;
                height: auto;
                border-radius: 10px;
                margin-top: 10px;
            }
            .image-container {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>View Incident</h2>
            <div class="incident-info">
                <p><strong>Tenant Email:</strong> ${incident.tenant_id.email}</p>
                <p><strong>Landlord Email:</strong> ${incident.landlord_id.email}</p>
                <p><strong>Context:</strong> ${incident.context}</p>
                <p><strong>Status:</strong> ${incident.status}</p>
                <p><strong>Date:</strong> ${incident.date}</p>
                <div class="image-container">
                    <p><strong>Image:</strong></p>
                    <a href="#"><img src="${incident.id}" alt="Incident Image"> </a>
                </div>
                <!-- Add more incident details here if needed -->
            </div>
            <a href="listincidentreport" class="btn">Back to List</a>
        </div>
    </body>
</html>
