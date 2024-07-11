<%-- 
    Document   : productDetail
    Created on : Jun 11, 2024, 3:29:16 PM
    Author     : Dell
--%>
<%@ page import="java.util.ArrayList" %>
<%@page import="modal.ProductJoin" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/assets_pd/css/newcss.css" rel="stylesheet">

        <style>
            .thumbnail {
                width: 100px;
                height: 100px;
                border: 1px solid #eaeaea;
                margin: 5px 0;
                cursor: pointer;
                transition: transform 0.3s ease; /* Hiệu ứng chuyển động */
            }

            .thumbnail:hover {
                transform: scale(1.1); /* Phóng to 110% khi di chuột vào */
            }
            .color-option img {
                width: 70px;
                height: 70px;
                margin-right: 10px;
            }
            .sapn01{
                font-size: 20px;
            }
            .GpmJtT {
                align-items: center;
                display: flex;
            }
            .WNSVcC {
                align-items: center;
                background: transparent;
                border: 1px solid rgba(0, 0, 0, .09);
                border-radius: 2px;
                color: rgba(0, 0, 0, .8);
                cursor: pointer;
                display: flex;
                font-size: .875rem;
                font-weight: 300;
                height: 32px;
                justify-content: center;
                letter-spacing: 0;
                line-height: 1;
                outline: none;
                transition: background-color .1s cubic-bezier(.4,0,.6,1);
                width: 32px;
                text-align: center;
            }
            .notification {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                display: none; /* Ban đầu ẩn */
                z-index: 1000;
            }

            .notification-inner {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #dee2e6c7;
                color: red;
                border-radius: 10px; /* Bo tròn góc */
                width: 300px; /* Độ rộng thông báo */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Đổ bóng */
                font-size: 18px; /* Kích cỡ chữ */
                text-align: center;
            }


        </style>
    </head>
    <body>
        <div class ="all">
            <div class="header" id="includedContent">
                <jsp:include page="homeTag.jsp"></jsp:include>
                </div>
                <div class="container">
                    <div class="image-section">
                        <div class="thumbnails">

                        <c:forEach var="img" items="${requestScope.imgAll}">
                            <a href="${pageContext.request.contextPath}/productdetail?img=${img.img}&shoeid=${requestScope.shoe.getId()}">
                                <img src="${pageContext.request.contextPath}/${img.img}" alt="" class="thumbnail">
                            </a>
                        </c:forEach>

                        <!-- Additional thumbnail images can be added here -->
                    </div>
                    <img src="${pageContext.request.contextPath}/${imgMain.img}" alt="Product Image" class="main-image">
                </div>
                <div class="details-section">
                    <div class="highly-rated">Highly Rated</div>
                    <div class="product-title">${requestScope.shoe.getName()}</div>
                    <div class="product-price">${requestScope.shoe.getPrice()}Đ</div>
                    <div class="color-options" id="color-option">
                        <c:forEach var="color" items="${requestScope.imgColor}">
                            <a href="${pageContext.request.contextPath}/productdetail?color=${color.getShoe_color_id()}&shoeid=${requestScope.shoe.getId()}">
                                <div class="color-option">

                                    <img src="${pageContext.request.contextPath}/${color.img}" alt="">

                                </div>
                            </a>
                        </c:forEach>
                    </div>
                    <div class="size-fit"style="padding: 10px 10px;">
                        <strong>Size & Fit</strong>

                        <div class="size-options">
                            <c:forEach var="size" items="${requestScope.productJoin}">
                                <div class="size-option"  onclick="selectSize(${size.getShoe_size_id()}, ${size.getQuantity()}, ${size.getShoe_color_id()}, ${size.getShoe_id()})">EU ${size.getSize()}</div>
                            </c:forEach>
                            <!-- Additional size options can be added here -->
                        </div>
                        <div>
                            <strong>Quantity</strong>
                            <div class="GpmJtT">
                                <!-- Thay đổi khi dùng button giảm -->
                                <button class="WNSVcC" onclick="decrementQuantity()">
                                    <span class="sapn01">-</span>
                                </button>
                                <!-- Thay đổi khi nhập dữ liệu -->
                                <input class="WNSVcC" type="text" id="quantityInput" style="width: 75.6px;" value="1">
                                <!-- Thay đổi khi dùng button tăng -->
                                <button class="WNSVcC" onclick="incrementQuantity()">
                                    <span class="sapn01">+</span>
                                </button>
                            </div>
                            <div id="quantityDisplay"></div>
                        </div>
                        <div id="error-message" style="display: none; color: #ff424f;margin-top: 10px;">Please select Product Category</div>
                    </div>
                    <div class="product-description">
                        ${requestScope.shoe.getDescriptionm()}
                    </div>
                    <div class="free-delivery">
                        <strong>Free Delivery and Returns</strong>
                        <p>Free delivery and returns are available for all orders.</p>
                    </div>
                    <div class="reviews">
                        <strong>Reviews (32)</strong>
                        <div>★★★★☆</div>
                    </div>
                    <div class="add-to-bag" onclick="addToBag()">Add to Bag</div>
                </div>
            </div>



            <div class="recommended-section">
                <h2>You Might Also Like</h2>
                <div class="recommended-products">
                    <c:forEach var="brand" items="${requestScope.shoeBrand}">
                    <div class="recommended-product">
                        <a href="${pageContext.request.contextPath}/productdetail?shoeid=${brand.getId()}">
                        <img src="${pageContext.request.contextPath}/${brand.getImage()}" alt="Product 1" style="width: 100px; height: 100px">
                        </a>
                        <div class="product-info">
                            <div class="product-name">${brand.getName()} </div>
                            <c:choose>
                        <c:when test="${brand.getGenderId() == 1}">
                            <div class="product-category">Men's Shoes</div>
                        </c:when>
                        <c:when test="${brand.getGenderId() == 2}">
                            <div class="product-category">Women's Shoes</div>
                        </c:when>
                    </c:choose>
                            <div class="product-price">${brand.getPrice()} </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>

                    <div id="notification" class="notification"></div>
            <script>
