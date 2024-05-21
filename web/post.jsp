<%-- 
    Document   : post
    Created on : May 21, 2024, 4:23:45 PM
    Author     : DuyThai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Post</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header class="bg-primary text-white text-center py-3">
        <h1>Community Post</h1>
    </header>

    <main class="container mt-5">
        <section id="post-section" class="mb-5">
            <h2>Đăng Bài</h2>
            <form id="post-form" class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="title">Tiêu đề:</label>
                    <input type="text" id="title" name="title" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng nhập tiêu đề.</div>
                </div>
                <div class="form-group">
                    <label for="content">Nội dung:</label>
                    <textarea id="content" name="content" class="form-control" rows="3" required></textarea>
                    <div class="invalid-feedback">Vui lòng nhập nội dung.</div>
                </div>
                <div class="form-group">
                    <label for="image">Đính kèm ảnh:</label>
                    <input type="file" id="image" name="image" class="form-control-file" accept="image/*">
                </div>
                <div id="image-preview" class="mb-3"></div>
                <button type="submit" class="btn btn-primary">Đăng</button>
            </form>
        </section>
    </main>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts.js"></script>
</body>
</html>
