/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    $("#payServlet").submit(function (event) {
        event.preventDefault();
        placeOrder(); // Kiểm tra hàng tồn kho trước khi submit form
    });
});
function placeOrder() {
    const selectedBankCode = document.querySelector('input[name="bankCode"]:checked').value;

    $.ajax({
        url: 'checkOut', // URL để kiểm tra hàng tồn kho
        type: 'GET',
        data: {bankCode: selectedBankCode},
        dataType: 'json',
        success: function (response) {
            if (response.available) {
                // Nếu sản phẩm có sẵn, tiến hành submit form thanh toán
                var postData = $("#payServlet").serialize();
                var submitUrl = $("#payServlet").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            // Chuyển hướng đến URL thanh toán
                            window.location.href = x.data;
                        } else {
                            alert(x.message);
                        }
                    }
                });

            } else {
                alert('Sản phẩm đã hết hàng!');
                window.location.href = 'cart';
            }
        },
        error: function (xhr, status, error) {
            console.error('Error:', error);
            alert('Đã xảy ra lỗi khi kiểm tra hàng hóa.');
        }
    });
}


function handleCheckoutPageLoad() {
    const cartItems = document.querySelectorAll(".cart-item");
    let productTotal = 0;

    cartItems.forEach(item => {
        const price = parseFloat(item.getAttribute("data-price"));
        const quantity = parseInt(item.getAttribute("data-quantity"));
        productTotal += price * quantity;

    });

    document.getElementById("product-total").innerHTML = productTotal.toLocaleString("en") + "đ";
    const voucherDiscount = 0;
    const overallTotal = productTotal - voucherDiscount;
    document.getElementById("overall-total").innerHTML = overallTotal.toLocaleString('en') + "đ";
    document.getElementById('amount').value = overallTotal;

    formatAllPrices();
}


function formatAllPrices() {

    var priceElements = document.querySelectorAll('.item-price');
    priceElements.forEach(element => {
        var currentPrice = parseFloat(element.textContent.replace('₫', '').replace(/,/g, ''));
        var formattedPrice = currentPrice.toLocaleString('en');
        element.textContent = formattedPrice + "₫";
    });

}


