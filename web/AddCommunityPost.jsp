<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="assets/jquery-1.11.3.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/minh.css" />
    <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
    <script type="module" src="https://cdn.jsdelivr.net/npm/emoji-picker-element@^1/index.js"></script>
    <style>
        #imagePreview img {
            max-width: 100px;
            max-height: 100px;
            margin: 5px;
        }
    </style>
    <title>Community Post</title>
</head>
<jsp:include page="Navbar.jsp" />
<br><br><br><br><br><br>
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div><br></div>
                <span class="breadcrumb"><a href="#">Community</a></span>
                <h3>ADD COMMUNITY POST</h3>
            </div>
        </div>
    </div>
</div>

<body>
    <main class="post">
        <form class="wrapper" action="addCommunityPost" enctype="multipart/form-data">
            <section class="create-post">
                <header class="header">
                    <h1>Create post</h1>
                    <div class="cross-icon">
                        <div class="cross-icon-mark"></div>
                    </div>
                </header>
                <div class="post-header">
                    <div class="profile-pic"></div>
                    <div class="user-info">
                        <div class="full-name">${sessionScope.user_Data.last_name} ${sessionScope.user_Data.first_name}</div>
                        <div class="post-audience"></div>
                    </div>
                </div>
                <div class="post-content">
                    <textarea name="post-title" id="post-title" cols="30" rows="2" placeholder="Write your title"></textarea>
                    <textarea name="post-desc" id="posts" cols="30" rows="5" placeholder="What's on your mind ??"></textarea>
                    <div class="emoji-picker">
                        <script>
                            ClassicEditor
                                .create(document.querySelector('#posts'))
                                .catch(error => {
                                    console.error(error);
                                });
                        </script>
                        <emoji-picker class="light"></emoji-picker>
                        <i class="emoji" aria-label="Insert an emoji" role="img"></i>
                    </div>
                    <div class="form-group row">
                        <input type="file" id="imageInput" name="images" multiple accept="image/*"><br><br>
                        <div class="preview" id="imagePreview"></div><br>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Post">
                </div>
            </section>
        </form>
    </main>
    <script src="./script.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <jsp:include page="Footer.jsp" />
    <script>
        document.getElementById('imageInput').addEventListener('change', function(event) {
            const files = event.target.files;
            const previewContainer = document.getElementById('imagePreview');
            previewContainer.innerHTML = '';

            Array.from(files).forEach(file => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    previewContainer.appendChild(img);
                };
                reader.readAsDataURL(file);
            });
        });
    </script>
</body>

</html>
