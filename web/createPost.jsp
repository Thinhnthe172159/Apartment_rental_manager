<%-- 
    Document   : createPost
    Created on : May 23, 2024, 7:50:14 PM
    Author     : DuyThai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo bài viết mới</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
            background-color: #f8f9fa;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007bff; /* Màu xanh dương của Bootstrap */
        }

        .btn-primary {
            background-color: #28a745; /* Màu xanh lá của Bootstrap */
            border-color: #28a745;
        }

        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mb-4">Tạo bài viết mới</h1>
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        <form action="CreatePostServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Tiêu đề:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="content">Nội dung:</label>
                <textarea class="form-control" id="content" name="content" rows="4"></textarea>
            </div>
            <div class="form-group">
                <label for="images">Chọn ảnh:</label>
                <input type="file" class="form-control-file" id="images" name="images" multiple>
            </div>
            <button type="submit" class="btn btn-primary">Đăng bài</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>