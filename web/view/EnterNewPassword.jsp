<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }
        </style>
    </head>

    <body>
        <div class="form-gap"></div>
        <div class="container">
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
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3>
                                    <i class="fa fa-lock fa-4x"></i>
                                </h3>
                                <h2 class="text-center">Nhập mật khẩu</h2>
                                <% if (request.getAttribute("message") != null) { 
                                    out.print("<p class='text-danger ml-1'>" + request.getAttribute("message") + "</p>"); 
                                } %>
                                <!-- quan merge -->
                                <form id="register-form" action="${pageContext.request.contextPath}/validatePassword" role="form" autocomplete="off" class="form" method="post">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <input id="otp" name="passValue" placeholder="Nhập mật khẩu" class="form-control" type="text" required="required">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input id="submitBtn" name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Đổi mật khẩu" type="submit">
                                    </div>
                                    <input type="hidden" class="hide" name="token" id="token" value="">
                                </form>
                                <p id="countdown" class="text-danger"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
