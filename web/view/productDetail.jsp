<%-- 
    Document   : productDetail
    Created on : Jun 11, 2024, 3:29:16 PM
    Author     : Dell
--%>

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
        </style>
    </head>
    <body>
        <div class ="all">
            <div class="header">
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
                    <div class="size-fit">
                        <strong>Size & Fit</strong>

                        <div class="size-options">
                            <c:forEach var="size" items="${requestScope.productJoin}">
                                <div class="size-option">EU ${size.getSize()}</div>
                            </c:forEach>
                            <!-- Additional size options can be added here -->
                        </div>

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
                    <div class="add-to-bag">Add to Bag</div>
                </div>
            </div>



            <div class="recommended-section">
                <h2>You Might Also Like</h2>
                <div class="recommended-products">
                    <div class="recommended-product">
                        <img src="url-to-image-1" alt="Product 1">
                        <div class="product-info">
                            <div class="product-name">Nike Air Force 1 '07</div>
                            <div class="product-category">Men's Shoes</div>
                            <div class="product-price">2,591,199đ <span class="original-price">3,239,000đ</span></div>
                        </div>
                    </div>
                    <div class="recommended-product">
                        <img src="url-to-image-2" alt="Product 2">
                        <div class="product-info">
                            <div class="product-name">Nike Court Vision Low</div>
                            <div class="product-category">Men's Shoes</div>
                            <div class="product-price">2,069,000đ</div>
                        </div>
                    </div>
                    <div class="recommended-product">
                        <img src="url-to-image-3" alt="Product 3">
                        <div class="product-info">
                            <div class="product-name">Air Jordan 1 Mid</div>
                            <div class="product-category">Women's Shoes</div>
                            <div class="product-price">2,201,399đ <span class="original-price">3,669,000đ</span></div>
                        </div>
                    </div>
                    <div class="recommended-product">
                        <img src="url-to-image-3" alt="Product 3">
                        <div class="product-info">
                            <div class="product-name">Air Jordan 1 Mid</div>
                            <div class="product-category">Women's Shoes</div>
                            <div class="product-price">2,201,399đ <span class="original-price">3,669,000đ</span></div>
                        </div>
                    </div>
                    <div class="recommended-product">
                        <img src="url-to-image-3" alt="Product 3">
                        <div class="product-info">
                            <div class="product-name">Air Jordan 1 Mid</div>
                            <div class="product-category">Women's Shoes</div>
                            <div class="product-price">2,201,399đ <span class="original-price">3,669,000đ</span></div>
                        </div>
                    </div>
                    <div class="recommended-product">
                        <img src="url-to-image-3" alt="Product 3">
                        <div class="product-info">
                            <div class="product-name">Air Jordan 1 Mid</div>
                            <div class="product-category">Women's Shoes</div>
                            <div class="product-price">2,201,399đ <span class="original-price">3,669,000đ</span></div>
                        </div>
                    </div>
                </div>
            </div>

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


            <div class="footer">
                <jsp:include page="FooterTag.jsp"></jsp:include>
            </div>
        </div>


    </body>

</html>
