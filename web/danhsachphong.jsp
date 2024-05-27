<%-- 
    Document   : RoomList
    Created on : Apr 13, 2024, 8:54:18 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <!-- Data Table CSS -->
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
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Danh sách tai khoan</h5>
                                <form action="account" method="post">
                                    <div class="filter" style="display: flex ; gap: 20px">
                                        <div class="section section1">
                                            <select id="roles" class="check" name="role" >
                                                <option value="default">Chọn vai tro</option>
                                                <c:forEach var="uni" items="${sessionScope.list_roles}">
                                                    <option ${requestScope.tagRole == uni ? "selected" : "" } value="${uni}">${uni}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="section section77">
                                            <select id="status" class="check" name="status" >
                                                <option value="default">Chọn trang thai</option>
                                                <option  value="1" ${requestScope.tagStatus == '1' ? "selected" : ""}>hoat dong</option>
                                                <option  value="0" ${requestScope.tagStatus == '0' ? "selected" : ""}>khong hoat dong</option>
                                            </select>
                                        </div>
                                        <div class="section section7">
                                            <input class="check" id="username" type="text" placeholder="Nhập username" value="${requestScope.username}" name="username" />
                                        </div>
                                        <div class="section section2">
                                            <input class="check" id="fullname" type="text" placeholder="Nhập ten " value="${requestScope.fullname}" name="fullname" />
                                        </div>
                                        <div class="section section3">
                                            <input class="check" id="email" type="text" placeholder="Nhập email" value="${requestScope.email}" name="email" />
                                        </div>
                                        <div class="section section4">
                                            <input class="check" id="mobile" type="text" placeholder="Nhập dien thoai" value="${requestScope.mobile}" name="mobile" />
                                        </div>
                                        <div class="section section5">
                                            <input type="submit" value="Tìm Kiếm" />
                                        </div>
                                        <div class="section section5">
                                            <input type="button" value="Reset" onclick="resetForm()" />
                                        </div>

                                    </div>
                                </form>

                                <!-- Default Table -->
                                <table class="table">
                                    <thead>
                                        <tr>

                                            <th>username</th>
                                            <th>ten</th>
                                            <th>email</th>
                                            <th>so dien thoai</th>
                                            <th>vai tro</th>
                                            <th>trang thai hoat dong</th>
                                            <th>Thông tin chi tiết</th>
                                            <th>Thay đổi trạng thái</th>
                                        </tr>
                                    </thead>
                                    <tbody id="room_list_tbody">

                                        <c:forEach var="uni" items="${list_users}">
                                            <tr id="${uni.id}">

                                                <td>${uni.username}</td>
                                                <td>${uni.fullname}</td>
                                                <td>${uni.email}</td>
                                                <td>${uni.phone}</td>
                                                <td>${uni.rolename}</td>

                                                <td>${uni.status == '1' ? 'Đang hoạt động' : 'Không hoạt động'}</td>
                                                <td><a class="room-detail" href="accountdetail?id=${uni.id}">Xem thông tin</a></td>

                                                <td>


                                                    <button style="border: 1px solid #ccc" onclick="lockAccount(${uni.id})">${uni.status == '1' ? 'khoa tai khoan' : 'kich hoat tai khoan'}</button>


                                                </td>


                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <div class="paging">
                                    <a href=""><span class="fa fa-chevron-left"></span></a>
                                        <c:forEach var="i" begin="1" end="${sessionScope.numberPage}">
                                        <span onclick="submitForm(${i})" id="page${i}" class="${i == 1? 'numberpage' : 'numberpage-1'}">${i}</span>
                                    </c:forEach>
                                    <a href=""><span class="fa fa-chevron-right"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <input id="roomIdInput"/>


        <!--        // modal khi bam vao nut kich haot hoac huy kich hoat-->
        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmModalLabel">Xác nhận</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn kích hoạt hoặc hủy kích hoạt tài khoản này không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" id="confirmButton">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>






        <!---------- jQuery ------------->
        <script>

            function resetForm() {
                document.getElementById("roles").selectedIndex = 0;
                document.getElementById("status").selectedIndex = 0;
                document.getElementById("username").value = "";
                document.getElementById("fullname").value = "";
                document.getElementById("email").value = "";
                document.getElementById("mobile").value = "";
                window.location.href = "account";
            }



            document.addEventListener('DOMContentLoaded', function () {
                // Thêm sự kiện click cho tất cả các phần tử có thuộc tính data-room-id
                document.body.addEventListener('click', function (event) {
                    // Kiểm tra xem phần tử được nhấp vào có thuộc tính data-room-id hay không
                    if (event.target.hasAttribute('data-room-id')) {
                        event.preventDefault(); // Ngăn chặn hành vi mặc định của liên kết
                        var accountId = event.target.getAttribute('data-account-id'); // Lấy ID account từ thuộc tính data-room-id
                        var confirmation = confirm("Bạn có chac chan muốn khóa tai khoan nay không?");
                        if (confirmation) {
                            // Chuyển hướng đến servlet với ID phòng như một tham số truy vấn
                            window.location.href = "account?id_account_active=" + accountId;
                        }
                    }
                });
            });
            //adasda
            //let accountIdToToggle; // Biến toàn cục để lưu trữ ID tài khoản cần thay đổi trạng thái

            function lockAccount(param) {
                accountIdToToggle = param; // Lưu trữ ID tài khoản vào biến toàn cục
                $('#confirmModal').modal('show'); // Hiển thị modal xác nhận
            }

            document.getElementById('confirmButton').addEventListener('click', function () {
                $.ajax({
                    type: 'get',
                    url: '/SWP391_OnlineShop_G04/account',
                    data: {
                        accountId_active: accountIdToToggle
                    },
                    success: function (data) {
                        $('#' + accountIdToToggle).replaceWith(data); // Cập nhật hàng trong bảng
                        $('#confirmModal').modal('hide'); // Đóng modal sau khi thực hiện xong
                    },
                    error: function (xhr, status, error) {
                        alert('Đã xảy ra lỗi khi gửi yêu cầu: ' + xhr.responseText);
                        $('#confirmModal').modal('hide'); // Đóng modal nếu có lỗi
                    }
                });
            });


            function submitForm(param) {
                // Cập nhật các biến với giá trị hiện tại từ form
//                String index = request.getParameter("index");
//
//        //lay thong tin ve id_account khi kich hoat hoachuy kich hoat
//        // lay thong tin name , email , phone , status
//        String role = request.getParameter("name_roles");
//        String status = request.getParameter("status");
//        String username = request.getParameter("username");
//        String fullname = request.getParameter("fullname");
//        String email = request.getParameter("email");
//        String mobile = request.getParameter("mobile");
                var role = $('#roles').val();
                var status = $('#status').val();
                var username = $('#username').val();
                var fullname = $('#fulname').val();
                var email = $('#email').val();
                var mobile = $('#mobile').val();

                $.ajax({
                    type: 'POST',
                    url: '/SWP391_OnlineShop_G04/account',
                    data: {
                        index: param,
                        role: role,
                        status: status,
                        username: username,
                        fullname: fullname,
                        email: email,
                        mobile: mobile


                    },
                    success: function (data) {
                        $('#room_list_tbody').html(data); // Cập nhật nội dung

                        // Đặt màu nền cho trang hiện tại và reset trang đầu tiên
                        $('span[id^="page"]').css('background-color', ''); // Reset tất cả trước
                        $('#page' + param).css('background-color', 'blue');
                        if (param !== 1) {
                            $('#page1').css('background-color', '#ccc');
                        }

                    },
                    error: function () {
                        alert('Đã xảy ra lỗi khi gửi yêu cầu.');
                    }
                });
            }

        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
