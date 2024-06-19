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
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Shop Cart</span></h2>

            <div> 
                <!--header cart--> 
                <div class="footer">
                    <div class="row">
                        <div class="nhom col-lg-12">
                            <div class="col-lg-6">
                                <div class="product">
                                    <input class="checkbox_input" type="checkbox" id="select_all_header">
                                    <p style="color: #212529">Product</p>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row">
                                    <div class="nhom">
                                        <div class="col-lg-3 nhom1">
                                            <div>Unit Price</div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div>Quantity</div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div>Money(vnđ)</div>
                                        </div>
                                        <div class="col-lg-3 nhom1">
                                            <div>Action</div>
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
                                        <img class="product_img" src="${pageContext.request.contextPath}<%= item.getImg() %>" alt="product image">
                                    </a>
                                    <div class="c54pg1 col-lg-4">
                                        <a title="<%= item.getShoe_name() %>" href="#"><%= item.getShoe_name() %></a>
                                        <div class="co-inspection"><span>Free exchange 15 days</span></div>
                                        <img class="ship_img" src="https://down-vn.img.susercontent.com/file/vn-50009109-adeb9f40700bf1e29996a6caf07746e2" alt="loading..">
                                        <div class="gvFc9h"></div>
                                    </div>
                                    <div class="col-lg-3" style="left: 30px;">
                                        <div class="qNRZqG1 dropdown">
                                            <button class="mM4TZ8 dropdown-toggle btn" data-toggle="dropdown">
                                                <div class="iIg1CN" data-shoe-id="<%= item.getShoe_id()%>">Product classification:</div>
                                                <div class="iIg1CN"><%= item.getColor() %>, <%= item.getSize() %></div>
                                            </button>
                                            <div class="bfr5fB dropdown-menu">
                                                <div class="bfr5fB1">
                                                    <label class="UTcc4z"id="mau">Color:</label>
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
                                                    <button class="cancel-btn">Cancel</button>
                                                    <button class="xacnhan">Confirm</button>
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
                                            <button class="delete " onclick="deleteGroup(<%= item.getIdCartItem() %>)">Delete</button>
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
                    <button class="voucher-button">Add voucher</button>
                </div>
                <div class="total">
                    <div class="stardust-checkbox">
                        <label class="checkbox">
                            <input class="checkbox_input" type="checkbox" id="select_all_footer">
                            <div class="stardust-checkbox__box"></div>
                        </label>
                    </div>
                    <button class="select_all btn" type="checkbox" id="select_all">Select All (<%= listC.size() %>)</button>
                    <button class="btn" style="color: red" onclick="DeleteSelectedItems()">Delete</button>
                    <div>
                        <!--                            <button class="btn"><p class="btn" style="color: red">Bỏ sản phẩm không hoạt động</p></button>-->
                    </div>
                    <button class="btn">Save to Liked</button>
                    <div></div>
                    <div role="">
                        <div class="btn">
                            <div class="total_thanhtien">
                                <div id ="totalproduct" style="margin-right: 10px">Total Payment (0 Products)</div>
                                <div class="sapn02 priceform" id="totalprice">₫0</div>
                            </div>
                        </div>
                        <div></div>
                    </div>
                    <button class="pay">
                        <span class="" >Purchase</span>
                    </button>
                </div>
            </section>

        </div>
        <!-- Button to trigger modal -->
        <button id="open-error-modal-btn" style="display: none">Open Modal</button>

        <!-- Modal -->
        <div id="error-modal" class="modal">
            <div class="modal-content">
                <p id="error-mess" style="color: red">This is a feature not a bug1.</p>
                <div class="modal-buttons">
                    <button id="close-error-modal-btn">Cancel</button>
                </div>
            </div>
        </div>
        <div id="confirm-modal" class="modal">
            <div class="modal-content">
                <p id="confirm-message" class="modal-message">This is a feature not a bug.</p>
                <div class="modal-buttons">
                    <button id="cancel-btn" class="modal-btn">Cancel</button>
                    <button id="confirm-btn" class="modal-btn">OK</button>
                </div>
            </div>
        </div>
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Shop by Sport</span></h2>

        <jsp:include page="FooterTag.jsp"></jsp:include>

            <!-- JavaScript to handle the checkbox functionality -->
            <script>        // Lấy modal và các phần tử liên quan
                var openModal = document.getElementById('open-error-modal-btn');
                var errorModal = document.getElementById('error-modal');
                var closeErrorButton = document.getElementById('close-error-modal-btn');
                var modalMessage = document.getElementById('error-mess');
                var confirmModal = document.getElementById('confirm-modal');
                var confirmMessage = document.getElementById('confirm-message');
                var confirmButton = document.getElementById('confirm-btn');
                var cancelButton = document.getElementById('cancel-btn');

                function closeConfirmModal() {
                    confirmModal.style.display = 'none';
                }
                function showConfirmModal(message) {
                    confirmMessage.textContent = message; // Thiết lập nội dung thông báo
                    confirmModal.style.display = 'block'; // Hiển thị modal
                }
                cancelButton.onclick = function () {
                    confirmResult = false;
                    closeConfirmModal();
                };
                // Hàm hiển thị modal lỗi khi xóa không thành công và thiết lập nội dung
                function showErrorModal(message) {
                    modalMessage.textContent = message; // Thiết lập nội dung thông báo
                    errorModal.style.display = 'block'; // Hiển thị modal
                }
                // Mở để test
                openModal.onclick = function () {
                    errorModal.style.display = 'block';
                };
                // Đóng modal khi nhấn nút Close
                closeErrorButton.onclick = function () {
                    errorModal.style.display = 'none';
                };

                // Đóng modal khi nhấn phím ESC
                window.onkeydown = function (event) {
                    if (event.key === 'Escape') {
                        errorModal.style.display = 'none';
                    }
                };
            </script>

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
                        url: "${pageContext.request.contextPath}/cart",
                        method: "POST",
                        data: {
                            action: "deleteCartItem",
                            cartItemId: cartItemId
                        },
                        success: function (response) {
                            // Update UI after successful deletion
                            var deletedGroup = document.getElementById("cartItem" + cartItemId);
                            deletedGroup.remove(); // Remove the group from UI
                            selectedItems(); // Update selected items count and total price display
                        },
                        error: function () {
                            showErrorModal('Failed to delete group from cart.');
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
                    totalproduct.innerHTML = "Total payment (" + check + " Product):";
                    var totalprice = document.getElementById("totalprice");
                    totalprice.innerHTML = "₫" + total.toLocaleString('en') + '.0';
                    var totalCartItem = document.getElementById("select_all");
                    totalCartItem.innerHTML = "Select All (" + quantityCartItem.length + ")";
                }
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Script for handling checkbox toggles
                const selectAllHeader = document.getElementById('select_all_header');
                const selectAllFooter = document.getElementById('select_all_footer');
                const itemCheckboxes = document.querySelectorAll('.item-checkbox');

                // Function to update select all checkboxes based on individual checkboxes
                function updateSelectAllCheckboxes() {
                    const allChecked = [...itemCheckboxes].every(checkbox => checkbox.checked);
                    selectAllHeader.checked = allChecked;
                    selectAllFooter.checked = allChecked;
                }

                // Function to toggle all checkboxes based on header/footer checkbox state
                function toggleAllCheckboxes(isChecked) {
                    itemCheckboxes.forEach(checkbox => {
                        checkbox.checked = isChecked;
                    });
                    selectAllHeader.checked = isChecked;
                    selectAllFooter.checked = isChecked;
                }

                // Event listener for select all checkboxes (header and footer)
                [selectAllHeader, selectAllFooter].forEach(selectAll => {
                    selectAll.addEventListener('change', function () {
                        toggleAllCheckboxes(selectAll.checked);
                    });
                });

                // Event listener for individual item checkboxes
                itemCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', updateSelectAllCheckboxes);
                });

                // Function to send AJAX request to update item quantity on the server
                function sendUpdateRequest(cartItemId, newQuantity) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/cart",
                        method: "POST",
                        data: {
                            action: "updateQuantity",
                            cartItemId: cartItemId,
                            quantity: newQuantity
                        },
                        success: function (response) {
                            // Update the total price and unit price in the UI
                            // newQuantity = response.quantity;
//                            updateQuantity()
                            var totalPriceElement = document.getElementById("cart" + cartItemId);
                            totalPriceElement.innerHTML = '₫' + (response.price * newQuantity).toLocaleString('en') + '.0';
                            var PriceElement = document.getElementById("price" + cartItemId);
                            PriceElement.innerHTML = '₫' + (response.price.toLocaleString('en')) + '.0';
                            selectedItems(); // Update the selected items count and total price display

                        }
