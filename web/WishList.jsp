<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .wishlist-container {
            margin-top: 20px;
        }
        .wishlist-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .wishlist-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .wishlist-item-body {
            padding: 15px;
        }
        .wishlist-item-title {
            font-size: 18px;
            font-weight: bold;
        }
        .wishlist-item-details {
            font-size: 14px;
            color: #555;
        }
        .wishlist-item-actions {
            margin-top: 10px;
        }
        .wishlist-item-actions button {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="my-4">Nội dung đã lưu</h2>
        <div class="wishlist-container row">
            <c:forEach var="item" items="${wishlist}">
                <div class="col-md-4">
                    <div class="wishlist-item">
                        <img src="path_to_apartment_images/${item.Apartment_id}.jpg" alt="Apartment Image">
                        <div class="wishlist-item-body">
                            <div class="wishlist-item-title">Apartment ID: ${item.apartment_id}</div>
                            <div class="wishlist-item-details">
                                <p>Homedy</p>
                                <p>Dự án</p>
                            </div>
                            <div class="wishlist-item-actions">
                                <form action="wishlist" method="post" class="d-inline">
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <button type="submit" class="btn btn-danger btn-sm">Bỏ lưu</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
