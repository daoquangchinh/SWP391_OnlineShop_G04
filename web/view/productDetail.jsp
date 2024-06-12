<%-- 
    Document   : productDetail
    Created on : Jun 11, 2024, 3:29:16 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/assets_pd/css/newcss.css" rel="stylesheet">


    </head>
    <body>
        <div class ="all">
            <div class="header">
                <jsp:include page="homeTag.jsp"></jsp:include>
                </div>
                <div class="container">
                    <div class="image-section">
                        <div class="thumbnails">
                            <img src="thumbnail1-url" alt="Thumbnail 1" class="thumbnail">
                            <img src="thumbnail2-url" alt="Thumbnail 2" class="thumbnail">
                            <img src="thumbnail3-url" alt="Thumbnail 3" class="thumbnail">
                            <img src="thumbnail4-url" alt="Thumbnail 4" class="thumbnail">
                        </div>
                        <img src="main-image-url" alt="Product Image" class="main-image">
                    </div>
                    <div class="details-section">
                        <div class="highly-rated">Highly Rated</div>
                        <div class="product-title">Nike Force 1 Low EasyOn</div>
                        <div class="product-price">1,909,000đ</div>
                        <div class="color-options">
                            <div class="color-option">
                                <img src="color1-url" alt="Color 1">
                                <span>Black</span>
                            </div>
                            <div class="color-option">
                                <img src="color2-url" alt="Color 2">
                                <span>Pink</span>
                            </div>
                            <div class="color-option">
                                <img src="color3-url" alt="Color 3">
                                <span>Blue</span>
                            </div>
                            <div class="color-option">
                                <img src="color4-url" alt="Color 4">
                                <span>White</span>
                            </div>
                        </div>
                        <div class="size-fit">
                            <strong>Size & Fit</strong>
                            <div class="size-options">
                                <div class="size-option">EU 25</div>
                                <div class="size-option">EU 26</div>
                                <div class="size-option">EU 27</div>
                                <div class="size-option">EU 27.5</div>
                                <div class="size-option">EU 28</div>
                                <div class="size-option">EU 28.5</div>

                            </div>
                        </div>
                        <div class="product-description">
                            The look of laces without the struggle of having to tie them? Now, that's easy. The laces on these sneakers are just for show—the top two lace loops are attached to a hook-and-loop strap so kids can fasten them fast while still enjoying the traditional look of the AF-1. But these shoes aren't just easy for kids to put on. We designed them around kids' feet for overall comfort too.
                        </div>
                        <div class="product-details">
                            <strong>Colour Shown:</strong> White/White/White<br>
                            <strong>Style:</strong> FN0237-111
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


                

                <div class="footer">
                <jsp:include page="FooterTag.jsp"></jsp:include>
            </div>
        </div>

        <script>
            document.querySelectorAll('.size-option').forEach(sizeOption => {
            sizeOption.addEventListener('click', function () {
            document.querySelectorAll('.size-option').forEach(option => {
            option.classList.remove('selected');
            });
            this.classList.add('selected');
            });
            });
            document.querySelectorAll('.color-option').forEach(colorOption => {
            colorOption.addEventListener('click', function () {
            document.querySelectorAll('.color-option').forEach(option => {
            option.classList.remove('selected');
            });
            this.classList.add('selected');
            });
            });
        </script>
    </body>

</html>
