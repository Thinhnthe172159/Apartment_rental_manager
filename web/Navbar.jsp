<%-- 
    Document   : Navbar
    Created on : May 28, 2024, 11:40:46 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">



        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

        <style>
            /* Custom CSS for hover dropdown */
            .dropdown:hover .dropdown-menu {
                display: block;
                margin-top: 0; /* Adjust margin as needed */
            }

            .header-area {
                position: fixed;
                top: 0;
                width: 100%;
                background-color: #ffffff; /* Đảm bảo navbar có màu nền nếu cần thiết */
                z-index: 1000;
            }


        </style>
    </head>
    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
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
                                    <c:choose>
                                        <c:when test="${user_Data == null}">
                                    <li><a href="Login"><i class="fa fa-sign-in"></i></a></li>
                                        </c:when>
                                        <c:otherwise>
                                    <li><a href="UserProfile"><i class="fa fa-user"></i></a></li>
                                    <li><a href="Logout"><i class="fa fa-sign-out"></i></a></li>
                                        </c:otherwise>
                                    </c:choose>
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
                            <a href="HomePage" class="logo">
                                <h1>Easy_Rentals</h1>
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="HomePage" class="<c:if test="${requestScope.page == 1}">active</c:if>">Home</a></li>
                                <li><a href="ApartmentPostList"class="<c:if test="${requestScope.page == 2}">active</c:if>">Tìm Căn Hộ</a></li>
                                    <li class="nav-item dropdown">
                                        <a class="dropdown-toggle <c:if test="${requestScope.page == 3}">active</c:if>"  href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Đăng bài
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="AddApartmentPost">Đăng bài cho thuê căn hộ</a>
                                        <a class="dropdown-item" href="#">Đăng bài cộng dồng</a>
                                    </div>
                                </li>
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

        <!-- Bootstrap JS and dependencies (Popper.js) -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.7/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"></script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/counter.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
