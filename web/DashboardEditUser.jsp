<%-- 
    Document   : Dashboard
    Created on : Jun 10, 2024, 4:08:21 PM
    Author     : ASUS
--%>

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
                            </div>
                            <!--<span class="badge badge-danger text-white ml-3 rounded">3</span> notification-->
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Dashboard">
                            <i class="mdi mdi-home menu-icon"></i>
                            <span class="menu-title">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="DashboardUser">
                            <i class="mdi mdi-contacts menu-icon"></i>
                            <span class="menu-title">Users</span>
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
                            </li>
                        </ul>
                        <ul class="navbar-nav navbar-nav-right ml-lg-auto">
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
                            <h3 class="mb-0"> Hi, welcome back! <span class="pl-0 h6 pl-sm-2 text-muted d-inline-block">Your web analytics dashboard template.</span>
                            </h3>
                            <!--                            <div class="d-flex">
                                                            <button type="button" class="btn btn-sm bg-white btn-icon-text border">
                                                                <i class="mdi mdi-email btn-icon-prepend"></i> Email </button>
                                                            <button type="button" class="btn btn-sm bg-white btn-icon-text border ml-3">
                                                                <i class="mdi mdi-printer btn-icon-prepend"></i> Print </button>
                                                            <button type="button" class="btn btn-sm ml-3 btn-success"> Add User </button>
                                                        </div>-->
                        </div>
                        <div class="row">
                            <div class="col-12 grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Edit user</h4>
                                        <!--<p class="card-description">Basic form elements</p>-->
                                        <form action="EditUser" method="post" class="forms-sample">
                                            <input hidden readonly value="${specific_user_data.id}" type="text" name="userId">
                                            <div class="form-group">
                                                <label for="first_name">First Name</label><br>
                                                <input type="text" value="${specific_user_data.first_name}" name="first-name" class="form-control-lg" id="first_name" placeholder="First Name" required=""/>
                                                <c:if test="${messagefirstname != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messagefirstname}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="last_name">Last Name</label><br>
                                                <input type="text" value="${specific_user_data.last_name}" name="last-name" class="form-control-lg" id="last_name" placeholder="Last Name" required=""/>
                                                <c:if test="${messagelastname != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messagelastname}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email address</label><br>
                                                <input type="email" value="${specific_user_data.email}"name="email" class="form-control-lg" id="email" placeholder="Email" required=""/>
                                                <c:if test="${messageemail != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messageemail}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="password">Password</label><br>
                                                <input type="password" value="${specific_user_data.password}" name="password" class="form-control-lg" id="password" placeholder="Password" required=""/>
                                                <c:if test="${messagepassword != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messagepassword}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="re-password">Password</label><br>
                                                <input type="password" value="${specific_user_data.password}" name="re-password" class="form-control-lg" id="password" placeholder="Password" required=""/>
                                                <c:if test="${messagerepassword != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messagerepassword}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="role">Role</label><br>
                                                <select class="form-control-lg" id="role" name="role" required="">
                                                    <c:forEach items="${role_List}" var="r">
                                                        <c:choose>
                                                            <c:when test="${r.getId() eq specific_user_data.getRole_id().getId()}">
                                                                <option selected value="${r.getId()}">${r.getRole_name()}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${r.getId()}">${r.getRole_name()}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <c:if test="${messagerole != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messagerole}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--                                            <div class="form-group">
                                                                                            <label>Membership</label>
                                                                                            <div class="col-sm-4">
                                                                                                <div class="form-check">
                                                                                                    <label class="form-check-label">
                                                                                                        <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios1" value="" checked /> Free </label>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-sm-5">
                                                                                                <div class="form-check">
                                                                                                    <label class="form-check-label">
                                                                                                        <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios2" value="option2" /> Professional </label>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                            <!--                                            <div class="form-group">
                                                                                            <label>File upload</label>
                                                                                            <input type="file" name="img[]" class="file-upload-default" />
                                                                                            <div class="input-group col-xs-12">
                                                                                                <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image" />
                                                                                                <span class="input-group-append">
                                                                                                    <button class="file-upload-browse btn btn-primary" type="button"> Upload </button>
                                                                                                </span>
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="form-group">
                                                <label for="dob">Date of Birth</label><br>
                                                <input type="date" value="${specific_user_data.dob}" name="dob" class="form-control-lg" id="dob" required=""/>
                                                <c:if test="${messageDob != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messageDob}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label for="amount">Amount</label><br>
                                                <input type="number" step="any" value="${specific_user_data.money}" name="money" class="form-control-lg" id="amount" required=""/>
                                                <c:if test="${messageamount != null}">
                                                    <div style="width: 500px" class="alert alert-danger" role="alert">
                                                        ${messageamount}
                                                    </div>
                                                </c:if>
                                            </div>
                                            <!--                                            <div class="form-group">
                                                                                            <label for="exampleTextarea1">Textarea</label>
                                                                                            <textarea
                                                                                                class="form-control"
                                                                                                id="exampleTextarea1"
                                                                                                rows="4"
                                                                                                ></textarea>
                                                                                        </div>-->
                                            <button type="submit" class="btn btn-primary mr-2"> Submit </button>
                                            <a href="DashboardUser" class="btn btn-light">Cancel</a>
                                        </form>
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
