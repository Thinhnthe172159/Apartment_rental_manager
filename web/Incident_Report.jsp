<%-- 
    Document   : Incident Report
    Created on : May 21, 2024, 3:34:45 PM
    Author     : vumin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tenant Incident Report Form</title>   
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
        <div class="container">
            <h1>Tenant Incident Report</h1>
            <form>
                <label for="tenantName">Tenant Name</label>
                <input type="text" id="tenantName" name="tenantName" required>

                <label for="tenantContact">Tenant Contact Information</label>
                <input type="text" id="tenantContact" name="tenantContact" required>

                <label for="incidentDate">Date of Incident</label>
                <input type="date" id="incidentDate" name="incidentDate" required>

                <label for="incidentTime">Time of Incident</label>
                <input type="time" id="incidentTime" name="incidentTime" required>

                <label for="incidentLocation">Location of Incident</label>
                <input type="text" id="incidentLocation" name="incidentLocation" required>

                <label for="incidentDescription">Description of Incident</label>
                <textarea id="incidentDescription" name="incidentDescription" rows="6" required></textarea>

                <label for="incidentSeverity">Severity of Incident</label>
                <select id="incidentSeverity" name="incidentSeverity" required>
                    <option value="">Select</option>
                    <option value="minor">Minor</option>
                    <option value="moderate">Moderate</option>
                    <option value="severe">Severe</option>
                </select>

                <button type="submit">Submit Report</button>
            </form>
        </div>
    </body>
</html>