//            error: function () {
//            showErrorModal('Failed to update quantity.');
//            }
                    });
                }

                // Function to update quantity based on increment/decrement buttons
                function updateQuantity(input, increment) {
                    const cartItemId = input.dataset.cartId;

                    let quantity = parseInt(input.value, 10);
//                    quantity = increment ? quantity + 1 : Math.max(0, quantity - 1);
                    if (quantity === 0) {
                        // Display a confirmation dialog for deletion
                        showConfirmModal("Do you want to remove this product from your cart?");
                        confirmButton.onclick = function () { // Corrected line
                            deleteGroup(cartItemId); // Call delete function with the corresponding cartItemId
                            closeConfirmModal();
                        };
                        cancelButton.onclick = function () { // Corrected line

                            closeConfirmModal();
                        };
                        quantity = 1; // Reset quantity to 1 if deletion is canceled

                    }
                    input.value = quantity;
                    sendUpdateRequest(cartItemId, quantity);
                }
// Event listeners for increment buttons
                document.querySelectorAll('.increment').forEach(button => {
                    button.addEventListener('click', function () {
                        const quantityInput = button.closest('.nhom1').querySelector('.quantity');
                        var quantity = parseInt(quantityInput.value, 10);
                        quantityInput.value = quantity + 1;
                        fetchQuantityAndUpdate(quantityInput, true);
                    });
                });

