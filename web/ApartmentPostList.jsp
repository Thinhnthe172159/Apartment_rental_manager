<%-- 
    Document   : apartmentPostLists
    Created on : Jun 4, 2024, 10:33:18 PM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <!-- Mirrored from storage.googleapis.com/theme-vessel-items/checking-sites/nest-2-html/HTML/main/properties-list-rightside.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 04 Jun 2024 15:11:29 GMT -->
    <head>
        <!-- Google Tag Manager -->
        <script>(function (w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({'gtm.start':
                            new Date().getTime(), event: 'gtm.js'});
                var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                        '../../../../../../www.googletagmanager.com/gtm5445.html?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-TNL8QV6');</script>
        <!-- End Google Tag Manager -->
        <title>The Nest - Real Estate HTML Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">

        <!-- External CSS libraries -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-submenu.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
        <link rel="stylesheet" href="css/leaflet.css" type="text/css">
        <link rel="stylesheet" href="css/map.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/flaticon/font/flaticon.css">
        <link type="text/css" rel="stylesheet" href="fonts/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="fonts/linearicons/style.css">
        <link rel="stylesheet" type="text/css"  href="css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" type="text/css"  href="css/dropzone.css">
        <link rel="stylesheet" type="text/css"  href="css/magnific-popup.css">
        <link rel="stylesheet" type="text/css"  href="css/slick.css">

        <!-- Custom stylesheet -->
        <link rel="stylesheet" type="text/css" href="css/initial.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" id="style_sheet" href="css/skins/default.css">

        <!-- Favicon icon -->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" >

        <!-- Google fonts -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPlayfair+Display:400,700%7CRoboto:100,300,400,400i,500,700">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;600;700;900&amp;family=Roboto:wght@400;500;700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@100;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link rel="stylesheet" type="text/css" href="css/ie10-viewport-bug-workaround.css">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script type="text/javascript" src="js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="js/html5shiv.min.js"></script>
        <script type="text/javascript" src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TNL8QV6"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
        <div class="page_loader"></div>


        <!-- Properties section body start -->
        <div class="properties-section-body content-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-xs-12">
                        <!-- Option bar start -->
                        <div class="option-bar">
                            <div class="row">
                                <div class="col-lg-5 col-md-5 col-sm-5">
                                    <h4>
                                        <span class="heading-icon">
                                            <i class="fa fa-th-list"></i>
                                        </span>
                                        <span class="title">Properties List</span>
                                    </h4>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-7">
                                    <div class="sorting-options advanced-search">
                                        <select class="selectpicker search-fields sorting" name="new-to-old">
                                            <option>New To Old</option>
                                            <option>Old To New</option>
                                            <option>Properties (High To Low)</option>
                                            <option>Properties (Low To High)</option>
                                        </select>
                                        <a href="properties-list-rightside.html" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                        <a href="properties-grid-rightside.html" class="change-view-btn"><i class="fa fa-th-large"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Option bar end -->

                        <!-- Property start -->

                        <c:forEach items="${requestScope.apartmentPostList}" var="ap">
                            <div class="property row g-0 fp2 clearfix wow fadeInUp delay-03s">
                                <div class="col-lg-5 col-md-5 col-sm-12">
                                    <!-- Property img -->
                                    <div class="property-img">
                                        <div class="property-tag button alt featured">Vip ${ap.payment_id.name}</div>
                                        <div class="property-tag button sale">For Rent</div>
                                        <div class="property-price">${ap.price}</div>
                                        <img src="uploads/${ap.first_image}" alt="fp-list" class="img-responsive hp-1">
                                        <div class="property-overlay">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}" class="overlay-link">
                                                <i class="fa fa-link"></i>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 property-content">
                                    <div class="info">
                                        <!-- title -->
                                        <h1 class="title">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}">     <c:if test="${ap.payment_id.id == 1}" >
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
                                                </c:if></a>
                                        </h1>
                                        <!-- Property address -->
                                        <h3 class="property-address">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}">
                                                <i class="fa fa-map-marker"></i>${ap.city},${ap.district},${ap.commune}
                                            </a>
                                        </h3>
                                        <!-- Facilities List -->
                                        <ul class="facilities-list clearfix">
                                            <li>
                                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                                <span>${ap.area} m2</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-bed"></i>
                                                <span>${ap.number_of_bedroom} bedroom</span>
                                            </li>
                                         
                                        </ul>
                                        <!-- Property footer -->
                                    </div>
                                    <div class="property-footer">
                                        <span class="left">
                                            <a href="#"><i class="fa fa-user"></i>Jhon Doe</a>
                                        </span>
                                        <span class="right">
                                            <i class="fa fa-calendar"></i>5 Days ago
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Property end -->

                        <!-- Pagination box start -->
                        <div class="pagination-box text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="#">Prev</a>
                                    </li>
                                    <li class="page-item"><a class="page-link  active" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Pagination box end -->
                    </div>
                    <div class="col-lg-4 col-md-12 col-xs-12">
                        <!-- Advanced search start -->
                        <div class="sidebar-widget advanced-search">
                            <div class="main-title-4">
                                <h1>Advanced  Search</h1>
                            </div>
                            <form method="GET">
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="property status">
                                        <option>Chọn loại hình căn hộ</option>
                                        <option>For Sale</option>
                                        <option>For Rent</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="location">
                                        <option>Tìm theo tỉnh thành</option>
                                        <option>United States</option>
                                        <option>United Kingdom</option>
                                        <option>American Samoa</option>
                                        <option>Belgium</option>
                                        <option>Cameroon</option>
                                        <option>Canada</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="location">
                                        <option>Tìm theo quận huyện</option>
                                        <option>United States</option>
                                        <option>United Kingdom</option>
                                        <option>American Samoa</option>
                                        <option>Belgium</option>
                                        <option>Cameroon</option>
                                        <option>Canada</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select class="selectpicker search-fields" name="location">
                                        <option>Tìm theo xã phường</option>
                                        <option>United States</option>
                                        <option>United Kingdom</option>
                                        <option>American Samoa</option>
                                        <option>Belgium</option>
                                        <option>Cameroon</option>
                                        <option>Canada</option>
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <select class="selectpicker search-fields" name="bedrooms">
                                                <option>Số phòng ngủ</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <select class="selectpicker search-fields" name="bathrooms">
                                                <option>Bathrooms</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="range-slider">
                                    <label>Area</label>
                                    <div data-min="1" data-max="1000" data-unit="m2" data-min-name="areaUp" data-max-name="areaDown" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <input id="areaUp" class="selectpicker search-fields"  type="number" name="areaUp" placeholder="   area min">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <input id="areaDown" class="selectpicker search-fields"  type="number" name="areaDown" placeholder="   area max">
                                        </div>
                                    </div>
                                </div>
                                <script>
            document.getElementById('areaUp').addEventListener('input', function () {
                var value = parseInt(this.value, 10);
                if (value > 1000) {
                    this.value = 1000;
                } else if (value < 0) {
                    this.value = 0;
                }
            });

            document.getElementById('areaDown').addEventListener('input', function () {
                var value = parseInt(this.value, 10);
                if (value > 1000) {
                    this.value = 1000;
                } else if (value < 0) {
                    this.value = 0;
                }
            });
                                </script>
                                <div class="range-slider">
                                    <label>Price</label>
                                    <div data-min="1" data-max="100" data-unit="triệu đồng" data-min-name="priceUp" data-max-name="priceDown" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <input id="priceUp" class="selectpicker search-fields"  type="number" name="areaUp" placeholder="   area min">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <input id="priceDown" class="selectpicker search-fields"  type="number" name="areaDown" placeholder="   area max">
                                        </div>
                                    </div>
                                </div>

                                <script>
                                    document.getElementById('priceUp').addEventListener('input', function () {
                                        var value = parseInt(this.value, 10);
                                        if (value > 100) {
                                            this.value = 100;
                                        } else if (value < 0) {
                                            this.value = 0;
                                        }
                                    });

                                    document.getElementById('priceDown').addEventListener('input', function () {
                                        var value = parseInt(this.value, 10);
                                        if (value > 100) {
                                            this.value = 100;
                                        } else if (value < 0) {
                                            this.value = 0;
                                        }
                                    });
                                </script>


                                <div class="form-group mb-0">
                                    <button type="submit" class="button-md button-theme btn-3 w-100">Search</button>
                                </div>
                            </form>
                        </div>
                        <!-- Advanced search end -->

                        <!-- Category posts start -->
                        <div class="sidebar-widget category-posts">
                            <div class="main-title-4">
                                <h1>Popular Category</h1>
                            </div>
                            <ul class="list-unstyled list-cat">
                                <li><a href="#">Single Family </a> <span>(45)  </span></li>
                                <li><a href="#">Apartment  </a> <span>(21)  </span></li>
                                <li><a href="#">Condo </a> <span>(23)  </span></li>
                                <li><a href="#">Multi Family </a> <span>(19)  </span></li>
                                <li><a href="#">Villa </a> <span>(19)  </span></li>
                                <li><a href="#">Other  </a> <span>(22)  </span></li>
                            </ul>
                        </div>
                        <!-- Category posts end -->

                        <!-- Popular posts start -->
                        <div class="sidebar-widget popular-posts">
                            <div class="main-title-4">
                                <h1>Recent Properties</h1>
                            </div>
                            <div class="d-flex mb-3 popular-posts-box">
                                <a class="pr-3" href="properties-details.html">
                                    <img src="img/properties/small-properties-2.jpg" alt="small-photo" class="flex-shrink-0 me-3">
                                </a>
                                <div class="detail align-self-center">
                                    <h4>
                                        <a href="properties-details.html">Modern Family Home</a>
                                    </h4>
                                    <div class="listing-post-meta">
                                        Sep 18, 2021 | <a href="#">$470,00</a>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex mb-3 popular-posts-box">
                                <a class="pr-3" href="properties-details.html">
                                    <img src="img/properties/small-properties-1.jpg" alt="small-photo" class="flex-shrink-0 me-3">
                                </a>
                                <div class="detail align-self-center">
                                    <h4>
                                        <a href="properties-details.html">Sweet Family Home</a>
                                    </h4>
                                    <div class="listing-post-meta">
                                        Aug 18, 2020 | <a href="#">$485,00</a>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex popular-posts-box">
                                <a class="pr-3" href="properties-details.html">
                                    <img src="img/properties/small-properties-3.jpg" alt="small-photo" class="flex-shrink-0 me-3">
                                </a>
                                <div class="detail align-self-center">
                                    <h4>
                                        <a href="properties-details.html">Beautful Single Home</a>
                                    </h4>
                                    <div class="listing-post-meta">
                                        Aug Feb, 2021 | <a href="#">$850,00</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Popular posts end -->

                        <!-- Helping box Start -->
                        <div class="sidebar-widget helping-box clearfix">
                            <div class="main-title-4">
                                <h1>Helping Center</h1>
                            </div>
                            <div class="helping-center">
                                <div class="icon"><i class="fa fa-map-marker"></i></div>
                                <h4>Address</h4>
                                <p>123 Kathal St. Tampa City,</p>
                            </div>
                            <div class="helping-center">
                                <div class="icon"><i class="fa fa-phone"></i></div>
                                <h4>Phone</h4>
                                <p><a href="tel:+55-417-634-7071">+55 417 634 7071</a> </p>
                            </div>
                        </div>
                        <!-- Helping box end -->

                        <!-- Latest reviews start -->
                        <div class="sidebar-widget latest-reviews mb-30">
                            <div class="main-title-4">
                                <h1>Latest  Reviews</h1>
                            </div>
                            <div class="latest-reviews-box d-flex mb-4">
                                <a class="pr-3" href="#">
                                    <img src="img/avatar/avatar-1.jpg" alt="avatar" class="flex-shrink-0 me-3">
                                </a>
                                <div class="detail">
                                    <h3><a href="#">John Antony</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiamrisus tortor, accumsan at,</p>
                                </div>
                            </div>
                            <div class="latest-reviews-box d-flex">
                                <a class="pr-3" href="#">
                                    <img src="img/avatar/avatar-2.jpg" alt="avatar" class="flex-shrink-0 me-3">
                                </a>
                                <div class="detail">
                                    <h3><a href="#">Karen Paran</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiamrisus tortor, accumsan at,</p>
                                </div>
                            </div>
                        </div>
                        <!-- Latest reviews end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Properties section body end -->

        <!-- Partners strat -->
        <div class="partners bg-white">
            <div class="container">
                <h4>Brands <span>$ Partners</span></h4>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="custom-slider slide-box-btn">
                            <div class="custom-box"><img src="img/brand/partner.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-2.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-3.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-4.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-5.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-2.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-3.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-4.png" alt="brand"></div>
                            <div class="custom-box"><img src="img/brand/partner-5.png" alt="brand"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Partners end -->

        <!-- Footer start -->
        <footer class="main-footer clearfix">
            <div class="container">
                <!-- Footer info-->
                <div class="footer-info">
                    <div class="row">
                        <!-- About us -->
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-item fi2">
                                <div class="main-title-4">
                                    <h1>Contact Us</h1>
                                </div>
                                <ul class="personal-info">
                                    <li>
                                        <i class="fa fa-map-marker"></i>
                                        Address: 360 Harvest St, North Subract, London. United States Of Amrica.
                                    </li>
                                    <li>
                                        <i class="fa fa-envelope"></i>
                                        Email:<a href="mailto:sales@hotelempire.com">info@themevessel.com</a>
                                    </li>
                                    <li>
                                        <i class="fa fa-phone"></i>
                                        Phone: <a href="tel:+55-417-634-7071">+0477 85X6 552</a>
                                    </li>
                                    <li>
                                        <i class="fa fa-fax"></i>
                                        Fax: +0487 85X6 224
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Links -->
                        <div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <div class="main-title-4">
                                    <h1>Links</h1>
                                </div>
                                <ul class="links">
                                    <li>
                                        <a href="index.html">Home</a>
                                    </li>
                                    <li>
                                        <a href="about.html">About Us</a>
                                    </li>
                                    <li>
                                        <a href="contact.html">Contact Us</a>
                                    </li>
                                    <li>
                                        <a href="blog-single-sidebar-right.html">Blog</a>
                                    </li>
                                    <li>
                                        <a href="blog-single-sidebar-right.html">Services</a>
                                    </li>
                                    <li>
                                        <a href="properties-list-rightside.html">Properties Listing</a>
                                    </li>
                                    <li>
                                        <a href="properties-details.html">Properties Details</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Recent cars -->
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-item popular-posts">
                                <div class="main-title-4">
                                    <h1>Popular Posts</h1>
                                </div>
                                <div class="d-flex mb-3 popular-posts-box">
                                    <a class="pr-3" href="properties-details.html">
                                        <img src="img/properties/small-properties-2.jpg" alt="small-photo" class="flex-shrink-0 me-3">
                                    </a>
                                    <div class="detail align-self-center">
                                        <h4>
                                            <a href="properties-details.html">Modern Family Home</a>
                                        </h4>
                                        <div class="listing-post-meta">
                                            Sep 18, 2021 | <a href="#">$470,00</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex mb-3 popular-posts-box">
                                    <a class="pr-3" href="properties-details.html">
                                        <img src="img/properties/small-properties-1.jpg" alt="small-photo" class="flex-shrink-0 me-3">
                                    </a>
                                    <div class="detail align-self-center">
                                        <h4>
                                            <a href="properties-details.html">Sweet Family Home</a>
                                        </h4>
                                        <div class="listing-post-meta">
                                            Aug 18, 2020 | <a href="#">$485,00</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex popular-posts-box">
                                    <a class="pr-3" href="properties-details.html">
                                        <img src="img/properties/small-properties-3.jpg" alt="small-photo" class="flex-shrink-0 me-3">
                                    </a>
                                    <div class="detail align-self-center">
                                        <h4>
                                            <a href="properties-details.html">Beautful Single Home</a>
                                        </h4>
                                        <div class="listing-post-meta">
                                            Aug Feb, 2021 | <a href="#">$850,00</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Subscribe -->
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-item">
                                <div class="main-title-4">
                                    <h1>Subscribe</h1>
                                </div>
                                <div class="newsletter clearfix">
                                    <p>Sign Up for Our Newsletter to get Latest Updates and Offers. Subscribe to receive news in your inbox. Lorem Ipsum</p>
                                    <form class="form-inline d-flex" action="#">
                                        <input class="form-control" type="email" id="email" placeholder="Email Address...">
                                        <button class="btn button-theme" type="submit"><i class="fa fa-paper-plane"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right">
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <p>&copy;  2022 <a href="http://themevessel.com/" target="_blank">Theme Vessel</a>. All Rights Reserved.</p>
                        </div>
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <ul class="social-list clearfix">
                                <li>
                                    <a href="#" class="facebook-bg">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="twitter-bg">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="linkedin-bg">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="google-bg">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="rss-bg">
                                        <i class="fa fa-rss"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer end -->

        <!-- Property Video Modal -->
        <div class="modal property-modal fade" id="propertyModal" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row modal-raw g-0">
                            <div class="col-lg-5 modal-left">
                                <div class="modal-left-content">
                                    <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false" data-bs-interval="false">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <iframe class="modalIframe w-100" src="https://www.youtube.com/embed/V7IrnC9MISU" allowfullscreen></iframe>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="img/img-1.jpg" alt="model-photo" class="w-100 img-fluid">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="img/img-2.jpg" alt="model-photo" class="w-100 img-fluid">
                                            </div>
                                        </div>
                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </button>
                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 modal-right">
                                <div class="modal-right-content bg-white">
                                    <div class="heading comon-section">
                                        <h2>Find Your Dream House</h2>
                                        <p class="location">123 Kathal St. Tampa City,</p>
                                    </div>
                                    <div class="features comon-section">
                                        <strong class="price">
                                            $178,000
                                        </strong>
                                        <section>
                                            <h3>Features</h3>
                                        </section>
                                        <ul class="bullets">
                                            <li><i class="flaticon-air-conditioner"></i>Air conditioning</li>
                                            <li><i class="flaticon-wifi"></i>Wifi</li>
                                            <li><i class="flaticon-transport"></i>Parking</li>
                                            <li><i class="flaticon-people-2"></i>Pool</li>
                                            <li><i class="flaticon-weightlifting"></i>Gym</li>
                                            <li><i class="flaticon-building"></i>Alarm</li>
                                            <li><i class="flaticon-old-telephone-ringing"></i>Balcony</li>
                                            <li><i class="flaticon-monitor"></i>TV</li>
                                        </ul>
                                    </div>
                                    <div class="0verview comon-section cs-none">
                                        <section>
                                            <h3>Overview</h3>
                                        </section>
                                        <dl>
                                            <dt>Model</dt>
                                            <dd>Maxima</dd>
                                            <dt>Condition</dt>
                                            <dd>Brand New</dd>
                                            <dt>Year</dt>
                                            <dd>2018</dd>
                                            <dt>Price</dt>
                                            <dd>$178,000</dd>
                                        </dl>
                                        <a href="properties-details.html" class="btn button-sm button-theme">Show Detail</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script  src="js/bootstrap-submenu.js"></script>
        <script src="js/rangeslider.js"></script>
        <script src="js/jquery.mb.YTPlayer.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.scrollUp.js"></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/leaflet.js"></script>
        <script src="js/leaflet-providers.js"></script>
        <script src="js/leaflet.markercluster.js"></script>
        <script src="js/dropzone.js"></script>
        <script src="js/jquery.filterizr.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/maps.js"></script>
        <script src="js/sidebar.js"></script>
        <script src="js/app.js"></script>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
        <!-- Custom javascript -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
    </body>

    <!-- Mirrored from storage.googleapis.com/theme-vessel-items/checking-sites/nest-2-html/HTML/main/properties-list-rightside.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 04 Jun 2024 15:11:30 GMT -->
</html>

