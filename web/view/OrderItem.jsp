<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modal.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/Order/order.css" rel="stylesheet">
    </head>
    <body>
        <div id="includedContent">
            <jsp:include page="homeTag.jsp"></jsp:include>
            </div>
            <div style="margin-left: 50px">
                <div class="row">
                    <div class="col-md-3">
                        <div class="left-content">
                            <!-- Buttons to filter orders -->
                            <button class="filter-button active" value="All">All</button>
                            <button class="filter-button" value="Order">Pending Payment</button>
                            <button class="filter-button" value="Delivery">In Delivery</button>
                            <button class="filter-button" value="Receive">Delivered</button>
                            <button class="filter-button" value="Cancel_order">Cancelled</button>
                            <button class="filter-button" value="Paid">Paid</button>
                            <button class="filter-button" value="Unpaid">Unpaid</button>
                        </div>
                    </div>
                    <div class="col-md-9 Right-content">
                    <%
                    List<OrderView> orders = (List<OrderView>) request.getAttribute("orders");
                    %>
                    <div>
                        <% for (OrderView order : orders) { %>
                        <div class="order-container">
                            <div class="order-header">
                                <div class="date">Order Date: <%= order.getOrderDate() %></div>
                                <div class="shipping"><%= order.getStatusId() %></div>
                            </div>
                            <div class="order-items">
                                <% List<OrderDetails> listOrderItem = order.getListOrderItem();
                            for (OrderDetails orderItem : listOrderItem) { %>
                                <div class="order-item">
                                    <img src="${pageContext.request.contextPath}/<%= orderItem.getImg() %>" alt="Product Image">
                                    <div class="item-details">
                                        <div><%= orderItem.getShoeName() %></div>
                                        <div>Type: <%= orderItem.getShoeColor() %>, <%= orderItem.getSize() %></div>
                                        <div>x<%= orderItem.getQuantity() %></div>
                                    </div>
                                    <div class="item-price"><%= orderItem.getPrice() %>đ</div>
                                </div>
                                <% } %>
                            </div>
                            <div class="order-status">Order not paid</div>
                            <div class="order-summary">
                                Total: <span class="total"><%= order.getTotal() %></span>
                            </div>
                            <div class="order-cancel">
                                <%if (order.getStatusId().equalsIgnoreCase("Cancel order")){%>
                                <button class="cancel-button-btn" disabled>Cancel Order</button>
                                <%}else{%>
                                <button class="cancel-button"data-orderId="<%= order.getOrderId() %>">Cancel Order</button>
                                <%}%>
                                <button class="buy-again-button" data-orderId="<%= order.getOrderId() %>">Buy Again</button>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <jsp:include page="FooterTag.jsp"></jsp:include>
            </div>

            <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets_h/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/Order/order.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.cancel-button').click(function () {
                    // Lấy giá trị của data-orderId từ nút bấm
                    
                    var orderId = $(this).data('orderid');

                    // Gửi yêu cầu AJAX
                    $.ajax({
                        url: 'BuyandCancelServlet', // Thay thế với URL servlet của bạn
                        type: 'POST',
                        data: {
                            orderId: orderId,
                            action : 'cancel'
                        },
                        success: function (response) {
                            // Xử lý kết quả thành công
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            // Xử lý lỗi
                            alert('An error occurred: ' + error);
                        }
                    });
                });
                $('.buy-again-button').click(function () {
                    // Lấy giá trị của data-orderId từ nút bấm
                    
                    var orderId = $(this).data('orderid');

                    // Gửi yêu cầu AJAX
                    $.ajax({
                        url: 'BuyandCancelServlet', // Thay thế với URL servlet của bạn
                        type: 'POST',
                        data: {
                            orderId: orderId,
                            action : 'Buy'
                        },
                        success: function (response) {
                            // Xử lý kết quả thành công
                           window.location.href = 'cart';
                        },
                        error: function (xhr, status, error) {
                            // Xử lý lỗi
                            alert('An error occurred: ' + error);
                        }
                    });
                });
            });
        </script>
    </body>
</html>