// Event listeners for decrement buttons
                document.querySelectorAll('.decrement').forEach(button => {
                    button.addEventListener('click', function () {
                        const quantityInput = button.closest('.nhom1').querySelector('.quantity');
                        var quantity = parseInt(quantityInput.value, 10);
                        quantityInput.value = quantity - 1;
                        fetchQuantityAndUpdate(quantityInput, false);
                    });
                });

// Function to fetch quantity from the database and update it
                function fetchQuantityAndUpdate(input, increment) {
                    const cartItemId = input.dataset.cartId;

                    $.ajax({
                        url: "${pageContext.request.contextPath}/cart", // URL của servlet để lấy quantity từ database
                        method: "POST",
                        data: {
                            action: "fetchQuantity",
                            cartItemId: cartItemId,
                            quantity: input.value
                        },
                        success: function (response) {
                            var strErr = response.strErr;
                            if (strErr !== null && strErr.trim() !== "") {
                                showErrorModal(strErr);
                            }
                            input.value = response.quantity;
                            updateQuantity(input, increment);
                        },
                        error: function () {
                            showErrorModal('Failed to fetch quantity from database.');
                        }
                    });
                }
                // Event listeners for manual quantity input changes
                document.querySelectorAll('.quantity').forEach(input => {
                    // Kiểm tra và loại bỏ ký tự không phải số khi người dùng nhập
                    input.addEventListener('input', function () {
                        input.value = input.value.replace(/[^\d]/g, '');
                    });

                    // Kiểm tra và loại bỏ ký tự không phải số khi người dùng rời khỏi ô nhập liệu
                    input.addEventListener('blur', function () {
                        input.value = input.value.replace(/[^\d]/g, '');
                        fetchQuantityAndUpdate(input, false);
                    });
                });


                // Initialize select all checkboxes based on individual checkbox states
                updateSelectAllCheckboxes();
            });

            document.addEventListener('DOMContentLoaded', function () {
                // Initialize selectedItems function on page load
                var itemCheckboxes = document.querySelectorAll('.checkbox_input');
                itemCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', function () {
                        selectedItems(); // Call selectedItems function whenever there is a change in checkbox_input
                    });
                });

                // Format price elements to include commas and currency symbol
                var priceElements = document.querySelectorAll('.priceform');
                priceElements.forEach(element => {
                    var currentPrice = parseFloat(element.textContent.replace('₫', '').replace(/,/g, ''));
                    var formattedPrice = currentPrice.toLocaleString('en');
                    element.textContent = "₫" + formattedPrice + ".0";
                });
            });

        </script>
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <script src="${pageContext.request.contextPath}/assets_h/js/main.js"></script>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_h/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets_h/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="${pageContext.request.contextPath}/assets_h/mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

    </body>
</html>