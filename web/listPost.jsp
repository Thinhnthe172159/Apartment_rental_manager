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
</head>
<body>
    <div class="container">
        <h1>Danh sách bài đăng</h1>

        <a href="addCommunityPost" class="btn btn-primary">Tạo bài viết mới</a>

        <form action="listpost" method="get">
            
        <table class="table">
            <thead>
                <tr>
                    <th>Tiêu đề</th>
                    <th>Nội dung</th>
                    <th>Tác giả</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.postList}" var="p">
                    <tr>
                        <td>${p.title}</td>
                        <td>${p.getContext()}</td>
                        <td>${p.getUser_id().id}</td> 
                        
                        <td>
                            <a href="editPost.jsp?id=${post.postId}" class="btn btn-warning">Chỉnh sửa</a>
                            <a href="deletePost?id=${post.postId}" class="btn btn-danger">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
