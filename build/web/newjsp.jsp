<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password Toggle Example</title>
<style>
    /* Style cho ô nh?p m?t kh?u */
    .password-input {
        margin-bottom: 10px;
        padding-right: 30px; /* Thêm padding ?? gi? ch? cho bi?u t??ng m?t */
    }
    
    /* Style cho bi?u t??ng m?t */
    .toggle-password-btn {
        position: absolute;
        top: 50%;
        right: 5px;
        transform: translateY(-50%);
        cursor: pointer;
    }
</style>
</head>
<body>
    <h2>Password Toggle Example</h2>
    <label for="passwordField">Password:</label>
    <!-- Tr??ng nh?p m?t kh?u -->
    <div style="position: relative;">
        <input type="password" id="passwordField" class="password-input" placeholder="Enter your password">
        <!-- Button bi?u t??ng m?t -->
        <button type="button" id="togglePassword" class="toggle-password-btn">
            <img src="eye-icon.png" alt="Toggle Password" width="20">
        </button>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const passwordField = document.getElementById("passwordField");
            const togglePassword = document.getElementById("togglePassword");

            // B?t s? ki?n nh?p vào button bi?u t??ng m?t
            togglePassword.addEventListener("click", function() {
                // N?u tr??ng nh?p m?t kh?u ?ang ? ki?u password
                if (passwordField.getAttribute("type") === "password") {
                    // Hi?n th? m?t kh?u d??i d?ng v?n b?n thô
                    passwordField.setAttribute("type", "text");
                } else {
                    // N?u tr??ng nh?p m?t kh?u ?ang ? ki?u text, ?n m?t kh?u
                    passwordField.setAttribute("type", "password");
                }
            });
        });
    </script>
</body>
</html>
