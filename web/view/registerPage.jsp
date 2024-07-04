<%-- 
    Document   : registerPage
    Created on : May 24, 2024, 7:44:23 AM
    Author     : VIQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modal.User" %> <!-- Add this line to import the user class -->
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
        <link href="${pageContext.request.contextPath}/assets_h/css/style.css" rel="stylesheet">

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
            .error-message {
                color: red;
                font-size: 14px;
            }
        </style>
    </head>
    <body id="top">
        <!-- Google Tag Manager (noscript) -->
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TAGCODE"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
        <div class="page_loader"></div>
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
                                <a href="${pageContext.request.contextPath}/Home">
                                    <img src="${pageContext.request.contextPath}/assets_lg/img/nike.jpg" alt="logo">
                                </a>
                            </div>
                            <h3>Create an account</h3>
                            <div class="btn-section clearfix">
                                <a href="${pageContext.request.contextPath}/login" class="link-btn active btn-1 default-bg">Login</a>
                                <a href="${pageContext.request.contextPath}/register" class="link-btn btn-2 active-bg">Register</a>
                            </div>
                            <div class="login-inner-form">
                                <form action="${pageContext.request.contextPath}/register" method="POST" >
                                    <% 
                                       User u = (User) request.getAttribute("u"); 
                                       String messName = (String) request.getAttribute("messName");
                                       String messEmail = (String) request.getAttribute("messEmail");
                                       String messPhone = (String) request.getAttribute("messPhone");
                                       String messconfPassword = (String) request.getAttribute("messconfPassword");
                                       String messpass = (String) request.getAttribute("messpass");
                                       String confPassword = (String) request.getAttribute("confPassword");

                                    %>

                                    <div class="form-group form-box">
                                        <input type="text" name="fullname"  class="input-text"  placeholder="Full Name"  value="<%= u != null ? u.getFullname() : "" %>">
                                        <i class="flaticon-user"></i>
                                        <% if (messName != null) { %>
                                        <div id="error-message-email" class="error-message"><%= messName %></div>
                                        <% } %>
                                    </div>  

                                    <div class="form-group form-box">
                                        <input type="text" name="email"  class="input-text"  placeholder="Email Address" value="<%= u != null ? u.getEmail() : "" %>">
                                        <i class="flaticon-mail-2"></i>
                                        <% if (messEmail != null) { %>
                                        <div id="error-message-email" class="error-message"><%= messEmail %></div>
                                        <% } %>
                                    </div>

                                    <div class="form-group form-box">
                                        <input type="number" name="phone" class="input-text"  placeholder="Number Phone" value="<%= u != null ? u.getPhone() : "" %>">
                                        <i class="flaticon-phone"></i>
                                        <% if (messPhone != null) { %>
                                        <div id="error-message-phone" class="error-message"><%= messPhone %></div>
                                        <% } %>  
                                    </div>

                                    <div class="form-group form-box">
                                        <input type="file" name="img"  class="input-text"  placeholder="Img">
                                        <i class="flaticon-picture"></i>
                                    </div>

                                    <div class="form-group form-box">
                                        <input type="password" id="password" name="password"  class="input-text"  placeholder=" Password"value="<%= u != null ? u.getPassword() : "" %>">
                                        <i class="flaticon-password"></i>
                                        <% if (messpass != null) { %>
                                        <div id="error-message-phone" class="error-message"><%= messpass %></div>
                                        <% } %>
                                    </div> 

                                    <div class="form-group form-box">
                                        <input type="password" id="confPassword" name="confPassword" class="input-text"  placeholder="Confirm Password" value="<%= confPassword != null && !confPassword.equals("") ? confPassword : "" %>">
                                        <i class="flaticon-password"></i>
                                        <% if (messconfPassword != null) { %>
                                        <div id="error-message-phone" class="error-message"><%= messconfPassword %></div>
                                        <% } %>
                                    </div> 
                                    <div class="checkbox clearfix">
                                        <!-- Checkbox -->
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="showPassword" value="" onclick="togglePasswordVisibility()" >
                                            <label class="form-check-label" for="showPassword">Show pass</label>
                                        </div>
                                    </div>

                                    <div class="input-group">
                                        <label  class="form-check-label" for="rememberMe">Gender:   </label>
                                        <div class="p-t-10">
                                            <label  class="form-check-label" for="rememberMe">Male
                                                <input type="radio" name="gender" value="male"   checked=""<%= u != null && "male".equals(u.getGender()) ? "checked" : "" %>>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label  class="form-check-label" for="rememberMe">Female
                                                <input type="radio" name="gender" value="female" <%= u != null && "female".equals(u.getGender()) ? "checked" : "" %>>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="checkbox clearfix">
                                        <div class="form-check checkbox-theme">
                                            <input class="form-check-input" type="checkbox" value="" id="agreeTerms" checked="">
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
    </body>
</html>
