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
            .preview {
                display: flex;
                flex-wrap: wrap;
            }
            .preview img {
                max-width: 150px;
                margin: 10px;
            }
            .error {
                color: red;
                font-size: 0.9em;
            }
            .navbar {
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000; /* Đảm bảo navbar hiển thị trên cùng */
            }

            #map{
                z-index: 2;
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
                        <h3>DETAIL YOUR PROPERTIES</h3>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        <c:set var="ap" value="${requestScope.Apartment}"/>
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
                                        <input required placeholder="Điền tên căn hộ" type="text" name="name_apartment" value="${ap.name}" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="name_apartment_error"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Loại căn hộ</td>
                                <td>
                                    <select required class="form-select" name="apartment_type" aria-label="Default select example">
                                        <option value="">Chọn loại hình căn hộ</option>

                                        <option value="">${ap.type_id}</option>

                                    </select>
                                    <div class="error" id="apartment_type_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Tỉnh/Thành phố</td>
                                <td>      
                                    <select required class="form-select"  aria-label="Default select example">
                                        <option value="0">${ap.city}</option>
                                    </select>
                                    <div class="error" id="tinh_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Quận/Huyện</td>
                                <td>
                                    <select required class="form-select"  aria-label="Default select example">
                                        <option value="0">${ap.district}</option>
                                    </select>
                                    <div class="error" id="quan_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Xã/Phường</td>
                                <td>
                                    <select required class="form-select" aria-label="Default select example">
                                        <option value="0">${ap.commune}</option>
                                    </select>
                                    <div class="error" id="phuong_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Địa chỉ cụ thể</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required placeholder="" value="${ap.address}" type="text" name="address" class="form-control" aria-label="Text input with checkbox">
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
                                        <input required type="text" value="${ap.price} vnd" name="price" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="price_error"></div>
                                    </div>
                                </td>
                                <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Diện tích (m2)*</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required type="text" value="${ap.area} m2" name="area" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="area_error"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Số lượng phòng ngủ</td>
                                <td> 
                                    <div class="input-group mb-3">
                                        <input required type="text" name="number_of_bedroom" value="${ap.number_of_bedroom}" class="form-control" aria-label="Text input with checkbox">
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
                    <div class="col-md-12" style="border: 1px solid #686868;">

                        <div class="preview" id="preview">
                            <c:forEach items="${requestScope.apartment_images}" var="image">
                                <img  style="object-fit: contain;background: #000" height="100px;" width="130px"  src="uploads/${image.image}" alt="alt"/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h2 class="col-md-12" style="color: royalblue">IV. Thông tin bổ sung</h2>
                        <c:forEach items="${requestScope.apartment_propertieses_list}" var="p"> 
                            <span class="col-md-4"><img style="width: 35px" src="${p.property_id.image}" alt="alt"/>  ${p.property_id.name} </span>  
                            </c:forEach>
                   
                </div>
                <hr>
            </div>
            <div style="display: flex; justify-content: center;">
                <a class="btn btn-primary btn-lg" href="EditApartment?apartment_id=${ap.id}">Sửa thông tin căn hộ</a>  
            </div>
        </form>

        <script>
            function handleFiles(files) {
                const preview = document.getElementById('preview');
                preview.innerHTML = ''; // Clear the preview container

                for (let i = 0; i < files.length; i++) {
                    const file = files[i];
                    const reader = new FileReader();
                    const imgWrapper = document.createElement('div');
                    imgWrapper.className = 'img-wrapper';

                    reader.onload = function (e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        imgWrapper.appendChild(img);

                        const removeBtn = document.createElement('button');
                        removeBtn.innerHTML = '×';
                        removeBtn.className = 'remove-btn';
                        removeBtn.onclick = function () {
                            preview.removeChild(imgWrapper);
                            if (preview.children.length === 0) {
                                const newInput = document.createElement('input');
                                newInput.type = 'file';
                                newInput.id = 'files';
                                newInput.name = 'files';
                                newInput.accept = 'image/*';
                                newInput.multiple = true;
                                newInput.className = 'form-control';
                                newInput.addEventListener('change', handleInputChange);
                                document.getElementById('files').replaceWith(newInput);
                            }
                        };
                        imgWrapper.appendChild(removeBtn);

                        preview.appendChild(imgWrapper);
                    };

                    reader.readAsDataURL(file);
                }
            }

            function handleInputChange(event) {
                const files = event.target.files;
                handleFiles(files);
            }

            document.getElementById('files').addEventListener('change', handleInputChange);

            const dropZone = document.getElementById('drop-zone');

            dropZone.addEventListener('dragover', function (event) {
                event.preventDefault();
                dropZone.classList.add('dragover');
            });

            dropZone.addEventListener('dragleave', function (event) {
                dropZone.classList.remove('dragover');
            });

            dropZone.addEventListener('drop', function (event) {
                event.preventDefault();
                dropZone.classList.remove('dragover');
                const files = event.dataTransfer.files;
                handleFiles(files);
            });

            dropZone.addEventListener('click', function (event) {
                document.getElementById('files').click();
            });

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

            var map = L.map('map');


            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            var address = '${ap.city} .${ap.district}. ${ap.commune}.${ap.address}';
                var url = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address);

                fetch(url)
                        .then(response => response.json())
                        .then(data => {
                            var lat = parseFloat(data[0].lat);
                            var long = parseFloat(data[0].lon);
                            map.setView([lat, long], 15);
                            L.marker([lat, long]).addTo(map).bindPopup(address).openPopup();
                        })
                        .catch(error => console.error('Error:', error));

                var schoolMarker = L.marker([schoolLat, schoolLng]).bindPopup('School Name');
                schoolsLayer.addLayer(schoolMarker);

                var hospitalMarker = L.marker([hospitalLat, hospitalLng]).bindPopup('Hospital Name');
                hospitalsLayer.addLayer(hospitalMarker);

                schoolsLayer.addTo(map);
                hospitalsLayer.addTo(map);

                L.control.layers(null, {
                    'Schools': schoolsLayer,
                    'Hospitals': hospitalsLayer,

                }).addTo(map);
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
