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
                            <select required name="apartment" class="form-select" aria-label="Default select example">
                                <option value="">Lựa chọn căn hộ mà bạn muốn cho thuê</option>
                                <c:forEach items="${requestScope.apartmentList}" var="ap">
                                    <option value="${ap.id}">${ap.name} <c:if test="${ap.status_apartment == 1}"></c:if></option>
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
                    <div class="col-md-12 row">  
                        <div class="col-md-3">
                            <select required=""  name="payment_method" class="form-select" aria-label="Default select example" id="payment_method_select">
                                <option value="">Chọn gói đăng tin</option>
                                <c:forEach items="${requestScope.payment_methodsList}" var="pm">
                                    <option value="${pm.id}" data-description="${pm.description}" data-price="${pm.price}">${pm.name}</option>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="col-md-3">
                            <select required="" name="week" class="form-select" aria-label="Default select example">
                                <option value="">Chọn thời hạn bài đăng</option>
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
                                    aria-label="poststart" aria-describedby="addon-wrapping">
                        </div>
                        <div class="col-md-3">
                            <input  name="Post_end" type="date" class="form-control" placeholder=""
                                    aria-label="postend" aria-describedby="addon-wrapping">
                        </div>
                        <br><br>
                        <div class="col-md-4 form-select" style="font-size: 20px;padding-left;box-shadow: rgba(240, 46, 170, 0.4) 5px 5px, rgba(240, 46, 170, 0.3) 10px 10px, rgba(240, 46, 170, 0.2) 15px 15px, rgba(240, 46, 170, 0.1) 20px 20px, rgba(240, 46, 170, 0.05) 25px 25px;">
                            Quý khách nên chọn đăng tin VIP để có hiệu quả hơn.<br>
                            VD: Tin HDY Diamond có lượt xem trung bình cao hơn 20 lần so với tin thường.<br>
                            Mô tả gói:
                            <p style="font-size: 20px;" id="package_description"></p>
                            <p style="font-size: 20px;" id="total_price"></p>
                        </div>

                    </div>
                    <br><br><br><br><br>
                    <div class="col-md-12 d-flex justify-content-center">
                        <input type="submit" name="submit" value="Đăng Bài"class="btn btn-primary btn-lg">
                        <input type="submit" name="submit" value="Lưu nháp"class="btn btn-secondary btn-lg ms-3">

                    </div><br><br><br> *Lưu ý nếu như bạn lựa chọn lưu nháp thì thời gian của bài đăng của bạn sẽ không được ghi nhận!
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
                var weakSelect = document.querySelector('select[name="week"]');
                var paymentMethodSelect = document.querySelector('#payment_method_select');
                var packageDescription = document.getElementById('package_description');
                var totalPrice = document.getElementById('total_price');

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

                function updatePackageDetails() {
                    var selectedOption = paymentMethodSelect.options[paymentMethodSelect.selectedIndex];
                    var description = selectedOption.getAttribute('data-description');
                    var pricePerWeek = parseFloat(selectedOption.getAttribute('data-price'));
                    var selectedWeeks = parseInt(weakSelect.value);
                    var packageId = selectedOption.value;

                    // Update description color based on packageId
                    switch (packageId) {
                        case "1":
                            packageDescription.style.color = ""; // default color
                            break;
                        case "2":
                            packageDescription.style.color = "blue";
                            break;
                        case "3":
                            packageDescription.style.color = "yellowgreen";
                            break;
                        case "4":
                            packageDescription.style.color = "red";
                            break;
                        default:
                            packageDescription.style.color = ""; // default color
                            break;
                    }


                    packageDescription.textContent = description ? "Mô tả: " + description : "";
                    if (!isNaN(pricePerWeek) && !isNaN(selectedWeeks)) {
                        totalPrice.textContent = "Tổng giá: " + (pricePerWeek * selectedWeeks).toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                    } else {
                        totalPrice.textContent = "";
                    }
                }

                calculatePostEnd();
                updatePackageDetails();

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
                    updatePackageDetails();
                });

                paymentMethodSelect.addEventListener('change', function () {
                    updatePackageDetails();
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            var message = '${requestScope.message}';

            if (message === "b") {
                Swal.fire({
                    icon: "error",
                    title: "Oop...",
                    text: "Tài khoản của bạn không đủ để thanh toán cho bài đăng,vui lòng nạp thêm tiền vào tài khoản!",
                });

            }
        </script>



    </body>

</html>
