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
            <h2 class="text-center">Add New Incident Report</h2>
            <form id="uploadForm" action="addincidentreport" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="landlordId"> Nhập nội dung báo cáo :</label>
                    <textarea id="editor" required="" name="context" class="form-control" placeholder="  " id="floatingTextarea2"  cols="300" rows="10">
                                <br><br><br><br>
                    </textarea>

                    <script>
                        ClassicEditor
                                .create(document.querySelector('#editor'))
                                .catch(error => {
                                    console.error(error);
                                });
                    </script>
                </div>
                <div class="form-group row">
                    <input type="file" id="imageInput" name="images" multiple accept="image/*"><br><br>
                    <div class="preview" id="imagePreview"></div><br>
                </div>
               
              

                <input type="submit" class="btn btn-primary" value="submit"> 
            </form>

        </div>
        <jsp:include page="Footer.jsp"/>
        <script>
            document.getElementById('imageInput').addEventListener('change', function (event) {
                const files = event.target.files;
                const previewContainer = document.getElementById('imagePreview');
                previewContainer.innerHTML = '';

                Array.from(files).forEach(file => {
                    const reader = new FileReader();
                    reader.onload = function (e) {
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
