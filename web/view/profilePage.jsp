<%-- 
    Document   : profilePage
    Created on : May 28, 2024, 10:48:35 AM
    Author     : ViQuan
--%>
<%@ page import="modal.User, modal.OrderView" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.css">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Custom Styles -->
        <style>
            .card-body img {
                width: 150px;
                height: 150px;
                object-fit: cover;
                border-radius: 50%;
            }
            .action-button {
                padding: 6px 12px;
                background-color: #007bff;
                color: #fff;
                border: none;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            .action-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <jsp:include page="homeTag.jsp"></jsp:include>
            <h1 style="margin-left: 50px">User Profile</h1>
            <div class="container mt-5">
            <c:if test="${empty sessionScope.acc}">
                <p>Bạn chưa đăng nhập. Vui lòng <a href="${pageContext.request.contextPath}/login">đăng nhập</a>.</p>
            </c:if>
            <c:if test="${not empty sessionScope.acc}">
                <div class="row mb-4">
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="${not empty sessionScope.acc.img ? sessionScope.acc.img : 'https://cellphones.com.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg'}" alt="avatar" class="rounded-circle img-fluid">
                                <h5 class="my-3">${sessionScope.acc.username}</h5>
                            </div>
                            <div class="d-flex justify-content-center mb-2">
                                <a href="${pageContext.request.contextPath}/edProfile">
                                    <button type="button" class="btn btn-primary ms-1">Edit Profile</button>
                                </a>
                                <a href="${pageContext.request.contextPath}/changePass">
                                    <button type="button" class="btn btn-outline-primary ms-1">Change Password</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name:</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.acc.fullname}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email:</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.acc.email}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone:</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.acc.phone}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Gender:</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.acc.gender}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address:</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">Bay Area, San Francisco, CA</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Order History</h5>
                        <table id="orderTable" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Ngày mua</th>
                                    <th>Phương thức giao dịch</th>
                                    <th>Tổng đơn</th>
                                    <th>Trạng thái</th>
                                    <th>Đơn hàng thanh toán</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Dữ liệu sẽ được thêm vào đây từ JavaScript -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>
        </div>

        <jsp:include page="FooterTag.jsp"></jsp:include>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>
            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/profile',
                        type: 'POST',
                        dataType: 'json',
                        success: function (data) {
                            $('#orderTable').DataTable({
                                data: data,
                                columns: [
                                    {data: 'orderDate'},
                                    {data: 'paymentMethodId'},
                                    {data: 'total'},
                                    {
                                        data: 'statusId',
                                        render: function (data) {
                                            switch (data) {
                                                case 'Order':
                                                    return '<span class="badge badge-info">' + data + '</span>';
                                                case 'Delivery':
                                                    return '<span class="badge badge-primary">' + data + '</span>';
                                                case 'Receive':
                                                    return '<span class="badge badge-success">' + data + '</span>';
                                                case 'Cancel order':
                                                    return '<span class="badge badge-danger">' + data + '</span>';
                                                default:
                                                    return '<span class="badge badge-secondary">' + data + '</span>';
                                            }
                                        }
                                    },
                                    {data: 'paymentStatus',
                                        render: function (data) {
                                            switch (data) {
                                                case 'Đã thanh toán':
                                                    return '<span class="badge badge-success">' + data + '</span>';
                                                case 'Chưa thanh toán':
                                                    return '<span class="badge badge-warning">' + data + '</span>';
                                                default:
                                                    return '<span class="badge badge-danger">' + data + '</span>';
                                            }
                                        }
                                    },
                                    {
                                        data: null,
                                        render: function (data) {
                                            return '<a href="/viewOrderDetails?id=' + data.id + '" class="btn btn-primary btn-sm">View Detail</a>';
                                        }
                                    }
                                ],
                                order: [[0, 'desc']] // Sắp xếp cột đầu tiên (orderDate) theo thứ tự tăng dần

                            });
                        },
                        error: function (xhr, status, error) {
                            console.error('Error fetching data from server:', error);
                        }
                    });
                });

        </script>
    </body>
</html>
