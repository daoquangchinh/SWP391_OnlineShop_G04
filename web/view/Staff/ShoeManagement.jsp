<%-- 
    Document   : ShoeManagement
    Created on : Jul 30, 2024, 4:14:21 PM
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
                    <li class="breadcrumb-item active"><a href="#"><b>Shoe Management</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-1.5">
                                    <a class="btn btn-add btn-sm" href="productmanager?action=insert" title="Thêm"><i class="fas fa-plus"></i>
                                        Add Product</a>
                                </div>
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
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Brand</th>
                                        <th>Sports</th>
                                        <th>Gender</th>
                                        <th>Price</th>
                                        <th>Discount</th>
                                        <th width="70">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${shoeList}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td><img src="${p.image}" alt="${p.name}" style="width: 50px; height: 50px;"/></td>
                                            <td><a href="ProductManagementServlet?id=${p.id}">${p.name}</a></td>
                                            <td>${p.description}</td>
                                            <td>${p.brandName}</td>
                                            <td>${p.sportsName}</td>
                                            <td>${p.genderName}</td>
                                            <td>${p.price}</td>
                                            <td>${p.discount}</td>

                                            <td>
                                                <button class="btn btn-primary btn-sm edit" type="button" title="Edit" id="show-product" 
                                                        data-id="${p.id}" 
                                                        data-name="${p.name}" 
                                                        data-description="${p.description}"
                                                        data-brand="${p.brandName}"
                                                        data-sports="${p.sportsName}"
                                                        data-gender="${p.genderName}"
                                                        data-price="${p.price}"
                                                        data-discount="${p.discount}"
                                                        data-created-at="${p.createdAt}"
                                                        data-updated-at="${p.updatedAt}"
                                                        data-image="${p.image}"
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
                            <span aria-hidden="true" style="color: black">&times;</span>
                        </button>
                    </div>                      
                    <div class="modal-body">
                        <!-- Hidden Product ID -->
                        <input type="hidden" id="productId" name="productId">

                        <!-- Product Name -->
                        <div class="form-group">
                            <label for="productName">Name</label>
                            <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name">
                        </div>

                        <!-- Product Brand -->
                        <div class="form-group">
                            <label for="productBrand">Brand</label>
                            <input type="text" class="form-control" id="productBrand" name="productBrand" placeholder="Enter product brand">
                        </div>

                        <!-- Product Sports -->
                        <div class="form-group">
                            <label for="productSports">Sports</label>
                            <input type="text" class="form-control" id="productSports" name="productSports" placeholder="Enter product sports">
                        </div>
                        <!-- Product Description -->
                        <div class="form-group">
                            <label for="productDescription">Description</label>
                            <textarea class="form-control" id="productDescription" name="productDescription" placeholder="Enter product description" rows="4" style="resize: vertical; overflow: auto;"></textarea>
                        </div>

                        <!-- Product Price -->
                        <div class="form-group">
                            <label for="productPrice">Price</label>
                            <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="Enter product price">
                        </div>

                        <!-- Product Discount -->
                        <div class="form-group">
                            <label for="productDiscount">Discount</label>
                            <input type="text" class="form-control" id="productDiscount" name="productDiscount" placeholder="Enter product discount">
                        </div>
                        <!-- Product Image -->
                        <div class="form-group">
                            <label for="productImage">Product Image</label>
                            <div id="myfileupload">
                                <input type="file" id="product_img" name="product_img">
                                <input id="productImage" name="product_img0" style="display: none">
                            </div>

                        </div>
                        <!-- Product Gender -->
                        <div class="form-group" style="display: flex">
                            <label>Gender  :  </label><br>
                            <div class="form-check" style="margin: 5px">
                                <input class="form-check-input" type="radio" id="genderMale" name="productGender" value="Male">
                                <label class="form-check-label" for="genderMale">
                                    Male   
                                </label>
                            </div>
                            <div class="form-check" style="margin: 5px">
                                <input class="form-check-input" type="radio" id="genderFemale" name="productGender" value="Female">
                                <label class="form-check-label" for="genderFemale">
                                    Female   
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="saveChanges">Save changes</button>
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
                                                var description = $(this).data('description');
                                                var brand = $(this).data('brand');
                                                var sports = $(this).data('sports');
                                                var gender = $(this).data('gender');
                                                var price = $(this).data('price');
                                                var discount = $(this).data('discount');
                                                var img = $(this).data('image');

                                                $('#productId').val(id);
                                                $('#productName').val(name);
                                                $('#productDescription').val(description);
                                                $('#productBrand').val(brand);
                                                $('#productSports').val(sports);
                                                $('#productPrice').val(price);
                                                $('#productDiscount').val(discount);
                                                $('#productImage').val(img);
                                                $('input[name="productGender"]').each(function () {
                                                    $(this).prop('checked', $(this).val() === gender);
                                                });
                                            });

                                            $('#saveChanges').click(function (event) {
                                                event.preventDefault(); // Ngăn chặn gửi form mặc định

                                                // Lấy dữ liệu từ form
                                                var productId = $('#productId').val();
                                                var productName = $('#productName').val();
                                                var productBrand = $('#productBrand').val();
                                                var productSports = $('#productSports').val();
                                                var productDescription = $('#productDescription').val();
                                                var productPrice = $('#productPrice').val();
                                                var productDiscount = $('#productDiscount').val();
                                                var productGender = $('input[name="productGender"]:checked').val();
                                                var product_img =$('#product_img')[0].files[0] ? $('#product_img')[0].files[0].name : ''; // Lấy tên ảnh đã chọn
                                                var img = $('#productImage').val();

                                                // Kiểm tra dữ liệu
                                                if (!productName || !productBrand || !productSports || !productDescription || !productPrice || !productDiscount || !productGender) {
                                                    swal("Error!", "Please fill out all required fields.", "error");
                                                    return;
                                                }

                                                if (isNaN(productPrice) || productPrice <= 0) {
                                                    swal("Error!", "Price must be a positive number.", "error");
                                                    return;
                                                }

                                                if (isNaN(productDiscount) || productDiscount < 0) {
                                                    swal("Error!", "Discount must be a non-negative number.", "error");
                                                    return;
                                                }


                                                // Gửi dữ liệu đến server qua AJAX
                                                $.ajax({
                                                    url: 'ShoeManagementServlet', // Cập nhật URL của endpoint
                                                    type: 'POST',
                                                    data: {
                                                        productId: productId,
                                                        productName: productName,
                                                        productBrand: productBrand,
                                                        productSports: productSports,
                                                        productDescription: productDescription,
                                                        productPrice: productPrice,
                                                        productDiscount: productDiscount,
                                                        productGender: productGender,
                                                        product_img : product_img,
                                                        img: img
                                                    },
                                                    success: function (response) {
                                                        if (response.success) {
                                                            swal("Product updated successfully!", "", "success");
                                                            $('#editModal').modal('hide');  // Ẩn modal
                                                            location.reload();
//                                                          
                                                        } else {
                                                            swal("Error!", "Product update failed. Please try again.", "error");
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
