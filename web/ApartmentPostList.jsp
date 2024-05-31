<%-- 
    Document   : ApartmentPostList
    Created on : May 28, 2024, 1:05:29 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <title>Villa Agency - Property Listing by TemplateMo</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>

    <body>
        <jsp:include page="Navbar.jsp"/>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="search">
                            <i class="fa fa-search"></i>
                            <input name="name" type="text" class="form-control" placeholder="Find apartment post title">
                            <button class="btn btn-primary" id="submit">Search</button>
                        </div>
                        <div><br></div>
                        <span class="breadcrumb"><a href="#">Apartment</a></span>
                        <h3>For you</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="section properties">

            <div class="container">
                <div>
                    <style>
                        .search{
                            position: relative;
                            box-shadow: 0 0 40px rgba(51, 51, 51, .1);

                        }

                        .search input{

                            height: 60px;
                            text-indent: 25px;
                            border: 2px solid #d6d4d4;


                        }


                        .search input:focus{

                            box-shadow: none;
                            border: 2px solid blue;


                        }

                        .search .fa-search{

                            position: absolute;
                            top: 20px;
                            left: 16px;

                        }

                        .search button{

                            position: absolute;
                            top: 5px;
                            right: 5px;
                            height: 50px;
                            width: 110px;
                            background: blue;

                        }
                    </style>
                    <script src="https://esgoo.net/scripts/jquery.js"></script>
                    <style type="text/css">
                        .css_select_div {
                            text-align: center;
                        }
                        .css_select {
                            display: inline-table;
                            width: 25%;
                            padding: 5px;
                            margin: 5px 2%;
                            border: solid 1px #686868;
                            border-radius: 5px;
                        }
                    </style>

                    <form  action="ApartmentPostList" method="get"  class="row height d-flex justify-content-center align-items-center">

                        <div class="col-md-3">
                            <select style="background: darkslategray;color: white" name="apartmentType"  class="form-select"  aria-label="Default select example">
                                <option value="0">Loại căn hộ</option>
                                <c:forEach items="${requestScope.apartment_types_list}" var="atl">
                                    <option value="${atl.id}">${atl.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select style="background: darkslategray;color: white" class="form-select" id="tinh" aria-label="Default select example">
                                <option value="0">Tỉnh Thành</option>
                            </select>
                        </div>

                        <div class="col-md-2">
                            <select style="background: darkslategray;color: white" class="form-select" id="quan" aria-label="Default select example">
                                <option value="0">Quận huyện</option>
                            </select>
                        </div>

                        <div class="col-md-2">
                            <select style="background: darkslategray;color: white"   class="form-select " id="phuong" aria-label="Default select example">
                                <option value="0">Xã Phường</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select style="background: darkslategray;color: white"  name="type"  required class="form-select"  aria-label="Default select example">
                                <option value="0" >Sắp xếp theo giá</option>
                                <option value="1" >tăng theo giá</option>
                                <option value="2" >giảm theo giá</option>
                            </select>
                        </div>
                        <div><br></div>
                        <input type="hidden" name="tinh" id="hidden_tinh">
                        <input type="hidden" name="quan" id="hidden_quan">
                        <input type="hidden" name="phuong" id="hidden_phuong">
                        <div class="col-md-3">
                            <div class="input-group mb-3">
                                <input style="background: #d6d4d4;color: black" type="text" name="moneyUp" class="form-control" placeholder="Nhập số tiền trên khoảng" aria-label="Dollar amount (with dot and two decimal places)">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="input-group mb-3">
                                <input style="background: #d6d4d4;color: black" name="moneyDown" type="text" class="form-control"placeholder="Nhập số tiền dưới khoảng" aria-label="Dollar amount (with dot and two decimal places)">

                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group mb-3">
                                <input style="background: #d6d4d4;color: black" name="bedroom" type="text" class="form-control" placeholder="Số lượng phòng ngủ" aria-label="Dollar amount (with dot and two decimal places)"> 
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group mb-3">
                                <input style="background: #d6d4d4;color: black" name="areaUp" type="text" class="form-control" placeholder="Diện tích lớn hơn" aria-label="Dollar amount (with dot and two decimal places)"> 
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group mb-3">
                                <input style="background: #d6d4d4;color: black" name="areaDown" type="text" class="form-control" placeholder="Diện tích nhỏ hơn" aria-label="Dollar amount (with dot and two decimal places)"> 
                            </div>
                        </div>

                        <input class="btn-outline-danger" type="submit" value="Search">

                    </form>
                </div>
                <div><br></div>
                <div class="row properties-box">
                    <c:forEach items="${requestScope.apartmentPostList}" var="ap"> 
                        <div class="col-lg-6 col-md-6 align-self-center mb-30 properties-items col-md-6 adv" >
                            <div class="item" style="background:whitesmoke">
                                <a href="property-details.html"><img src="uploads/${ap.first_image}" alt="" style="height: 400px; width: 580px;"></a>
                                <span class="category">${ap.apartment_type.name}</span>
                                <h6>${ap.price}</h6>
                                <h4><a href="property-details.html">${ap.apartment_name}</a></h4><hr>
                                    <c:if test="${ap.payment_id.id == 1}" >
                                    <h4 style="">${ap.title}</h4>
                                </c:if>
                                <c:if test="${ap.payment_id.id == 2}" >
                                    <h4 style="color: blue;font-style: italic">${ap.title}</h4>
                                </c:if>
                                <c:if test="${ap.payment_id.id == 3}" >
                                    <h4 style="color: yellowgreen; font-family: cursive;font-size: large;" >${ap.title.toUpperCase()}</h4>
                                </c:if>
                                <c:if test="${ap.payment_id.id == 4}" >
                                    <h4 style="color: red;font-style: italic; font-family: serif">${ap.title.toUpperCase()}</h4>
                                </c:if>
                                <hr>
                                <ul>
                                    <li>Bedrooms: <span>${ap.number_of_bedroom}</span></li>
                                    <li>Area: <span>${ap.area}</span></li>
                                    <li>Address: <span>${ap.city}</span><svg xmlns="http://www.w3.org/2000/svg" fill="#000000" width="20px" height="30px" viewBox="0 0 100 100"><path d="M49,18.92A23.74,23.74,0,0,0,25.27,42.77c0,16.48,17,31.59,22.23,35.59a2.45,2.45,0,0,0,3.12,0c5.24-4.12,22.1-19.11,22.1-35.59A23.74,23.74,0,0,0,49,18.92Zm0,33.71a10,10,0,1,1,10-10A10,10,0,0,1,49,52.63Z"/></svg></li>
                                    <hr>
                                    <li>${ap.post_start}</li>
                                </ul>
                                <div class="main-button">
                                    <a href="property-details.html">Schedule a visit</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="pagination">
                            <c:forEach items="${pageList}" var="i">
                                <li>
                                    <a href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${i}" class="${i == page_index ? 'is_active' : ''}">
                                        ${i}
                                    </a>
                                </li>
                            </c:forEach>
                            <li><a href="#">>></a></li>
                        </ul>
                    </div>
                </div>


            </div>
        </div>

        <footer><jsp:include page="Footer.jsp"/>
            <div class="container">
                <div class="col-lg-12">
                    <p>Copyright © 2048 Villa Agency Co., Ltd. All rights reserved. 

                        Design: <a rel="nofollow" href="https://templatemo.com" target="_blank">TemplateMo</a> Distribution: <a href="https://themewagon.com">ThemeWagon</a></p>
                </div>
            </div>
        </footer>

        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/counter.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            $(document).ready(function () {
                // Fetch provinces
                $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                    if (data_tinh.error == 0) {
                        $.each(data_tinh.data, function (key_tinh, val_tinh) {
                            $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                        });
                        $("#tinh").change(function (e) {
                            var idtinh = $(this).val();
                            $("#hidden_tinh").val($("#tinh option:selected").text());
                            // Fetch districts
                            $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                                if (data_quan.error == 0) {
                                    $("#quan").html('<option value="0">Quận Huyện</option>');
                                    $("#phuong").html('<option value="0">Phường Xã</option>');
                                    $.each(data_quan.data, function (key_quan, val_quan) {
                                        $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                    });
                                    // Fetch wards
                                    $("#quan").change(function (e) {
                                        var idquan = $(this).val();
                                        $("#hidden_quan").val($("#quan option:selected").text());
                                        $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                            if (data_phuong.error == 0) {
                                                $("#phuong").html('<option value="0">Phường Xã</option>');
                                                $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                                    $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                                });
                                                $("#phuong").change(function (e) {
                                                    $("#hidden_phuong").val($("#phuong option:selected").text());
                                                });
                                            }
                                        });
                                    });
                                }
                            });
                        });
                    }
                });
            });
        </script> 
    </body>
</html>