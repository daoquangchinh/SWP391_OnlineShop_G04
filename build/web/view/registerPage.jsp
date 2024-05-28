<%-- 
    Document   : registerPage
    Created on : May 24, 2024, 7:44:23 AM
    Author     : Dell
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
                        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-TAGCODE');</script>
        <!-- End Google Tag Manager -->
        <title>Logee - Login and Register HTML5 Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- External CSS libraries -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/css/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/fonts/font-awesome/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/fonts/flaticon/font/flaticon.css">

        <!-- Favicon icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets_lg/img/favicon.ico" type="image/x-icon" >

        <!-- Google fonts -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPoppins:400,500,700,800,900%7CRoboto:100,300,400,400i,500,700">

        <!-- Custom Stylesheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/assets_lg/css/style.css">
        <link rel="stylesheet" type="text/css" id="style_sheet" href="${pageContext.request.contextPath}/assets_lg/css/skins/default.css">
        <style>
            .radio-container b {
                font-weight: bold;
            }
        </style>
    </head>
    <body id="top">
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TAGCODE"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
        <div class="page_loader"></div>

        <!-- Login 11 start -->
        <div class="login-11">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-12 bg-img none-992">
                        <div class="info">
                            <h1>Welcome to Logee</h1>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 bg-color-13">
                        <div class="form-section">
                            <div class="logo clearfix">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/assets_lg/img/logos/logo-2.png" alt="logo">
                                </a>
                            </div>
                            <h3>Create an account</h3>
                            <div class="btn-section clearfix">
                                <a href="/SWP391_OnlineShop_G4/view/loginPage.jsp" class="link-btn active btn-1 default-bg">Login</a>
                                <a href="/SWP391_OnlineShop_G4/view/registerPage.jsp" class="link-btn btn-2 active-bg">Register</a>
                            </div>
                            <div class="login-inner-form">
                                <form action="${pageContext.request.contextPath}/register" method="POST">
                                    <div class="form-group form-box">
                                        <input type="text" name="fullname" class="input-text" placeholder="Full Name">
                                        <i class="flaticon-user"></i>
                                    </div>
                                    <div class="form-group form-box">
                                        <input type="email" name="email" class="input-text" placeholder="Email Address">
                                        <i class="flaticon-mail-2"></i>
                                    </div>
                                    <div class="form-group form-box">
                                        <input type="number" name="phone" class="input-text" placeholder="Number Phone">
                                        <i class="flaticon-phone"></i>
                                    </div>
                                    <div class="form-group form-box">
                                        <input type="file" name="img" class="input-text" placeholder="Img">
                                        <i class="flaticon-picture"></i>
                                    </div>
                                    <div class="form-group form-box">
                                        <input type="password" name="password" class="input-text" placeholder="Password">
                                        <i class="flaticon-password"></i>
                                    </div> 

                                    <div class="input-group">
                                        <label class="label">Gender:   </label>
                                        <div class="p-t-10">
                                            <label class="radio-container m-r-45">Male
                                                <input type="radio" checked="checked" name="gender" value="male">
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio-container">Female
                                                <input type="radio" name="gender" value="female">
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="checkbox clearfix">
                                        <div class="form-check checkbox-theme">
                                            <input class="form-check-input" type="checkbox" value="" id="agreeTerms">
                                            <label class="form-check-label" for="agreeTerms">
                                                I agree to the <a href="#">terms of service</a>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn-md btn-theme btn-block">Register</button>
                                    </div>
                                </form>
                            </div>
                            <div class="social-list">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login 11 end -->

        <!-- External JS libraries -->
        <script src="${pageContext.request.contextPath}/assets_lg/js/jquery-2.2.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_lg/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_lg/js/bootstrap.min.js"></script>
        <!-- Custom JS Script -->

    </body>
</html>
