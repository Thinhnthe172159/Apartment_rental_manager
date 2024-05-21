<%-- 
    Document   : Maintain_Report
    Created on : May 21, 2024, 9:43:27 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Apartment Maintain Report</title>
  <style>
                  body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 20px;
            }
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: auto;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            label {
                font-weight: bold;
                margin-top: 10px;
                display: block;
            }
            input, textarea, select {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            textarea {
                resize: vertical;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 15px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            button:hover {
                background-color: #45a049;
            }
  </style>
</head>
<body>
  <h1>Apartment Maintain Report</h1>
  <form id="maintain-form">
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required>

    <label for="apartName">Apartment name:</label>
    <input type="text" id="apartName" name="apartname" required>

    <label for="tenantName">Tenant name:</label>
    <input type="text" id="tenantName" name="tenantName" required>

    <label for="landlordName">Landlord name:</label>
    <input type="text" id="landlordName" name="landlordName" required>
    
    <label for ="date">Date of report</label>
    <input type="date" id="date" name="date" required>

    <label for="description">Description:</label>
    <textarea id="description" name="description" rows="5"></textarea>

    <button type="submit">Generate Report</button>
  </form>
</body>
</html>
