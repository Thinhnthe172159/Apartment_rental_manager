<%-- 
    Document   : Dashboard
    Created on : Jun 10, 2024, 4:08:21 PM
    Author     : ASUS
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Easy Rental</title>
        <link rel="stylesheet" href="dashboard/assets/vendors/mdi/css/materialdesignicons.min.css" />
        <link rel="stylesheet" href="dashboard/assets/vendors/flag-icon-css/css/flag-icon.min.css" />
        <link rel="stylesheet" href="dashboard/assets/vendors/css/vendor.bundle.base.css" />
        <link rel="stylesheet" href="dashboard/assets/vendors/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="dashboard/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />
        <link rel="stylesheet" href="dashboard/assets/css/style.css" />
        <link rel="shortcut icon" href="img/logoWeb.png" />
        <style>
            .alert-postponed {
                background-color: orange;
                color: maroon;
            }
        </style>
    </head>
    <body>
        <div class="container-scroller">
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <div class="text-center sidebar-brand-wrapper d-flex align-items-center">
                    <a class="sidebar-brand brand-logo" href="HomePage"><img src="img/Logo.png" alt="logo" /></a>
                    <a class="sidebar-brand brand-logo-mini pl-4 pt-3" href="HomePage"><img src="dashboard/assets/images/logo-mini.svg" alt="logo" /></a>
                </div>
                <ul class="nav">
                    <li style="margin-top: 35px;" class="nav-item nav-profile">
                        <a href="#" class="nav-link">
                            <div class="nav-profile-image">
                                <img src="img/User/${user_Data.getImage()}" 
                                     alt="Error" 
                                     class="d-block ui-w-80" 
                                     id="previewImage"
                                     onerror="this.onerror=null; this.src='${user_Data.getImage()}';"/>
                                <span class="login-status online"></span>
                                <!--change to offline or busy as needed-->
                            </div>
                            <div class="nav-profile-text d-flex flex-column pr-3">
                                <span class="font-weight-medium mb-2">${user_Data.getFirst_name()} ${user_Data.getLast_name()}</span>
                                <span class="font-weight-normal">${user_Data.getMoney()}$</span>
                            </div>
                            <!--<span class="badge badge-danger text-white ml-3 rounded">3</span> notification-->
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LandLordDashboard">
                            <i class="mdi mdi-home menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LandLordDashboardMaintenanceReports">
                            <i class="mdi mdi-contacts menu-icon"></i>
                            <span class="menu-title">Maintenance Reports</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DashboardChart">
                            <i class="mdi mdi-chart-bar menu-icon"></i>
                            <span class="menu-title">Charts</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DashboardTable">
                            <i class="mdi mdi-table-large menu-icon"></i>
                            <span class="menu-title">Tables</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <div class="container-fluid page-body-wrapper">
                <div id="theme-settings" class="settings-panel">
                    <i class="settings-close mdi mdi-close"></i>
                    <p class="settings-heading">SIDEBAR SKINS</p>
                    <div class="sidebar-bg-options selected" id="sidebar-default-theme">
                        <div class="img-ss rounded-circle bg-light border mr-3"></div> Default
                    </div>
                    <div class="sidebar-bg-options" id="sidebar-dark-theme">
                        <div class="img-ss rounded-circle bg-dark border mr-3"></div> Dark
                    </div>
                    <p class="settings-heading mt-2">HEADER SKINS</p>
                    <div class="color-tiles mx-0 px-4">
                        <div class="tiles light"></div>
                        <div class="tiles dark"></div>
                    </div>
                </div>
                <nav class="navbar col-lg-12 col-12 p-lg-0 fixed-top d-flex flex-row">
                    <div class="navbar-menu-wrapper d-flex align-items-stretch justify-content-between">
                        <a class="navbar-brand brand-logo-mini align-self-center d-lg-none" href="Dashboard.jsp"><img src="dashboard/assets/images/logo-mini.svg" alt="logo" /></a>
                        <button class="navbar-toggler navbar-toggler align-self-center mr-2" type="button" data-toggle="minimize">
                            <i class="mdi mdi-menu"></i>
                        </button>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="count count-varient1">7</span>
                                </a>
                                <div class="dropdown-menu navbar-dropdown navbar-dropdown-large preview-list" aria-labelledby="notificationDropdown">
                                    <h6 class="p-3 mb-0">Notifications</h6>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <img src="dashboard/assets/images/faces/face4.jpg" alt="" class="profile-pic" />
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="mb-0"> Dany Miles <span class="text-small text-muted">commented on your photo</span>
                                            </p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <img src="dashboard/assets/images/faces/face3.jpg" alt="" class="profile-pic" />
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="mb-0"> James <span class="text-small text-muted">posted a photo on your wall</span>
                                            </p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-thumbnail">
                                            <img src="dashboard/assets/images/faces/face2.jpg" alt="" class="profile-pic" />
                                        </div>
                                        <div class="preview-item-content">
                                            <p class="mb-0"> Alex <span class="text-small text-muted">just mentioned you in his post</span>
                                            </p>
                                        </div>
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <p class="p-3 mb-0">View all activities</p>
                                </div>
                            </li>
                            <li class="nav-item dropdown d-none d-sm-flex">
                                <a class="nav-link count-indicator dropdown-toggle" id="messageDropdown" href="#" data-toggle="dropdown">
                                    <i class="mdi mdi-email-outline"></i>
                                    <span class="count count-varient2">5</span>
                                </a>
                                <div class="dropdown-menu navbar-dropdown navbar-dropdown-large preview-list" aria-labelledby="messageDropdown">
                                    <h6 class="p-3 mb-0">Messages</h6>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-item-content flex-grow">
                                            <span class="badge badge-pill badge-success">Request</span>
                                            <p class="text-small text-muted ellipsis mb-0"> Suport needed for user123 </p>
                                        </div>
                                        <p class="text-small text-muted align-self-start"> 4:10 PM </p>
                                    </a>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-item-content flex-grow">
                                            <span class="badge badge-pill badge-warning">Invoices</span>
                                            <p class="text-small text-muted ellipsis mb-0"> Invoice for order is mailed </p>
                                        </div>
                                        <p class="text-small text-muted align-self-start"> 4:10 PM </p>
                                    </a>
                                    <a class="dropdown-item preview-item">
                                        <div class="preview-item-content flex-grow">
                                            <span class="badge badge-pill badge-danger">Projects</span>
                                            <p class="text-small text-muted ellipsis mb-0"> New project will start tomorrow </p>
                                        </div>
                                        <p class="text-small text-muted align-self-start"> 4:10 PM </p>
                                    </a>
                                    <h6 class="p-3 mb-0">See all activity</h6>
                                </div>
                            </li>
                            <li class="nav-item nav-search border-0 ml-1 ml-md-3 ml-lg-5 d-none d-md-flex">
                                <!--                                <form class="nav-link form-inline mt-2 mt-md-0">
                                                                    <div class="input-group">
                                                                        <input type="text" class="form-control" placeholder="Search" />
                                                                        <div class="input-group-append">
                                                                            <span class="input-group-text">
                                                                                <i class="mdi mdi-magnify"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </form>-->
                            </li>
                        </ul>
                        <ul class="navbar-nav navbar-nav-right ml-lg-auto">
                            <!--                            <li class="nav-item dropdown d-none d-xl-flex border-0">
                                                            <a class="nav-link dropdown-toggle" id="languageDropdown" href="#" data-toggle="dropdown">
                                                                <i class="mdi mdi-earth"></i> English </a>
                                                            <div class="dropdown-menu navbar-dropdown" aria-labelledby="languageDropdown">
                                                                <a class="dropdown-item" href="#"> French </a>
                                                                <a class="dropdown-item" href="#"> Spain </a>
                                                                <a class="dropdown-item" href="#"> Latin </a>
                                                                <a class="dropdown-item" href="#"> Japanese </a>
                                                            </div>
                                                        </li>-->
                            <li class="nav-item nav-profile dropdown border-0">
                                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown">
                                    <img src="img/User/${user_Data.getImage()}" 
                                         alt="Error" 
                                         class="nav-profile-img mr-2" 
                                         id="previewImage"
                                         onerror="this.onerror=null; this.src='${user_Data.getImage()}';"/>
                                    <span class="profile-name">${user_Data.getFirst_name()} ${user_Data.getLast_name()}</span>
                                </a>
                                <div class="dropdown-menu navbar-dropdown w-100" aria-labelledby="profileDropdown">
                                    <!--                                    <a class="dropdown-item" href="#">
                                                                            <i class="mdi mdi-cached mr-2 text-success"></i> Activity Log </a>-->
                                    <a class="dropdown-item" href="Logout">
                                        <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
                                </div>
                            </li>
                        </ul>
                        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                            <span class="mdi mdi-menu"></span>
                        </button>
                    </div>
                </nav>
                <div class="main-panel">
                    <div class="content-wrapper pb-0">
                        <div class="page-header flex-wrap">
                            <h3 class="mb-0"> Hi, welcome back! <span class="pl-0 h6 pl-sm-2 text-muted d-inline-block"></span>
                            </h3>
                            <div class="d-flex">
                                <!--                                <button type="button" class="btn btn-sm bg-white btn-icon-text border">
                                                                    <i class="mdi mdi-email btn-icon-prepend"></i> Email </button>
                                                                <button type="button" class="btn btn-sm bg-white btn-icon-text border ml-3">
                                                                    <i class="mdi mdi-printer btn-icon-prepend"></i> Print </button>-->
                                <!--<a href="DashboardAddUser" class="btn btn-sm ml-3 btn-success"><span style="color: white">Add User</span></a>-->
                            </div>
                        </div>
                        <c:if test="${messagesuccess != null}">
                            <div style="width: 100%" class="alert alert-success" role="alert">
                                ${messagesuccess}
                            </div>
                        </c:if>
                        <c:if test="${messagedanger != null}">
                            <div style="width: 100%" class="alert alert-danger" role="alert">
                                ${messagedanger}
                            </div>
                        </c:if>
                        <c:if test="${messagepostponed != null}">
                            <div style="width: 100%" class="alert alert-postponed" role="alert">
                                ${messagepostponed}
                            </div>
                        </c:if>
                        <div class="row">
                            <div class="col-xl-12 col-sm-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body px-0 overflow-auto">
                                        <h4 class="card-title pl-4">Maintance Reports</h4>
                                        <div class="table-responsive">
                                            <table class="table table-hover">
                                                <thead class="bg-light">
                                                    <tr>
                                                        <th>Tenant Name</th>
                                                        <th>Apartment Name</th>
                                                        <th>Status</th>
                                                        <th>Date Posted</th>
                                                        <th></th>
                                                        <!--<th></th>-->
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${report_List}" var="r">
                                                        <tr>
                                                            <td>
                                                                <div class="d-flex align-items-center">
                                                                    <img src="img/User/${r.tenantId.image}"
                                                                         alt="Error"
                                                                         onerror="this.onerror=null; this.src='${r.tenantId.image}';"/>
                                                                    <div class="table-user-name ml-3">
                                                                        <p class="mb-0 font-weight-medium"> ${r.tenantId.first_name} ${r.tenantId.last_name} </p>
                                                                    </div>
                                                                </div>
                                                            </td>
