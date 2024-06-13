<%-- 
    Document   : listPost
    Created on : May 28, 2024, 1:41:04 PM
    Author     : DuyThai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách bài đăng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .post-card {
            margin-bottom: 20px;
            position: relative;
        }
        .dropdown-menu {
            min-width: 0;
        }
        .dropdown-toggle::after {
            display: none;
        }
        .dropdown {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mb-4">Danh sách bài đăng</h1>
        <a href="addCommunityPost" class="btn btn-primary mb-4">Tạo bài viết mới</a>

        <c:forEach items="${requestScope.postList}" var="p">
            <div class="card post-card">
                <div class="card-body">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ...
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="editPost.jsp?id=${p.id}">Chỉnh sửa</a>
                            <a class="dropdown-item" href="#" onclick="confirmDelete(${p.id})">Xóa</a>
                        </div>
                    </div>
                    <h5 class="card-title">${p.title}</h5>
                    <p class="card-text">${p.context}</p>
                    <p class="card-text"><small class="text-muted">Tác giả: ${p.user_id.id}</small></p>
                </div>
            </div>
        </c:forEach>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
    <script>
        function confirmDelete(postId) {
            if (confirm("Bạn có chắc chắn muốn xóa bài viết này không?")) {
                window.location.href = 'deletePost?id=' + postId;
            }
        }
    </script>
</body>
</html>



