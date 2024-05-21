/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', () => {
    const postForm = document.getElementById('post-form');
    const postsContainer = document.getElementById('posts-container');
    const imageInput = document.getElementById('image');
    const imagePreview = document.getElementById('image-preview');

    imageInput.addEventListener('change', () => {
        imagePreview.innerHTML = ''; // Clear any existing previews
        const file = imageInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (e) => {
                const img = document.createElement('img');
                img.src = e.target.result;
                imagePreview.appendChild(img);
            };
            reader.readAsDataURL(file);
        }
    });

    postForm.addEventListener('submit', (event) => {
        event.preventDefault();

        if (!postForm.checkValidity()) {
            postForm.classList.add('was-validated');
            return;
        }

        const title = document.getElementById('title').value;
        const content = document.getElementById('content').value;

        const postCol = document.createElement('div');
        postCol.classList.add('col-md-6');

        const postCard = document.createElement('div');
        postCard.classList.add('card');

        const postCardBody = document.createElement('div');
        postCardBody.classList.add('card-body');

        const postTitle = document.createElement('h5');
        postTitle.classList.add('card-title');
        postTitle.textContent = title;

        const postContent = document.createElement('p');
        postContent.classList.add('card-text');
        postContent.textContent = content;

        postCardBody.appendChild(postTitle);
        postCardBody.appendChild(postContent);

        const file = imageInput.files[0];
        if (file) {
            const img = document.createElement('img');
            img.classList.add('card-img-top');
            const reader = new FileReader();
            reader.onload = (e) => {
                img.src = e.target.result;
                postCard.insertBefore(img, postCardBody);
            };
            reader.readAsDataURL(file);
        }

        postCard.appendChild(postCardBody);
        postCol.appendChild(postCard);
        postsContainer.appendChild(postCol);

        postForm.reset();
        postForm.classList.remove('was-validated');
        imagePreview.innerHTML = ''; // Clear the image preview
    });
});
