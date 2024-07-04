<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Upload Multiple Images</title>
        <style>
            .preview {
                display: flex;
                flex-wrap: wrap;
            }
            .preview img {
                max-width: 150px;
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Upload Multiple Images</h1>
        <form id="uploadForm" action="image" method="post" enctype="multipart/form-data">
            <input type="file" id="imageInput" name="images" multiple accept="image/*" ><br><br>
            <div class="preview" id="imagePreview"></div><br>
            <button type="submit">Upload</button>
        </form>

        <script>
            document.getElementById('imageInput').addEventListener('change', function (event) {
                const files = event.target.files;
                const previewContainer = document.getElementById('imagePreview');
                previewContainer.innerHTML = '';

                Array.from(files).forEach(file => {
                    const reader = new FileReader();
                    reader.onload = function (e) {
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
