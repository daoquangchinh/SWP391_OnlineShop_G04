<%-- 
    Document   : cartPage
    Created on : Jun 9, 2024, 1:56:03 PM
    Author     : ViQuan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="modal.Cart_Item" %>
<%@page  import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>MultiShop - Online Shop Website Template</title>
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
        <link href="${pageContext.request.contextPath}/assets_cart/styles.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="homeTag.jsp"></jsp:include>
            <div> 
                <!--header cart--> 
                <div class="footer">
                    <div class="row">
                        <div class="nhom col-lg-12">
                            <div class="col-lg-6">
                                <div class="product">
                                    <input class="checkbox_input" type="checkbox" id="select_all_header">
                                    <p>Sản Phẩm</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="nhom">
                                        <div class="col-lg-3 nhom1">
                                            <div>Đơn Giá</div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div>Số Lượng</div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div>Số Tiền</div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div>Thao Tác</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--cart item--> 

                <!-- Lấy thông tin cart item -->
            <%
                List<Cart_Item> listC = (List<Cart_Item>) request.getAttribute("cart_item");
                      String mess = (String) request.getAttribute("mess");

                if (listC == null) {
            %>
            <%
                   listC = new ArrayList<>(); // Khởi tạo danh sách rỗng nếu null
               }
            %>
            <div id="cartItemfor">
                <% for (Cart_Item item : listC) { %>
                <div class="footer" id="cartItem<%= item.getIdCartItem() %>">
                    <div class="row">
                        <div class="nhom col-lg-12">
                            <div class="col-lg-6">
                                <div class="product">
                                    <input class="checkbox_input item-checkbox" type="checkbox">
                                    <a title="<%= item.getShoe_name() %>" href="#">
                                        <img class="product_img" src="<%= item.getImg() %>" alt="product image">
                                    </a>
                                    <div class="c54pg1 col-lg-2">
                                        <a title="<%= item.getShoe_name() %>" href="#"><%= item.getShoe_name() %></a>
                                        <div class="co-inspection"><span>Đổi ý miễn phí 15 ngày</span></div>
                                        <img class="ship_img" src="https://down-vn.img.susercontent.com/file/vn-50009109-adeb9f40700bf1e29996a6caf07746e2" alt="loading..">
                                        <div class="gvFc9h"></div>
                                    </div>
                                    <div class="col-lg-3" style="left: 30px;">
                                        <div class="qNRZqG1 dropdown">
                                            <button class="mM4TZ8 dropdown-toggle" data-toggle="dropdown">
                                                <div class="iIg1CN">Phân loại hàng:</div>
                                                <div class="iIg1CN"><%= item.getColor() %>, <%= item.getSize() %></div>
                                            </button>
                                            <div class="bfr5fB dropdown-menu">
                                                <div class="bfr5fB1">
                                                    <label class="UTcc4z">Màu:</label>
                                                    <label >Đen</label>
                                                    <button><div>Đen</div></button>
                                                </div>
                                                <div class="bfr5fB1">
                                                    <label class="UTcc4z">Size: </label>
                                                    <button><div>39</div></button>
                                                    <button><div>40</div></button>
                                                </div>
                                                <div class="ZQrI2V">
                                                    <button class="cancel-btn">Trở Lại</button>
                                                    <button class="xacnhan">Xác nhận</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="nhom">
                                        <div class="col-lg-3 nhom1">
                                            <div class="vjkBXu" id="price<%= item.getIdCartItem()%>">₫<%= item.getPrice() %></div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div class="GpmJtT">
                                                <!--thay đổi khi dùng button--> 
                                                <button class="WNSVcC decrement">
                                                    <span class="sapn01">-</span>
                                                </button>
                                                <!--thay đổi khi nhập dữ liệu-->
                                                <input class="WNSVcC g2m9n4 quantity" type="text" value="<%= item.getQuatityCart() %>" data-cart-id="<%= item.getIdCartItem() %>">
                                                <button class="WNSVcC increment">
                                                    <span class="sapn01">+</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div class="total-price sapn02" id="cart<%= item.getIdCartItem() %>">₫<%= item.getQuatityCart() * item.getPrice() %></div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <button class="delete" onclick="deleteGroup(<%= item.getIdCartItem() %>)">Xóa</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <!--footer cart--> 
            <div class="sticky-top">
                <section class="footer">
                    <div class="voucher">               
                        <div>Shop Voucher</div>
                        <button class="voucher-button">Chọn hoặc nhập mã</button>
                    </div>
                    <div class="total">
                        <div class="stardust-checkbox">
                            <label class="checkbox">
                                <input class="checkbox_input" type="checkbox" id="select_all_footer">
                                <div class="stardust-checkbox__box"></div>
                            </label>
                        </div>
                        <button class="select_all btn" type="checkbox" id="select_all">Chọn Tất Cả (23)</button>
                        <button class="btn" onclick="DeleteSelectedItems()">Xóa</button>
                        <div>
                            <button class="btn"><p class="btn" style="color: red">Bỏ sản phẩm không hoạt động</p></button>
                        </div>
                        <button class="btn">Lưu vào mục Đã thích</button>
                        <div></div>
                        <div role="">
                            <div class="btn">
                                <div class="total_thanhtien">
                                    <div style="margin-right: 10px">Tổng thanh toán (0 Sản phẩm):</div>
                                    <div>₫0</div>
                                </div>
                            </div>
                            <div></div>
                        </div>
                        <button class="pay">
                            <span class="" >Mua hàng</span>
                        </button>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="FooterTag.jsp"></jsp:include>
            <!-- JavaScript to handle the checkbox functionality -->
            <script>
                function deleteGroup(cartItemId) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/deleteCartItem", // Adjust URL as per your server endpoint
                        method: "POST",
                        data: {
                            cartItemId: cartItemId
                        },
                        success: function (response) {
                            // Update UI after successful deletion
                            var deletedGroup = document.getElementById("cartItem" + cartItemId);
                            deletedGroup.remove(); // Remove the group from UI
                        },
                        error: function () {
                            alert('Failed to delete group from cart.');
                        }
                    });
                }

                function DeleteSelectedItems() {
                    var checkboxes = document.getElementById('cartItemfor').querySelectorAll('.item-checkbox:checked');

                    // Lặp qua danh sách các checkbox đã chọn và xóa từng mục
                    checkboxes.forEach(checkbox => {
                        const cartItemId = checkbox.closest('.footer').id.replace('cartItem', ''); // Lấy cartItemId từ id của thẻ cha
                        deleteGroup(cartItemId); // Gọi hàm xóa mục với cartItemId tương ứng
                    });

                }

        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const selectAllHeader = document.getElementById('select_all_header');
                const selectAllFooter = document.getElementById('select_all_footer');
                const itemCheckboxes = document.querySelectorAll('.item-checkbox');

                function updateSelectAllCheckboxes() {
                    const allChecked = [...itemCheckboxes].every(checkbox => checkbox.checked);
                    selectAllHeader.checked = allChecked;
                    selectAllFooter.checked = allChecked;
                }

                function toggleAllCheckboxes(isChecked) {
                    itemCheckboxes.forEach(checkbox => {
                        checkbox.checked = isChecked;
                    });
                    selectAllHeader.checked = isChecked;
                    selectAllFooter.checked = isChecked;
                }

                [selectAllHeader, selectAllFooter].forEach(selectAll => {
                    selectAll.addEventListener('change', function () {
                        toggleAllCheckboxes(selectAll.checked);
                    });
                });

                itemCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', updateSelectAllCheckboxes);
                });

                function sendUpdateRequest(cartItemId, newQuantity) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/cart",
                        method: "POST",
                        data: {
                            cartItemId: cartItemId,
                            quantity: newQuantity
                        },
                        success: function (response) {
                            // Update total price of the item
                            var totalPriceElement = document.getElementById("cart" + cartItemId);
                            totalPriceElement.innerHTML = '₫' + (response.price * newQuantity) + '.0';
                            var PriceElement = document.getElementById("price" + cartItemId);
                            PriceElement.innerHTML = '₫' + (response.price) + '.0';
                        },
                        error: function () {
                            alert('Failed to update quantity.');
                        }
                    });
                }



                function updateQuantity(input, increment) {
                    const cartItemId = input.dataset.cartId;
                    let quantity = parseInt(input.value, 10);

                    quantity = increment ? quantity + 1 : Math.max(1, quantity - 1);

                    input.value = quantity;
                    sendUpdateRequest(cartItemId, quantity);
                }

                document.querySelectorAll('.increment').forEach(button => {
                    button.addEventListener('click', function () {
                        const quantityInput = button.closest('.nhom1').querySelector('.quantity');
                        updateQuantity(quantityInput, true);
                    });
                });

                document.querySelectorAll('.decrement').forEach(button => {
                    button.addEventListener('click', function () {
                        const quantityInput = button.closest('.nhom1').querySelector('.quantity');
                        updateQuantity(quantityInput, false);
                    });
                });

                document.querySelectorAll('.quantity').forEach(input => {
                    input.addEventListener('input', function () {
                        input.value = input.value.replace(/[^\d]/g, '') || 1;
                        sendUpdateRequest(input.dataset.cartId, input.value);
                    });
                });

                updateSelectAllCheckboxes();
            });
        </script>



        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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