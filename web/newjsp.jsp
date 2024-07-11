<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="modal.Cart_Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="modal.ShoeColor" %>
<%@page import="modal.ShoeSize" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhập thông tin mới</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input[type="text"], .form-group input[type="tel"], .form-group select {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Nhập thông tin mới</h2>
        <form id="infoForm" action="submit-info.php" method="POST">
            <div class="form-group">
                <label for="phone">Số điện thoại:</label>
                <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại của bạn" required>
            </div>
            <div class="form-group">
                <label for="address">Địa điểm:</label>
                <input type="text" id="address" name="address" placeholder="Nhập địa điểm của bạn" required>
            </div>
            <div class="form-group">
                <label for="province">Tỉnh/Thành phố:</label>
                <select id="province" name="province" required>
                    <option value="">Chọn Tỉnh/Thành phố</option>
                    <option value="Hà Nội">Hà Nội</option>
                    <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                    <option value="Đà Nẵng">Đà Nẵng</option>
                    <!-- Thêm các tỉnh/thành phố khác tại đây -->
                </select>
            </div>
            <div class="form-group">
                <label for="district">Quận/Huyện:</label>
                <input type="text" id="district" name="district" placeholder="Nhập Quận/Huyện của bạn" required>
            </div>
            <div class="form-group">
                <button type="submit">Lưu thông tin</button>
            </div>
        </form>
    </div>
</body>
</html>
