<%-- 
    Document   : User-Profile
    Created on : May 27, 2024, 7:39:38 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #f5f5f5;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .ui-w-80 {
                width : 80px !important;
                height: auto;
            }

            .btn-default {
                border-color: rgba(24, 28, 33, 0.1);
                background  : rgba(0, 0, 0, 0);
                color       : #4E5155;
            }

            label.btn {
                margin-bottom: 0;
            }

            .btn-outline-primary {
                border-color: #26B4FF;
                background  : transparent;
                color       : #26B4FF;
            }

            .btn {
                cursor: pointer;
            }

            .text-light {
                color: #babbbc !important;
            }

            .btn-facebook {
                border-color: rgba(0, 0, 0, 0);
                background  : #3B5998;
                color       : #fff;
            }

            .btn-instagram {
                border-color: rgba(0, 0, 0, 0);
                background  : #000;
                color       : #fff;
            }

            .card {
                background-clip: padding-box;
                box-shadow     : 0 1px 4px rgba(24, 28, 33, 0.012);
            }

            .row-bordered {
                overflow: hidden;
            }

            .account-settings-fileinput {
                position  : absolute;
                visibility: hidden;
                width     : 1px;
                height    : 1px;
                opacity   : 0;
            }

            .account-settings-links .list-group-item.active {
                font-weight: bold !important;
            }

            html:not(.dark-style) .account-settings-links .list-group-item.active {
                background: transparent !important;
            }

            .account-settings-multiselect~.select2-container {
                width: 100% !important;
            }

            .light-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .light-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

            .material-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }

            .material-style .account-settings-links .list-group-item.active {
                color: #4e5155 !important;
            }

            .dark-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(255, 255, 255, 0.03) !important;
            }

            .dark-style .account-settings-links .list-group-item.active {
                color: #fff !important;
            }

            .light-style .account-settings-links .list-group-item.active {
                color: #4E5155 !important;
            }

            .light-style .account-settings-links .list-group-item {
                padding     : 0.85rem 1.5rem;
                border-color: rgba(24, 28, 33, 0.03) !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <div class="container light-style flex-grow-1 container-p-y" style="padding-top: 150px">
            <h4 class="font-weight-bold py-3 mb-4">
                Account settings
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0 d-flex flex-column">
                        <!-- List group -->
                        <div class="list-group list-group-flush account-settings-links flex-grow-1">
                            <a class="list-group-item list-group-item-action"  href="UserProfile">General</a>
                            <a class="list-group-item list-group-item-action active"  href="ChangePassword">Change password</a>
                            <a class="list-group-item list-group-item-action"  href="User-ViewProfile.jsp">Info</a>
                        </div>

                        <!-- Back to Home button -->
                        <div class="mt-auto" style="margin: 10px">
                            <a href="HomePage" class="btn btn-primary btn-block">Back to Home</a>
                        </div>
                    </div>

                    <div class="col-md-9">
                        <div class="tab-content">

                            <!--Change Password-->

                            <div class="tab-pane active" id="account-change-password">
                                <form action="ChangePassword" method="post">
                                    <input name="userid" type="hidden" value="${user_Data.getId()}">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label">Current password</label>
                                            <input type="password" name="current-password" class="form-control">
                                        </div>
                                        <c:if test="${messagecurrentpassword != null}">
                                            <div style="width: 500px" class="alert alert-danger" role="alert">
                                                ${messagecurrentpassword}
                                            </div>
                                        </c:if>
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input type="password" name="new-password" class="form-control">
                                        </div>
                                        <c:if test="${messagenewpassword != null}">
                                            <div style="width: 500px" class="alert alert-danger" role="alert">
                                                ${messagenewpassword}
                                            </div>
                                        </c:if>
                                        <div class="form-group">
                                            <label class="form-label">Repeat new password</label>
                                            <input type="password" name="re-password" class="form-control">
                                        </div>
                                        <c:if test="${messagerepassword != null}">
                                            <div style="width: 500px" class="alert alert-danger" role="alert">
                                                ${messagerepassword}
                                            </div>
                                        </c:if>
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
                                    <div style="margin: 0 10px 10px" class="text-right mt-3">
                                        <button type="submit" name="button" value="ChangePassword" class="btn btn-primary">Save changes</button>&nbsp;
                                    </div>
                                </form>
                            </div>

                            <!--User info-->

                            <div class="tab-pane fade" id="account-info">
                                <form action="UserProfile" method="post">
                                    <input name="userid" type="hidden" value="${user_Data.getId()}">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label">Bio</label>
                                            <textarea class="form-control"
                                                      rows="5">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc arcu, dignissim sit amet sollicitudin iaculis, vehicula id urna. Sed luctus urna nunc. Donec fermentum, magna sit amet rutrum pretium, turpis dolor molestie diam, ut lacinia diam risus eleifend sapien. Curabitur ac nibh nulla. Maecenas nec augue placerat, viverra tellus non, pulvinar risus.</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Birthday</label>
                                            <input type="text" class="form-control" value="May 3, 1995">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Country</label>
                                            <select class="custom-select">
                                                <option>USA</option>
                                                <option selected>Canada</option>
                                                <option>UK</option>
                                                <option>Germany</option>
                                                <option>France</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Phone</label>
                                            <input type="text" class="form-control" value="+0 (123) 456 7891">
                                        </div>
                                    </div>
                                    <div style="margin: 0 10px 10px" class="text-right mt-3">
                                        <button type="submit" name="button" value="UserInfo" class="btn btn-primary">Save changes</button>&nbsp;
                                        <button type="button" class="btn btn-default">Cancel</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div class="container">
                <div class="col-lg-8">
                    <p>Copyright © 2048 Villa Agency Co., Ltd. All rights reserved. 

                        Design: <a rel="nofollow" href="https://templatemo.com" target="_blank">TemplateMo</a> Distribution: <a href="https://themewagon.com">ThemeWagon</a></p>
                </div>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                                    function previewAvatar() {
                                                        const imageInput = document.getElementById('imageInput');
                                                        const previewImage = document.getElementById('previewImage');

                                                        if (imageInput.files && imageInput.files[0]) {
                                                            const reader = new FileReader();

                                                            reader.onload = function (e) {
                                                                previewImage.src = e.target.result;
                                                            }

                                                            reader.readAsDataURL(imageInput.files[0]);
                                                        }
                                                    }
        </script>
    </body>
</html>
