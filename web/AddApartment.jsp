<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm thông tin căn hộ</title>
        <link rel="icon" href="img/logoWeb.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"/>
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <style>


            .navbar {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000; /* Đảm bảo navbar hiển thị trên cùng */
            }
            .error {
                color: red;
                font-size: 0.9em;
            }
            #map{
                z-index: 2;
            }

            .preview {
                display: flex;
                flex-wrap: wrap;
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
                display: inline;
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
        <br><br><br><br><br><br>
        <form id="apartmentForm" action="addApartment" method="post" enctype="multipart/form-data" >
            <div class="container">
                <div class="row">
                    <script src="https://esgoo.net/scripts/jquery.js"></script>
                    <style type="text/css">
                        .css_select_div {
                            text-align: center;
                        }
                        .css_select {
                            display: inline-table;
                            width: 25%;
                            padding: 5px;
                            margin: 5px 2%;
                            border: solid 1px #686868;
                            border-radius: 5px;
                        }
                    </style>
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

                    <table class="col-md-7">
                        <thead>
                            <tr>
                                <th class="col-md-4"><h2 style="color: royalblue">I. Thông tin cơ bản</h2></th>
                                <th class="col-md-5"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tên căn hộ</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required placeholder="Điền tên căn hộ" type="text" name="name_apartment" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="name_apartment_error"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Loại căn hộ</td>
                                <td>
                                    <select required class="form-select" name="apartment_type" aria-label="Default select example">
                                        <option value="">Chọn loại hình căn hộ</option>
                                        <c:forEach items="${requestScope.apartment_types_list}" var="at">
                                            <option value="${at.id}">${at.name}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="error" id="apartment_type_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Tỉnh/Thành phố</td>
                                <td>      
                                    <select required class="form-select" id="tinh" aria-label="Default select example">
                                        <option value="0">Tỉnh Thành</option>
                                    </select>
                                    <div class="error" id="tinh_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Quận/Huyện</td>
                                <td>
                                    <select required class="form-select" id="quan" aria-label="Default select example">
                                        <option value="0">Quận huyện</option>
                                    </select>
                                    <div class="error" id="quan_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Xã/Phường</td>
                                <td>
                                    <select required class="form-select" id="phuong" aria-label="Default select example">
                                        <option value="0">Phường xã</option>
                                    </select>
                                    <div class="error" id="phuong_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Địa chỉ cụ thể</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required placeholder="Điền địa chỉ cụ thể như số nhà, ngõ, đường,..." type="text" name="address" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="address_error"></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="col-md-5">
                        <style>
                            #map {
                                width: 100%;
                                height: 500px;
                            }
                        </style>
                        <div id="map"></div>
                    </div>
                    <input type="hidden" name="tinh" id="hidden_tinh" >
                    <input type="hidden" name="quan" id="hidden_quan">
                    <input type="hidden" name="phuong" id="hidden_phuong">
                </div>
                <hr>
                <br>
                <div class="row">
                    <table border="0" class="col-md-12">
                        <thead>
                            <tr>
                                <th class="col-md-3"><h2 style="color: royalblue">II. Thông tin mô tả</h2></th>
                                <th class="col-md-4"></th>
                                <th class="col-md-2"></th>
                                <th class="col-md-3"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Giá tiền (VNĐ)</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input id="numberInput" required type="number" min="1000" max="100000000" name="price" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="price_error"></div>
                                    </div>
                                </td>
                                <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Diện tích (m2)*</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input id="numberInput" required type="number" min="1000" max="100000000" name="area" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="area_error"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Số lượng phòng ngủ</td>
                                <td> 
                                    <div class="input-group mb-3">
                                        <input id="numberInput" required type="number" name="number_of_bedroom" min="1000" max="100000000" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="number_of_bedroom_error"></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr>
                <br>
                <div class="row">
                    <h2 class="col-md-12" style="color: royalblue">III. Thông tin hình ảnh</h2>
                    <div class="row" style="border: 1px solid #686868;">
                        <p style="justify-items: center;">Tin đăng có hình ảnh thường hiệu quả hơn 59% tin đăng không có hình ảnh.<br>Lưu ý bức ảnh đầu tiên bạn chọn sẽ là thumbnail của bài đăng cho căn hộ của bạn</p>
                        <label for="files">Thêm hình ảnh:</label>
                        <div class="col-md-4">
                            1<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            2<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            3<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            4<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            5<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            6<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            7<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            8<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                        <div class="col-md-4">
                            9<input type="file" id="files" name="files" accept="image/" class="form-control">
                            <div class="preview" id="preview">
                                <button class="remove-btn">X</button> <!-- Nút bỏ chọn -->
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h2 class="col-md-12" style="color: royalblue">IV. Thông tin bổ sung</h2>
                    <h4 class="col-md-12" style="color: royalblue">Phòng Khách</h4>
                    <c:forEach items="${requestScope.propertys_List_livingroom}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>

                    <h4 class="col-md-12" style="color: royalblue">Phòng Ngủ</h4>
                    <c:forEach items="${requestScope.propertys_List_bedroom}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>
                    <h4 class="col-md-12" style="color: royalblue">Phòng Bếp</h4>
                    <c:forEach items="${requestScope.propertys_List_kitchen}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>
                    <h4 class="col-md-12" style="color: royalblue">Phòng Tắm</h4>
                    <c:forEach items="${requestScope.propertys_List_bathroom}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>
                </div>
                <hr>
            </div>
            <div style="display: flex;
                 justify-content: center;">
                <input class="btn btn-primary btn-lg" type="submit" value="Lưu thông tin căn hộ">  
            </div>
        </form>

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
            //---------------------------------

            document.getElementById('apartmentForm').addEventListener('submit', function (event) {
                event.preventDefault();
                const form = event.target;
                let isValid = true;


                if (!form.name_apartment.value) {
                    isValid = false;
                    document.getElementById('name_apartment_error').textContent = 'Vui lòng điền tên căn hộ';
                } else {
                    document.getElementById('name_apartment_error').textContent = '';
                }

                if (!form.apartment_type.value) {
                    isValid = false;
                    document.getElementById('apartment_type_error').textContent = 'Vui lòng chọn loại căn hộ';
                } else {
                    document.getElementById('apartment_type_error').textContent = '';
                }

                if (form.tinh.value == "0") {
                    isValid = false;
                    document.getElementById('tinh_error').textContent = 'Vui lòng chọn tỉnh/thành phố';
                } else {
                    document.getElementById('tinh_error').textContent = '';
                }

                if (form.quan.value == "0") {
                    isValid = false;
                    document.getElementById('quan_error').textContent = 'Vui lòng chọn quận/huyện';
                } else {
                    document.getElementById('quan_error').textContent = '';
                }

                if (form.phuong.value == "0") {
                    isValid = false;
                    document.getElementById('phuong_error').textContent = 'Vui lòng chọn xã/phường';
                } else {
                    document.getElementById('phuong_error').textContent = '';
                }

                if (!form.address.value) {
                    isValid = false;
                    document.getElementById('address_error').textContent = 'Vui lòng điền địa chỉ cụ thể';
                } else {
                    document.getElementById('address_error').textContent = '';
                }

                if (!form.price.value) {
                    isValid = false;
                    document.getElementById('price_error').textContent = 'Vui lòng điền giá tiền';
                } else {
                    document.getElementById('price_error').textContent = '';
                }

                if (!form.area.value) {
                    isValid = false;
                    document.getElementById('area_error').textContent = 'Vui lòng điền diện tích';
                } else {
                    document.getElementById('area_error').textContent = '';
                }

                if (!form.number_of_bedroom.value) {
                    isValid = false;
                    document.getElementById('number_of_bedroom_error').textContent = 'Vui lòng điền số lượng phòng ngủ';
                } else {
                    document.getElementById('number_of_bedroom_error').textContent = '';
                }

                if (isValid) {
                    form.submit();
                }
            });
        </script>
        <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
        <script>
            var map = L.map('map').setView([21.0285, 105.8542], 10); // Default to Hanoi

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            var marker;

            function updateMap(address) {
                var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address);

                fetch(url)
                        .then(response => response.json())
                        .then(data => {
                            if (data.length > 0) {
                                var lat = parseFloat(data[0].lat);
                                var longitude = parseFloat(data[0].lon);
                                map.setView([lat, longitude], 14);

                                if (marker) {
                                    map.removeLayer(marker);
                                }
                                marker = L.marker([lat, longitude]).addTo(map).bindPopup(address).openPopup();
                            } else {
                                console.error('No results found for the address');
                            }
                        })
                        .catch(error => console.error('Error:', error));
            }

            document.getElementById('tinh').addEventListener('change', function () {
                var tinh = this.options[this.selectedIndex].text;
                document.getElementById('hidden_tinh').value = tinh;


                document.getElementById('quan').innerHTML = '<option value="0">Quận huyện</option>';
                document.getElementById('phuong').innerHTML = '<option value="0">Phường xã</option>';
                document.getElementById('hidden_quan').value = '';
                document.getElementById('hidden_phuong').value = '';

                updateMap(tinh);
            });

            document.getElementById('quan').addEventListener('change', function () {
                var tinh = document.getElementById('hidden_tinh').value;
                var quan = this.options[this.selectedIndex].text;
                document.getElementById('hidden_quan').value = quan;


                document.getElementById('phuong').innerHTML = '<option value="0">Phường xã</option>';
                document.getElementById('hidden_phuong').value = '';

                updateMap(tinh + ' ' + quan);
            });

            document.getElementById('phuong').addEventListener('change', function () {
                var tinh = document.getElementById('hidden_tinh').value;
                var quan = document.getElementById('hidden_quan').value;
                var phuong = this.options[this.selectedIndex].text;
                document.getElementById('hidden_phuong').value = phuong;

                updateMap(tinh + ' ' + quan + ' ' + phuong);
            });
        </script>

        <script>
            document.getElementById('numberInput').addEventListener('keydown', function (event) {
                if (event.key === '-' || event.key === 'e') {
                    event.preventDefault();
                }
            });

            document.getElementById('numberInput').addEventListener('input', function (event) {
                const input = event.target;
                const value = input.value;
                if (value < 0) {
                    input.value = 0;
                }
            });
        </script>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/counter.js"></script>
        <script src="assets/js/custom.js"></script>

        <br><br>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>