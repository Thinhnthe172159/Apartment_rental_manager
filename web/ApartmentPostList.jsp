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
        <!--
        
        TemplateMo 591 villa agency
        
        https://templatemo.com/tm-591-villa-agency
        
        -->
    </head>

    <body>

        <!-- ***** Preloader Start ***** -->

        <!-- ***** Preloader End ***** -->

        <div class="sub-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <ul class="info">
                            <li><i class="fa fa-envelope"></i> info@company.com</li>
                            <li><i class="fa fa-map"></i> Sunny Isles Beach, FL 33160</li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <ul class="social-links">
                            <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                            <li><a href="https://x.com/minthu" target="_blank"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="index.html" class="logo">
                                <h1>Easy_Rentals</h1>
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="HomePage.jsp">Home</a></li>
                                <li><a href="ApartmentPostList" class="active">Tìm Căn hộ</a></li>
                                <li><a href="property-details.html">Blogs</a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                                <li><a href="#"><i class="fa fa-calendar"></i> Schedule a visit</a></li>
                            </ul>   
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <span class="breadcrumb"><a href="#">Apartment</a> / Rent</span>
                        <h3>Properties</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="section properties">
            <div class="container">
                <div>
                    <style>
                        @import url("https://fonts.googleapis.com/css2?family=Poppins:weight@100;200;300;400;500;600;700;800&display=swap");






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
                    <form action="" class="row height d-flex justify-content-center align-items-center">

                        <div class="col-md-8">

                            <div class="search">
                                <i class="fa fa-search"></i>
                                <input name="name" type="text" class="form-control" placeholder="Find apartment name">
                                <button class="btn btn-primary" id="submit">Search</button>
                            </div>

                        </div>

                    </form>
                </div>
                <div class="row properties-box">
                    <c:forEach items="${requestScope.apartmentPostList}" var="ap"> 
                        <div class="col-lg-6 col-md-6 align-self-center mb-30 properties-items col-md-6 adv" >
                            <div class="item" style="background:whitesmoke">
                                <a href="property-details.html"><img src="uploads/${ap.first_image}" alt="" style="height: 400px; width: 580px;"></a>
                                <span class="category">${ap.apartment_type.name}</span>
                                <h6>${ap.price}</h6>
                                <h4><a href="property-details.html">${ap.apartment_name}</a></h4><hr>
                                    <c:if test="${ap.payment_id.id == 1}" >
                                    <h5 style="">${ap.title}</h5>
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
                            <li><a href="#">1</a></li>
                            <li><a class="is_active" href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">>></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <footer>
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

    </body>
</html>