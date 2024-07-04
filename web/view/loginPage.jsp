<%-- 
    Document   : login
    Created on : May 24, 2024, 7:31:37 AM
    Author     : ViQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Google Tag Manager -->
        <script>(function (w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({'gtm.start':
                            new Date().getTime(), event: 'gtm.js'});
                var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s), dl = l !== 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-TAGCODE');</script>
        <!-- End Google Tag Manager -->
        <title>ShoeShop - Online Shop </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- External CSS libraries -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/fonts/font-awesome/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/fonts/flaticon/font/flaticon.css">
        <!-- Favicon icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets_lg/img/favicon.jpg" type="image/x-icon" >

        <!-- Google fonts -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPoppins:400,500,700,800,900%7CRoboto:100,300,400,400i,500,700">
        <link href="${pageContext.request.contextPath}/assets_h/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- Custom Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/css/style.css">
        <style>
            .error-message {
                color: red;
                font-family: 'Arial', sans-serif; /* Đổi sang phông chữ bạn muốn */
                font-size: 14px; /* Kích thước phông chữ */
                font-weight: bold; /* Độ đậm của phông chữ */
            }
        </style>
    </head>
    <body id="top">
        <% 
                                      String mess = (String) request.getAttribute("mess");
                                      String name = (String) request.getAttribute("name");
        %>
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TAGCODE"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
        <div class="page_loader"></div>

        <!-- Login 11 start -->
        <div class="login-11">
            <div class="container-fluid">
                <div class="col-lg-4">
                    <a href="${pageContext.request.contextPath}/Home" class="text-decoration-none"style="    position: fixed;
                       left: 0;
                       top: 0;
                       z-index: 1000;
                       box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);">
                        <span class="h1 text-uppercase text-primary bg-dark px-2">Multi</span>
                        <span  class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
                    </a>
                </div>
                <!--                <div class="login-11">
                                    <div class="container-fluid">
                                         Thêm biểu tượng home từ Font Awesome 
                                        <a class="active" href="${pageContext.request.contextPath}/Home">
                                            <i class="fas fa-home">Home</i>
                                        </a>
                                         Các phần còn lại của mã HTML không thay đổi 
                                    </div>
                                </div>-->
                <div class="row">
                    <div class="col-lg-6 col-md-12 bg-img none-992">
                        <div class="info">
                            <h1>Welcome to Shop</h1>
                            <p>Your destination for stylish and high-quality shoes. From athletic to office shoes, we have the perfect options for you. Visit Shop today!</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 bg-color-13">
                        <div class="form-section">
                            <div class="logo clearfix">

                                <a href="${pageContext.request.contextPath}/Home">
                                    <img src="${pageContext.request.contextPath}/assets_lg/img/nike.jpg" alt="logo">
                                </a>
                            </div>
                            <h3>Sign into your account</h3>
                            <div class="btn-section clearfix">
                                <a href="${pageContext.request.contextPath}/login" class="link-btn active btn-1 active-bg">Login</a>
                                <a href="${pageContext.request.contextPath}/register" class="link-btn btn-2 default-bg">Register</a>
                            </div> 
                            <div class="login-inner-form">
                                <form action="${pageContext.request.contextPath}/login" method="POST">
                                    <div class="form-group form-box">
                                        <input type="text" name="name" class="input-text" placeholder="Email Address" value="<%= name != null ? name : "" %>">
                                        <i class="flaticon-mail-2"></i>
                                    </div>
                                    <div class="form-group form-box">
                                        <input type="password" name="pass" class="input-text" id="password"  placeholder="Password" >
                                        <i class="flaticon-password"></i>
                                    </div>
                                    <% if (mess != null) { %>
                                    <div class="error-message"><%= mess %></div>
                                    <% } %>
                                    <div class="checkbox clearfix">
                                        <!-- Checkbox -->
                                        <div class="form-check checkbox-theme">
                                            <input class="form-check-input" type="checkbox" id="showPassword" name="showPassword"   onclick="togglePasswordVisibility()" >
                                            <label class="form-check-label" for="showPassword">Show pass</label>
                                        </div>
                                    </div>
                                    <div class="checkbox clearfix">

                                        <a href="${pageContext.request.contextPath}/forgotPassword">Forgot Password</a>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn-md btn-theme btn-block">Login</button>
                                        <a class="btn-md btn-theme btn-block" style="background: #db4437" href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:9999/SWP391_OnlineShop_G4/loginGoogle&response_type=code&client_id=1010233504049-oh58d8og1veov7smdtb443ub2f490kap.apps.googleusercontent.com&approval_prompt=force">
                                            <i class="fab fa-google"></i> Sign in with Google.
                                        </a>

                                    </div>
                                </form>
                            </div>
                            <!--                            <div class="social-list">
                                                            <a href="#" class="facebook-bg">
                                                                <i class="fa fa-facebook"></i>
                                                            </a>
                                                            <a href="#" class="twitter-bg">
                                                                <i class="fa fa-twitter"></i>
                                                            </a>
                                                            <a href="#" class="google-bg">
                                                                <i class="fa fa-google"></i>
                                                            </a>
                                                            <a href="#" class="linkedin-bg">
                                                                <i class="fa fa-linkedin"></i>
                                                            </a>
                                                            <a href="#" class="pinterest-bg">
                                                                <i class="fa fa-pinterest"></i>
                                                            </a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login 11 end -->
        <script>
            function togglePasswordVisibility() {
                var passwordField = document.getElementById('password');
                var confPasswordField = document.getElementById('confPassword');
                var showPasswordCheckbox = document.getElementById('showPassword');
                if (showPasswordCheckbox.checked) {
                    passwordField.type = 'text';
                    confPasswordField.type = 'text';
                } else {
                    passwordField.type = 'password';
                    confPasswordField.type = 'password';
                }
            }
        </script>
        <!-- External JS libraries -->
        <script src="${pageContext.request.contextPath}/assets_lg/js/jquery-2.2.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_lg/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_lg/js/bootstrap.min.js"></script>
        <!-- Custom JS Script -->

    </body>
</html>
