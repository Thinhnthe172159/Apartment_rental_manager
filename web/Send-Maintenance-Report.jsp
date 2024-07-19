<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            .preview img {
                border-radius: 15px;
                border-color: black;
                height: auto;
                max-width: 350px;
                max-height: 284px;
                margin: 10px;
                object-fit: contain;
                background: black;
            }

            .img-wrapper {
                position: relative;
                display: flex;
            }

            .remove-btn {
                position: absolute;
                top: 25px;
                right: 20px;
                background-color: red;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 1em;
                padding: 5px 10px;
                border-radius: 15%;
                transform: translate(50%, -50%);
                display: inline;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <div class="container light-style flex-grow-1 container-p-y" style="padding-top: 150px">
            <h4 class="font-weight-bold py-3 mb-4">
                Send Maintenance Report
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">

                    <div class="col-md-12">
                        <div class="tab-content">

                            <!--General-->

                            <div class="tab-pane active" id="account-general">
                                <!--Avatar-->
                                <c:set var="ap" value="${requestScope.Apartment}"/>
                                <form action="SendMaintenanceReport" method="post" enctype="multipart/form-data">
                                    <input name="apartment_id" type="hidden" value="${ap.id}">
                                    <input name="tenant_id" type="hidden" value="${ap.tenant_id.id}">
                                    <input name="landlord_id" type="hidden" value="${ap.landLord_id.id}">
                                    <hr class="border-light m-0">
                                    <!--General Info-->
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="context">Context:</label>
                                            <textarea class="form-control" id="context" name="context" required></textarea>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <input type="file" id="files" name="image1" accept="image/" class="form-control">
                                                <div class="preview" id="preview">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <input type="file" id="files" name="image2" accept="image/" class="form-control">
                                                <div class="preview" id="preview">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <input type="file" id="files" name="image3" accept="image/" class="form-control">
                                                <div class="preview" id="preview">
                                                </div>
                                            </div>
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
                                    <div style="margin: 0 20px 10px" class="text-right mt-3">
                                        <button type="submit" name="button" value="general" class="btn btn-primary">Send Report</button>&nbsp;
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
            function handleFileSelect(event) {
                const input = event.target;
                const preview = input.nextElementSibling;
                const files = input.files;

                if (!files || files.length === 0) {
                    return;
                }

                const file = files[0];


                if (!file.type.startsWith('image/')) {
                    return;
                }


                const reader = new FileReader();


                reader.onload = function (e) {
                    const imgSrc = e.target.result;


                    const img = document.createElement('img');
                    img.src = imgSrc;


                    const removeBtn = document.createElement('button');
                    removeBtn.innerHTML = 'X';
                    removeBtn.className = 'remove-btn';
                    removeBtn.onclick = function () {

                        preview.innerHTML = '';
                        input.value = '';
                    };


                    const imageWrapper = document.createElement('div');
                    imageWrapper.className = 'img-wrapper';
                    imageWrapper.appendChild(img);
                    imageWrapper.appendChild(removeBtn);


                    while (preview.firstChild) {
                        preview.removeChild(preview.firstChild);
                    }


                    preview.appendChild(imageWrapper);
                };


                reader.readAsDataURL(file);
            }


            const fileInputs = document.querySelectorAll('input[type="file"]');
            fileInputs.forEach(function (input) {
                input.addEventListener('change', handleFileSelect);
            });
        </script>
    </body>
</html>
