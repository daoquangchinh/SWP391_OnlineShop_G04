<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="modal.Cart_Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_h/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_cart/styles.css">
</head>
<body>
    <div class="container">
        <div class="cart-items">
            <% 
                List<Cart_Item> listC = (List<Cart_Item>) request.getAttribute("cart_item");
                String mess = (String) request.getAttribute("mess");

                if (listC == null) {
                    listC = new ArrayList<>(); // Khởi tạo danh sách rỗng nếu null
                }

                for (Cart_Item item : listC) { 
            %>
            <div class="cart-item">
                <div class="product-details">
                    <div class="product-image">
                        <img src="<%= item.getImg() %>" alt="product image">
                    </div>
                    <div class="product-info">
                        <h3><%= item.getShoe_name() %></h3>
                        <p>Color: <%= item.getColor() %></p>
                        <p>Size: <%= item.getSize() %></p>
                        <p>Price: ₫<%= item.getPrice() %></p>
                    </div>
                </div>
                <div class="quantity-actions">
                    <div class="quantity">
                        <button class="decrement">-</button>
                        <input class="quantity-input" type="text" value="<%= item.getQuatityCart() %>" data-cart-id="<%= item.getIdCartItem() %>">
                        <button class="increment">+</button>
                    </div>
                    <div class="total-price">Total: ₫<%= item.getQuatityCart() * item.getPrice() %></div>
                    <button class="delete">Delete</button>
                </div>
            </div>
            <% } %>
        </div>

        <div class="cart-footer">
            <button class="btn btn-primary checkout-btn">Proceed to Checkout</button>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.quantity-actions .increment').on('click', function () {
                var input = $(this).siblings('.quantity-input');
                var newQuantity = parseInt(input.val()) + 1;
                updateQuantity(input, newQuantity);
            });

            $('.quantity-actions .decrement').on('click', function () {
                var input = $(this).siblings('.quantity-input');
                var newQuantity = Math.max(parseInt(input.val()) - 1, 1);
                updateQuantity(input, newQuantity);
            });

            $('.quantity-actions .quantity-input').on('input', function () {
                var input = $(this);
                var newQuantity = parseInt(input.val().replace(/[^\d]/g, '')) || 1;
                updateQuantity(input, newQuantity);
            });

            function updateQuantity(input, newQuantity) {
                var cartItemId = input.data('cart-id');

                $.ajax({
                    url: "${pageContext.request.contextPath}/cart",
                    method: "POST",
                    data: {
                        cartItemId: cartItemId,
                        quantity: newQuantity
                    },
                    success: function (response) {
                        // Xử lý phản hồi từ servlet nếu cần
                        console.log(response);
                        // Cập nhật lại tổng giá tiền của sản phẩm
                        var totalPriceElement = input.closest('.cart-item').find('.total-price');
                        totalPriceElement.text('Total: ₫' + (response.price * newQuantity));
                    },
                    error: function () {
                        alert('Failed to update quantity.');
                    }
                });
            }
        });
    </script>
</body>
</html>
