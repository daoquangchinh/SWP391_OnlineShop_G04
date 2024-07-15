<%-- 
    Document   : OrderItem
    Created on : Jul 14, 2024, 5:13:16 PM
    Author     : ViQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Đơn Hàng</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }

        .order-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .order-header .date {
            font-weight: bold;
            font-size: 16px;
            color: #555;
        }

        .order-items {
            border: 1px solid #eaeaea;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .order-item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 10px;
        }

        .order-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .order-item img {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            margin-right: 15px;
        }

        .order-item .item-details {
            flex-grow: 1;
            color: #333;
        }

        .order-item .item-details div {
            margin-bottom: 5px;
        }

        .order-item .item-details div:first-child {
            font-weight: bold;
        }

        .order-item .item-details div:last-child {
            font-size: 14px;
        }

        .order-item .item-price {
            font-size: 18px;
            font-weight: bold;
            color: #000;
        }

        .order-summary {
            text-align: right;
            font-size: 18px;
            color: #000;
        }

        .order-summary .total {
            font-size: 20px;
            font-weight: bold;
            color: red;
        }

        .order-status {
            text-align: left;
            font-style: italic;
            color: #ff0700;
        }

        .order-cancel {
            text-align: right;
        }

        .order-cancel button {
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #ff8814;
            color: white;
            border: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .order-cancel button:hover {
            background-color: #db7411;
        }
    </style>
</head>
<body>
    <div class="order-container">
        <div class="order-header">
            <div class="date">Ngày đặt: 20/02/2024</div>
            <div class="shipping">Vận chuyển</div>
        </div>
        <div class="order-items">
            <div class="order-item">
                <img src="https://via.placeholder.com/50" alt="Product Image">
                <div class="item-details">
                    <div>Tên Sản Phẩm</div>
                    <div>Phân loại: Đỏ, 39</div>
                    <div>x10</div>
                </div>
                <div class="item-price">1,000đ</div>
            </div>
            <div class="order-item">
                <img src="https://via.placeholder.com/50" alt="Product Image">
                <div class="item-details">
                    <div>Tên Sản Phẩm</div>
                    <div>Phân loại: Đỏ, 39</div>
                    <div>x10</div>
                </div>
                <div class="item-price">1,000đ</div>
            </div>
        </div>
        <div class="order-status">Đơn hàng chưa thanh toán</div>
        <div class="order-summary">
            Total: <span class="total">10,000đ</span>
        </div>
        <div class="order-cancel">
            <button>Hủy đơn</button>
        </div>
    </div>
</body>
</html>
