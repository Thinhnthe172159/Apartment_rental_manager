<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="container mt-4">
            <div class="row">
                <div class="col-md-4 mb-4">
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

                <div class="col-md-8 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
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
                            <input type="text" id="custom-amount" class="form-control mb-4" placeholder="0 vnđ">
                            <p class="text-danger">Sau khi nhấn thanh toán Quý khách vui lòng <span class="font-weight-bold">*không đóng trình duyệt*</span> tới khi hệ thống thông báo kết quả giao dịch. Số tiền cần nạp <span class="font-weight-bold">*tối thiểu 50.000vnđ*</span></p>

                            <h2 class="text-secondary font-weight-bold mt-4 mb-4">Chọn hình thức thanh toán</h2>
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="paymentMethod1" name="payment-method" class="custom-control-input">
                                        <label class="custom-control-label" for="paymentMethod1">Thẻ ATM/Online Banking</label>
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHGGjASksnJ4c8Edv6beDyO__mLoXBl1M-UA&s" alt="ATM/Online Banking" class="float-right">
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="paymentMethod2" name="payment-method" class="custom-control-input">
                                        <label class="custom-control-label" for="paymentMethod2">Zalo Pay</label>
                                        <img src="https://cdn.coin68.com/uploads/2019/11/zalopay.png" alt="Zalo Pay" class="float-right">
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="paymentMethod3" name="payment-method" class="custom-control-input">
                                        <label class="custom-control-label" for="paymentMethod3">Tiền mặt/Chuyển khoản</label>
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4fd1u8ScNZKQ8YcrPyNZ8si8CBAySsWIEdQ&s" alt="Cash/Bank Transfer" class="float-right">
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="paymentMethod4" name="payment-method" class="custom-control-input">
                                        <label class="custom-control-label" for="paymentMethod4">Thẻ tín dụng/Thẻ ghi nợ Quốc tế</label>
                                        <img src="https://luatvietan.vn/wp-content/uploads/2014/07/dich-vu-visa.jpg" alt="Credit/Debit Card" class="float-right">
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="paymentMethod5" name="payment-method" class="custom-control-input">
                                        <label class="custom-control-label" for="paymentMethod5">Quét mã QR (Payoo)</label>
                                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuZIMpMQAIWyClSe0xIvM4CCwGlu4A3uR2GA&s" alt="Payoo QR Code" class="float-right">
                                    </div>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="paymentMethod6" name="payment-method" class="custom-control-input">
                                        <label class="custom-control-label" for="paymentMethod6">Ví Momo</label>
                                        <img src="https://sieuthituivai.com/wp-content/uploads/2023/07/logo-momo-4.jpg" alt="Momo Wallet" class="float-right">
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary mt-4">Tiếp tục</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
