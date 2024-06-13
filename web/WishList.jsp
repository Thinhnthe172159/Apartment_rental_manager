<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wishlist</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="my-4">Your Wishlist</h2>
        <form action="wishlist" method="post" class="mb-4">
            <input type="hidden" name="userId" value="${userId}">
            <div class="form-group">
                <label for="productId">Product ID:</label>
                <input type="number" class="form-control" id="productId" name="productId" required>
            </div>
            <button type="submit" class="btn btn-primary">Add to Wishlist</button>
        </form>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product ID</th>
                    <th>Added Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${wishlist}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.productId}</td>
                        <td>${item.addedDate}</td>
                        <td>
                            <form action="wishlist" method="post">
                                <input type="hidden" name="_method" value="delete">
                                <input type="hidden" name="id" value="${item.id}">
                                <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
