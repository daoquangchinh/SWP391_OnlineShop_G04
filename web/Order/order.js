/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    // Xử lý sự kiện khi click vào nút filter-button
    formatItemPrices();
    $(document).on('click', '.filter-button', function () {
        // Xóa lớp active khỏi tất cả các nút
        $('.filter-button').removeClass('active');

        // Thêm lớp active cho nút được click
        $(this).addClass('active');

        // Lấy giá trị filter từ nút được click
        var filterValue = $(this).val();

        // Gọi AJAX để lấy dữ liệu từ servlet
        $.ajax({
            type: 'POST',
            url: 'OrderItemServlet',
            data: {filter: filterValue},
            success: function (data) {
                // Cập nhật nội dung của .Right-content khi thành công
                $('.Right-content').html(data);

                // Format lại các giá trị giá sản phẩm
                formatItemPrices();
            },
            error: function () {
                // Xử lý lỗi khi tải dữ liệu
                alert('Đã xảy ra lỗi khi tải lại dữ liệu.');
            }
        });
    });

    // Hàm format lại giá tiền của các sản phẩm
    
    
});
            function formatItemPrices() {
        var itemPriceElements = document.querySelectorAll('.item-price');
        itemPriceElements.forEach(function (itemPriceElement) {
            var itemPriceText = itemPriceElement.textContent.trim();
            var formattedPrice = formatCurrency(itemPriceText);
            itemPriceElement.textContent = formattedPrice;
        });
    }

    // Hàm format số tiền thành định dạng tiền tệ
    function formatCurrency(price) {
        var parts = price.split('đ');
        var numberPart = parts[0].trim();
        var formattedNumber = numberPart.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        return formattedNumber + 'đ';}