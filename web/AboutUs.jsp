<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Về Chúng tôi</title>
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
                        <h3>ABOUT US</h3>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        <div class="bg-light text-dark">
            <main class="container py-5 px-6">
                <section class="mb-5">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h2 class="fs-1 fw-bold mb-3">About Us</h2>
                            <p class="text-secondary">HubSpot's company and culture are a lot like our product. They're crafted, not cobbled, for a delightful experience.</p>
                        </div>
                        <div class="col-md-6 mt-4 mt-md-0">
                            <img src="https://placehold.co/500x300" alt="Team photo" class="rounded shadow-lg img-fluid">
                        </div>
                    </div>
                </section>
                <section class="mb-5">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <img src="https://placehold.co/500x300" alt="Office photo" class="rounded shadow-lg img-fluid">
                        </div>
                        <div class="col-md-6 mt-4 mt-md-0">
                            <h2 class="fs-1 fw-bold mb-3">Our Mission: Helping Millions of Organizations Grow Better</h2>
                            <p class="text-secondary">We believe not just in growing bigger, but in growing better. And growing better means aligning the success of your own business with the success of your customers. Win-win!</p>
                        </div>
                    </div>
                </section>
                <section class="mb-5">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h2 class="fs-1 fw-bold mb-3">Our Story</h2>
                            <p class="text-secondary">In 2004, fellow MIT graduate students Brian Halligan and Dharmesh Shah noticed a major shift in the way people shop and purchase products. Buyers didn't want to be interrupted by ads, they wanted helpful information. In 2006, they founded HubSpot to help companies use that shift to grow better with inbound marketing.</p>
                            <p class="text-secondary mt-3">Along the way, HubSpot expanded beyond marketing into a crafted, not cobbled suite of products that create the frictionless customer experience that buyers expect today. Expertly led by CEO Yamini Rangan, HubSpot uses its customer platform built on an AI-powered Smart CRM to help millions of scaling organizations grow better.</p>
                        </div>
                        <div class="col-md-6 mt-4 mt-md-0">
                            <img src="https://placehold.co/500x300" alt="Founders photo" class="rounded shadow-lg img-fluid">
                        </div>
                    </div>
                </section>
                <section class="mb-5 text-center">
                    <h2 class="fs-1 fw-bold mb-3">HubSpot By the Numbers</h2>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <div class="bg-white p-4 rounded shadow-lg">
                                <h3 class="fs-2 fw-bold mb-2">12 Global Offices</h3>
                                <a href="#" class="text-primary">Learn more</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="bg-white p-4 rounded shadow-lg">
                                <h3 class="fs-2 fw-bold mb-2">7,600+ Employees</h3>
                                <a href="#" class="text-primary">Learn more</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="bg-white p-4 rounded shadow-lg">
                                <h3 class="fs-2 fw-bold mb-2">205,000+ Customers</h3>
                                <a href="#" class="text-primary">Learn more</a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="text-center">
                    <h3 class="fs-4 fw-bold mb-3">Voted #1 in 318 categories</h3>
                    <a href="#" class="text-primary">Learn more</a>
                </section>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>



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