<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : homePage
    Created on : May 23, 2024, 10:48:35 AM
    Author     : ViQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="ht        <link rel="preconnect" href="https://fonts.gstatic.com">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets_h/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets_h/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets_h/css/style.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="homeTag.jsp"></jsp:include>
            <!-- Carousel Start -->
            <div class="container-fluid mb-3">
                <div class="row px-xl-5">
                    <div class="col-lg-8">
                        <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#header-carousel" data-slide-to="1"></li>
                                <li data-target="#header-carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item position-relative active" style="height: 430px;">
                                    <img class="position-absolute w-100 h-100" src="${pageContext.request.contextPath}/img/img_sports/men.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Men Fashion ${listBrands.size()}</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">iscover the latest trends in men's fashion with our exclusive collection. Stylish, modern, and designed for comfort.</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="${pageContext.request.contextPath}/img/img_sports/women.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Women Fashion</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Explore our chic and elegant women's fashion collection. Perfect for every occasion, from casual to formal.</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item position-relative" style="height: 430px;">
                                <img class="position-absolute w-100 h-100" src="${pageContext.request.contextPath}/img/img_sports/kids.jpg" style="object-fit: cover;">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Kids Fashion</h1>
                                        <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Fun, colorful, and comfy styles for kids. Let your little ones shine with our trendy kids' fashion collection.</p>
                                        <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/sale2.jpg" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 20%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                    <div class="product-offer mb-30" style="height: 200px;">
                        <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/sale3.jpg" alt="">
                        <div class="offer-text">
                            <h6 class="text-white text-uppercase">Save 30%</h6>
                            <h3 class="text-white mb-3">Special Offer</h3>
                            <a href="" class="btn btn-primary">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!--         Categories Start 
        --><div class="container-fluid pt-5">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Shop by Sport</span></h2>
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="">
                        <div class="cat-item d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/basketball.jpg" alt="">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Nike Basketball</h6>
                                <small class="text-body">100 Products</small>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/golf.jpg" alt="">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Nike Golf</h6>
                                <small class="text-body">100 Products</small>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/tennis.jpg" alt="">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Nike tennis</h6>
                                <small class="text-body">100 Products</small>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/running.jpg" alt="">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Nike Running</h6>
                                <small class="text-body">100 Products</small>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/fb.jpg" alt="">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Nike Running</h6>
                                <small class="text-body">100 Products</small>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                    <a class="text-decoration-none" href="">
                        <div class="cat-item img-zoom d-flex align-items-center mb-4">
                            <div class="overflow-hidden" style="width: 100px; height: 100px;">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/img/img_sports/volleyball.jpg" alt="">
                            </div>
                            <div class="flex-fill pl-3">
                                <h6>Nike Volleyball</h6>
                                <small class="text-body">100 Products</small>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div><!--
         Categories End -->





        <!-- Products Start -->
        
        <div class="container-fluid pt-5 pb-3">
                    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Products</span></h2>
                    <div class="row px-xl-5">   
                        <c:forEach var="item" items="${requestScope.listShoes}">
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











        <jsp:include page="FooterTag.jsp"></jsp:include>

            <!-- Back to Top -->
            <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <script src="${pageContext.request.contextPath}/assets_h/js/main.js"></script>
            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets_h/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_h/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="${pageContext.request.contextPath}/assets_h/mail/jqBootstrapValidation.min.js"></script>

        <!-- Template Javascript -->
    </body>

</html>
