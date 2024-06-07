<%-- 
    Document   : editProfile
    Created on : May 29, 2024, 10:42:14 PM
    Author     : ViQuan
--%>

<%@ page import="modal.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>  
        <title>ShoeShop - Online Shop </title>
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
        <style>
            .breadcrumb {
                background-color: #eee;
            }
            .card-body img {
                width: 150px;
            }
            .progress {
                height: 5px;
            }
            .error-message {
                color: red;
                font-family: 'Arial', sans-serif; /* Đổi sang phông chữ bạn muốn */
                font-size: 14px; /* Kích thước phông chữ */
                font-weight: bold; /* Độ đậm của phông chữ */
            }
            .radio-container b {
                font-weight: bold;
            }
            .error-message {
                color: red;
                font-size: 14px;
            }
            .form-box {
                border: 1px solid #ccc;
                background-color: #f9f9f9;
                float: left;
                width: 90%;
                padding: 11px 45px 11px 20px;
                border-radius: 50px;
                margin-bottom: 0px;
            }

        </style>
    </head>

    <body id="top">
        <jsp:include page="homeTag.jsp"></jsp:include>
        <%
      // Lấy đối tượng user từ session
      User u = (User) session.getAttribute("acc");
      String phone = (String) request.getAttribute("phone");
      String messPhone = (String) request.getAttribute("messPhone");
      String fullname = (String) request.getAttribute("fullname");
      String messname = (String) request.getAttribute("messname");
      // Kiểm tra xem người dùng có đăng nhập không
      if (u != null) {
      String displayedFullName = (fullname != null && !fullname.isEmpty()) ? fullname : u.getFullname();
      String imgSrc = u.getImg();
   if (imgSrc == null || imgSrc.isEmpty()) {
       imgSrc = "https://cellphones.com.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg";
   }
        %>


        <h1>User Profile</h1>
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="<%= imgSrc %>" alt="avatar"
                             class="rounded-circle img-fluid">
                        <h5 class="my-3"><%= u.getUsername() %></h5>
                    </div>

                </div>
                <div class="card mb-4 mb-lg-0">
                    <div class="card-body p-0">
                        <ul class="list-group list-group-flush rounded-3">
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <p class="mb-0" style="margin-top: 15px;">https://mdbootstrap.com</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-github fa-lg text-body"></i>
                                <p class="mb-0" style="margin-top: 15px;">mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                <p class="mb-0" style="margin-top: 15px;">@mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                <p class="mb-0" style="margin-top: 15px;">mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                <p class="mb-0" style="margin-top: 15px;">mdbootstrap</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <!-- Hiển thị các thông tin khác của người dùng -->

            <div class="col-lg-8 ">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/edProfile" method="POST">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0" style="margin-top: 15px;" style="margin-top: 15px;">Full Name</p>
                                </div>
                                <div class="col-sm-9 ">
                                    <div class="form-group  ">
                                        <input type="text" name="fullname"  class="input-text form-box" required="" placeholder="Full Name" required="" value="<%= displayedFullName %>">
                                        <i class="flaticon-user"></i>
                                         <br> <br> 
                                        <% if (messname != null) { %>
                                        <div class="error-message"><%= messname %></div>
                                        <% } %>
                                    </div>  
                                </div>
                            </div>

                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0" style="margin-top: 15px;" >Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <div class="form-group " >
                                        <p type="email" name="email"  class="input-text form-box" required="" placeholder="Email Address" ><%=u.getEmail()%></p>
                                        <i class="flaticon-mail-2"></i>
                                    </div>                            
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0" style="margin-top: 15px;">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <div class="form-group">
                                        <input type="number" name="phone"  class="input-text form-box" required="" placeholder="Number Phone" value="<%= phone != null ?  phone : u.getPhone() %>">
                                        <i class="flaticon-phone"></i>
                                    </div>       <br> <br> 
                                        <% if (messPhone != null) { %>
                                        <div class="error-message"><%= messPhone %></div>
                                        <% } %>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0" >Gender</p>
                                </div>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="p-t-10">
                                            <label class="radio-container m-r-45">Male
                                                <input type="radio" name="gender" value="male" checked="" <%= u != null && "male".equals(u.getGender()) ? "checked" : "" %>>
                                                <span class="checkmark"></span>
                                            </label>
                                            <label class="radio-container">Female
                                                <input type="radio" name="gender" value="female" <%= u != null && "female".equals(u.getGender()) ? "checked" : "" %>>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0" style="margin-top: 15px;">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0 form-box">Bay Area, San Francisco, CA</p>
                                </div>
                            </div>


                    </div>

                </div> 
                <div class="col-sm-12">
                    <div class="d-flex justify-content-center mb-2">
                        <button type="submit"class="btn btn-primary ms-1">Save Profile</button>
                        <a href="${pageContext.request.contextPath}/logout"><button type="button" class="btn  btn-outline-primary ms-1 ">Logout</button></a>
                    </div>
                </div>
                </form>


                <div class="row">
                    <div class="col-md-6">
                        <div class="card mb-4 mb-md-0">
                            <div class="card-body">
                                <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                                </p>
                                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                <div class="progress rounded mb-2">
                                    <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>  
                    </div>
                    <div class="col-md-6">
                        <div class="card mb-4 mb-md-0">
                            <div class="card-body">
                                <p class="mb-4"><span class="text-primary font-italic me-1">assigment</span> Project Status
                                </p>
                                <p class="mb-1" style="font-size: .77rem;">Web Design</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">Website Markup</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 72%" aria-valuenow="72"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">One Page</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 89%" aria-valuenow="89"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">Mobile Template</p>
                                <div class="progress rounded">
                                    <div class="progress-bar" role="progressbar" style="width: 55%" aria-valuenow="55"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <p class="mt-4 mb-1" style="font-size: .77rem;">Backend API</p>
                                <div class="progress rounded mb-2">
                                    <div class="progress-bar" role="progressbar" style="width: 66%" aria-valuenow="66"
                                         aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%
                    } else {
    %>
    <p>Bạn chưa đăng nhập. Vui lòng <a href="${pageContext.request.contextPath}/login">đăng nhập</a>.</p>
    <%
        }
    %>
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
</body>

</html>
