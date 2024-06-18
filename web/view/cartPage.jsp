<%-- 
    Document   : cartPage
    Created on : Jun 9, 2024, 1:56:03 PM
    Author     : ViQuan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="modal.Cart_Item" %>
<%@page import="java.util.ArrayList" %>
<%@page import="modal.ShoeColor" %>
<%@page import="modal.ShoeSize" %>
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
                                    <div class="c54pg1 col-lg-4">
                                        <a title="<%= item.getShoe_name() %>" href="#"><%= item.getShoe_name() %></a>
                                        <div class="co-inspection"><span>Đổi ý miễn phí 15 ngày</span></div>
                                        <img class="ship_img" src="https://down-vn.img.susercontent.com/file/vn-50009109-adeb9f40700bf1e29996a6caf07746e2" alt="loading..">
                                        <div class="gvFc9h"></div>
                                    </div>
                                    <div class="col-lg-3" style="left: 30px;">
                                        <div class="qNRZqG1 dropdown">
                                            <button class="mM4TZ8 dropdown-toggle" data-toggle="dropdown">
                                                <div class="iIg1CN" data-shoe-id="<%= item.getShoe_id()%>">Phân loại hàng:</div>
                                                <div class="iIg1CN"><%= item.getColor() %>, <%= item.getSize() %></div>
                                            </button>
                                            <div class="bfr5fB dropdown-menu">
                                                <div class="bfr5fB1">
                                                    <label class="UTcc4z"id="mau">Màu:</label>
                                                    <%-- Hiển thị tất cả các màu có sẵn trong item --%>
                                                    <% for (ShoeColor colorItem : item.getAvailableColors()) {%>
                                                    <button class="dropdown-item" data-item-type="color"><%= colorItem.getColor() %></button>
                                                    <% } %>
                                                </div>
                                                <div class="bfr5fB1">
                                                    <label class="UTcc4z" id="size ">Size:</label>
                                                    <% for (ShoeSize sizeItem : item.getAvailableSizes()) {%>
                                                    <button class="dropdown-item" data-item-type="size"><%= sizeItem.getSize() %></button>
                                                    <% } %>
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
                                            <div class="vjkBXu priceform" id="price<%= item.getIdCartItem()%>">₫<%= item.getPrice() %></div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div class="GpmJtT">
                                                <!--thay đổi khi dùng button--> 
                                                <button class="WNSVcC decrement">
                                                    <span class="sapn01">-</span>
                                                </button>
                                                <!--thay đổi khi nhập dữ liệu-->
                                                <input class="WNSVcC g2m9n4 quantity" id="" type="text" value="<%= item.getQuatityCart() %>" data-cart-id="<%= item.getIdCartItem() %>">
                                                <button class="WNSVcC increment">
                                                    <span class="sapn01">+</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div class="total-price priceform sapn02" id="cart<%= item.getIdCartItem() %>">₫<%= item.getQuatityCart() * item.getPrice() %></div>
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

            <section class="footerend">
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
                    <button class="select_all btn" type="checkbox" id="select_all">Chọn Tất Cả (<%= listC.size() %>)</button>
                    <button class="btn" onclick="DeleteSelectedItems()">Xóa</button>
                    <div>
                        <!--                            <button class="btn"><p class="btn" style="color: red">Bỏ sản phẩm không hoạt động</p></button>-->
                    </div>
                    <button class="btn">Lưu vào mục Đã thích</button>
                    <div></div>
                    <div role="">
                        <div class="btn">
                            <div class="total_thanhtien">
                                <div id ="totalproduct" style="margin-right: 10px">Tổng thanh toán (0 Sản phẩm):</div>
                                <div class="sapn02 priceform" id="totalprice">₫0</div>
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
        <jsp:include page="FooterTag.jsp"></jsp:include>
            <!-- JavaScript to handle the checkbox functionality -->
            <script>
                $(document).ready(function () {
                    // Đóng dropdown-menu khi nhấp vào nút "Trở lại"
                    $('.cancel-btn').click(function () {
                        $(this).closest('.dropdown-menu').removeClass('show');
                    });

                    // Xử lý khi nhấn vào các nút xác nhận
                    $('.xacnhan').click(function () {
                        // Viết mã xử lý xác nhận ở đây (nếu cần)
                        // Sau khi xử lý xong, đóng dropdown-menu
                        $(this).closest('.dropdown-menu').removeClass('show');
                    });

                    // Đóng dropdown-menu khi nhấp ra ngoài, nhưng không đóng khi nhấn vào dropdown-item
                    $(document).click(function (event) {
                        var dropdownMenus = $('.dropdown-menu');
                        var target = $(event.target);

                        if (!target.hasClass('dropdown-menu') && !target.parents().hasClass('dropdown-menu') &&
                                !target.hasClass('dropdown-toggle') && !target.parents().hasClass('dropdown-toggle') &&
                                !target.hasClass('dropdown-item') && !target.parents().hasClass('dropdown-item')) {
                            dropdownMenus.removeClass('show');
                        }
                    });

                    // Để ngăn dropdown đóng khi nhấn vào dropdown-toggle
                    $('.dropdown-toggle').click(function (event) {
                        var dropdownMenu = $(this).next('.dropdown-menu');
                        if (dropdownMenu.hasClass('show')) {
                            dropdownMenu.removeClass('show');
                        } else {
                            $('.dropdown-menu').removeClass('show'); // Đóng tất cả các dropdown khác
                            dropdownMenu.addClass('show');
                        }
                        event.stopPropagation(); // Ngăn sự kiện click lan tới document
                    });

                    // Đánh dấu các lựa chọn khi click vào dropdown-item và cập nhật hiển thị
                    $('.dropdown-item[data-item-type="color"]').click(function (event) {
                        event.stopPropagation(); // Ngăn dropdown đóng
                        $('.dropdown-item[data-item-type="color"]').removeClass('selected').css('background-color', '');
                        $(this).addClass('selected').css('background-color', 'yellow');
                    });

                    $('.dropdown-item[data-item-type="size"]').click(function (event) {
                        event.stopPropagation(); // Ngăn dropdown đóng
                        $('.dropdown-item[data-item-type="size"]').removeClass('selected').css('background-color', '');
                        $(this).addClass('selected').css('background-color', 'yellow');
                    });

                    // Hàm để lấy màu đã chọn
                    function getSelectedColor() {
                        return $('.dropdown-item[data-item-type="color"].selected').text() || "";
                    }

                    // Hàm để lấy kích thước đã chọn
                    function getSelectedSize() {
                        return $('.dropdown-item[data-item-type="size"].selected').text() || "";
                    }
                });
            </script>

            <script>
                // JavaScript functions for handling deletion and updating UI
                function deleteGroup(cartItemId) {
                    // Function to delete a group via AJAX
                    $.ajax({
                        url: "${pageContext.request.contextPath}/deleteCartItem", // Adjust URL as per your server endpoint
                        method: "GET",
                        data: {
                            cartItemId: cartItemId
                        },
                        success: function (response) {
                            // Update UI after successful deletion
                            var deletedGroup = document.getElementById("cartItem" + cartItemId);
                            deletedGroup.remove(); // Remove the group from UI
                            selectedItems(); // Update selected items count and total price display
                        },
                        error: function () {
                            alert('Failed to delete group from cart.');
                        }
                    });
                }

                function DeleteSelectedItems() {
                    // Function to delete selected items
                    var checkboxes = document.getElementById('cartItemfor').querySelectorAll('.item-checkbox:checked');
                    // Loop through selected checkboxes and delete each item
                    checkboxes.forEach(checkbox => {
                        const cartItemId = checkbox.closest('.footer').id.replace('cartItem', ''); // Get cartItemId from parent element's id
                        deleteGroup(cartItemId); // Call delete function with corresponding cartItemId
                    });
                }

                function selectedItems() {
                    // Function to update selected items count and total price
                    var checkboxes = document.querySelectorAll('.item-checkbox:checked');
                    var check = checkboxes.length; // Number of selected checkboxes
                    var total = 0;
                    var quantityCartItem = document.querySelectorAll('.item-checkbox');
                    checkboxes.forEach(checkbox => {
                        var cartItemElement = checkbox.closest('.footer');
                        var quantity = parseInt(cartItemElement.querySelector('.quantity').value);
                        var price = parseFloat(cartItemElement.querySelector('.vjkBXu').textContent.replace('₫', '').replace(/,/g, ''));
                        total += quantity * price;
                    });
                    var totalproduct = document.getElementById("totalproduct");
                    totalproduct.innerHTML = "Tổng thanh toán (" + check + " Sản phẩm):";
                    var totalprice = document.getElementById("totalprice");
                    totalprice.innerHTML = "₫" + total.toLocaleString('en') + '.0';
                    var totalCartItem = document.getElementById("select_all");
                    totalCartItem.innerHTML = "Chọn Tất Cả (" + quantityCartItem.length + ")";
                }
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Script for handling checkbox toggles
                const selectAllHeader = document.getElementById('select_all_header');
                const selectAllFooter = document.getElementById('select_all_footer');
                const itemCheckboxes = document.querySelectorAll('.item-checkbox');

                function updateSelectAllCheckboxes() {
                    // Function to update select all checkboxes functionality
                    const allChecked = [...itemCheckboxes].every(checkbox => checkbox.checked);
                    selectAllHeader.checked = allChecked;
                    selectAllFooter.checked = allChecked;
                }

                function toggleAllCheckboxes(isChecked) {
                    // Function to toggle all checkboxes based on header/footer checkbox
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
                    // Function to send AJAX request to update item quantity
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
                            totalPriceElement.innerHTML = '₫' + (response.price * newQuantity).toLocaleString('en') + '.0';
                            var PriceElement = document.getElementById("price" + cartItemId);
                            PriceElement.innerHTML = '₫' + (response.price.toLocaleString('en')) + '.0';
                            selectedItems(); // Update selected items count and total price display
                        }
                        error: function () {
                            alert('Failed to update quantity.');
                        }
                    });
                }

                function updateQuantity(input, increment) {
                    // Function to update quantity based on increment/decrement buttons
                    const cartItemId = input.dataset.cartId;

                    let quantity = parseInt(input.value, 10);
                    quantity = increment ? quantity + 1 : Math.max(0, quantity - 1);
                    if (quantity === 0) {
                        // Display a confirmation dialog
                        if (window.confirm("Bạn có muốn xóa không?" + cartItemId)) {
                            // User confirmed deletion, you can proceed with any further deletion logic here
                            deleteGroup(cartItemId); // Call delete function with corresponding cartItemId

                        } else {
                            // User canceled deletion, you may keep the quantity at 0 or take other appropriate actions
                            quantity = 1; // Reset quantity to 1
                        }
                    }
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
                        input.value = input.value.replace(/[^\d]/g, '') || "";
                        sendUpdateRequest(input.dataset.cartId, input.value);
                    });
                });

                updateSelectAllCheckboxes();
            });

            document.addEventListener('DOMContentLoaded', function () {
                // Initialize selectedItems function on page load
                // Checkbox change event listener
                var itemCheckboxes = document.querySelectorAll('.checkbox_input');
                itemCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', function () {
                        selectedItems(); // Call selectedItems function whenever there is a change in checkbox_input
                    });
                });

                // Format price elements
                var priceElements = document.querySelectorAll('.priceform');
                priceElements.forEach(element => {
                    var currentPrice = parseFloat(element.textContent.replace('₫', '').replace(/,/g, ''));
                    var formattedPrice = currentPrice.toLocaleString('en');
                    element.textContent = "₫" + formattedPrice + ".0";
                });
            });
        </script>




        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>




    </body>
</html>