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
                                <li><input type="radio" name="price" id="price-option-1" value="1"><label for="price-option-1">1.000.000₫ - 2.000.000₫</label></li>
                                <li><input type="radio" name="price" id="price-option-2" value="2"><label for="price-option-2">2.000.000₫ - 3.000.000₫</label></li>
                                <li><input type="radio" name="price" id="price-option-3" value="3"><label for="price-option-3">3.000.000₫ - 5.000.000₫</label></li>
                                <li><input type="radio" name="price" id="price-option-4" value="5"><label for="price-option-4">5.000.000₫ - 10.000.000₫</label></li>
                            </ul>
                        </div>
                    </div>

                    <div class="size-container">
                        <div class="size-heading" onclick="toggleSizeOptions()">Size</div>
                        <div class="size-options collapsed">
                            <div class="size-options">
                                <ul>
                                    <li><input type="radio" name="size" id="size-option-39" value="39"><label for="size-option-39">Size 39</label></li>
                                    <li><input type="radio" name="size" id="size-option-40" value="40"><label for="size-option-40">Size 40</label></li>
                                    <li><input type="radio" name="size" id="size-option-41" value="41"><label for="size-option-41">Size 41</label></li>
                                    <li><input type="radio" name="size" id="size-option-42" value="42"><label for="size-option-42">Size 42</label></li>
                                    <li><input type="radio" name="size" id="size-option-43" value="43"><label for="size-option-43">Size 43</label></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="shoe-type-container">
                        <div class="shoe-type-heading" onclick="toggleShoeTypeOptions()">Shoe Type</div>
                        <div class="shoe-type-options collapsed">
                            <div class="shoe-type-options">
                                <ul>
                                    <li><input type="radio" name="shoe-type" id="shoe-type-nike" value="1"><label for="shoe-type-nike">Nike</label></li>
                                    <li><input type="radio" name="shoe-type" id="shoe-type-air-jordan" value="2"><label for="shoe-type-air-jordan">Air Jordan</label></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="shoe-sports-container">
                        <div class="shoe-sports-heading" onclick="toggleShoeSports()">Sports</div>
                        <div class="shoe-sports collapsed"> <!-- Thêm lớp 'collapsed' ở đây -->
                            <ul>
                                <li><input type="radio" name="shoe-type" id="shoe-sports-w" value="1"><label for="shoe-sports-w">W</label></li>
                                <li><input type="radio" name="shoe-type" id="shoe-sports-B" value="2"><label for="shoe-sports-B">B</label></li>
                            </ul>
                        </div>
                    </div>

                    <div class="shoe-color-container">
                        <div class="shoe-color-heading" onclick="toggleShoeColor()()">Color</div>
                        <div class="shoe-color collapsed">
                            <div class="shoe-color">
                                <ul>
                                    <li><input type="radio" name="shoe-type" id="shoe-color-W" value="1"><label for="shoe-color-W">W</label></li>
                                    <li><input type="radio" name="shoe-type" id="shoe-color-B" value="2"><label for="shoe-color-B">B</label></li>
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

                <div class="custom-container">
                    <!-- Nút được tạo bằng Bootstrap -->
                    <button id="expandButton" class="btn btn-primary">Sort By ↖</button>
                    <!-- Nội dung mở rộng -->
                    <div id="expandableContent" class="custom-expandable-content">
                        <label for="option" class="custom-label"></label>
                        <div class="custom-select-container">
                            <select id="option" class="custom-select" size="4">
                                <option value="option1">Option 1</option>
                                <option value="option2">Option 2</option>
                                <option value="option3">Option 3</option>
                                <option value="option3">Option 3</option>
                            </select>
                        </div>
                    </div>
                </div>


                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        var expandButton = document.getElementById("expandButton");
                        var expandableContent = document.getElementById("expandableContent");

                        // Ẩn nội dung mở rộng khi trang được tải
                        expandableContent.style.display = "none";

                        expandButton.addEventListener("click", function () {
                            if (expandableContent.style.display === "none") {
                                expandableContent.style.display = "block";
                                expandButton.textContent = "Sort By ↘";
                            } else {
                                expandableContent.style.display = "none";
                                expandButton.textContent = "Sort By ↖";
                            }
                        });
                    });
                </script>


                <!-- Categories Start -->
                <div class="container-fluid pt-5">
                    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
                    <div class="row px-xl-5 pb-3">
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-1.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-2.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-3.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-4.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-4.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-3.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-2.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-1.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-2.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-1.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-4.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                            <a class="text-decoration-none" href="">
                                <div class="cat-item img-zoom d-flex align-items-center mb-4">
                                    <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/assets_h/img/cat-3.jpg" alt="">
                                    </div>
                                    <div class="flex-fill pl-3">
                                        <h6>Category Name</h6>
                                        <small class="text-body">100 Products</small>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Categories End -->


                <!-- Products Start -->
                <div class="container-fluid pt-5 pb-3">
                    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Products</span></h2>
                    <div class="row px-xl-5">   
                            <c:forEach var="item" items="${MenuChose}">
                                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                                    <div class="product-item bg-light mb-4">
                                        <div class="product-img position-relative overflow-hidden">
                                            <img class="img-fluid w-100" src="${item.getImage()}" alt="">
                                            <!--                                <div class="product-action">
                                                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                                                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                                                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                                                            </div>-->
                                        </div>
                                        <div class="text-center py-4">
                                            <a class="h6 text-decoration-none text-truncate" href="">${item.getName()}</a>
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
