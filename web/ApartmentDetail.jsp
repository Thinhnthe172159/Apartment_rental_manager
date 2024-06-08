<%-- 
    Document   : ApartmentDetail
    Created on : May 31, 2024, 12:16:09 PM
    Author     : thinh
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <link rel="icon" href="img/logoWeb.png" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
        <title>Chi tiết bài đăng căn hộ</title>


        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <style>
            .ratio-16x9 {
                background: black;
                border: 3px solid #000;
                position: relative;
                width: 100%;
                padding-top: 56.25%;
                overflow: hidden;
            }

            .ratio-16x9 img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: contain;
            </style>
        </head>

        <body style=" background: whitesmoke">

                <jsp:include page="Navbar.jsp"/>
                <br><br><br><br><br><br>
                <!-- ***** Header Area End ***** -->
                <c:set var="Apartment" value="${requestScope.Apartment}"/>
                <c:set value="${requestScope.apartment_Post}" var="apartment_Post"/>
                <div class="page-heading header-text">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <span class="breadcrumb"><a href="#">Apartment</a>  /  Detail</span>
                                <h3>Single Property</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="single-property section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8" style="background">
                                <div style="position: absolute;
                                z-index: 1">:
                                    <c:if test="${apartment_Post.payment_id.id == 1}" >
                                        <h4 style="">&nbsp;  ${apartment_Post.payment_id.name}</h4>
                                    </c:if>
                                    <c:if test="${requestScope.apartment_Post.payment_id.id == 2}" >
                                        <h4 style="color: blue;">&nbsp;  ${apartment_Post.payment_id.name}</h4>
                                </c:if>
                                <c:if test="${apartment_Post.payment_id.id == 3}" >
                                    <h4 style="color: yellowgreen" >&nbsp;  VIP${apartment_Post.payment_id.name}</h4>
                                    </c:if>
                                    <c:if test="${apartment_Post.payment_id.id == 4}" >
                                        <h4 style="color: red">&nbsp;  VIP ${apartment_Post.payment_id.name}</h4>
                                    </c:if>
                                    </span> 
                                </div>
                                <div class="main-image">

                                    <!-- Image Modal -->
                                    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <img id="modalImage" src="" class="img-fluid" alt="Apartment Image">
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <div style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;" id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
                                    <div class="carousel-inner">
                                        <c:forEach items="${requestScope.apartment_images_list}" var="image" varStatus="status">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''} ratio-16x9">
                                                <img src="uploads/${image.image}" class="d-block w-100" alt="..." data-bs-toggle="modal" data-bs-target="#imageModal" data-src="uploads/${image.image}">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>


                                <!-- Thumbnails -->
                                <div style="" class="carousel-thumbnails mt-3">
                                    <div class="thumbnail-row">
                                        <c:forEach items="${requestScope.apartment_images_list}" var="image" varStatus="status">
                                            <div class="thumbnail-item">
                                                <a href="uploads/${image.image}" data-lightbox="apartment-gallery">
                                                    <img src="uploads/${image.image}" class="img-thumbnail ${status.index == 0 ? 'active-thumb' : ''}" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="${status.index}" alt="...">
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>


                                <style>
                                    .carousel-thumbnails {
                                        overflow-x: auto;
                                        white-space: nowrap;
                                    }
                                    .thumbnail-row {
                                        display: flex;
                                        flex-wrap: nowrap;
                                    }
                                    .thumbnail-item {
                                        flex: 0 0 auto;
                                        margin-right: 10px;

                                    }
                                    .carousel-thumbnails img {
                                        object-fit: contain;
                                        cursor: pointer;
                                        width: 150px;
                                        height: 110px;
                                    }
                                    .active-thumb {
                                        border: 2px solid #007bff;
                                    }

                                </style>





                            </div>
                            <div  class="main-content">
                                <span style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;" class="category">${requestScope.Apartment.type_id.name}</span><span>  <svg xmlns="http://www.w3.org/2000/svg" fill="#000000" width="30px" height="40px" viewBox="0 0 100 100"><path d="M49,18.92A23.74,23.74,0,0,0,25.27,42.77c0,16.48,17,31.59,22.23,35.59a2.45,2.45,0,0,0,3.12,0c5.24-4.12,22.1-19.11,22.1-35.59A23.74,23.74,0,0,0,49,18.92Zm0,33.71a10,10,0,1,1,10-10A10,10,0,0,1,49,52.63Z"/></svg>
                                    <a style="color: black" href="ApartmentPostList?tinh=${requestScope.Apartment.city}">${requestScope.Apartment.city}</a>,
                                        <a style="color: black" href="ApartmentPostList?tinh=${requestScope.Apartment.city}&quan=${requestScope.Apartment.district}">${requestScope.Apartment.district}</a>,
                                        <a style="color: black" href="ApartmentPostList?tinh=${requestScope.Apartment.city}&quan=${requestScope.Apartment.district}&phuong=${requestScope.Apartment.commune}">${requestScope.Apartment.commune}</a>,${requestScope.Apartment.address} </span>
                                    <hr>
                                    <div style="background: #FFFFFF;
                                    border-radius: 15px;
                                    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                                    <div style="background: #FFFFFF;
                                         padding: 3% 3% 3% 3%;
                                         border-radius: 15px;">
                                        <c:if test="${apartment_Post.payment_id.id == 1}" >
                                            <h3 style="">${apartment_Post.title}</h3>
                                        </c:if>
                                        <c:if test="${requestScope.apartment_Post.payment_id.id == 2}" >
                                            <h3 style="color: blue;
                                                font-style: italic">${apartment_Post.title}</h3>
                                            </c:if>
                                            <c:if test="${apartment_Post.payment_id.id == 3}" >
                                                <h3 style="color: yellowgreen;
                                                font-family: cursive;
                                                font-size: large;" >${apartment_Post.title.toUpperCase()}</h3>
                                        </c:if>
                                        <c:if test="${apartment_Post.payment_id.id == 4}" >
                                            <h3 style="color: red;
                                                font-style: italic;
                                                font-family: serif">${apartment_Post.title.toUpperCase()}</h3>
                                            </c:if>
                                            <h4 style="font-family: initial">${Apartment.name}</h4>
                                        </div>
                                    </div>
                                    <br><br>
                                    <br>
                                    <div style="background: #FFFFFF;
                                    border-radius: 15px;
                                    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">

                                    <div style="background: #FFFFFF;
                                         border-radius: 15px;
                                         padding: 3% 3% 3% 3%"><br><h5>Thông tin mô tả:</h5><br>
                                             <p style="font-family: initial">${apartment_Post.description}</p>
                                         </div>
                                    </div>

                                </div> 
                                <div class="accordion" id="accordionExample" style="border-radius: 15px;
                                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Nội Thất
                                        </button>
                                    </h2>
                                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                        <div class="row accordion-body">
                                            <c:forEach items="${requestScope.apartment_propertieses_list}" var="p"> 
                                                <span class="col-md-4"><img style="width: 35px" src="${p.property_id.image}" alt="alt"/>  ${p.property_id.name} </span>  
                                                    </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion" id="accordionExample" style="border-radius: 15px;
                                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                                <div>
                                    <h2 class="accordion-header" id="headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            Xem Trên Bản Đồ
                                        </button>
                                        <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                            <style>
                                                #map {
                                                    width: 100%;
                                                    height: 350px;
                                                    z-index: 2;
                                                }
                                            </style>
                                            <div class="" id="map"></div>
                                        </div>
                                    </h2>
                                </div>
                            </div>
                            <div class="accordion" id="accordionExample" style="border-radius: 15%;
                                 box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                                <div class="accordion-item" style="padding: 3% 3% 3% 3%;">
                                    <table  border="0">
                                        <thead>
                                            <tr>
                                                <th>Ngày đăng &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                <th>Ngày hết hạn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                                <th>Loại tin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>${apartment_Post.post_start}</td>
                                                <td>${apartment_Post.post_end}</td>
                                                <td>${apartment_Post.payment_id.name}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>         
                        <div class="col-lg-4">
                            <div class="info-table"  style="background: #FFFFFF">
                                    <ul>
                                        <li>
                                            <img src="${Apartment.landLord_id.image}" alt="ảnh landlord" style="width: 100px;
                                            height: 100px;
                                            border-radius: 50%">
                                            <h4>${Apartment.landLord_id.first_name} ${Apartment.landLord_id.last_name}<br><span>Liên hệ tư vấn</span><br><span>Phone --> 0987654321</span></h4>
                                        </li>
                                        <li>
                                            <img src="assets/images/info-icon-01.png" alt="" style="max-width: 52px;">
                                        <h4>${Apartment.area}<br><span>m2</span></h4>
                                    </li>
                                    <li>
                                        <img src="assets/images/info-icon-02.png" alt="" style="max-width: 52px;">
                                        <h4><c:if test="${Apartment.status_apartment == 1}">Available<br><span>Contract Ready</span></c:if><c:if test="${Apartment.status_apartment == 0}">Not Available</c:if><br><span>Contract is not Ready</span></h4>
                                        </li>
                                        <li>
                                            <img src="assets/images/info-icon-03.png" alt="" style="max-width: 52px;">
                                                <h4><fmt:formatNumber value="${Apartment.price}" pattern="#,###"/>vnd/m<br><span>Payment Process</span></h4>
                                    </li>
                                    <li>
                                        <img src="https://thumbs.dreamstime.com/b/bed-sleep-bedroom-icon-orange-vector-sketch-well-organized-simple-use-commercial-purposes-web-printing-any-type-design-241213928.jpg" alt="" style="max-width: 60px;">
                                        <h4>${Apartment.number_of_bedroom}<br><span>Bedroom</span></h4>
                                    </li>
                                </ul>
                            </div>
                            <br>
                            <div class="info-table"  style="background: #FFFFFF">
                                    <h4 style="font-family: initial">Căn hộ nổi bật</h4>
                                    <c:forEach items="${requestScope.apartment_Posts_popular}" var="app">


                                        <br>
                                        *<a style="color: blue" href="ApartmentDetail?Apartment_id=${app.apartment_id.id}&apartment_post_id=${app.id}">
                                            ${app.title}
                                        </a>
                                        <br>


                                    </c:forEach>
                                </div>      
                            </div>
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="row" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
                background: #F5DEC9">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="container">
                            <div class="row">

                                <div>
                                    <br>
                                </div>
                                <div class="col-md-12">
                                    <h3>Căn hộ cùng khu vực</h3><br>
                                </div>
                                <style>
                                    .scroll-container {
                                    width: 100%;
                                    overflow-x: auto;

                                    border-radius: 15px;
                                    white-space: nowrap;
                                    padding: 10px 0;
                                }

                                .content {
                                    display: inline-block;
                                    white-space: nowrap;
                                }

                                .card {
                                    display: inline-block;
                                    margin-right: 10px;

                                }

                                .card img {
                                    object-fit: contain;
                                    background: #000;
                                }

                            </style>
                            <div class="scroll-container">
                                <div class="content">
                                    <c:forEach items="${requestScope.apartment_Post_nearby_list}" var="ap">
                                        <div class="card" style="width: 18rem;
                                             display: inline-block;
                                             vertical-align: top;">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}"><img src="uploads/${ap.first_image}" height="200px" class="card-img-top" alt="Apartment Image"/></a>
                                            <div class="card-body">
                                                <c:choose>
                                                    <c:when test="${fn:length(ap.title) > 30}">
                                                        <a style="color: red" href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}">
                                                                ${fn:substring(ap.title, 0, 30)}...
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a style="color: red" href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}">
                                                                ${ap.title}
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose><br><fmt:formatNumber value="${ap.price}" pattern="#,###"/>/tháng<br>
                                                    <p>${ap.city},${ap.district}</p>

                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">

                    <!-- Widgets - Bootstrap Brain Component -->
                    <section class="bg-light py-4 py-md-5 py-xl-8 border-top border-light">
                        <div class="container overflow-hidden">
                            <div class="row gy-4 gy-lg-0 justify-content-xl-between">
                                <div class="col-12 col-md-4 col-lg-3 col-xl-2">
                                    <div class="widget">
                                        <a href="#!">
                                            <img src="./assets/img/bsb-logo.svg" alt="BootstrapBrain Logo" width="175" height="57">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4 col-lg-3 col-xl-2">
                                    <div class="widget">
                                        <h4 class="widget-title mb-4">Get in Touch</h4>
                                        <address class="mb-4">8014 Edith Blvd NE, Albuquerque, New York, United States</address>
                                        <p class="mb-1">
                                            <a class="link-secondary text-decoration-none" href="tel:+15057922430">(505) 792-2430</a>
                                        </p>
                                        <p class="mb-0">
                                            <a class="link-secondary text-decoration-none" href="mailto:demo@yourdomain.com">demo@yourdomain.com</a>
                                        </p>
                                    </div>
                                </div>
                                <div class="col-12 col-md-4 col-lg-3 col-xl-2">
                                    <div class="widget">
                                        <h4 class="widget-title mb-4">Learn More</h4>
                                        <ul class="list-unstyled">
                                            <li class="mb-2">
                                                <a href="#!" class="link-secondary text-decoration-none">About</a>
                                            </li>
                                            <li class="mb-2">
                                                <a href="#!" class="link-secondary text-decoration-none">Contact</a>
                                            </li>
                                            <li class="mb-2">
                                                <a href="#!" class="link-secondary text-decoration-none">Advertise</a>
                                            </li>
                                            <li class="mb-2">
                                                <a href="#!" class="link-secondary text-decoration-none">Terms of Service</a>
                                            </li>
                                            <li class="mb-0">
                                                <a href="#!" class="link-secondary text-decoration-none">Privacy Policy</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-3 col-xl-4">
                                    <div class="widget">
                                        <h4 class="widget-title mb-4">Our Newsletter</h4>
                                        <p class="mb-4">Subscribe to our newsletter to get our news & discounts delivered to you.</p>
                                        <form action="#!">
                                            <div class="row gy-4">
                                                <div class="col-12">
                                                    <div class="input-group">
                                                        <span class="input-group-text" id="email-newsletter-addon">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                                            <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
                                                            </svg>
                                                        </span>
                                                        <input type="email" class="form-control" id="email-newsletter" value="" placeholder="Email Address" aria-label="email-newsletter" aria-describedby="email-newsletter-addon" required>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="d-grid">
                                                        <button class="btn btn-primary" type="submit">Subscribe</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Copyright - Bootstrap Brain Component -->
                    <div class="bg-light py-4 py-md-5 py-xl-8 border-top border-light-subtle">
                        <div class="container overflow-hidden">
                            <div class="row gy-4 gy-md-0 align-items-md-center">
                                <div class="col-xs-12 col-md-7 order-1 order-md-0">
                                    <div class="copyright text-center text-md-start">
                                        &copy; 2024. All Rights Reserved.
                                    </div>
                                    <div class="credits text-secondary text-center text-md-start mt-2 fs-8">
                                        Built by <a href="https://bootstrapbrain.com/" class="link-secondary text-decoration-none">BootstrapBrain</a> with <span class="text-primary">&#9829;</span>
                                    </div>
                                </div>

                                <div class="col-xs-12 col-md-5 order-0 order-md-1">
                                    <div class="social-media-wrapper">
                                        <ul class="list-unstyled m-0 p-0 d-flex justify-content-center justify-content-md-end">
                                            <li class="me-3">
                                                <a href="#!" class="link-dark link-opacity-75-hover">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                                    <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li class="me-3">
                                                <a href="#!" class="link-dark link-opacity-75-hover">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16">
                                                    <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.007 2.007 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.007 2.007 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31.4 31.4 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.007 2.007 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A99.788 99.788 0 0 1 7.858 2h.193zM6.4 5.209v4.818l4.157-2.408L6.4 5.209z" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li class="me-3">
                                                <a href="#!" class="link-dark link-opacity-75-hover">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                                                    <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
                                                    </svg>
                                                </a>
                                            </li>
                                            <li class="">
                                                <a href="#!" class="link-dark link-opacity-75-hover">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                                                    <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z" />
                                                    </svg>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </footer>
                <footer class="footer-no-gap">
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

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
                <script>
                    document.addEventListener('DOMContentLoaded', (event) => {
                        var myCarousel = document.querySelector('#carouselExampleAutoplaying');
                        var carousel = new bootstrap.Carousel(myCarousel, {
                            interval: 5000,
                            wrap: true
                        });

                        myCarousel.addEventListener('slide.bs.carousel', function (event) {
                            document.querySelectorAll('.carousel-thumbnails img').forEach(function (thumbnail) {
                                thumbnail.classList.remove('active-thumb');
                            });
                            var nextIndex = event.to;
                            document.querySelectorAll('.carousel-thumbnails img')[nextIndex].classList.add('active-thumb');
                        });

                        document.querySelectorAll('.carousel-thumbnails img').forEach(function (thumbnail, index) {
                            thumbnail.addEventListener('click', function () {
                                carousel.to(index);
                            });
                        });

                        document.querySelectorAll('.carousel-inner img').forEach(function (image) {
                            image.addEventListener('click', function () {
                                var src = image.getAttribute('data-src');
                                var modalImage = document.getElementById('modalImage');
                                modalImage.src = src;
                            });
                        });
                    });


                </script>


                <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
                <script>

                    var map = L.map('map');


                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                    }).addTo(map);

                    var address = '${Apartment.city} .${Apartment.district}. ${Apartment.commune}.${Apartment.address}';
                        var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address);

                        fetch(url)
                                .then(response => response.json())
                                .then(data => {
                                    var lat = parseFloat(data[0].lat);
                                    var long = parseFloat(data[0].lon);
                                    map.setView([lat, long], 15);
                                    L.marker([lat, long]).addTo(map).bindPopup(address).openPopup();
                                })
                                .catch(error => console.error('Error:', error));

                        var schoolMarker = L.marker([schoolLat, schoolLng]).bindPopup('School Name');
                        schoolsLayer.addLayer(schoolMarker);

                        var hospitalMarker = L.marker([hospitalLat, hospitalLng]).bindPopup('Hospital Name');
                        hospitalsLayer.addLayer(hospitalMarker);

                        schoolsLayer.addTo(map);
                        hospitalsLayer.addTo(map);

                        L.control.layers(null, {
                            'Schools': schoolsLayer,
                            'Hospitals': hospitalsLayer,
                            // ... add other layers here
                        }).addTo(map);

                </script>



            </body>
        </html>