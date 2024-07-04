<%-- Your existing JSP code --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link href="${pageContext.request.contextPath}/assets_cart/styles.css" rel="stylesheet">
       
    </head>
    <body>
        <div id="includedContent">
            <jsp:include page="view/homeTag.jsp">
                <jsp:param name="quantityCartItem" value="${quantityCartItem}" />
            </jsp:include>
        </div>
        <button id="checkButton">Check</button>
        <h1>Hello World!</h1>
        <div class="footer" >
            <div class="row">
                <div class="nhom col-lg-12">
                    <div class="col-lg-6">
                        <div class="product">
                            <input class="checkbox_input item-checkbox" type="checkbox">
                            <a title="shoe" href="#">
                                <img class="product_img"  alt="product image">
                            </a>
                            <div class="c54pg1 col-lg-4">
                                <a title="shoe1">shoe name</a>
                                <div class="co-inspection"><span>Free exchange 15 days</span></div>
                                <img class="ship_img" src="https://down-vn.img.susercontent.com/file/vn-50009109-adeb9f40700bf1e29996a6caf07746e2" alt="loading..">
                                <div class="gvFc9h"></div>
                            </div>
                            <div class="col-lg-3" style="left: 30px;">
                                <div class="qNRZqG1 dropdown">
                                    <button class="mM4TZ8 dropdown-toggle btn" data-toggle="dropdown">
                                        <div class="iIg1CN" >Product classification:</div>
                                        <div class="iIg1CN product-classification">red, 39</div>
                                    </button>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="nhom">
                                <div class="col-lg-3 nhom1">
                                    <div class="vjkBXu priceform" >₫200</div>
                                </div>
                                <div class="col-lg-3 nhom1">
                                    <div class="GpmJtT">
                                        <!--thay đổi khi dùng button--> 
                                        <button class="WNSVcC decrement">
                                            <span class="sapn01">-</span>
                                        </button>
                                        <!--thay đổi khi nhập dữ liệu-->
                                        <input class="WNSVcC g2m9n4 quantity" type="text"  >
                                        <button class="WNSVcC increment">
                                            <span class="sapn01">+</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-lg-3 nhom1">
                                    <div class="total-price priceform sapn02" >₫100</div>
                                </div>
                                <div class="col-lg-3 nhom1">
                                    <button >Delete</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlay">Sản phẩm này đã bị xóa</div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--        <script>
            $(document).ready(function () {
                $(".footer").append('<div class="overlay">Sản phẩm này đã bị xóa</div>');
            });
        </script>-->
        <script>
            $(document).ready(function () {
                // Handle click event for "check" button
                $("#checkButton").click(function () {
                    // Perform AJAX request to reload quantityCartItem
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/NewServlet", // Replace with your Servlet URL
                        dataType: "json", // Expect JSON response
                        success: function (data) {
                            // Update the included content with new quantityCartItem value
                            $("#includedContent").load("view/homeTag.jsp", {quantityCartItem: data.quantityCartItem});
                        },
                        error: function (xhr, status, error) {
                            console.error("Error loading quantityCartItem:", error);
                        }
                    });
                });
            });

        </script>

    </body>
</html>
