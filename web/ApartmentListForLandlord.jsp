<%-- 
    Document   : apartmentPostLists
    Created on : Jun 4, 2024, 10:33:18 PM
    Author     : thinh
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">


    <head>

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
        <link rel="stylesheet" type="text/css" href="css/initial.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" id="style_sheet" href="css/skins/default.css">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" >
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPlayfair+Display:400,700%7CRoboto:100,300,400,400i,500,700">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;600;700;900&amp;family=Roboto:wght@400;500;700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@100;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/ie10-viewport-bug-workaround.css">
        <script src="js/ie-emulation-modes-warning.js"></script>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>


            /* ===== Career ===== */
            .career-form {
                background-color: #4e63d7;
                border-radius: 5px;
                padding: 0 16px;
            }

            .career-form .form-control {
                background-color: rgba(255, 255, 255, 0.2);
                border: 0;
                padding: 12px 15px;
                color: #fff;
            }

            .career-form .form-control::-webkit-input-placeholder {
                /* Chrome/Opera/Safari */
                color: #fff;
            }

            .career-form .form-control::-moz-placeholder {
                /* Firefox 19+ */
                color: #fff;
            }

            .career-form .form-control:-ms-input-placeholder {
                /* IE 10+ */
                color: #fff;
            }

            .career-form .form-control:-moz-placeholder {
                /* Firefox 18- */
                color: #fff;
            }

            .career-form .custom-select {
                background-color: rgba(255, 255, 255, 0.2);
                border: 0;
                padding: 12px 15px;
                color: #fff;
                width: 100%;
                border-radius: 5px;
                text-align: left;
                height: auto;
                background-image: none;
            }

            .career-form .custom-select:focus {
                -webkit-box-shadow: none;
                box-shadow: none;
            }

            .career-form .select-container {
                position: relative;
            }

            .career-form .select-container:before {
                position: absolute;
                right: 15px;
                top: calc(50% - 14px);
                font-size: 18px;
                color: #ffffff;
                content: '\F2F9';
                font-family: "Material-Design-Iconic-Font";
            }

            .filter-result .job-box {
                background:#fff;
                -webkit-box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
                box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
                border-radius: 10px;
                padding: 10px 35px;
            }

            .card {
                margin-bottom: 24px;
                -webkit-box-shadow: 0 2px 3px #e4e8f0;
                box-shadow: 0 2px 3px #e4e8f0;
            }

            .card {
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid #eff0f2;
                border-radius: 1rem;
            }

            .font-size-18 {
                font-size: 18px!important;
            }

            a {
                text-decoration: none!important;
            }

            .text-muted {
                --bs-text-opacity: 1;
                color: #7f838b!important;
            }

            .font-size-20 {
                font-size: 20px!important;
            }

            .font-size-15 {
                font-size: 15px!important;
            }





        </style>

    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <br><br><br><br><br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <span class="breadcrumb"><a href="#">Apartment manager</a></span>

                    </div>
                </div>
            </div>
        </div>
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TNL8QV6"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
        <div class="page_loader"></div>
        <br><br><br>

        <!-- Properties section body start -->
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <div class="career-search mb-60">

                    <form action="#" class="career-form mb-60">
                        <div class="row">
                            <div class="col-md-6 col-lg-3 my-3">
                                <div class="input-group position-relative">
                                    <input type="text" class="form-control" placeholder="Nhập tên căn hộ" id="keywords">
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 my-3">
                                <div class="select-container">
                                    <select class="custom-select" >
                                        <option style="color: black" value="0" >Loại hình căn hộ</option>
                                        <c:forEach items="${requestScope.apartment_types_list}" var="atl">
                                            <option style="color: black" value="${atl.id}" >${atl.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 my-3">
                                <div class="select-container">
                                    <select class="custom-select">
                                        <option style="color: black"selected="0">Trạng Thái</option>
                                        <option style="color: black"value="1">Đã có người thuê</option>
                                        <option style="color: black"value="2">Chưa có người thuê</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3 my-3">
                                <button type="button" class="btn btn-lg btn-block btn-light btn-custom" id="contact-submit">
                                    Search
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row align-items-center">
                                                <div class="table-responsive px-3">
                                                    <table class="table table-striped align-middle table-nowrap">
                                                        <tbody>
                                                            <c:set var="index" value="0" />
                                                            <c:forEach items="${requestScope.apartmentList}" var="ap">
                                                                <c:set var="index" value="${index + 1}" />
                                                                <tr>


                                                                    <td>
                                                                        <div>
                                                                            <h5 class="font-size-18"><a href="ecommerce-product-detail.html" class="text-dark">${index}</a></h5>

                                                                        </div>
                                                                    </td>

                                                                    <td>
                                                                        <ul class="list-unstyled ps-0 mb-0">
                                                                            <li><i class=""></i> Apartment: ${ap.name}</li>
                                                                            <li><i class=""></i> Address : ${ap.city},${ap.district}.${ap.commune}</li>
                                                                            <li><i class=""></i> ${ap.address}| Area: ${ap.area}m2</li>
                                                                        </ul>
                                                                    </td>

                                                                    <td style="width: 180px;">
                                                                        <p>Status :</p>
                                                                        <c:if test="${ap.status_apartment == 0}">
                                                                            <p>chưa có người</p>
                                                                        </c:if>
                                                                        <c:if test="${ap.status_apartment == 1}">
                                                                            <p>Đã có người thuê</p>
                                                                        </c:if>
                                                                    </td>

                                                                    <td style="width: 220px;">
                                                                        <b><fmt:formatNumber value="${ap.price}" pattern="#,###"/> vnd</b>
                                                                    </td>

                                                                    <td>
                                                                        <div class="dropdown">
                                                                            <button class="btn btn-secondary " type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                                Action .
                                                                            </button>
                                                                            <ul class="dropdown-menu">
                                                                                <li><button class="dropdown-item" type="button"><a href="ViewApartmentDetail?apartment_id=${ap.id}">View detail</a></button></li>
                                                                                <li><button class="dropdown-item" type="button">Edit</button></li>
                                                                                <li><button class="dropdown-item" type="button">Remove</button></li>
                                                                            </ul>
                                                                        </div>
                                                                    </td>
                                                                    <td>.</td>


                                                                </tr> 
                                                            </c:forEach> 

                                                        </tbody>
                                                        <br><br><br>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    <!-- START Pagination -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-reset justify-content-center">
                            <c:if test="${pageIndex > 1}">
                                <li class="page-item">
                                    <a class="page-link" tabindex="-1" aria-disabled="true" href="AparmentListForLandlord?page_index=${pageIndex-1}">
                                        <i class="">previous</i>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach items="${requestScope.pagelist}" var="i">
                                <li class="page-item ${i == pageIndex ? 'active' : ''}"><a class="page-link" href="AparmentListForLandlord?page_index=${i}">${i}</a></li>
                                </c:forEach>
                            <li class="page-item">
                                <c:if test="${pageIndex < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" tabindex="-1" aria-disabled="true" href="AparmentListForLandlord?page_index=${pageIndex+1}">
                                        <i class="">next</i>
                                    </a>
                                </li>
                            </c:if>
                            </li>
                        </ul>
                    </nav>
                    <!-- END Pagination -->
                </div>
            </div>

        </div>
        <!-- Properties section body end -->
        <jsp:include page="Footer.jsp"/>
        <!-- Partners strat -->

        <!-- Footer end -->




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

