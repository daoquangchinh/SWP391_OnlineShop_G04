<%-- 
    Document   : MyBookingList
    Created on : Apr 21, 2024, 8:38:26 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            href="css_toichoi/vendor/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link
            href="css_toichoi/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="css_toichoi/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
        <link href="css_toichoi/vendor/quill/quill.snow.css" rel="stylesheet" />
        <link href="css_toichoi/vendor/quill/quill.bubble.css" rel="stylesheet" />
        <link href="css_toichoivendor/remixicon/remixicon.css" rel="stylesheet" />
        <link href="css_toichoi/vendor/simple-datatables/style.css" rel="stylesheet" />
    </head>
    <body>
        <jsp:include page="AdminHeader.jsp" />

        <jsp:include page="AdminNabvar.jsp" />
        <main id="main" class="main">
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Danh sách đặt phòng</h5>

                                <!-- Default Table -->
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Tòa nhà</th>
                                            <th scope="col">Loại phòng</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Tên phòng</th>
                                            <th scope="col">Ngày bắt đầu ở</th>
                                            <th scope="col">Ngày kết thúc</th>
                                            <th scope="col">Trang thai</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="x" items="${sessionScope.list_bhr}">
                                            <tr>
                                                <td>${x.name_building}</td>
                                                <td>${x.name_type_room}</td>
                                                <td>${x.price}</td>
                                                <td>${x.name_room}</td>
                                                <td>${x.start_date}</td>
                                                <td>${x.end_date}</td>
                                                <td>${x.status}</td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                                <!-- End Default Table Example -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- comment -->
            </section>
        </main>
    </body>
</html>
