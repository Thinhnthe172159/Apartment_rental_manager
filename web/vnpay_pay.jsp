<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->

        <!-- Custom styles for this template -->

        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">   
        <style>
            .media {
                display: flex;
                align-items: center;
            }
            .media-body {
                flex: 1;
                text-align: right;
            }
            .media img {
                width: 24px;
                height: 24px;
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
                        <h3>ADD PROPERTIES</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="alert alert-danger d-flex justify-content-between align-items-center p-4">
            <p>Số dư tài khoản của bạn đang bằng 0 hoặc không đủ để đặt ngân sách. Để đảm bảo chiến dịch AI của bạn không bị gián đoạn, hãy nạp tiền ngay!</p>
            <button class="btn btn-danger">Nạp tiền</button>
        </div>



        <div class="container" style="font-size: 20px;">
            <div class="header clearfix">


            </div>
            <h3>Tạo mới đơn hàng</h3>
            <div class="">
                <div class="row">
                    <div class="col-md-4 mt-4">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h2 class="text-primary font-weight-bold mb-4">Thông tin khách hàng</h2>
                                <ul class="list-unstyled">
                                    <li class="media mb-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                                        </svg>
                                        <div class="media-body">Nguyen Trong Thinh HL K17</div>
                                    </li>
                                    <li class="media mb-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-phone" viewBox="0 0 16 16">
                                        <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                                        <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
                                        </svg>
                                        <div class="media-body">0345882332</div>
                                    </li>
                                    <li class="media mb-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"/>
                                        </svg>
                                        <div class="media-body">thinhnthe172159@fpt.edu.vn</div>
                                    </li>
                                    <li class="media mb-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6"/>
                                        </svg>
                                        <div class="media-body">Chưa cập nhật</div>
                                    </li>
                                </ul>
                                <div class="alert alert-secondary d-flex align-items-center p-2 mt-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
                                    <path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5"/>
                                    </svg>
                                    <span>Hotline: 0788 267 268</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card shadow-sm">
                            <form action="/vnpay_jsp/vnpayajax" id="frmCreateOrder" method="post">     
                                <h2 class="text-secondary font-weight-bold mb-4">Chọn số tiền thanh toán</h2>
                                <div class="btn-group btn-group-toggle mb-4" data-toggle="buttons">
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox" value="300000" autocomplete="off"> 300.000
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox" value="500000" autocomplete="off"> 500.000
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox"  value="1000000" autocomplete="off"> 1.000.000
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox" value="2000000" autocomplete="off"> 2.000.000
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox" value="5000000" autocomplete="off"> 5.000.000
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox" value="10000000" autocomplete="off"> 10.000.000
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="checkbox" name="options" class="custom-checkbox" value="20000000" autocomplete="off"> 20.000.000
                                    </label>
                                </div>

                                <div class="form-group">
                                    <label for="amount">Số tiền</label>

                                    <input required="" type="number" id="custom-amount" name="amount" max="100000000"  class="form-control mb-4" placeholder="50.000 vnd"  value="50000">
                                </div>
                                <h4>Chọn phương thức thanh toán</h4>
                                <div class="form-group">
                                    <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                                    <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                                    <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                                    <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                                    <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                                    <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                                    <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                                    <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                                    <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                                    <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                                </div>
                                <div class="form-group">
                                    <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                                    <input type="radio" id="language" Checked="True" name="language" value="vn">
                                    <label for="language">Tiếng việt</label><br>
                                    <input type="radio" id="language" name="language" value="en">
                                    <label for="language">Tiếng anh</label><br>

                                </div>
                                <div class="d-flex justify-content-center mt-4">
                                    <button type="submit" class="btn btn-primary">Thanh toán</button>
                                </div>

                            </form>

                        </div>
                    </div>
                </div>

            </div>
            <p>
                &nbsp;
            </p>
        </div>
        <jsp:include page="Footer.jsp" />
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>    
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                console.log("DOM Loaded");
                const radioButtons = document.querySelectorAll("input[name='options']");
                const customAmountInput = document.getElementById("custom-amount");

                // Event listener for radio buttons
                radioButtons.forEach(radio => {
                    radio.addEventListener("change", function () {
                        console.log("Radio button selected:", radio.value);
                        customAmountInput.value = formatCurrency(radio.value);
                        customAmountInput.classList.remove("is-invalid");
                    });
                });

                // Function to format currency for display
                function formatCurrency(amount) {
                    const formatted = parseInt(amount);
                    return formatted;
                }

                // Event listener for custom amount input
                customAmountInput.addEventListener("input", function () {
                    // Remove non-numeric characters
                    customAmountInput.value = customAmountInput.value.replace(/\D/g, '');

                    // Clear radio button selection when manual input is detected
                    radioButtons.forEach(radio => {
                        radio.checked = false;
                    });
                });

                // Event listener for input focus
                customAmountInput.addEventListener("focus", function () {
                    // Remove formatting for editing
                    customAmountInput.value = customAmountInput.value.replace(/\D/g, '');
                });

                // Event listener for input blur
                customAmountInput.addEventListener("blur", function () {
                    // Format currency on blur
                    const value = parseInt(customAmountInput.value, 10);
                    if (!isNaN(value) && value >= 50000) {
                        customAmountInput.value = formatCurrency(value);
                    } else {
                        customAmountInput.value = '';
                    }
                });

                // Check initial radio button state on page load
                const checkedRadio = document.querySelector("input[type='radio']:checked");
                if (checkedRadio) {
                    customAmountInput.value = formatCurrency(checkedRadio.value);
                }
            });

            // chỉ cho chọn 1 checkbox
            document.addEventListener("DOMContentLoaded", function () {
                const checkboxes = document.querySelectorAll(".custom-checkbox");

                checkboxes.forEach(checkbox => {
                    checkbox.addEventListener("change", function () {
                        // Uncheck all checkboxes except the one that was just checked
                        checkboxes.forEach(cb => {
                            if (cb !== checkbox) {
                                cb.checked = false;
                            }
                        });
                    });
                });
            });
        </script>


    </body>
</html>