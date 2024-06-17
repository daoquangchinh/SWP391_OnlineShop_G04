<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="modal.Cart_Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dropdown Menu</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    .dropdown-menu {
      display: none;
      position: absolute;
      background-color: #fff;
      border: 1px solid #ccc;
      padding: 10px;
      z-index: 1000;
    }
    .dropdown-menu.show {
      display: block;
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <div class="col-lg-3" style="left: 30px;">
    <div class="qNRZqG1 dropdown">
      <button class="mM4TZ8 dropdown-toggle" data-toggle="dropdown">
        <div class="iIg1CN">Phân loại hàng:</div>
        <div class="iIg1CN">red, 39</div>
      </button>
      <div class="bfr5fB dropdown-menu" aria-labelledby="dropdownMenuButton">
        <div class="bfr5fB1">
          <label class="UTcc4z">Màu:</label>
          <button class="dropdown-item"><div>Đen</div></button>
        </div>
        <div class="bfr5fB1">
          <label class="UTcc4z">Size:</label>
          <button class="dropdown-item"><div>39</div></button>
          <button class="dropdown-item"><div>40</div></button>
        </div>
        <div class="ZQrI2V">
          <button class="cancel-btn">Trở Lại</button>
          <button class="xacnhan">Xác nhận</button>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
  $(document).ready(function() {
    $('.dropdown-toggle').click(function() {
      $('.dropdown-menu').toggleClass('show');
    });
  });
</script>

</body>
</html>
