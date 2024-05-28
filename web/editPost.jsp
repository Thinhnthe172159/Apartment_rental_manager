<%-- 
    Document   : editPost
    Created on : May 28, 2024, 1:56:07 PM
    Author     : DuyThai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa bài đăng</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Chỉnh sửa bài đăng</h1>
        <form action="editPost" method="post">
            <input type="hidden" name="id" value="${post.postId}">
            <div class="form-group">
                <label for="title">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="t" value="${post.title}" required>
            </div>
            <div class="form-group">
                <label for="context">Nội dung:</label>
                <textarea class="form-control" name="c" id="context" style="height: 200px">${post.context}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>