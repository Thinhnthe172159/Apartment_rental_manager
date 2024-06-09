<%-- 
    Document   : editPost
    Created on : May 28, 2024, 1:56:07 PM
    Author     : DuyThai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Chỉnh sửa bài viết</h1>

        <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger" role="alert">
                ${requestScope.error}
            </div>
        </c:if>

        <c:if test="${not empty requestScope.success}">
            <div class="alert alert-success" role="alert">
                ${requestScope.success}
            </div>
        </c:if>

        <form action="editpost" method="post">
            <input type="hidden" name="postId" value="${post.id}">
            <div class="form-group">
                <label for="title">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" value="${post.title}">
            </div>
            <div class="form-group">
                <label for="context">Nội dung:</label>
                <textarea class="form-control" id="context" name="context">${post.context}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>