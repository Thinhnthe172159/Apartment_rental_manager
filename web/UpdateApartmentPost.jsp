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
        <title>Update Apartment Post</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>

    </head>

    <body>
        <jsp:include page="Navbar.jsp"/>
        <c:set value="${requestScope.post}" var="post"/>
        <br><br><br><br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <span class="breadcrumb"><a href="#">Apartment</a></span>
                        <h3>UPDATE POST</h3>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        <div class="container">
            <br>
            <div class="row">
                <form action="UpdateApartmentPost" method="post" style="background-color:antiquewhite;">
                    <br><br>
                    <div class="col-md-12">
                        <div class="input-group flex-nowrap">
                            <select name="apartment" class="form-select" aria-label="Default select example">       
                                <c:forEach items="${requestScope.apartmentList}" var="ap">
                                    <option <c:if test="${post.apartment_id.id == ap.id}">style="background: blueviolet; color: white;"  selected</c:if> value="${ap.id}">${ap.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>
                        <a class="btn btn-primary btn-lg" href="addApartment">Thêm căn hộ mới</a>
                    </div>
                    <br><br>
                    <div class="col-md-12">
                        <input required="" name="title" type="text" class="form-control" placeholder="Nhập tiêu đề bài viết" value="${post.title}"
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
                            ${post.description}
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
                    <div class="col-md-12 row">  
                        <div class="col-md-3">
                            <select required="" id="paymentMethod" name="payment_method" class="form-select" aria-label="Default select example">
                                <option  value="">Chọn gói đăng tin</option>
                                <c:forEach items="${requestScope.payment_methods_list}" var="pm">
                                    <option <c:if test="${post.payment_id.id == pm.id}">style="background: blueviolet; color: white;"  selected</c:if> value="${pm.id}">${pm.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select id="weekSelect" name="weak" class="form-select" aria-label="Default select example">
                                <option value="0">Không thay đổi thời hạn</option>
                                <option value="1">Thời hạn 1 tuần</option>
                                <option value="2">Thời hạn 2 tuần</option>
                                <option value="3">Thời hạn 3 tuần</option>
                                <option value="4">Thời hạn 4 tuần</option>
                                <option value="5">Thời hạn 5 tuần</option>
                                <option value="6">Thời hạn 6 tuần</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <input  name="Post_start" type="date" class="form-control" placeholder=""
                                    aria-label="Username" aria-describedby="addon-wrapping">
                        </div>
                        <div class="col-md-3">
                            <input  name="Post_end" type="date" class="form-control" placeholder=""
                                    aria-label="Username" aria-describedby="addon-wrapping">
                        </div>
                    </div>
                    <br><br><br><br>
                    <div class="col-md-4">
                        <input type="text" hidden="" value="${post.id}" name="post">
                    </div>
                    <div class="col-md-12 d-flex justify-content-center">
                        <input type="submit" name="submit" value="Cập Nhật"class="btn btn-primary btn-lg">
                        <c:if test="${post.post_status == 1}">

                            &nbsp; <input type="submit" name="submit" value="Đăng Bài"class="btn btn-primary btn-lg">

                        </c:if>
                    </div>

                    <br><br>

                </form>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var today = new Date().toISOString().split('T')[0];

                var postStartInput = document.querySelector('input[name="Post_start"]');
                var postEndInput = document.querySelector('input[name="Post_end"]');
                var weakSelect = document.querySelector('select[name="weak"]');
                var paymentMethodSelect = document.querySelector('#paymentMethod');

                postStartInput.value = today;

                function calculatePostEnd() {
                    var startDate = new Date(postStartInput.value);
                    var selectedWeeks = parseInt(weakSelect.value);

                    if (!isNaN(selectedWeeks) && selectedWeeks > 0) {
                        var endDate = new Date(startDate.getTime());
                        endDate.setDate(endDate.getDate() + selectedWeeks * 7);
                        postEndInput.value = endDate.toISOString().split('T')[0];
                    } else {
                        postEndInput.value = "";
                    }
                }

                function updateWeekOptions() {
                    var originalPaymentMethod = "${post.payment_id.id}";
                    if (paymentMethodSelect.value != originalPaymentMethod) {
                        if (weakSelect.querySelector('option[value="0"]')) {
                            weakSelect.querySelector('option[value="0"]').remove();
                        }
                    } else {
                        if (!weakSelect.querySelector('option[value="0"]')) {
                            var defaultOption = document.createElement('option');
                            defaultOption.value = "0";
                            defaultOption.textContent = "Không thay đổi thời hạn";
                            weakSelect.insertBefore(defaultOption, weakSelect.firstChild);
                        }
                    }
                }

                calculatePostEnd();

                postStartInput.addEventListener('change', function () {
                    var selectedDate = new Date(postStartInput.value);
                    if (selectedDate < new Date(today)) {
                        postStartInput.value = today;
                        alert("Ngày bắt đầu không thể là ngày trong quá khứ. Đã đặt lại ngày bắt đầu là hôm nay.");
                    }
                    calculatePostEnd();
                });

                weakSelect.addEventListener('change', function () {
                    calculatePostEnd();
                });

                paymentMethodSelect.addEventListener('change', function () {
                    updateWeekOptions();
                    calculatePostEnd();
                });

                updateWeekOptions();
            });
        </script>
    </body>

</html>