//                document.addEventListener('DOMContentLoaded', function () {
//                    // Handle click on color options
//                    document.querySelectorAll('.color-option').forEach(function (colorOption, index) {
//                        colorOption.addEventListener('click', function () {
//                            var colorImage = colorOption.querySelector('img').getAttribute('src');
//                            // Redirect to productdetail with color parameter
//                            window.location.href = '${pageContext.request.contextPath}/productdetail?color=' + encodeURIComponent(colorImage);
//                        });
//                    });
//                    // Handle click on thumbnails
//                    document.querySelectorAll('.thumbnail').forEach(function (thumbnail, index) {
//                        thumbnail.addEventListener('click', function () {
//                            var thumbnailImage = thumbnail.getAttribute('src');
//                            // Redirect to productdetail with thumbnail parameter
//                            window.location.href = '${pageContext.request.contextPath}/productdetail?img=' + encodeURIComponent(thumbnailImage);
//                        });
//                    });
//                });
                // Highlight selected size and color options
                document.querySelectorAll('.size-option').forEach(sizeOption => {
                    sizeOption.addEventListener('click', function () {
                        document.querySelectorAll('.size-option').forEach(option => {
                            option.classList.remove('selected');
                        });
                        this.classList.add('selected');
                    });
                });
            </script>


            <script>
                var quantityInput = document.getElementById('quantityInput');
                var previousValue = 1; // Giá trị mặc định ban đầu là 1
                var max = Infinity;
                var sizeSelected = false;
                var shoeId;
                var colorId;
                var sizeId;

                function showNotification(message, type) {
                    var notificationElement = document.getElementById('notification');
                    var notificationInnerElement = document.createElement('div');
                    notificationInnerElement.classList.add('notification-inner');
                    notificationInnerElement.innerText = message;

                    // Xóa nội dung cũ và thêm nội dung mới vào .notification
                    notificationElement.innerHTML = '';
                    notificationElement.appendChild(notificationInnerElement);

                    // Hiển thị thông báo
                    notificationElement.style.display = 'block';

                    // Ẩn thông báo sau 3 giây
                    setTimeout(function () {
                        notificationElement.style.display = 'none';
                    }, 1000); // 3000 milliseconds = 3 seconds
                }

                function selectSize(size, quantity, color, shoe) {
                    sizeId = size;
                    colorId = color;
                    shoeId = shoe;
                    document.getElementById('error-message').style.display = 'none';
                    document.querySelector('.size-fit').classList.remove('error');
                    sizeSelected = true;
                    max = quantity;
                    quantityInput.value = 1;
                    document.getElementById('quantityDisplay').innerText = quantity + " products left";
                }

                quantityInput.addEventListener('blur', function () {
                    var value = parseInt(this.value);
                    if (isNaN(value) || value < 1) {
                        this.value = previousValue.toString(); // Nếu giá trị nhỏ hơn 1, đặt lại là giá trị trước đó
                    } else if (value > max) {
                        this.value = previousValue.toString(); // Nếu giá trị lớn hơn max, đặt lại là giá trị trước đó
                    } else {
                        previousValue = value; // Lưu giữ giá trị hợp lệ vào giá trị trước đó
                    }
                });

                quantityInput.addEventListener('input', function () {
                    this.value = this.value.replace(/[^0-9]/g, ''); // Chỉ cho phép nhập số
                });

                function decrementQuantity() {
                    var value = parseInt(quantityInput.value) || 1; // Giá trị nhỏ nhất là 1
                    if (value > 1) {
                        quantityInput.value = value - 1;
                        previousValue = value - 1; // Cập nhật giá trị trước đó khi giảm
                    }
                }

                function incrementQuantity() {
                    var value = parseInt(quantityInput.value) || 1;
                    if (value < max) {
                        quantityInput.value = value + 1;
                        previousValue = value + 1; // Cập nhật giá trị trước đó khi tăng
                    }
                }

                function addToBag() {
                    if (!sizeSelected) {
                        document.getElementById('error-message').style.display = 'block';
                        var sizeFitElement = document.querySelector('.size-fit');
                        sizeFitElement.classList.add('error');
                    } else {
                        // Xử lý logic thêm vào giỏ hàng ở đây
                        $.ajax({
                            url: "${pageContext.request.contextPath}/productdetail",
                            method: "POST",
                            data: {
                                shoeId: shoeId,
                                sizeId: sizeId,
                                colorId: colorId,
                                quantity: quantityInput.value
                            },
                            success: function (response) {
                                showNotification(response.strErr, 'success');
                                $("#includedContent").load("view/homeTag.jsp");

                            },
                            error: function () {
                                showNotification('Không thể thêm sản phẩm vào giỏ hàng!', 'error');
                            }
                        });
                    }
                }
            </script>

            <script src="${pageContext.request.contextPath}/assets_h/js/main.js"></script>
            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets_h/lib/easing/easing.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets_h/lib/owlcarousel/owl.carousel.min.js"></script>

            <!-- Contact Javascript File -->
            <script src="${pageContext.request.contextPath}/assets_h/mail/jqBootstrapValidation.min.js"></script>


            <div class="footer">
                <jsp:include page="FooterTag.jsp"></jsp:include>
            </div>
        </div>


    </body>

</html>
