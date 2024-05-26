<%-- 
    Document   : AddApartmentPost
    Created on : May 27, 2024, 12:38:22 AM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <title>Document</title>
    </head>

    <body>
        <div class="container">
            <br>
            <div class="row">
                <div style="background-color:antiquewhite;">
                    <br><br>
                    <div class="col-md-12">
                        <div class="input-group flex-nowrap">
                            <input type="text" class="form-control" placeholder="Nhập tiêu đề bài viết"
                                   aria-label="Username" aria-describedby="addon-wrapping">
                        </div>
                        <br><br>
                    </div>
                    <div class="col-md-12">
                        <div class="form-floating">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"
                                      style="height: 300px"></textarea>
                            <label for="floatingTextarea2">Nhập nội dung bài viết</label>
                        </div>
                    </div>
                    <br><br>
                    <div class="col-md-12">
                        <select class="form-select" aria-label="Default select example">
                            <option selected disabled>Lựa chọn căn hộ mà bạn muốn cho thuê</option>
                            <option value="1">Phòng p02</option>
                            <option value="2">Phòng p03</option>
                            <option value="3">Phòng p04</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <div class="col-md-4">
                        <select class="form-select" aria-label="Default select example">
                            <option selected disabled>Chọn gói đăng tin</option>
                            <option value="1">Basic</option>
                            <option value="2">Silver</option>
                            <option value="3">Gold</option>
                        </select>
                    </div>
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-12 d-flex justify-content-center">
                        <button type="button" class="btn btn-primary btn-lg">Đăng Bài</button>
                        <button type="button" class="btn btn-secondary btn-lg ms-3">Lưu nháp</button>
                    </div>
                    <br><br>
                </div>
            </div>
        </div>
    </body>

</html>
