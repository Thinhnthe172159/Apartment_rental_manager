<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm thông tin căn hộ</title>
        <link rel="icon" href="img/logoWeb.png" type="image/x-icon">
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

            @media (max-width: 767.98px) {
                .border-sm-start-none {
                    border-left: none !important;
                }
            }
        </style>
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
                        <h3>LIST APARTMENT POST MANAGERMENT</h3>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        <section class="row" style="background-color: #eee;">
            <div class="col-md-9">


                <div class="container py-5">
                    <c:if test="${page_index == 1}">
                        <c:set var="indexPage" value="0"/>
                    </c:if>
                    <c:if test="${page_index > 1}">
                        <c:set var="indexPage" value="${(page_index-1)*6}"/>
                    </c:if>

                    <c:forEach items="${requestScope.apartmentPostList}" var="apl">
                        <c:set var="indexPage" value="${indexPage+1}"/>
                        <div class="row justify-content-center mb-4">
                            <div class="">
                                <div class="card shadow-0 border rounded-3">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                    ${indexPage}<img height="200" width="300" style="object-fit: cover;" src="uploads/${apl.first_image}" class="w-100" />
                                                    <a href="#!">
                                                        <div class="hover-overlay">
                                                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-xl-6">
                                                <h5 class="col-md-4">${apl.apartment_type.name} | <h5  class="col-md-4 text-center" style=" color:white;border-radius: 15px; <c:if test="${apl.payment_id.id == 1}" >
                                                                                                       background: black;
                                                        </c:if>
                                                        <c:if test="${apl.payment_id.id == 2}" >
                                                            background: blue;
                                                        </c:if>
                                                        <c:if test="${apl.payment_id.id == 3}" >
                                                            background: #99cc00;
                                                        </c:if>
                                                        <c:if test="${apl.payment_id.id == 4}" >
                                                            background: red;
                                                        </c:if>">Vip ${apl.payment_id.name}</h5></h5>
                                                <div class="d-flex flex-row">
                                                    <span>Diện tích: ${apl.area}m2</span>&nbsp;&nbsp;
                                                    <span style="background: blueviolet; color: white; border-radius: 15px; box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;">
                                                        &nbsp;&nbsp;Trạng Thái:
                                                        <c:if test="${apl.post_status == 1}">Lưu Nháp</c:if>
                                                        <c:if test="${apl.post_status == 2}">Chờ Duyệt</c:if>
                                                        <c:if test="${apl.post_status == 3}">Xuất Bản</c:if>        
                                                        <c:if test="${apl.post_status == 4}">Hết Hạn</c:if>
                                                        <c:if test="${apl.post_status == 5}">Đã Thuê</c:if>
                                                            &nbsp;&nbsp;
                                                        </span>
                                                    </div>
                                                    <div class="mt-1 mb-0 text-muted small">
                                                        <span>${apl.city}</span>
                                                    <span class="text-primary"> • </span>
                                                    <span>${apl.district}</span>
                                                    <span class="text-primary"> • </span>
                                                    <span>${apl.commune}</span>
                                                    <span class="text-primary"> • </span>
                                                    <span>${apl.apartment_id.address}<br /></span>
                                                </div>
                                                <h3 style="font-size: 20px;" class="text-truncate mb-4 mb-md-0">
                                                    ${apl.title}
                                                </h3>
                                                <br>
                                                <h6>
                                                    start at: ${apl.post_start}/ end: ${apl.post_end}<br> limitation: ${apl.week} week<br> paid for post: <fmt:formatNumber value="${apl.paid_for_post}" pattern="#,###"/>d
                                                </h6>
                                            </div>
                                            <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                                <div class="d-flex flex-row align-items-center mb-1">
                                                    <h4 class="mb-1 me-1"><fmt:formatNumber value="${apl.price}" pattern="#,###"/> vnd</h4>
                                                </div>
                                                <form class="d-flex flex-column mt-4" id="deleteForm-${apl.id}" action="ApartmentPostForLandlord?delete_id=${apl.id}" method="post">
                                                    <a style="color: white" href="ApartmentDetail?Apartment_id=${apl.apartment_id.id}&apartment_post_id=${apl.id}" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-sm" type="button">Preview</a>

                                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-primary btn-sm mt-2" type="button" onclick="confirmDeletion('deleteForm-${apl.id}')">
                                                        Remove
                                                    </button>

                                                    <a data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-sm mt-2" style="color: white;" href="UpdateApartmentPost?post_id=${apl.id}">
                                                        Update
                                                    </a>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="pagination-box text-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${page_index > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="ApartmentPostForLandlord?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${page_index-1}&status=${status}&post_type=${post_type}">Prev</a>
                                    </li>
                                </c:if>
                                <c:forEach items="${pageList}" var="i">
                                    <li class="page-item">
                                        <a href="ApartmentPostForLandlord?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${i}&status=${status}&post_type=${post_type}" class="page-link ${i == page_index ? 'active' : ''}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${page_index < pageList.size()}">
                                    <li class="page-item">
                                        <a class="page-link" href="ApartmentPostForLandlord?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${page_index+1}&status=${status}&post_type=${post_type}">Next</a>
                                    </li>
                                </c:if>
                            </ul>


                        </nav>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="z-index: 999;position: sticky">
                <!-- Advanced search start -->
                <div class="sidebar-widget advanced-search">
                    <div class="main-title-4">
                        <h1>Advanced  Search</h1>
                    </div>
                    <form action="ApartmentPostForLandlord" method="GET">
                        <div class="form-group">
                            <select class="form-select" name="apartmentType" aria-label="Default select example">
                                <option value="0">Loại căn hộ</option>
                                <c:forEach items="${requestScope.apartment_types_list}" var="atl">
                                    <option value="${atl.id}">${atl.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <select  class="form-select" id="tinh" aria-label="Default select example">
                                <option value="0">Tỉnh Thành</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select  class="form-select" id="quan" aria-label="Default select example">
                                <option value="0">Quận huyện</option><hr>
                            </select>
                        </div>
                        <div class="form-group">
                            <select    class="form-select " id="phuong" aria-label="Default select example">
                                <option value="0">Xã Phường</option>
                                <hr>
                            </select>
                        </div>
                        <div class="form-group">
                            <select    class="form-select" name="status"  aria-label="Default select example">
                                <option value="0">Trạng Thái Bài Đăng</option>
                                <option value="1">Lưu Nháp</option>
                                <option value="2">Chờ Duyệt</option>
                                <option value="3">Xuất Bản</option>
                                <option value="4">Hết Hạn</option>
                                <option value="5">Căn Hộ Đã Cho Thuê</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select    class="form-select" name="post_type"  aria-label="Default select example">
                                <option value="0">Chọn loại bài đăng</option>
                                <c:forEach items="${requestScope.payment_methods_list}" var="pml">
                                    <option value="${pml.id}">VIP ${pml.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" name="tinh" id="hidden_tinh">
                        <input type="hidden" name="quan" id="hidden_quan">
                        <input type="hidden" name="phuong" id="hidden_phuong">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="form-group">
                                    <select class="form-select" name="bedroom">
                                        <option value="0">Số phòng ngủ</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="form-group">
                                    <select class="form-select" name="type">
                                        <option value="0">Sắp xếp giá</option>
                                        <option value="1">Tăng dần</option>
                                        <option value="2">Giảm dần</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <style>
                            .range-slider {
                                margin: 20px 0;
                            }

                            .ui-slider {
                                width: 100%;
                            }

                            .clearfix::after {
                                content: "";
                                display: table;
                                clear: both;
                            }
                        </style>

                        <div class="range-slider">
                            <label>Diện tích</label>
                            <div id="ArearangeSlider" data-min="0" data-max="500" data-unit="m2" class="range-slider-ui ui-slider"></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input id="areaUp" class="selectpicker search-fields" type="number" name="areaUp" placeholder="0">
                            </div>
                            <div class="col-md-6 form-group">
                                <input id="areaDown" class="selectpicker search-fields" type="number" name="areaDown" placeholder="100">
                            </div>
                        </div>

                        <!-- Include jQuery and jQuery UI -->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
                        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

                        <script>
                                                        $(document).ready(function () {
                                                            var $slider = $("#ArearangeSlider");
                                                            var $minInput = $("#areaUp");
                                                            var $maxInput = $("#areaDown");

                                                            $slider.slider({
                                                                range: true,
                                                                min: 0,
                                                                max: 500,
                                                                values: [0, 500],
                                                                slide: function (event, ui) {
                                                                    $minInput.val(ui.values[0]);
                                                                    $maxInput.val(ui.values[1]);
                                                                }
                                                            });

                                                            $minInput.val($slider.slider("values", 0));
                                                            $maxInput.val($slider.slider("values", 1));

                                                            function updateSlider() {
                                                                var min = parseInt($minInput.val(), 10);
                                                                var max = parseInt($maxInput.val(), 10);

                                                                if (min > max) {
                                                                    min = max;
                                                                    $minInput.val(min);
                                                                }
                                                                if (max < min) {
                                                                    max = min;
                                                                    $maxInput.val(max);
                                                                }

                                                                $slider.slider("values", 0, min);
                                                                $slider.slider("values", 1, max);
                                                            }

                                                            $minInput.on("input", function () {
                                                                clearTimeout(this.delay);
                                                                this.delay = setTimeout(function () {
                                                                    updateSlider();
                                                                }.bind(this), 1500);
                                                            });

                                                            $maxInput.on("input", function () {
                                                                clearTimeout(this.delay);
                                                                this.delay = setTimeout(function () {
                                                                    updateSlider();
                                                                }.bind(this), 1500);
                                                            });
                                                        });
                        </script>



                        <div class="range-slider">
                            <label>Giá tiền khoảng</label>
                            <div id="rangeSlider" data-min="0" data-max="100" data-unit="triệu vnd" class="range-slider-ui ui-slider"></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input id="priceUp" class="selectpicker search-fields" type="number" name="moneyUp" placeholder="0">
                            </div>
                            <div class="col-md-6 form-group">
                                <input id="priceDown" class="selectpicker search-fields" type="number" name="moneyDown" placeholder="100">
                            </div>
                        </div>
                        <!-- Include jQuery and jQuery UI -->
                        <!-- Include jQuery and jQuery UI -->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
                        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

                        <script>
                                                        $(document).ready(function () {
                                                            var $slider = $("#rangeSlider");
                                                            var $minInput = $("#priceUp");
                                                            var $maxInput = $("#priceDown");

                                                            $slider.slider({
                                                                range: true,
                                                                min: 0,
                                                                max: 100,
                                                                values: [0, 100],
                                                                slide: function (event, ui) {
                                                                    $minInput.val(ui.values[0]);
                                                                    $maxInput.val(ui.values[1]);
                                                                }
                                                            });

                                                            $minInput.val($slider.slider("values", 0));
                                                            $maxInput.val($slider.slider("values", 1));

                                                            function updateSlider() {
                                                                var min = parseInt($minInput.val(), 10);
                                                                var max = parseInt($maxInput.val(), 10);

                                                                if (min > max) {
                                                                    min = max;
                                                                    $minInput.val(min);
                                                                }
                                                                if (max < min) {
                                                                    max = min;
                                                                    $maxInput.val(max);
                                                                }

                                                                $slider.slider("values", 0, min);
                                                                $slider.slider("values", 1, max);
                                                            }

                                                            $minInput.on("input", function () {
                                                                clearTimeout(this.delay);
                                                                this.delay = setTimeout(function () {
                                                                    updateSlider();
                                                                }.bind(this), 1500);
                                                            });

                                                            $maxInput.on("input", function () {
                                                                clearTimeout(this.delay);
                                                                this.delay = setTimeout(function () {
                                                                    updateSlider();
                                                                }.bind(this), 1500);
                                                            });
                                                        });
                        </script>
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                        <script>
                                                        function confirmDeletion(formId) {
                                                            Swal.fire({
                                                                title: "Are you sure?",
                                                                text: "You won't be able to revert this!",
                                                                icon: "warning",
                                                                showCancelButton: true,
                                                                confirmButtonColor: "#3085d6",
                                                                cancelButtonColor: "#d33",
                                                                confirmButtonText: "Yes, delete it!"
                                                            }).then((result) => {
                                                                if (result.isConfirmed) {
                                                                    Swal.fire({
                                                                        title: "Deleted!",
                                                                        text: "Your file has been deleted.",
                                                                        icon: "success"
                                                                    });
                                                                    document.getElementById(formId).submit();
                                                                }
                                                            });
                                                        }
                        </script>

                        <script>
                            var message = '${requestScope.message}';
                            if (message) {
                                if (message === 'b') {
                                    Swal.fire({
                                        icon: "error",
                                        title: "Oops...",
                                        text: "Tài khoản của bạn không đủ để chi cho bài đăng này, Vui lòng nạp thêm tiền vào tài khoản! Bài đăng của bạn sẽ được lưu nháp lại",
                                    });
                                } else if (message === 'a') {
                                    Swal.fire({
                                        title: "Done!",
                                        text: "Đăng bài thành công, bài đăng của bạn sẽ được công khai trong vài phút",
                                        icon: "success"
                                    });
                                } else if (message === 'c') {
                                    Swal.fire({
                                        title: "Done!",
                                        text: "Lưu nháp bài đăng thành công",
                                        icon: "success"
                                    });
                                } else if (message === 'd') {
                                    Swal.fire({
                                        title: "Done!",
                                        text: "Lưu nháp bài đăng thành công",
                                        icon: "success"
                                    });
                                }
                            }
                        </script>


                        <div class="form-group mb-0">
                            <button type="submit" class="button-md button-theme btn-3 w-100">Search</button>
                        </div>
                    </form>
                </div>
                <!-- Advanced search end -->


            </div>

        </div>
    </section>  


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

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <!-- Custom javascript -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <br><br>
    <jsp:include page="Footer.jsp"/>
</body>
</html>