




<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <title>Cộng Đồng</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
        <jsp:include page="Navbar.jsp"/>
        <br><br><br><br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <form class="search row justify-content-center" method="get" action="CommunityPostList">
                            <i class="fa fa-search"></i>
                            <input style="border-radius: 20px;height: 40px;z-index: 1;" name="title" type="text" class="col-md-9" placeholder="tìm kiếm tiêu đề bài đăng"> 
                            <button class="btn btn-primary col-md-1" style="border-radius: 20px; z-index: 10;background:" type="submit" id="submit">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                </svg>
                            </button>
                        </form>
                        <br><br>
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
                                <a href="UserProfile"><img style="object-fit: contain" src="<c:choose>
                                                               <c:when test="${sessionScope.user_Data != null}">
                                                                   ${sessionScope.user_Data.getImage()}
                                                               </c:when>
                                                               <c:otherwise>
                                                                   https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png
                                                               </c:otherwise>
                                                           </c:choose>"
                                                           class="rounded-circle mb-3" alt="User Avatar" /></a>
                                <h5 class="card-title"><c:if test="${sessionScope.user_Data!=null}">${sessionScope.user_Data.first_name} ${sessionScope.user_Data.last_name}</c:if><c:if test="${sessionScope.user_Data==null}">Bạn chưa đăng nhập</c:if></h5>
                                </div>
                            </div>
                            <div class="list-group">
                                    <a href="CommunityPostList" class="list-group-item list-group-item-action <c:if test="${selection == 0}">active</c:if>">Bảng tin</a>
                            <a href="CommunityPostList?selection=2" class="list-group-item list-group-item-action <c:if test="${selection == 2}">active</c:if>">Bài viết của tôi</a>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-9 post">
                        <div class="row"><img height="50" width="50" style="border-radius: 50%; object-fit: contain" class="col-lg-1" src="<c:choose>
                                              <c:when test="${sessionScope.user_Data != null}">
                                                  ${sessionScope.user_Data.getImage()}
                                              </c:when>
                                              <c:otherwise>
                                                  https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png
                                              </c:otherwise>
                                          </c:choose>" alt="alt"/>
                        <a href="addCommunityPost" class="col-lg-11"><input class="col-md-12"  style="border-radius: 30px;height: 55px;z-index: 1;box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;border: 0"   type="text" placeholder="Tạo bài đăng mới"></a>
                    </div>
                    <br><br>
                    <c:forEach items="${postList}" var="pl">
                        <div id="${pl.id}" class="card mb-4">
                            <div class="card-body" style="">
                                <div class="text-muted d-flex justify-content-between">
                                    <span><img style="width: 50px; height: 50px; object-fit: contain" src="${pl.user_id.getImage()}" class="card-img" alt="alt"/></span>    
                                    <span> <i class="far fa-solid"><c:if test="${user_Data!=null}">
                                                <div class="dropdown-center">
                                                    <button class="btn btn-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                        . . .
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <c:if test="${user_Data.id == pl.user_id.id}">
                                                            <li><a class="dropdown-item font-monospace" href="#">Xóa bỏ</a></li>
                                                            <li><a class="dropdown-item font-monospace" href="#">Chỉnh sửa</a></li>
                                                            </c:if>
                                                            <c:if test="${user_Data.id != pl.user_id.id}">  <li><a class="dropdown-item font-monospace" href="#">Báo cáo vi phạm</a></li> </c:if>

                                                        </ul>
                                                    </div> </c:if></i></span>
                                    </div>

                                    <div><br><div>
                                            <span><h6 class="">${pl.user_id.first_name} ${pl.user_id.last_name} - ${pl.time}</h6></span>
                                        <span><h5 class="">${pl.title}</h5></span>
                                            ${pl.context}
                                        <br><br><br>
                                        <a href="DetailCommnityPost?post_id=${pl.id}&view=1" class="card-link">Xem chi tiết</a>

                                    </div>  <c:if test="${pl.first_image !=null}">
                                        <img style="max-width: 100%;height: 500px;object-fit": contain;background: black;" src="${pl.first_image}" class="card-img-bottom" alt="Post Image" />
                                    </c:if>
                                    <div class="card-footer text-muted d-flex justify-content-between">
                                        <div>
                                            <span class="mr-2">
                                                <a href="CommunityPostList?like=1&post_id=${pl.id}&checkNull=1&page_index=${page_index}&title=${title}" class="fa-solid fa-heart" 
                                                   style="<c:choose>
                                                       <c:when test="${requestScope.likePost.contains(pl.id)}">
                                                           color:red;
                                                       </c:when>
                                                       <c:otherwise>
                                                           color:black;
                                                       </c:otherwise>
                                                   </c:choose>"></a>${pl.num_of_like}</span>
                                            <span class="mr-2"><a href="DetailCommnityPost?post_id=${pl.id}" style="color: black" class="fa-solid fa-comment"></a> ${pl.num_of_comment}</span>
                                            <span><i class="far fa-eye"></i> ${pl.num_of_view}</span>
                                        </div>
                                        <div>
                                            <i class="far fa-bookmark"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <script>

                        var scrollToPostId = '${requestScope.scrollToPost}';
                        if (scrollToPostId) {

                            var element = document.getElementById(scrollToPostId);
                            if (element) {
                                element.scrollIntoView({behavior: 'smooth', block: 'start'});
                            }
                        }

                    </script>
                    <c:set value="${param.page_index != null ? param.page_index : 1}" var="num"/>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${num > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="CommunityPostList?page_index=${num-1}&title=${title}&selection=${selection}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach items="${requestScope.pageList}" var="pageIndex">
                                <c:choose>
                                    <c:when test="${pageIndex == num}">
                                        <li class="page-item active">
                                            <a class="page-link" href="CommunityPostList?page_index=${pageIndex}&title=${title}&selection=${selection}">${pageIndex}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="CommunityPostList?page_index=${pageIndex}&title=${title}&selection=${selection}">${pageIndex}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:if test="${num < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="CommunityPostList?page_index=${num+1}&title=${title}&selection=${selection}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>

                </div>




                <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://kit.fontawesome.com/a076d05399.js"></script>

                <div class="sticky-lg-top">
                    <jsp:include page="Footer.jsp" />

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
