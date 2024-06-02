<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Incident Report</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f0f2f5;
            }
            .container {
                max-width: 700px;
                margin-top: 70px;
                padding: 30px;
                background-color: #ffffff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 20px;
            }
            .form-control {
                height: 45px;
            }
            .btn-primary {
                width: 100%;
                height: 45px;
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
            }
            .form-check-label {
                padding-left: 10px;
            }
            .text-center {
                color: #007bff;
            }
            .form-group label {
                font-weight: bold;
            }
          
            .preview img {
                max-width: 100px;
                max-height: 100px;
                margin: 5px;
                border: 1px solid #ddd;
                padding: 5px;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <div class="container">
            <h2 class="text-center">Add New Incident Report</h2>
            <form id="uploadForm" action="addincidentreport" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="tenantId">Tenant ID:</label>
                    <input type="number" class="form-control" id="tenantId" name="tenantId" required>
                </div>
                <div class="form-group">
                    <label for="landlordId">Landlord ID:</label>
                    <input type="number" class="form-control" id="landlordId" name="landlordId" required>
                </div>
                <div class="form-group">
                    <label for="context">Context:</label>
                    <textarea class="form-control" id="context" name="context" rows="4" required></textarea>
                </div>
                <div class="form-group row">
                    <input type="file" id="imageInput" name="images" multiple accept="image/*"><br><br>
                    <div class="preview" id="imagePreview"></div><br>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select class="form-control" id="status" name="status">
                        <option value="Pending">Pending</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Resolved">Resolved</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <input type="submit" value="submit"> 
            </form>
           
        </div>
                
        <jsp:include page="Footer.jsp"/>
        <script>
        document.getElementById('imageInput').addEventListener('change', function(event) {
            const files = event.target.files;
            const previewContainer = document.getElementById('imagePreview');
            previewContainer.innerHTML = '';

            Array.from(files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    previewContainer.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        });

        </script>

    </body>
</html>
