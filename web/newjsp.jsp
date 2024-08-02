<%-- 
    Document   : newjsp
    Created on : Jul 14, 2024, 5:13:16 PM
    Author     : ViQuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <p style="color: red;text-align: right;margin: 0 0;">02:00</p>
    <h1>Nhập Mã OTP</h1>
    <p>Vui lòng nhập mã OTP đã được gửi đến Email của bạn.</p>
    <form id="otp-form" action="/verify-otp" method="post">
        <div class="otp-inputs">
            <input type="text" id="otp1" name="otp1" required maxlength="1" pattern="\d" title="Mã OTP phải gồm 6 chữ số" inputmode="numeric">
            <input type="text" id="otp2" name="otp2" required maxlength="1" pattern="\d" inputmode="numeric">
            <input type="text" id="otp3" name="otp3" required maxlength="1" pattern="\d" inputmode="numeric">
            <input type="text" id="otp4" name="otp4" required maxlength="1" pattern="\d" inputmode="numeric">
            <input type="text" id="otp5" name="otp5" required maxlength="1" pattern="\d" inputmode="numeric">
            <input type="text" id="otp6" name="otp6" required maxlength="1" pattern="\d" inputmode="numeric">
        </div>
        <button type="submit">Xác Nhận</button>
    </form>
</div>