<!--                                                            <td>${r.tenantId.first_name} ${r.tenantId.last_name}</td>-->
                                                            <td>${r.apartmentId.name}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${r.status == '1'}">Pending</c:when>
                                                                    <c:when test="${r.status == '2'}">In-progress</c:when>
                                                                    <c:when test="${r.status == '3'}">Done</c:when>
                                                                    <c:otherwise>Unknown</c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${r.datePost}</td>
                                                            <!--                                                            <td>
                                                            <c:choose>
                                                                <c:when test="${u.status eq 0}">
                                                                    <a class="btn btn-sm btn-danger" href="BlockUser?userId=${u.id}"><i class="mdi mdi-block-helper"></i></a>
                                                                </c:when>
                                                                <c:when test="${u.status eq 1}">
                                                                <a class="btn btn-sm btn-success" href="BlockUser?userId=${u.id}"><i class="mdi mdi-check"></i></a>
                                                                </c:when>
                                                            </c:choose>
                                                    </td>-->
                                                            <td><a href="LandLordDashboardEditMaintenanceReport?rmId=${r.id}" class="btn btn-sm btn-primary"><i class=" mdi mdi-pencil-box-outline "></i></a></td>
                                                            <!--<td><a href="ViewUser?userId=${u.id}" class="btn btn-sm btn-primary"><i class=" mdi mdi-eye "></i></a></td>-->
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer class="footer">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
                                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard template</a> from Bootstrapdash.com</span>
                            </div>
                        </footer>
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->
            <!-- plugins:js -->
            <script src="dashboard/assets/vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <script src="dashboard/assets/vendors/chart.js/Chart.min.js"></script>
            <script src="dashboard/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
            <script src="dashboard/assets/vendors/flot/jquery.flot.js"></script>
            <script src="dashboard/assets/vendors/flot/jquery.flot.resize.js"></script>
            <script src="dashboard/assets/vendors/flot/jquery.flot.categories.js"></script>
            <script src="dashboard/assets/vendors/flot/jquery.flot.fillbetween.js"></script>
            <script src="dashboard/assets/vendors/flot/jquery.flot.stack.js"></script>
            <script src="dashboard/assets/vendors/flot/jquery.flot.pie.js"></script>
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="dashboard/assets/js/off-canvas.js"></script>
            <script src="dashboard/assets/js/hoverable-collapse.js"></script>
            <script src="dashboard/assets/js/misc.js"></script>
            <!-- endinject -->
            <!-- Custom js for this page -->
            <script src="dashboard/assets/js/dashboard.js"></script>
            <!-- End custom js for this page -->
    </body>
</html>
