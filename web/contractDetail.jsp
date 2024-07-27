<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
        </style>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <br><br>
                        <span class="breadcrumb"><a href="#">CONTRACT DETAIL</a></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5 p-4 bg-light text-dark">
            <h2 class="text-center mb-4">Thông tin khách hàng</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="border p-4">
                        <img id="customer-avatar" src="${contract.tenant_avatar}" width="300" height="300" style="object-fit: contain" alt="Customer Avatar" class="img-fluid mb-3" />

                    </div>
                </div> 
                <div class="col-md-8">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phone">SDT (*)</label>
                            <input id="phone" readonly="" type="text" value="${contract.phone}" name="phone" class="form-control" id="phone">

                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Họ tên (*)</label>
                            <input readonly="" type="text" value="${contract.full_name}" name="full-name" class="form-control" id="full-name">

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input readonly="" type="email" value="${contract.email}" name="email" class="form-control" id="email">

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="dob">Ngày sinh</label>
                            <input readonly="" type="date" name="dob" value="${contract.dob}" class="form-control" id="birth-date">

                        </div>
                        <div class="form-group col-md-6">
                            <label for="city">Tỉnh / thành phố</label>
                            <select  class="form-control"  aria-label="Default select example">
                                <option selected="" value="0">${contract.city}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="district">Quận / huyện</label>
                            <select  class="form-control" >
                                <option selected="" value="0">${contract.district}</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="ward">Phường / xã</label>
                            <select  class="form-control" >
                                <option selected="" value="0">${contract.commune}</option>
                            </select>
                        </div>
                    </div>
                    <input required="" type="hidden" name="city" id="hidden_tinh">
                    <input required="" type="hidden" name="distric" id="hidden_quan">
                    <input required="" type="hidden" name="commune" id="hidden_phuong">
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" readonly="" name="address" value="${contract.address}" class="form-control" id="address">
                    </div>
                    <div class="form-group">
                        <label for="note">Ghi chú (mã vân tay,...)</label>
                        <textarea readonly="" name="note" class="form-control" id="note">${contract.note}</textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="id-number">CMTND / CCCD</label>
                            <input readonly="" type="text" value="${contract.cccd}" name="cccd" class="form-control" id="cccd-input">

                        </div>
                        <div class="form-group col-md-6">
                            <label for="id-date">Ngày cấp CMTND / CCCD</label>
                            <input id="dateInput" readonly="" type="date" name="cccd_receive_date" value="${contract.cccd_receive_date}" class="form-control" >

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="id-place">Nơi cấp CMTND / CCCD</label>
                        <input readonly="" type="text" name="office_name" value="${contract.office_name}" class="form-control" id="id-place">
                    </div>
                    <div class="form-group">
                        <label for="residence">Tạm trú</label>
                        <input type="text" readonly="" name="current_living" value="${contract.current_living}" class="form-control">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="residence">CCCD mặt trước</label>
                            <div class="border p-4">
                                <img src="${contract.cccd_civil_card_front}" width="200" height="200" style="object-fit: contain" alt="ID Front Image" class="img-fluid mb-3" />

                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="residence">CCCD mặt sau</label>
                            <div class="border p-4">
                                <img src="${contract.cccd_civil_card_back}" width="200" height="200" style="object-fit: contain" alt="ID Back Image" class="img-fluid mb-3" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="text" value="${notification}" name="notification" hidden="">
            <input type="text" hidden="" value="${apartment}" name="apartment">
            <c:if test="${contract.status!=3}">
                <form action="ViewContractDetail" method="post" class="d-flex justify-content-between border-top pt-3">
                    <div>
                        <textarea id="id" class="form-control" name="name" rows="5" cols="300" name="message" placeholder="Nhập thông báo mà bạn muốn gửi"></textarea>
                        <c:if test="${user_Data.id == contract.tenant_id.id}">
                            <input type="text" name="contract_id" value="${contract.id}" hidden="">
                            <button class="btn btn-secondary ml-2" type="submit" name="action" value="1">yêu cầu hủy bỏ hợp đồng</button>
                        </c:if>
                        <c:if test="${user_Data.id != contract.tenant_id.id}">
                            <input type="text" name="contract_id" value="${contract.id}" hidden="">
                            <button class="btn btn-danger ml-2" type="submit" name="action" value="2">Hủy bỏ hợp đồng</button>
                            <c:if test="${contract.status != 2}">
                                <button class="btn btn-primary ml-2" type="submit" name="action" value="3">Chấp thuận hợp đồng</button>
                            </c:if>
                        </c:if>
                    </div>
                </form>
            </c:if>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
