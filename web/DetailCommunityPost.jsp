




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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="assets/jquery-1.11.3.min.js"></script>

        <style type="">
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

        <style>
            .be-comment-block {
                margin-bottom: 50px !important;
                border: 1px solid #edeff2;
                border-radius: 2px;
                padding: 50px 70px;
                border:1px solid #ffffff;
            }

            .comments-title {
                font-size: 16px;
                color: #262626;
                margin-bottom: 15px;
                font-family: 'Conv_helveticaneuecyr-bold';
            }

            .be-img-comment {
                width: 60px;
                height: 60px;
                float: left;
                margin-bottom: 15px;
            }

            .be-ava-comment {
                width: 60px;
                height: 60px;
                border-radius: 50%;
            }

            .be-comment-content {
                margin-left: 80px;
            }

            .be-comment-content span {
                display: inline-block;
                width: 49%;
                margin-bottom: 15px;
            }

            .be-comment-name {
                font-size: 13px;
                font-family: 'Conv_helveticaneuecyr-bold';
            }

            .be-comment-content a {
                color: #383b43;
            }

            .be-comment-content span {
                display: inline-block;
                width: 49%;
                margin-bottom: 15px;
            }

            .be-comment-time {
                text-align: right;
            }

            .be-comment-time {
                font-size: 11px;
                color: #b4b7c1;
            }

            .be-comment-text {
                font-size: 13px;
                line-height: 18px;
                color: #7a8192;
                display: block;
                background: #f6f6f7;
                border: 1px solid #edeff2;
                padding: 15px 20px 20px 20px;
            }

            .form-group.fl_icon .icon {
                position: absolute;
                top: 1px;
                left: 16px;
                width: 48px;
                height: 48px;
                background: #f6f6f7;
                color: #b5b8c2;
                text-align: center;
                line-height: 50px;
                -webkit-border-top-left-radius: 2px;
                -webkit-border-bottom-left-radius: 2px;
                -moz-border-radius-topleft: 2px;
                -moz-border-radius-bottomleft: 2px;
                border-top-left-radius: 2px;
                border-bottom-left-radius: 2px;
            }

            .form-group .form-input {
                font-size: 13px;
                line-height: 50px;
                font-weight: 400;
                color: #b4b7c1;
                width: 100%;
                height: 50px;
                padding-left: 20px;
                padding-right: 20px;
                border: 1px solid #edeff2;
                border-radius: 3px;
            }

            .form-group.fl_icon .form-input {
                padding-left: 70px;
            }

            .form-group textarea.form-input {
                height: 150px;
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
                            <c:if test="${user_Data != null}">  <a href="CommunityPostList?selection=2" class="list-group-item list-group-item-action <c:if test="${selection == 2}">active</c:if>">Bài viết của tôi</a></c:if>
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
                    <c:set value="${Cpost}" var="pl" />
                    <div id="${pl.id}" class="card mb-4">

                        <div class="card-body" style="">
                            <span><img style="width: 50px; height: 50px; object-fit: contain" src="${pl.user_id.getImage()}" class="card-img" alt="alt"/></span>
                            <div><br><div>
                                    <span><h6 class="">${pl.user_id.first_name} ${pl.user_id.last_name} - ${pl.time}</h6></span>
                                    <span><h5 class="">${pl.title}</h5></span>
                                        ${pl.context}
                                    <br><br><br>
                                </div>  
                                <c:forEach items="${requestScope.listImage}" var="img">
                                    <img style="max-width: 100%;height: 500px;object-fit: contain;background: black;border-radius: 15px;" src="${img.image}" class="card-img-bottom" alt="Post Image" />
                                    <br>
                                </c:forEach>


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
                                        <span class="mr-2"><i class="far fa-comment"></i> ${pl.num_of_comment}</span>
                                        <span><i class="far fa-eye"></i>${pl.num_of_view}</span>
                                    </div>
                                    <div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <br><br>
                    <div class="row"><img height="50" width="50" style="border-radius: 50%; object-fit: contain" class="col-lg-1" src="<c:choose>
                                              <c:when test="${sessionScope.user_Data != null}">
                                                  ${sessionScope.user_Data.getImage()}
                                              </c:when>
                                              <c:otherwise>
                                                  https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png
                                              </c:otherwise>
                                          </c:choose>" alt="alt"/>
                        <c:if test="${sessionScope.user_Data !=null}">
                            <form action="DetailCommnityPost" method="post" class="col-lg-11"><input  type="text" value="${pl.id}" name="post_id" hidden=""><input required="" name="comment" class="col-md-11"  style="border-radius: 30px;height: 55px;z-index: 1;box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;border: 0"   type="text" placeholder="Thêm bình luận"><button type="submit" class="col-md-1 btn- btn btn-primary" style="background: #000391bf; border-radius:50px;"><svg style="color: white; height:42px; " xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
                                    <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471z"/>
                                    </svg></button>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.user_Data == null}">
                            <br>
                            Bạn cần phải đăng nhập để có thể comment bài đăng này
                        </c:if>

                    </div>
                    <br><br>
                    <div class="row">
                        <div class="container">
                            <div class="be-comment-block" style="background: #00000024;border-radius:15px; ">
                                <h1 id="new" class="comments-title">Comments (${pl.num_of_comment})</h1>

                                <c:forEach items="${commentList}" var="cm">

                                    <c:if test="${cm.getStatus() !=0 }">
                                        <div class="be-comment">
                                            <div class="be-img-comment">	

                                                <img src="${cm.user_id.image}" alt="" class="be-ava-comment">

                                            </div>
                                            <div class="be-comment-content">

                                                <span class="be-comment-name">
                                                    <a href="#">${cm.user_id.first_name} ${cm.user_id.last_name} <c:if test="${cm.user_id.id == pl.user_id.id}">(tác giả)✔️</c:if></a>
                                                    </span>
                                                    <span class="be-comment-time">
                                                        <i class="fa fa-clock-o"></i>
                                                        <span style="color: black" class="formatted-time" data-datetime="${cm.time}"></span>
                                                    <span><c:if test="${user_Data!=null}">
                                                            <div class="dropdown-center">
                                                                <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                    . . .
                                                                </button>
                                                                <ul class="dropdown-menu">
                                                                    <c:if test="${user_Data.id == cm.user_id.id}">
                                                                        <li><form class="dropdown-item" id="deleteForm-${cm.id}" action="DeleteComment?comment_id=${cm.id}" method="post">
                                                                                <button class="btn btn-block" type="button" onclick="confirmDeletion('deleteForm-${cm.id}')">Xóa bỏ</button>
                                                                            </form></li>
                                                                        <li><a class="dropdown-item" href="DetailCommnityPost?comment_id=${cm.id}&commentCheck=1&post_id=${pl.id}"><button class="btn btn-block">Sửa đổi</button></a></li>
                                                                        </c:if>
                                                                        <c:if test="${user_Data.id != cm.user_id.id}">  <li><a class="dropdown-item">Báo cáo bình luận </a></li> </c:if>

                                                                    </ul>
                                                                </div> </c:if>
                                                        </span>
                                                    </span>

                                                <c:if test="${comment_id != cm.id}">
                                                    <div id="${cm.id}" class="be-comment-text" style="border-radius: 15px;">
                                                        ${cm.mesage} </div> 
                                                    </c:if>
                                                    <c:if test="${comment_id == cm.id && user_Data != null}">
                                                    <form action="UpdateComment?comment_id=${cm.id}&post_id=${pl.id}" method="post">
                                                        <input id="${cm.id}" class="be-comment-text form-control" style="border-radius: 15px;height: 60px;" name="comment" type="input" value="${cm.mesage}">
                                                        <button class="btn btn-primary" type="submit">cập nhật</button>
                                                    </form>
                                                </c:if>

                                            </div>
                                        </div>  
                                        <br><br>
                                    </c:if>
                                    <c:if test="${cm.status == 0 && cm.user_id.id == user_Data.id}">
                                        <div class="be-comment">
                                            <div class="be-img-comment">	

                                                <img src="${cm.user_id.image}" alt="" class="be-ava-comment">

                                            </div>
                                            <div class="be-comment-content">

                                                <span class="be-comment-name">
                                                    <a href="#">${cm.user_id.first_name} ${cm.user_id.last_name} <c:if test="${cm.user_id.id == pl.user_id.id}">(tác giả)✔️</c:if></a>
                                                    </span>
                                                    <span class="be-comment-time">
                                                        <i class="fa fa-clock-o"></i>
                                                        <span style="color: black" class="formatted-time" data-datetime="${cm.time}"></span>
                                                    <span>
                                                    </span>
                                                </span>

                                                <div  class="be-comment-text" style="border-radius: 15px;">
                                                    ${cm.mesage}  <p style="color: red">Comment này của bạn đã bị ẩn do vi phạm chính sách cộng đồng (chỉ có bạn mới có thể nhìn thấy comment    này)</p>
                                                </div> 
                                            </div>
                                        </div>  
                                        <br><br>
                                    </c:if>

                                </c:forEach>

                            </div>
                        </div>
                    </div>           
                </div>
                <script type="text/javascript">
                    // Hàm chuyển đổi và định dạng ngày giờ
                    function formatDateTime(dateTimeString) {
                        const date = new Date(dateTimeString);
                        const options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric', hour12: true};
                        return date.toLocaleDateString('en-US', options);
                    }

                    // Thêm sự kiện load để chạy function formatDateTime
                    window.onload = function () {
                        const formattedTimeElements = document.querySelectorAll('.formatted-time');
                        formattedTimeElements.forEach(function (element) {
                            const originalDateTime = element.dataset.datetime; // Lấy dữ liệu từ thuộc tính data-datetime
                            element.textContent = formatDateTime(originalDateTime); // Cập nhật nội dung với thời gian đã định dạng
                        });
                    };
                </script>
                <script>

                    var scrollToPostId = '${requestScope.scrollToComment}';
                    if (scrollToPostId) {

                        var element = document.getElementById(scrollToPostId);
                        if (element) {
                            element.scrollIntoView({behavior: 'smooth', block: 'start'});
                        }
                    }

                </script>



                <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                <script src="https://kit.fontawesome.com/a076d05399.js"></script>

                <div class="sticky-lg-top">
                    <jsp:include page="Footer.jsp" />

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
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <script>
                                        function confirmDeletion(formId) {
                                            Swal.fire({
                                                title: "Are you sure?",
                                                text: "Bạn có chắc là bạn muốn xóa bình luận này không?",
                                                icon: "warning",
                                                showCancelButton: true,
                                                confirmButtonColor: "#3085d6",
                                                cancelButtonColor: "#d33",
                                                confirmButtonText: "Yes, delete it!"
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    Swal.fire({
                                                        title: "Deleted!",
                                                        text: "Bình luận của bạn đã được xóa.",
                                                        icon: "success"
                                                    });
                                                    document.getElementById(formId).submit();
                                                }
                                            });
                                        }
                    </script>

                    </body>
                    </html>