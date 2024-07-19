<%-- 
    Document   : Navbar
    Created on : May 28, 2024, 11:40:46 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.NotificationDao" %>
<%@page  import="model.User"%>
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

            .sub-header {
                position: fixed;
                width: 100%;
                z-index: 1000;
            }

            .header-area {
                position: fixed;
                top: 50px;
                width: 100%;
                background-color: #ffffff;
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
                            <c:if test="${user_Data.getRole_id().getId() == 1}">
                                <li><a href="Dashboard"><i class="fa fa-dashboard"></i></a></li>
                                    </c:if>
                                <c:if test="${user_Data.getRole_id().getId() == 2}">
                                    <li><a href="LandLordDashboard"><i class="fa fa-dashboard"></i></a></li>
                                    </c:if>
                                    <c:if test="${user_Data.getRole_id().getId() != 0}">
                                <li><a href="AparmentListForTenant"><i class="fa fa-home"></i></a></li>
                                    </c:if>
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
                    <div style="height: 100px" class="col-12">
                        <nav style="height: 100px" class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <span style="font-size:50px;cursor:pointer;padding-top: 5px;" onclick="openNav()">&#9776;.</span>
                            <a style="height: 100px; width: 225px" href="HomePage" class="logo">
                                <h1 style="margin-bottom: 0px;">Easy_Rentals</h1>
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="HomePage" class="<c:if test="${requestScope.page == 1}">active</c:if>">Home</a></li>
                                <li><a href="ApartmentPostList"class="<c:if test="${requestScope.page == 2}">active</c:if>">Tìm Căn Hộ</a></li>
                                <li><a href="CommunityPostList" class="<c:if test="${requestScope.page == 3}">active</c:if>">Blogs</a></li>
                                <li><a href="AboutUs" class="<c:if test="${requestScope.page == 4}">active</c:if>">About Us</a></li>
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
                <style>
                    body {
                        font-family: "Lato", sans-serif;
                    }

                    .sidenav {
                        height: 100%;
                        width: 0;
                        position: fixed;
                        z-index: 1;
                        top: 0;
                        left: 0;
                        background-color: #ffffff;
                        overflow-x: hidden;
                        transition: 0.09s;
                        padding-top: 60px;
                        box-shadow: rgba(0, 0, 0, 0.4) 0px 30px 90px;
                        display: flex;
                        flex-direction: column;
                    }

                    .sidenav .top-links {
                        display: flex;
                        flex-direction: column;
                    }

                    .sidenav .bottom-links {
                        margin-top: auto;
                        display: flex;
                        flex-direction: column;
                    }

                    .sidenav a {
                        padding: 8px 8px 8px 32px;
                        text-decoration: none;
                        font-size: 15px;
                        color: #000;
                        display: block;
                        transition: 0.3s;
                    }

                    .sidenav a:hover {
                        color: #0091ff;
                    }

                    .sidenav .closebtn {
                        position: absolute;
                        top: 0;
                        right: 25px;
                        font-size: 36px;
                        margin-left: 50px;
                    }

                    @media screen and (max-height: 450px) {
                        .sidenav {
                            padding-top: 17px;
                        }
                        .sidenav a {
                            font-size: 18px;
                        }
                    }
                </style>

                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <div class="top-links">
                    <c:if test="${sessionScope.user_Data == null}">
                        <a href="Login">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0z"/>
                            <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708z"/>
                            </svg>
                            Đăng nhập</a>
                        </c:if>

                    <c:if test="${sessionScope.user_Data != null}">

                        <a href="AddApartmentPost"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                            </svg>&nbsp;&nbsp;
                            Đăng tin căn hộ</a>
                        <a href="ApartmentPostForLandlord"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-sliders" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M11.5 2a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M9.05 3a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0V3zM4.5 7a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M2.05 8a2.5 2.5 0 0 1 4.9 0H16v1H6.95a2.5 2.5 0 0 1-4.9 0H0V8zm9.45 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m-2.45 1a2.5 2.5 0 0 1 4.9 0H16v1h-2.05a2.5 2.5 0 0 1-4.9 0H0v-1z"/>
                            </svg>
                            &nbsp;&nbsp;Quản lý đăng tin căn hộ</a>
                        <a href="addApartment">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>&nbsp;&nbsp;
                            Thêm căn hộ
                        </a>
                        <a href="AparmentListForLandlord"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-building-gear" viewBox="0 0 16 16">
                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm4.386 1.46c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382zM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"/>
                            </svg>&nbsp;&nbsp;
                            Quản lý căn hộ
                        </a>
                        <a href="addCommunityPost"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"/>
                            </svg>
                            &nbsp;&nbsp;Đăng tin cộng đồng</a>  

                        <a href="CommunityPostList?selection=2"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-sliders2-vertical" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M0 10.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1H3V1.5a.5.5 0 0 0-1 0V10H.5a.5.5 0 0 0-.5.5M2.5 12a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 1 0v-2a.5.5 0 0 0-.5-.5m3-6.5A.5.5 0 0 0 6 6h1.5v8.5a.5.5 0 0 0 1 0V6H10a.5.5 0 0 0 0-1H6a.5.5 0 0 0-.5.5M8 1a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 1 0v-2A.5.5 0 0 0 8 1m3 9.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1H14V1.5a.5.5 0 0 0-1 0V10h-1.5a.5.5 0 0 0-.5.5m2.5 1.5a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 1 0v-2a.5.5 0 0 0-.5-.5"/>
                            </svg>
                            &nbsp;&nbsp;Quản lý đăng tin cộng đồng</a>
                        <a href="AddFunds"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8m5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0"/>
                            <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195z"/>
                            <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083q.088-.517.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1z"/>
                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 6 6 0 0 1 3.13-1.567"/>
                            </svg>
                            &nbsp;&nbsp;Nạp tiền</a>
                        <a href="NotificationList"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                            <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2M8 1.918l-.797.161A4 4 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4 4 0 0 0-3.203-3.92zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5 5 0 0 1 13 6c0 .88.32 4.2 1.22 6"/>
                            </svg>
                            &nbsp;&nbsp;Thông báo <%   // Retrieve user_Data from session
    User user_Data = (User) session.getAttribute("user_Data");
    int count = 0;
    NotificationDao nd = new NotificationDao();
    count = nd.countNotificationNotRead(user_Data.getId());

    
                            %><span class="badge rounded-pill badge-notification bg-danger"><%= count %></span>
                        </a>

                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                            <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4"/>
                            </svg>&nbsp;&nbsp;Khách hàng của tôi</a>
                        </c:if>
                </div>
                <div class="bottom-links">
                    <a style="padding-left: 10px; background: white;" href="HomePage"><jsp:include page="img/svg.html" />
                        &nbsp;&nbsp;</a>
                        <c:if test="${sessionScope.user_Data != null}">
                        <a href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"/>
                            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
                            </svg>
                            &nbsp;&nbsp;
                            Đăng xuất
                        </a>
                    </c:if>



                </div>
            </div>
        </header>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "400px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script>

        <!-- Bootstrap JS and dependencies (Popper.js) -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.7/umd/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"></script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/counter.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- Start of LiveChat (www.livechat.com) code -->
        <script>
            window.__lc = window.__lc || {};
            window.__lc.license = 18242703;
            window.__lc.integration_name = "manual_channels";
            window.__lc.product_name = "livechat";
            ;
            (function (n, t, c) {
                function i(n) {
                    return e._h ? e._h.apply(null, n) : e._q.push(n)
                }
                var e = {_q: [], _h: null, _v: "2.0", on: function () {
                        i(["on", c.call(arguments)])
                    }, once: function () {
                        i(["once", c.call(arguments)])
                    }, off: function () {
                        i(["off", c.call(arguments)])
                    }, get: function () {
                        if (!e._h)
                            throw new Error("[LiveChatWidget] You can't use getters before load.");
                        return i(["get", c.call(arguments)])
                    }, call: function () {
                        i(["call", c.call(arguments)])
                    }, init: function () {
                        var n = t.createElement("script");
                        n.async = !0, n.type = "text/javascript", n.src = "https://cdn.livechatinc.com/tracking.js", t.head.appendChild(n)
                    }};
                !n.__lc.asyncInit && e.init(), n.LiveChatWidget = n.LiveChatWidget || e
            }(window, document, [].slice))
        </script>
        <noscript><a href="https://www.livechat.com/chat-with/18242703/" rel="nofollow">Chat with us</a>, powered by <a href="https://www.livechat.com/?welcome" rel="noopener nofollow" target="_blank">LiveChat</a></noscript>
        <!-- End of LiveChat code -->
    </body>
</html>
