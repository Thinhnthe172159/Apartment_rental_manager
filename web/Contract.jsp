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
            .preview {
                display: flex;
                flex-wrap: wrap;
            }

            .preview img {
                border-radius: 15px;
                border-color: black;
                height: auto;
                max-width: 250px;
                max-height: 204px;
                margin: 10px;
                object-fit: contain;
                background: black;
            }

            .img-wrapper {
                position: relative;
                display: inline-block;
            }

            .remove-btn {
                position: absolute;
                top: 0;
                right: 0;
                background-color: red;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 1em;
                padding: 5px 10px;
                border-radius: 15%;
                transform: translate(50%, -50%);
                display: none; /* Ẩn nút ban đầu */
            }

            .error {
                color: red;
                display: none;
            }

            .error2 {
                color: red;
                display: none;
            }

            .error3 {
                color: red;
                display: none;
            }
            .error4 {
                color: red;
                display: none;
            }
            .error5 {
                color: red;
                
            }
        </style>
    </head>
    <body>
        <form action="AddContract" method="post" enctype="multipart/form-data" class="container mt-5 p-4 bg-light text-dark">
            <h2 class="text-center mb-4">Thông tin khách hàng</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="border p-4">
                        <img id="customer-avatar" src="https://www.shutterstock.com/image-vector/default-avatar-profile-icon-vector-600nw-1745180411.jpg" width="300" height="300" style="object-fit: contain" alt="Customer Avatar" class="img-fluid mb-3" />
                        <input required="" type="file" id="customer-avatar-file" name="customer-avatar-file" accept="image/*" class="form-control">
                        <div class="preview" id="customer-avatar-preview">
                            <button class="remove-btn">X</button>
                        </div>
                    </div>
                </div> 
                <div class="col-md-8">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="phone">SDT (*)</label>
                            <input id="phone" required="" type="text" name="phone" class="form-control" id="phone">
                            <span id="error-message" class="error">Số điện thoại không hợp lệ</span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Họ tên (*)</label>
                            <input required="" type="text" name="full_name" class="form-control" id="full-name">
                            <span id="error-message2" class="error2">Họ và tên không hợp lệ</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input required="" type="email" name="email" class="form-control" id="email">

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="dob">Ngày sinh</label>
                            <input required="" type="date" name="dob" class="form-control" id="birth-date">
                            <span id="error-message3" class="error3">tuổi của bạn phải đủ 18 và không quá 100.</span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="city">Tỉnh / thành phố</label>
                            <select required="" class="form-control"  id="tinh" aria-label="Default select example">
                                <option value="0">Tỉnh / Thành Phố</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="district">Quận / huyện</label>
                            <select required="" class="form-control"  id="quan" aria-label="Default select example">
                                <option value="0">Chọn quận / huyện</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="ward">Phường / xã</label>
                            <select required="" class="form-control" id="phuong">
                                <option value="0">Chọn phường / xã</option>
                            </select>
                        </div>
                    </div>
                    <input  type="hidden" name="city" id="hidden_tinh">
                    <input  type="hidden" name="district" id="hidden_quan">
                    <input  type="hidden" name="commune" id="hidden_phuong">
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <input type="text" required="" name="address" class="form-control" id="address">
                    </div>
                    <div class="form-group">
                        <label for="note">Ghi chú (mã vân tay,...)</label>
                        <textarea name="note" class="form-control" id="note"></textarea>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="id-number">CMTND / CCCD</label>
                            <input required="" type="text" name="cccd" class="form-control" id="cccd-input">
                            <span id="error-message4" class="error4">Thẻ căn cước công dân không hợp lệ</span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="id-date">Ngày cấp CMTND / CCCD</label>
                            <input id="dateInput" required="" type="date" name="cccd_receive_date" class="form-control" >
                            <span id="errorSpan" class="error5">Ngày cấp không hợp lệ</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="id-place">Nơi cấp CMTND / CCCD</label>
                        <input required="" type="text" name="office_name" class="form-control" id="id-place">
                    </div>
                    <div class="form-group">
                        <label for="residence">Tạm trú</label>
                        <input type="text" required="" name="current_living" class="form-control">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <div class="border p-4">
                                <img src="https://placehold.co/150x150?text=Ảnh+CMT+trước" width="200" height="200" style="object-fit: contain" alt="ID Front Image" class="img-fluid mb-3" />
                                <input required="" type="file" id="id-front-file" name="id-front-file" accept="image/*" class="form-control">
                                <div class="preview" id="id-front-preview">
                                    <button class="remove-btn">X</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <div class="border p-4">
                                <img src="https://placehold.co/150x150?text=Ảnh+CMT+sau" width="200" height="200" style="object-fit: contain" alt="ID Back Image" class="img-fluid mb-3" />
                                <input required="" type="file" id="id-back-file" name="id-back-file" accept="image/*" class="form-control">
                                <div class="preview" id="id-back-preview">
                                    <button class="remove-btn">X</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="text" value="${notification}" name="notification" hidden="">
            <input type="text"  value="${requestScope.apartment}" name="apartmentId" hidden="">
            <input type="text" name="landlord_id" value="${requestScope.landlord}" hidden="" >
            <div class="d-flex justify-content-between border-top pt-3">
                <div>
                    <a class="btn btn-danger" href="HomePage">Hủy</a>
                    <button class="btn btn-primary ml-2" type="submit">Lưu</button>
                </div>
            </div>
        </form>
        <script src="https://esgoo.net/scripts/jquery.js"></script>
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
                                    $("#quan").html('<option value="0">Chọn quận / huyện</option>');
                                    $("#phuong").html('<option value="0">Chọn phường / xã</option>');
                                    $.each(data_quan.data, function (key_quan, val_quan) {
                                        $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                    });
                                    // Fetch wards
                                    $("#quan").change(function (e) {
                                        var idquan = $(this).val();
                                        $("#hidden_quan").val($("#quan option:selected").text());
                                        $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                            if (data_phuong.error == 0) {
                                                $("#phuong").html('<option value="0">Chọn phường / xã</option>');
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
        <script>
            function handleFileSelect(event) {
                const input = event.target;
                const preview = document.getElementById(input.id + '-preview');
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

                    // Hiển thị nút "X" sau khi ảnh được chọn
                    removeBtn.style.display = 'inline';
                };

                reader.readAsDataURL(file);
            }

            const fileInputs = document.querySelectorAll('input[type="file"]');
            fileInputs.forEach(function (input) {
                input.addEventListener('change', handleFileSelect);
            });
        </script>
        <script src="js/validation.js"></script>
    </body>
</html>
