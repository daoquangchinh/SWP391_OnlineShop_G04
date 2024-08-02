<%-- 
    Document   : checkOutPage
    Created on : Jul 5, 2024, 7:48:54 AM
    Author     : ViQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modal.Cart_Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="modal.ShoeColor" %>
<%@page import="modal.ShoeSize" %>
<%@page import="java.util.List" %>
<link href="${pageContext.request.contextPath}/assets_cart/checkout.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets_cart/checkOut.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div class="checkout-container">
    <!-- Address Section -->
    <div class="address-section">
        <div class="header">
            <svg height="16" viewBox="0 0 12 16" width="12" class="shopee-svg-icon icon-location-marker">
            <path d="M6 3.2c1.506 0 2.727 1.195 2.727 2.667 0 1.473-1.22 2.666-2.727 2.666S3.273 7.34 3.273 5.867C3.273 4.395 4.493 3.2 6 3.2zM0 6c0-3.315 2.686-6 6-6s6 2.685 6 6c0 2.498-1.964 5.742-6 9.933C1.613 11.743 0 8.498 0 6z" fill-rule="evenodd"></path>
            </svg>
            <h2>Địa chỉ nhận hàng</h2>
        </div>
        <div class="address-details">
            <div class="recipient-info">Nguyễn Vi Quân (+84) 838167715</div>
            <div class="address">Cây Xăng Sông Vân, Cống Vực, Xã An Châu, Huyện Đông Hưng, Thái Bình</div>
            <div class="default-label">Mặc  định</div>
        </div>
        <button class="change-address-btn" style="font: icon">Thay đổi</button>
    </div>
<!--        <button onclick="placeOrder()">quan</button>-->

    <!-- Cart Section -->
    <div class="cart-section">
        <div class="cart-header">
            <h4>Sản Phẩm</h4>
            <h4>Đơn giá </h4>
            <h4 style="text-align: center">Số lượng </h4>
            <h4 style="text-align: center">Total (đ) </h4>
        </div>
        <%
            List<Cart_Item> selectedItems = (List<Cart_Item>) session.getAttribute("selectedItems");
            if (selectedItems != null) {
                for (Cart_Item  item : selectedItems) {
        %> 
        <div class="cart-item" data-price="<%=item.getPrice()%>" data-quantity="<%=item.getQuatityCart()%>">
            <img src="${pageContext.request.contextPath}/<%= item.getImg()%>" alt="cartitem">
            <div class="item-price"><%=item.getPrice()%></div>    
            <div class="item-quantity" style="text-align: center"><%= item.getQuatityCart()%></div>
            <div class="item-total item-price"><%=item.getPrice()*item.getQuatityCart()%></div>
        </div>
        <hr>
        <% }
                    }%>

    </div>
    <form action="payServlet" id="payServlet" method="post"> 
        <!-- Summary Section -->
        <div class="summary-section">
            <div class="summary-row">
                <h4 class="summary-label">Product</h4>
                <h4 class="item-total" id="product-total">30000</h4>
            </div>
            <hr>
            <div class="summary-row">
                <h4 class="summary-label" style="color: #05a">Voucher</h4>
            </div>
            <hr>
            <div class="summary-row">
                <div class="voucher-details">Nội dung Voucher</div>
                <h4 class="item-total item-price">-0</h4>
            </div>
            <div class="summary-row">
                <h4 class="summary-label">Total</h4>
                <h4 class="item-total" id="overall-total">29000</h4>
            </div>
            <!-- Hidden input to pass the total amount to the servlet -->
            <input hidden name="amount" id="amount" value="">
        </div>

        <!-- Payment Method Section -->
        <div class="payment-section">
            <h4 class="payment-header">Chọn phương thức thanh toán</h4>
            <div class="payment-options">
                <label>
                    <input type="radio" id="bankCode" name="bankCode" value="COD" checked>
                    Thanh toán sau khi nhận hàng.
                </label>
                <label>
                    <input type="radio" id="bankCode" name="bankCode" value="">
                    Cổng thanh toán VNPAY
                </label>
            </div>
        </div>
        <button type="submit" class="place-order-btn" style="right: 0">Đặt hàng</button>
    </form>

</div>
