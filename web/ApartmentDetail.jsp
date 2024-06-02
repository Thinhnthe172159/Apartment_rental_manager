<%-- 
    Document   : ApartmentDetail
    Created on : May 31, 2024, 12:16:09 PM
    Author     : thinh
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <title>Villa Agency - Property Detail Page</title>

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
                position: relative;
                width: 100%;
                padding-top: 56.25%; /* 16:9 ratio */
                overflow: hidden;
            }

            .ratio-16x9 img {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                object-fit: cover; /* Cover the container while maintaining aspect ratio */
            </style>
        </head>

        <body>

            <jsp:include page="Navbar.jsp"/>

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
                        <div class="col-lg-8">
                            <div class="main-image">


                                <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
                                    <div class="carousel-inner">
                                        <c:forEach items="${requestScope.apartment_images_list}" var="image" varStatus="status">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''} ratio-16x9">
                                                <img src="uploads/${image.image}" class="d-block w-100" alt="...">
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
                                <div class="carousel-thumbnails mt-3">
                                    <div class="thumbnail-row">
                                        <c:forEach items="${requestScope.apartment_images_list}" var="image" varStatus="status">
                                            <div class="thumbnail-item">
                                                <img src="uploads/${image.image}" class="img-thumbnail ${status.index == 0 ? 'active-thumb' : ''}" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="${status.index}" alt="...">
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
                                        cursor: pointer;
                                        width: 150px;
                                    }
                                    .active-thumb {
                                        border: 2px solid #007bff;
                                    }
                                </style>





                            </div>
                            <div class="main-content">
                                <span class="category">${requestScope.Apartment.type_id.name}</span><span>  <svg xmlns="http://www.w3.org/2000/svg" fill="#000000" width="30px" height="40px" viewBox="0 0 100 100"><path d="M49,18.92A23.74,23.74,0,0,0,25.27,42.77c0,16.48,17,31.59,22.23,35.59a2.45,2.45,0,0,0,3.12,0c5.24-4.12,22.1-19.11,22.1-35.59A23.74,23.74,0,0,0,49,18.92Zm0,33.71a10,10,0,1,1,10-10A10,10,0,0,1,49,52.63Z"/></svg> ${requestScope.Apartment.city}, ${requestScope.Apartment.district}, ${requestScope.Apartment.commune}, ${requestScope.Apartment.address} </span>
                                <hr>
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
                                    <h4>${Apartment.name}</h4>
                                    <h5>Thông tin mô tả:</h5><br>
                                    <div style="border: 1px solid #004085">
                                        <br>
                                        <p style="padding-left: 1%;">${apartment_Post.description}</p>
                                </div>

                            </div> 
                            <div class="accordion" id="accordionExample">
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
                            </div>
                            <div class="col-lg-4">
                                <div class="info-table">
                                    <ul>
                                        <li>
                                            <img src="uploads/${Apartment}" alt="" style="max-width: 52px;">
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
                        </div>
                    </div>
                </div>
            </div>

            <div class="section best-deal">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="section-heading">
                                <h6>| Best Deal</h6>
                                <h2>Find Your Best Deal Right Now!</h2>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="tabs-content">
                                <div class="row">
                                    <div class="nav-wrapper">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="appartment-tab" data-bs-toggle="tab" data-bs-target="#appartment" type="button" role="tab" aria-controls="appartment" aria-selected="true">Appartment</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="villa-tab" data-bs-toggle="tab" data-bs-target="#villa" type="button" role="tab" aria-controls="villa" aria-selected="false">Villa House</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="penthouse-tab" data-bs-toggle="tab" data-bs-target="#penthouse" type="button" role="tab" aria-controls="penthouse" aria-selected="false">Penthouse</button>
                                            </li>
                                        </ul>
                                    </div>              
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="appartment" role="tabpanel" aria-labelledby="appartment-tab">
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="info-table">
                                                        <ul>
                                                            <li>Total Flat Space <span>540 m2</span></li>
                                                            <li>Floor number <span>3</span></li>
                                                            <li>Number of rooms <span>8</span></li>
                                                            <li>Parking Available <span>Yes</span></li>
                                                            <li>Payment Process <span>Bank</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <img src="assets/images/deal-01.jpg" alt="">
                                                </div>
                                                <div class="col-lg-3">
                                                    <h4>All Info About Apartment</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse. <br><br>Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
                                                    <div class="icon-button">
                                                        <a href="#"><i class="fa fa-calendar"></i> Schedule a visit</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="villa" role="tabpanel" aria-labelledby="villa-tab">
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="info-table">
                                                        <ul>
                                                            <li>Total Flat Space <span>250 m2</span></li>
                                                            <li>Floor number <span>26th</span></li>
                                                            <li>Number of rooms <span>5</span></li>
                                                            <li>Parking Available <span>Yes</span></li>
                                                            <li>Payment Process <span>Bank</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <img src="assets/images/deal-02.jpg" alt="">
                                                </div>
                                                <div class="col-lg-3">
                                                    <h4>Detail Info About New Villa</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut labore et dolore magna aliqua quised ipsum suspendisse. <br><br>Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
                                                    <div class="icon-button">
                                                        <a href="#"><i class="fa fa-calendar"></i> Schedule a visit</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="penthouse" role="tabpanel" aria-labelledby="penthouse-tab">
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <div class="info-table">
                                                        <ul>
                                                            <li>Total Flat Space <span>320 m2</span></li>
                                                            <li>Floor number <span>34th</span></li>
                                                            <li>Number of rooms <span>6</span></li>
                                                            <li>Parking Available <span>Yes</span></li>
                                                            <li>Payment Process <span>Bank</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    <img src="assets/images/deal-03.jpg" alt="">
                                                </div>
                                                <div class="col-lg-3">
                                                    <h4>Extra Info About Penthouse</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor pack incididunt ut Kinfolk tonx seitan crucifix 3 wolf moon bicycle rights keffiyeh snackwave wolf same vice, chillwave vexillologistlabore et dolore magna aliqua quised ipsum suspendisse. <br><br>Swag fanny pack lyft blog twee. JOMO ethical copper mug, succulents typewriter shaman DIY kitsch twee taiyaki fixie hella venmo after messenger poutine next level humblebrag swag franzen.</p>
                                                    <div class="icon-button">
                                                        <a href="#"><i class="fa fa-calendar"></i> Schedule a visit</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
                });
            </script>





        </body>
    </html>