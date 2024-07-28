<%-- 
    Document   : contractList
    Created on : Jul 27, 2024, 12:53:58 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>

        <style>
            body{
                margin-top:20px;
                background-color:#eee;
            }
            .project-list-table {
                border-collapse: separate;
                border-spacing: 0 12px
            }

            .project-list-table tr {
                background-color: #fff
            }

            .table-nowrap td, .table-nowrap th {
                white-space: nowrap;
            }
            .table-borderless>:not(caption)>*>* {
                border-bottom-width: 0;
            }
            .table>:not(caption)>*>* {
                padding: 0.75rem 0.75rem;
                background-color: var(--bs-table-bg);
                border-bottom-width: 1px;
                box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
            }

            .avatar-sm {
                height: 2rem;
                width: 2rem;
            }
            .rounded-circle {
                border-radius: 50%!important;
            }
            .me-2 {
                margin-right: 0.5rem!important;
            }
            img, svg {
                vertical-align: middle;
            }

            a {
                color: #3b76e1;
                text-decoration: none;
            }

            .badge-soft-danger {
                color: #f56e6e !important;
                background-color: rgba(245,110,110,.1);
            }
            .badge-soft-success {
                color: #63ad6f !important;
                background-color: rgba(99,173,111,.1);
            }

            .badge-soft-primary {
                color: #3b76e1 !important;
                background-color: rgba(59,118,225,.1);
            }

            .badge-soft-info {
                color: #57c9eb !important;
                background-color: rgba(87,201,235,.1);
            }

            .avatar-title {
                align-items: center;
                background-color: #3b76e1;
                color: #fff;
                display: flex;
                font-weight: 500;
                height: 100%;
                justify-content: center;
                width: 100%;
            }
            .bg-soft-primary {
                background-color: rgba(59,118,225,.25)!important;
            }
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
                        <span class="breadcrumb"><a href="#">CONTRACT LIST</a></span>
                    </div>
                </div>
            </div>
        </div>

        <br><br><br><br>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="mb-3">
                        <form action="contractList">
                            <h5 class="card-title">Danh sách hợp đồng <span class="text-muted fw-normal ms-2">()</span>
                                <span><input placeholder="Nhập tên cửa người thuê" class="form-control" type="text"name="fullName"><button type="submit" class="btn btn-primary fa-searchz">Tìm kiếm</button></span><a class="btn btn-secondary" href="contractList?tenant_id=${user_Data.id}&check=1">Hợp đồng của tôi</a>
                            </h5> 
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                        <span><select id="tenantSelect" class="form-select" name="tenant_id"  onchange="navigateToPage(this)" >
                                <option>Tìm khách hàng</option>
                                <option value="contractList?tenant_id=0"><a href="contractList?tenant_id=0">tất cả khách hàng</a></option>
                                <c:forEach items="${listTenant}" var="ta">
                                    <option value="contractList?tenant_id=${ta.id}"><a href="contractList?tenant_id=${ta.id}">${ta.first_name} ${ta.last_name}</a></option>
                                </c:forEach>
                               
                            </select></span>
                    </div>
                </div>
            </div>
            <script>
                function navigateToPage(select) {
                    const value = select.value;
                    if (value) {
                        window.location.href = value;
                    }
                }
            </script>
            <div class="row">
                <div class="col-lg-12">
                    <div class="">
                        <div class="table-responsive">
                            <table class="table project-list-table table-nowrap align-middle table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col" class="ps-4" style="width: 50px;">
                                            <div class="form-check font-size-16"><input type="checkbox" class="form-check-input" id="contacusercheck" /><label class="form-check-label" for="contacusercheck"></label></div>
                                        </th>
                                        <th scope="col">Họ và tên</th>
                                        <th scope="col">Thời gian</th>
                                        <th scope="col">Hợp đồng căn hộ</th>
                                        <th scope="col">Trạng thái hợp đồng</th>
                                        <th scope="col" style="width: 200px;">xử lý</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${contractList}" var="co">


                                        <tr>
                                            <th scope="row" class="ps-4">
                                                <div class="form-check font-size-16"><input type="checkbox" class="form-check-input" id="contacusercheck1" /><label class="form-check-label" for="contacusercheck1"></label></div>
                                            </th>
                                            <td><img src="${co.tenant_id.image}" alt="" class="avatar-sm rounded-circle me-2" /><a href="#" class="text-body">${co.full_name}</a></td>
                                            <td><span class="badge badge-soft-success mb-0"><fmt:formatDate value="${co.sign_date}" pattern="dd/MM/yyyy"/></span></td>
                                            <td><a href="ViewApartmentDetail?apartment_id=${co.apartment_id.id}">${co.apartment_id.name}</a></td>
                                            <td><c:if test="${co.status == 1}">
                                                    chờ xử lý
                                                </c:if>
                                                <c:if test="${co.status == 2}">
                                                    hoàn thành
                                                </c:if>
                                                <c:if test="${co.status == 3}">
                                                    đã hủy
                                                </c:if>
                                            </td>
                                            <td>
                                                <a href="ViewContractDetail?contract_id=${co.id}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                                    <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                                                    <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                                                    </svg></a>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-0 align-items-center pb-4">
                <div class="col-sm-6">

                </div>
                <div class="col-sm-6">
                    <div class="float-sm-end">
                        <ul class="pagination mb-sm-0">
                            <!--                            <li class="page-item disabled">
                                                            <a href="#" class="page-link"><--<i class="mdi mdi-chevron-left"></i></a>
                                                        </li>-->
                            <li class="page-item active"><a href="#" class="page-link">1</a></li>

                            <!--                            <li class="page-item">
                                                            <a href="#" class="page-link">--><i class="mdi mdi-chevron-right"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
