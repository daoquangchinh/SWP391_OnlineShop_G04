<%-- 
    Document   : OTP
    Created on : Jul 20, 2024, 9:52:04 PM
    Author     : ViQuan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enter OTP</title>
    </head>
    <body>
        <div class="full-page"> 
            <div class="containerOTP">
                <div id="countdown" class="countdown"></div>
                <h1 style="display: block;    color: black;">Enter OTP</h1>
                <p>Please enter the OTP that has been sent to your email.</p>
                <!--                <form id="otp-form" action="OTPServlet" method="post">-->
                <div class="otp-inputs">
                    <input type="text" id="otp1" name="otp1" required maxlength="1" pattern="\d" title="The OTP must be 6 digits long" inputmode="numeric">
                    <input type="text" id="otp2" name="otp2" required maxlength="1" pattern="\d" inputmode="numeric">
                    <input type="text" id="otp3" name="otp3" required maxlength="1" pattern="\d" inputmode="numeric">
                    <input type="text" id="otp4" name="otp4" required maxlength="1" pattern="\d" inputmode="numeric">
                    <input type="text" id="otp5" name="otp5" required maxlength="1" pattern="\d" inputmode="numeric">
                    <input type="text" id="otp6" name="otp6" required maxlength="1" pattern="\d" inputmode="numeric">
                </div>
                <div id="message" class="message"></div>
                <button  id="submitOtpBtn">Confirm</button>
                <!--</form>-->
            </div>
        </div>
    </body>



</html>
