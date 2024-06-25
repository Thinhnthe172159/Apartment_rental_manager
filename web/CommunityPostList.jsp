<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="assets/jquery-1.11.3.min.js"></script>

        <style type="text/tailwindcss">
            @layer base {
                :root {
                    --background: 0 0% 100%;
                    --foreground: 240 10% 3.9%;
                    --card: 0 0% 100%;
                    --card-foreground: 240 10% 3.9%;
                    --popover: 0 0% 100%;
                    --popover-foreground: 240 10% 3.9%;
                    --primary: 240 5.9% 10%;
                    --primary-foreground: 0 0% 98%;
                    --secondary: 240 4.8% 95.9%;
                    --secondary-foreground: 240 5.9% 10%;
                    --muted: 240 4.8% 95.9%;
                    --muted-foreground: 240 3.8% 46.1%;
                    --accent: 240 4.8% 95.9%;
                    --accent-foreground: 240 5.9% 10%;
                    --destructive: 0 84.2% 60.2%;
                    --destructive-foreground: 0 0% 98%;
                    --border: 240 5.9% 90%;
                    --input: 240 5.9% 90%;
                    --ring: 240 5.9% 10%;
                    --radius: 0.5rem;
                }
                .dark {
                    --background: 240 10% 3.9%;
                    --foreground: 0 0% 98%;
                    --card: 240 10% 3.9%;
                    --card-foreground: 0 0% 98%;
                    --popover: 240 10% 3.9%;
                    --popover-foreground: 0 0% 98%;
                    --primary: 0 0% 98%;
                    --primary-foreground: 240 5.9% 10%;
                    --secondary: 240 3.7% 15.9%;
                    --secondary-foreground: 0 0% 98%;
                    --muted: 240 3.7% 15.9%;
                    --muted-foreground: 240 5% 64.9%;
                    --accent: 240 3.7% 15.9%;
                    --accent-foreground: 0 0% 98%;
                    --destructive: 0 62.8% 30.6%;
                    --destructive-foreground: 0 0% 98%;
                    --border: 240 3.7% 15.9%;
                    --input: 240 3.7% 15.9%;
                    --ring: 240 4.9% 83.9%;
                }
            }

            .fixedElement.fixed {
                position: fixed;
                top: 100px;
                z-index: 1;
                width: 100%;
                max-width: 310px; /* Fixed width to ensure consistency during zoom */
            }
            .container-relative {
                position: relative;
            }

        </style>

        <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
        <script src="https://unpkg.com/unlazy@0.11.3/dist/unlazy.with-hashing.iife.js" defer init></script>
        <script type="text/javascript">
            window.tailwind.config = {
                darkMode: ['class'],
                theme: {
                    extend: {
                        colors: {
                            border: 'hsl(var(--border))',
                            input: 'hsl(var(--input))',
                            ring: 'hsl(var(--ring))',
                            background: 'hsl(var(--background))',
                            foreground: 'hsl(var(--foreground))',
                            primary: {
                                DEFAULT: 'hsl(var(--primary))',
                                foreground: 'hsl(var(--primary-foreground))'
                            },
                            secondary: {
                                DEFAULT: 'hsl(var(--secondary))',
                                foreground: 'hsl(var(--secondary-foreground))'
                            },
                            destructive: {
                                DEFAULT: 'hsl(var(--destructive))',
                                foreground: 'hsl(var(--destructive-foreground))'
                            },
                            muted: {
                                DEFAULT: 'hsl(var(--muted))',
                                foreground: 'hsl(var(--muted-foreground))'
                            },
                            accent: {
                                DEFAULT: 'hsl(var(--accent))',
                                foreground: 'hsl(var(--accent-foreground))'
                            },
                            popover: {
                                DEFAULT: 'hsl(var(--popover))',
                                foreground: 'hsl(var(--popover-foreground))'
                            },
                            card: {
                                DEFAULT: 'hsl(var(--card))',
                                foreground: 'hsl(var(--card-foreground))'
                            },
                        },
                    }
                }
            }
        </script>

    </head>

    <body>
        <jsp:include page="Navbar.jsp" />
        <br><br><br><br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <span class="breadcrumb"><a href="#">Community</a></span>
                        <h3>BLOG</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-4 container-relative">
            <div class="row">

                <div class="col-md-3 row">
                    <div class="col-md-12 user-info fixedElement">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="<c:choose>
                                         <c:when test="${sessionScope.user_Data != null}">
                                             ${sessionScope.user_Data.getImage()}
                                         </c:when>
                                         <c:otherwise>
                                             https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png
                                         </c:otherwise>
                                     </c:choose>"
                                     class="rounded-circle mb-3" alt="User Avatar" />
                                <h5 class="card-title"><c:if test="${sessionScope.user_Data!=null}">${sessionScope.user_Data.first_name} ${sessionScope.user_Data.last_name}</c:if><c:if test="${sessionScope.user_Data==null}">Bạn chưa đăng nhập</c:if></h5>
                                    <p class="card-text">0 người theo dõi</p>
                                    <p class="card-text">0 đang theo dõi</p>
                                </div>
                            </div>
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action active">Bảng tin</a>
                                <a href="#" class="list-group-item list-group-item-action">Tin nhắn</a>
                                <a href="#" class="list-group-item list-group-item-action">Bài viết đã lưu</a>
                                <a href="#" class="list-group-item list-group-item-action">Cài đặt</a>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-9 post">
                    <c:forEach items="${postList}" var="pl">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">${pl.title}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Tuyn Tận Tâm - 4 tháng trước</h6>
                                <p class="card-text">${pl.context}...</p>
                                <a href="#" class="card-link">Xem thêm</a>
                                
                            </div>
                            <img src="https://placehold.co/600x300" class="card-img-bottom" alt="Post Image" />
                            <div class="card-footer text-muted d-flex justify-content-between">
                                <div>
                                    <span class="mr-2"><i class="far fa-heart"></i> 3</span>
                                    <span class="mr-2"><i class="far fa-comment"></i> 1</span>
                                    <span><i class="far fa-eye"></i> 736</span>
                                </div>
                                <div>
                                    <i class="far fa-bookmark"></i>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                        
                    </div>
                </div>
            </div>
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://kit.fontawesome.com/a076d05399.js"></script>

            <div class="sticky-top">
            <jsp:include page="Footer.jsp" />
        </div>
        <script>
            var message = '${requestScope.message}';
            if (message) {
                if (message === "b") {
                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "Giao dịch không thành công, vui lòng thử lại",
                    });
                } else if (message === 'a') {
                    Swal.fire({
                        title: "Good job!",
                        text: "Giao dịch thành công",
                        icon: "success"
                    });
                }
            }


        </script>
        <script type="text/javascript">
            $(window).scroll(function (e) {
                var $el = $('.fixedElement');
                var isPositionFixed = $el.hasClass('fixed');
                var containerWidth = $el.parent().width(); // Get the parent container's width

                if ($(this).scrollTop() > 510 && !isPositionFixed) {
                    $el.addClass('fixed').css('width', containerWidth);
                }
                if ($(this).scrollTop() < 410 && isPositionFixed) {
                    $el.removeClass('fixed').css('width', '');
                }
            });

            // Adjust the width on window resize to maintain proper positioning
            $(window).resize(function () {
                var $el = $('.fixedElement.fixed');
                if ($el.length > 0) {
                    var containerWidth = $el.parent().width();
                    $el.css('width', containerWidth);
                }
            });
        </script>

    </body>
</html>
