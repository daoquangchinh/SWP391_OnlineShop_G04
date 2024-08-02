<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="modal.*"%>

<div>
    <% 
    List<OrderView> orders = (List<OrderView>) request.getAttribute("orders");
    for (OrderView order : orders) { %>
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

        <div class="order-status"><%=order.getPaymentStatus()%></div>
        <div class="order-summary">
            Total: <span class="total"><%= order.getTotal() %></span>
        </div>
        <div class="order-cancel">
            <%if (order.getStatusId().equalsIgnoreCase("Cancel order")){%>
            <button class="cancel-button-btn" disabled>Cancel Order</button>
            <%}else{%>
            <button class="cancel-button" data-orderId="<%= order.getOrderId() %>">Cancel Order</button>

            <%}%>
            <button class="buy-again-button" data-orderId="<%= order.getOrderId() %>">Buy Again</button>
        </div>
    </div>
    <% } %>
</div>
