<%-- 
    Document   : UserDetailByAdmin
    Created on : Jan 22, 2024, 5:02:26 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="author" content="CodeHim" />
        <title>Responsive & sortable Bootstrap data table Example</title>

        <link href="assets/img/favicon.png" rel="icon" />
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect" />
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet"
            />

        <!-- Vendor CSS Files -->
        <link
            href="assets/vendor/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link
            href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" />
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
        <link href="assets/remixicon/remixicon.css" rel="stylesheet" />
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet" />

        <link rel="stylesheet" href="assets/css/style.css"/>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css"
            />
        
        <link
            rel="stylesheet"
            href="https://cdn.datatables.net/1.13.5/css/dataTables.bootstrap5.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    </head>

    <body>





        <jsp:include page="AdminHeader.jsp" />

        <jsp:include page="AdminNabvar.jsp" />



        <main id="main" class="main">

            <div class="pagetitle">
                <h1><a href="account">Danh sach tai khoan</a>/ Thong tin tai khoan</h1>

            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">

                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                                <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
                                <h2>${requestScope.username}</h2>

                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                   
                                   



                                </ul>
                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview" id="profile-overview" >

                                        <h5 class="card-title">thong tin chi tiet tai khoan</h5>



                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label "> Name</div>
                                            <div class="col-lg-9 col-md-8">${requestScope.name}</div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">email</div>
                                            <div class="col-lg-9 col-md-8">${requestScope.email}</div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">phone</div>
                                            <div class="col-lg-9 col-md-8">${requestScope.phone}</div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Gioi tinh </div>
                                            <div class="col-lg-9 col-md-8">${requestScope.gender}</div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">dia chi </div>
                                            <div class="col-lg-9 col-md-8"></div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">vai tro hien tai</div>
                                            <div class="col-lg-9 col-md-8">users</div>
                                        </div>



                                    </div>

                                    

                                </div>

                                
                            </div><!-- End Bordered Tabs -->

                        </div>
                    </div>

                </div>
                </div>
            </section>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->


        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


        <script>
            function confirmSubmit() {
                return confirm("Do you want to change your personal information?");
            }
        </script>
        <script>
            // Kích hoạt tab "Change Password" khi trang đã được tải và requestScope changepass tồn tại
            document.addEventListener("DOMContentLoaded", function () {
                var tabChangePassword = document.querySelector('[data-bs-target="#profile-change-password"]');
                if (tabChangePassword && "${requestScope.changepass}" === "changepass") {
                    tabChangePassword.click(); // Kích hoạt sự kiện click trên nút "Change Password"
                }
            });
        </script>




        <script src="assets/js/main.js"></script>

    </body>

</html>