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
            <br>
            <div class="row">
                <form action="AddApartmentPost" method="post" style="background-color:antiquewhite;">
                    <br><br>
                    <div class="col-md-12">
                        <div class="input-group flex-nowrap">
                            <select name="apartment" class="form-select" aria-label="Default select example">
                                <option  selected disabled>Lựa chọn căn hộ mà bạn muốn cho thuê</option>
                                <c:forEach items="${requestScope.apartmentList}" var="ap">
                                    <option value="${ap.id}">${ap.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <a class="btn btn-primary btn-lg" href="addApartment">Thêm căn hộ mới</a>
                    </div>
                    <br><br>
                    <div class="col-md-12">
                        <input required="" name="title" type="text" class="form-control" placeholder="Nhập tiêu đề bài viết"
                               aria-label="Username" aria-describedby="addon-wrapping">
                    </div>
                    <br><br>
                    <style>
                        #editor {
                            width: 100%;
                            min-height: 400px; 
                        }

                    </style>
                    <div class="col-md-12">
                        
                           
                        <textarea id="editor" required="" name="description" class="form-control" placeholder="Nhập nội dung bài viết   " id="floatingTextarea2"  cols="300" rows="10">
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
                    <br>
                    <br>
                    <div class="col-md-4">
                        <select name="payment_method" class="form-select" aria-label="Default select example">
                            <option selected disabled>Chọn gói đăng tin</option>
                            <c:forEach items="${requestScope.payment_methodsList}" var="pm">
                                <option value="${pm.id}">${pm.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-12 d-flex justify-content-center">
                        <input type="submit" name="submit" value="Đăng Bài"class="btn btn-primary btn-lg">
                        <input type="submit" name="submit" value="Lưu nháp"class="btn btn-secondary btn-lg ms-3">
                    </div>
                    <br><br>
                </form>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>

</html>
