<%-- 
    Document   : ProductManagement
    Created on : Jul 27, 2024, 10:28:18 PM
    Author     : ViQuan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee List | Admin Management</title>
        <!-- Main CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/view/Admin/css/main.css">
        <!-- Icon Libraries -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap4.min.css">
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
                    <p class="app-sidebar__user-designation">Welcome Staff</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item" href="ShoeManagementServlet"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Shoe Management</span></a></li>
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Reports and Analysis</span></a></li>
            </ul>
        </aside>

        <!-- Main Content -->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Product Management</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button" style="justify-content: space-between;">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a class="btn btn-add btn-sm" href="productmanager?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                            Add Product</a>
                                    </div>
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm print-file" type="button" title="Print" onclick="myApp.printTable()">
                                            <i class="fas fa-print"></i> Print Data
                                        </a>
                                    </div>
                                    <p id="shoeId" data-shoe-id="${shoeId}" hidden="">Shoe ID: ${shoeId}</p>

                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-info btn-sm" href="ShoeManagementServlet" title="Go to detail Shoe">
                                        <i class="fas fa-arrow-left"></i> Go to New Page
                                    </a>
                                </div>
                            </div>

                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Color</th>
                                        <th>Size</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th width="70">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${productList}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td><img src="${p.img}" alt="${p.name}" style="width: 50px; height: 50px;"/></td>
                                            <td>${p.name}</td>
                                            <td>${p.color}</td>
                                            <td>${p.size}</td>
                                            <td>${p.quantity}</td>
                                            <td>${p.price}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${p.status == 'Active'}">
                                                        <span class="badge badge-success">Active</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-danger">Inactive</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Edit" id="show-product" 
                                                        data-id="${p.id}" 
                                                        data-name="${p.name}" 
                                                        data-color="${p.color}"
                                                        data-size="${p.size}"
                                                        data-quantity="${p.quantity}"
                                                        data-price="${p.price}"
                                                        data-status="${p.status}"
                                                        data-img="${p.img}"
                                                        data-toggle="modal" 
                                                        data-target="#editModal">
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


        <!-- Edit Product Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel" style="color: orange">Edit Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="padding: 0 0">
                            <span aria-hidden="true"style="color: black">&times;</span>
                        </button>
                    </div>                      
                    <!--                    <form id="editForm" action="ProductManagementServlet" method="post" >-->
                    <div class="modal-body">
                        <!-- Hidden Product ID -->
                        <input type="hidden" id="productId" name="productId">

                        <!-- Product Name -->
                        <div class="form-group">
                            <label for="productName">Name</label>
                            <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name"disabled>
                        </div>
                        <!-- Product Price -->
                        <div class="form-group">
                            <label for="productPrice">Price</label>
                            <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="Enter product price"disabled>
                        </div>
                        <!-- Product Color -->
                        <div class="form-group">
                            <label for="productColor">Color</label>
                            <input type="text" class="form-control" id="productColor" name="productColor" placeholder="Enter product color">
                        </div>

                        <!-- Product Size -->
                        <div class="form-group">
                            <label for="productSize">Size</label>
                            <input type="text" class="form-control" id="productSize" name="productSize" placeholder="Enter product size">
                        </div>

                        <!-- Product Quantity -->
                        <div class="form-group">
                            <label for="productQuantity">Quantity</label>
                            <input type="number" class="form-control" id="productQuantity" name="productQuantity" placeholder="Enter product quantity">
                        </div>



                        <!--                             Product Image 
                                                    <div class="form-group">
                                                        <label for="uploadfile">Product Image</label>
                                                        <div id="myfileupload">
                                                            <input type="file"  name="product_img">
                                                            <input id="uploadfile" name="product_img0" style="display: none">
                                                        </div>
                                                        <div id="boxchoice">
                                                            <a href="javascript:void(0);" class="Choicefile">
                                                                <i class="fas fa-cloud-upload-alt"></i> Choose Image
                                                            </a>
                                                        </div>
                                                    </div>-->

                        <!-- Product Status -->
                        <div class="form-group">
                            <label>Status:</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="productStatus" id="productStatusActive" value="1">
                                <label class="form-check-label" for="productStatusActive">Active</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="productStatus" id="productStatusInactive" value="2">
                                <label class="form-check-label" for="productStatusInactive">Inactive</label>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="saveChanges">Save changes</button>
                    </div>
                    <!--                    </form>-->
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap4.min.js"></script>
        <!-- SweetAlert JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
                                            $(document).ready(function () {
                                                // Khởi tạo DataTable và lưu trữ instance
                                                var table = $('#sampleTable').DataTable();

                                                $('.edit').on('click', function () {
                                                    var id = $(this).data('id');
                                                    var name = $(this).data('name');
                                                    var color = $(this).data('color');
                                                    var size = $(this).data('size');
                                                    var quantity = $(this).data('quantity');
                                                    var price = $(this).data('price');
                                                    var status = $(this).data('status');
                                                    var img = $(this).data('img');

                                                    $('#productId').val(id);
                                                    $('#productName').val(name);
                                                    $('#productColor').val(color);
                                                    $('#productSize').val(size);
                                                    $('#productQuantity').val(quantity);
                                                    $('#productPrice').val(price);
                                                    $('#uploadfile').val(img);
                                                    if (status === 'Active') {
                                                        $('#productStatusActive').prop('checked', true);
                                                    } else if (status === 'Inactive') {
                                                        $('#productStatusInactive').prop('checked', true);
                                                    }
                                                });

                                                $('#saveChanges').click(function (event) {
                                                    event.preventDefault(); // Ngăn chặn gửi form mặc định

                                                    // Lấy dữ liệu từ form
                                                    var shoeId = document.getElementById("shoeId").getAttribute("data-shoe-id");
                                                    var productId = $('#productId').val();
                                                    var productColor = $('#productColor').val();
                                                    var productSize = $('#productSize').val();
                                                    var productQuantity = $('#productQuantity').val();
                                                    var productStatus = $('input[name="productStatus"]:checked').val(); // Lấy giá trị trạng thái đã chọn

                                                    // Kiểm tra dữ liệu
                                                    if (!productId || !productColor || !productSize || !productQuantity || !productStatus) {
                                                        swal("Error!", "Please fill out all required fields.", "error");
                                                        return;
                                                    }

                                                    if (isNaN(productQuantity) || productQuantity <= 0) {
                                                        swal("Error!", "Quantity must be a positive number.", "error");
                                                        return;
                                                    }

                                                    // Gửi dữ liệu đến server qua AJAX
                                                    $.ajax({
                                                        url: 'ProductManagementServlet', // Cập nhật URL của endpoint
                                                        type: 'POST',
                                                        data: {
                                                            shoeId: shoeId,
                                                            productId: productId,
                                                            productColor: productColor,
                                                            productSize: productSize,
                                                            productQuantity: productQuantity,
                                                            productStatus: productStatus
                                                        },
                                                        success: function (response) {
                                                            if (response.success) {
                                                                // Tìm dòng với productId và cập nhật dữ liệu
                                                                var row = table.row(function (idx, data, node) {
                                                                    return data[0] === productId; // Cột ID ở chỉ số 0
                                                                });

                                                                if (row.length) {
                                                                    var rowData = row.data(); // Lấy dữ liệu hiện tại của dòng

                                                                    // Cập nhật chỉ các giá trị cần thiết
                                                                    rowData[3] = productColor; // Cập nhật giá trị của màu sản phẩm
                                                                    rowData[4] = productSize;  // Cập nhật giá trị của kích thước sản phẩm
                                                                    rowData[5] = productQuantity; // Cập nhật giá trị của số lượng sản phẩm
                                                                    rowData[7] = productStatus === "1"
                                                                            ? '<span class="badge badge-success">Active</span>'
                                                                            : '<span class="badge badge-danger">Inactive</span>';
                                                                    // Cập nhật dữ liệu dòng
                                                                    row.data(rowData).draw();
                                                                }

                                                                swal("Product updated successfully!", "", "success");
                                                                $('#editModal').modal('hide');  // Ẩn modal

                                                            } else {
                                                                swal("Product already exists!You need to change the color or size.", "", "warning");
                                                            }

                                                        },
                                                        error: function (xhr, status, error) {
                                                            // Xử lý lỗi
                                                            swal("Error!", "Something went wrong. Please try again.", "error");
                                                        }
                                                    });
                                                });
                                            });

                                            //deleteRow
                                            function deleteRow(r) {
                                                var i = r.parentNode.parentNode.rowIndex;
                                                document.getElementById("sampleTable").deleteRow(i);
                                            }

                                            jQuery(function () {
                                                jQuery(".trash").click(function () {
                                                    swal({
                                                        title: "Warning",
                                                        text: "Are you sure you want to delete this employee?",
                                                        buttons: ["Cancel", "Confirm"]
                                                    }).then((willDelete) => {
                                                        if (willDelete) {
                                                            swal("Successfully deleted!", {});
                                                        }
                                                    });
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
