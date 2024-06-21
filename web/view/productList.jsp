<%-- 
   Document   : homePage
   Created on : May 23, 2024, 10:48:35 AM
   Author     : ViQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/assets_h/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets_h/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets_h/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets_h/css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_pl/css/productListStyles.css">

    </head>

    <body>

        <div class="header">
            <jsp:include page="homeTag.jsp"></jsp:include>
            </div>

            <div class="wrapper">

                <!-- body -->
                <!-- choose option -->
                <div class="left-nav-wrapper">
                    <form action="${pageContext.request.contextPath}/productlist" method="post"> 

                    <div class="price-range-container">
                        <div class="price-range-heading" onclick="togglePriceOptions()">Price range</div>
                        <div class="price-range-labels" id="price-range-labels">
                            <ul class="price-options collapsed" id="price-options"> <!-- Thêm lớp 'collapsed' ở đây -->
                                <li><input type="radio" name="price" id="price-option-1" value="1"><label for="price-option-1">$0 - $50</label></li>
                                <li><input type="radio" name="price" id="price-option-2" value="2"><label for="price-option-2">$60 - $90</label></li>
                                <li><input type="radio" name="price" id="price-option-3" value="3"><label for="price-option-3">$100 - $150</label></li>
                                <li><input type="radio" name="price" id="price-option-4" value="4"><label for="price-option-4">$160 - $200</label></li>
                            </ul>
                        </div>
                    </div>

                    <div class="size-container">
                        <div class="size-heading" onclick="toggleSizeOptions()">Size</div>
                        <div class="size-options collapsed">
                            <div class="size-options">
                                <ul>
                                    <li><input type="radio" name="size" id="size-option-38" value="38"><label for="size-option-38">Size 38</label></li>
                                    <li><input type="radio" name="size" id="size-option-39" value="39"><label for="size-option-39">Size 39</label></li>
                                    <li><input type="radio" name="size" id="size-option-40" value="40"><label for="size-option-40">Size 40</label></li>
                                    <li><input type="radio" name="size" id="size-option-41" value="41"><label for="size-option-41">Size 41</label></li>
                                    <li><input type="radio" name="size" id="size-option-42" value="42"><label for="size-option-42">Size 42</label></li>
                                    <li><input type="radio" name="size" id="size-option-43" value="43"><label for="size-option-43">Size 43</label></li>
                                    <li><input type="radio" name="size" id="size-option-44" value="44"><label for="size-option-44">Size 44</label></li>
                                    <li><input type="radio" name="size" id="size-option-45" value="45"><label for="size-option-45">Size 45</label></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="shoe-type-container">
                        <div class="shoe-type-heading" onclick="toggleShoeTypeOptions()">Brand</div>
                        <div class="shoe-type-options collapsed">
                            <div class="shoe-type-options">
                                <ul>
                                    <li><input type="radio" name="Brand" id="shoe-type-nike" value="Nike Sportswear"><label for="shoe-type-nike">Nike Sportswear</label></li>
                                    <li><input type="radio" name="Brand" id="shoe-type-adidas" value="Jordan"><label for="shoe-type-adidas">Jordan</label></li>
                                    <li><input type="radio" name="Brand" id="shoe-type-converse" value="Nike By You"><label for="shoe-type-converse">Nike By You</label></li>
                                    <li><input type="radio" name="Brand" id="shoe-type-puma" value="NikeLab"><label for="shoe-type-puma">NikeLab</label></li>
                                    <li><input type="radio" name="Brand" id="shoe-type-asics" value="ACG"><label for="shoe-type-asics">ACG</label></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="shoe-sports-container">
                        <div class="shoe-sports-heading" onclick="toggleShoeSports()">Sports</div>
                        <div class="shoe-sports collapsed">
                            <ul>
                                <li><input type="radio" name="Sports" id="shoe-sports-Lifestyles" value="Lifestyles"><label for="shoe-sports-Lifestyles">Lifestyles</label></li>
                                <li><input type="radio" name="Sports" id="shoe-sports-Running" value="Running"><label for="shoe-sports-Running">Running</label></li>
                                <li><input type="radio" name="Sports" id="shoe-sports-Tennis" value="Tennis"><label for="shoe-sports-Tennis">Tennis</label></li>
                                <li><input type="radio" name="Sports" id="shoe-sports-Basketball" value="Basketball"><label for="shoe-sports-Basketball">Basketball</label></li>
                                <li><input type="radio" name="Sports" id="shoe-sports-Golf" value="Golf"><label for="shoe-sports-Golf">Golf</label></li>
                            </ul>
                        </div>
                    </div>

                    <style>
                        #shoe-color-Black + label {
                            color: black;
                        }
                        #shoe-color-Blue + label {
                            color: blue;
                        }
                        #shoe-color-Brown + label {
                            color: brown;
                        }
                        #shoe-color-green + label {
                            color: green;
                        }
                        #shoe-color-Grey + label {
                            color: grey;
                        }
                        #shoe-color-Orange + label {
                            color: orange;
                        }
                        #shoe-color-Pink + label {
                            color: pink;
                        }
                        #shoe-color-Red + label {
                            color: red;
                        }
                        #shoe-color-White + label {
                            color: white;
                            background-color: black;
                        }
                        #shoe-color-Yellow + label {
                            color: yellow;
                        }
                    </style>

                    <div class="shoe-color-container">
                        <div class="shoe-color-heading" onclick="toggleShoeColor()">Color</div>
                        <div class="shoe-color collapsed">
                            <div class="shoe-color">
                                <ul>
                                    <li><input type="radio" name="Color" id="shoe-color-Black" value="Black"><label for="shoe-color-Black">Black</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-Blue" value="Blue"><label for="shoe-color-Blue">Blue</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-Brown" value="Brown"><label for="shoe-color-Brown">Brown</label></li>                                    
                                    <li><input type="radio" name="Color" id="shoe-color-Grey" value="Gray"><label for="shoe-color-Grey">Gray</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-Orange" value="Purple"><label for="shoe-color-Orange">Purple</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-Pink" value="Pink"><label for="shoe-color-Pink">Pink</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-Red" value="Red"><label for="shoe-color-Red">Red</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-White" value="White"><label for="shoe-color-White">White</label></li>
                                    <li><input type="radio" name="Color" id="shoe-color-Yellow" value="Yellow"><label for="shoe-color-Yellow">Yellow</label></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="shoe-gen-container">
                        <div class="shoe-gen-heading" onclick="toggleShoeGen()">Gender</div>
                        <div class="shoe-gen collapsed">
                            <div class="shoe-gen">
                                <ul>
                                    <li><input type="radio" name="Gender" id="shoe-gen-Male" value="Male"><label for="shoe-gen-Male">Male</label></li>
                                    <li><input type="radio" name="Gender" id="shoe-gen-Female" value="Female"><label for="shoe-gen-Female">Female</label></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="button">Choose</button> 

                </form>
            </div>


            <!-- ListChose -->



            <!-- Start product -->
            <div class="right-nav-wrapper">

                <div class="right-nav-wrapper">
                    <div class="custom-container">
                        <!-- Nút được tạo bằng Bootstrap -->
                        <button id="expandButton" class="btn btn-primary">Sort By ↖</button>
                        <!-- Nội dung mở rộng -->
                        <div id="expandableContent" class="custom-expandable-content" style="display: none;">
                            <form id="sortForm" action="${pageContext.request.contextPath}/productlist" method="post">
                                <label for="option" class="custom-label">Sort Options:</label>
                                <div class="custom-select-container">
                                    <select id="option" name="sort" class="custom-select" size="3" onchange="submitForm()">
                                        <option value="newest">Newest</option>
                                        <option value="priceAsc">Price: High-Low</option>
                                        <option value="priceDesc">Price: Low-High</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var expandButton = document.getElementById("expandButton");
                        var expandableContent = document.getElementById("expandableContent");
                        var select = document.getElementById('option');

                        // Kiểm tra và khôi phục trạng thái của expandableContent từ localStorage
                        if (localStorage.getItem("expandableContentVisible") === "true") {
                            expandableContent.style.display = "block";
                            expandButton.textContent = "Sort By ↘";
                        } else {
                            expandableContent.style.display = "none";
                            expandButton.textContent = "Sort By ↖";
                        }

                        // Kiểm tra và khôi phục lựa chọn của select từ localStorage
                        var selectedValue = localStorage.getItem("selectedOption");
                        if (selectedValue) {
                            select.value = selectedValue;
                        }

                        expandButton.addEventListener("click", function () {
                            if (expandableContent.style.display === "none") {
                                expandableContent.style.display = "block";
                                expandButton.textContent = "Sort By ↘";
                                localStorage.setItem("expandableContentVisible", "true");
                            } else {
                                expandableContent.style.display = "none";
                                expandButton.textContent = "Sort By ↖";
                                localStorage.setItem("expandableContentVisible", "false");
                            }
                        });
                    });

                    function submitForm() {
                        var select = document.getElementById('option');
                        var selectedValue = select.value;
                        localStorage.setItem("selectedOption", selectedValue); // Lưu lựa chọn vào localStorage
                        document.getElementById('sortForm').submit();
                    }
                </script>


                <!-- Products Start -->
                <div class="container-fluid pt-5 pb-3">
                    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Products</span></h2>
                    <div class="row px-xl-5">   
                        <c:forEach var="item" items="${requestScope.MenuChose}">
                            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                <div class="product-item bg-light mb-4">
                                    <div class="product-img position-relative overflow-hidden">

                                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}${item.getImage()}" alt="">
                                        <!--                                <div class="product-action">
                                                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                                                        </div>-->
                                    </div>
                                    <div class="text-center py-4">
                                        <a class="h6 text-decoration-none text-truncate" href="${pageContext.request.contextPath}/productdetail?shoeid=${item.getId()}">${item.getName()}</a>
                                        <div class="d-flex align-items-center justify-content-center mt-2">
                                            <c:choose>
                                                <c:when test="${item.getPriceDiscount() != 0}">
                                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                                        <h5>$ ${item.getPriceDiscount()}</h5>
                                                        <h6 class="text-muted ml-2"><del>$ ${item.getPrice()}</del></h6>
                                                    </div> 
                                                </c:when>

                                                <c:otherwise>
                                                    <h6><del>$ ${item.getPrice()}</del></h6>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>
                                        <div class="d-flex align-items-center justify-content-center mb-1">
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <small class="fa fa-star text-primary mr-1"></small>
                                            <!--<small>(99)</small>-->
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </c:forEach>
                    </div>
                </div>
                <!-- Products End -->


                <!-- Offer Start -->
                <div class="container-fluid pt-5 pb-3">
                    <div class="row px-xl-5">
                        <div class="col-md-6">
                            <div class="product-offer mb-30" style="height: 300px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/offer-1.jpg" alt="">
                                <div class="offer-text">
                                    <h6 class="text-white text-uppercase">Save 20%</h6>
                                    <h3 class="text-white mb-3">Special Offer</h3>
                                    <a href="" class="btn btn-primary">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product-offer mb-30" style="height: 300px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/offer-2.jpg" alt="">
                                <div class="offer-text">
                                    <h6 class="text-white text-uppercase">Save 20%</h6>
                                    <h3 class="text-white mb-3">Special Offer</h3>
                                    <a href="" class="btn btn-primary">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Offer End -->



            </div>



            <!-- end body -->
        </div>

        <jsp:include page="FooterTag.jsp"></jsp:include>

            <!-- Back to Top -->
            <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets_h/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_h/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="${pageContext.request.contextPath}/assets_h/mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/assets_h/js/main.js"></script>

        <script src="${pageContext.request.contextPath}/assets_pl/js/productListScripts.js"></script>
    </body>

</html>
