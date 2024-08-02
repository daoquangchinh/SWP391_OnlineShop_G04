<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee List | Admin Management</title>
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/Admin/css/main.css">
        <!-- Icon Libraries -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar -->
        <header class="app-header">
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
            <ul class="app-nav">
                <li>
                    <a class="app-nav__item" href="Home">
                        <i class='bx bx-log-out bx-rotate-180'></i>
                    </a>
                </li>
            </ul>
        </header>

        <!-- Sidebar -->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user">
                <img class="app-sidebar__user-avatar" src="${pageContext.request.contextPath}/view/Admin/images/user.png" width="50" alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.user.user_name}</b></p>
                    <p class="app-sidebar__user-designation">Welcome Admin</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">Dashboard</span></a></li>
                <li><a class="app-menu__item" href="AccManagementServlet"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Account Management</span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Reports and Analysis</span></a></li>
            </ul>
        </aside>

        <!-- Main Content -->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Account Management</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a class="btn btn-delete btn-sm print-file" type="button" title="Print" onclick="myApp.printTable()">
                                        <i class="fas fa-print"></i> Print Data
                                    </a>
                                </div>
                            </div>

                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Customer Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th width="70">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${ListU}" var="u">
                                        <tr>
                                            <td>${u.id}</td>
                                            <td>${u.fullname}</td>
                                            <td>${u.email}</td>
                                            <td>${u.phone}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${u.role_id == 1}">
                                                        <span class="role-admin">Admin</span>
                                                    </c:when>
                                                    <c:when test="${u.role_id == 2}">
                                                        <span class="role-user">User</span>
                                                    </c:when>
                                                    <c:when test="${u.role_id == 3}">
                                                        <span class="role-staff">Staff</span>
                                                    </c:when>
                                                    <c:when test="${u.role_id == 4}">
                                                        <span class="role-shipper">Shipper</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="role-unknown">Unknown Role</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Edit" id="show-emp" 
                                                        data-id="${u.id}" 
                                                        data-name="${u.fullname}" 
                                                        data-email="${u.email}"
                                                        data-toggle="modal" 
                                                        data-target="#editModal"
                                                        data-role="${u.role_id}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Modal HTML -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding: 0 0;">
                            <span aria-hidden="true" style="color: black">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Nội dung chỉnh sửa người dùng -->
                        <form id="editForm">
                            <input type="hidden" id="userId" disabled> <!-- Trường ẩn để lưu id -->
                            <div class="form-group">
                                <label for="username">Name</label>
                                <input type="text" class="form-control" id="username" placeholder="Enter name" disabled>
                            </div>
                            <div class="form-group">
                                <label for="useremail">Email</label>
                                <input type="email" class="form-control" id="useremail" placeholder="Enter email" disabled>
                            </div>
                            <div class="form-group">
                                <label for="userRole">Role</label>
                                <select class="form-control" id="userRole">
                                    <option value="1">Admin</option>
                                    <option value="2">User</option>
                                    <option value="3">Staff</option>
                                    <option value="4">Shipper</option>
                                   
                                </select>
                            </div>
                            <!-- Thêm các trường khác nếu cần -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editRole_id" onclick="updateRoleId()">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <!-- SweetAlert JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
                            // Submit function for updating user role
                            function updateRoleId() {
                                // Lấy giá trị từ các phần tử trong modal
                                var id = $('#userId').val(); // Lấy giá trị id từ input ẩn
                                var roleId = $('#userRole').val(); // Lấy giá trị role_id từ dropdown

                                // Gửi dữ liệu đến servlet bằng AJAX
                                $.ajax({
                                    url: 'AccManagementServlet', // Thay thế bằng URL của servlet của bạn
                                    type: 'POST',
                                    data: {
                                        id: id,
                                        role_id: roleId
                                    },
                                    success: function (response) {
                                        // Xử lý phản hồi từ servlet nếu cần
                                        swal("Success!", "User details updated successfully.", "success");
                                        // Cập nhật bảng DataTable
                                        var table = $('#sampleTable').DataTable();
                                        table.rows().every(function (rowIdx, tableLoop, rowLoop) {
                                            var data = this.data();
                                            if (data[0] == id) { // Xác định hàng bằng id
                                                var roleText;
                                                switch (roleId) {
                                                    case '1':
                                                        roleText = '<span class="role-admin">Admin</span>';
                                                        break;
                                                    case '2':
                                                        roleText = '<span class="role-user">User</span>';
                                                        break;
                                                    case '3':
                                                        roleText = '<span class="role-staff">Staff</span>';
                                                        break;
                                                    case '4':
                                                        roleText = '<span class="role-shipper">Shipper</span>';
                                                        break;
                                                    default:
                                                        roleText = '<span class="role-unknown">Unknown Role</span>';
                                                }

                                                // Cập nhật nội dung của <td> chứa thông tin vai trò
                                                data[4] = roleText; // Giả sử cột vai trò là cột thứ 4 (index 3)
                                                this.data(data).draw();
                                            }
                                        });

                                        $('#editModal').modal('toggle'); // Để chuyển đổi trạng thái modal

                                    },
                                    error: function (xhr, status, error) {
                                        // Xử lý lỗi nếu có
                                        swal("Error!", "An error occurred while updating user details.", "error");
                                    }
                                });
                            }

                            // Initialize DataTable
                            $(document).ready(function () {
                                $('#sampleTable').DataTable();

                                // Populate modal with user data
                                $('.edit').on('click', function () {
                                    var id = $(this).data('id');
                                    var name = $(this).data('name');
                                    var email = $(this).data('email');
                                    var role = $(this).data('role');

                                    $('#userId').val(id);
                                    $('#username').val(name);
                                    $('#useremail').val(email);
                                    $('#userRole').val(role);
                                });
                            });

                            function time() {
                                var today = new Date();
                                var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
                                var day = weekday[today.getDay()];
                                var dd = today.getDate();
                                var mm = today.getMonth() + 1;
                                var yyyy = today.getFullYear();
                                var h = today.getHours();
                                var m = today.getMinutes();
                                var s = today.getSeconds();
                                m = checkTime(m);
                                s = checkTime(s);
                                var nowTime = h + " : " + m + " : " + s;
                                if (dd < 10)
                                    dd = '0' + dd;
                                if (mm < 10)
                                    mm = '0' + mm;
                                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                document.getElementById("clock").innerHTML = '<span class="date">' + today + ' - ' + nowTime + '</span>';
                                setTimeout(time, 1000);

                                function checkTime(i) {
                                    if (i < 10)
                                        i = "0" + i;
                                    return i;
                                }
                            }

                            var myApp = new function () {
                                this.printTable = function () {
                                    var tab = document.getElementById('sampleTable');
                                    var win = window.open('', '', 'height=700,width=700');
                                    win.document.write(tab.outerHTML);
                                    win.document.close();
                                    win.print();
                                };
                            };
        </script>
    </body>
</html>
