<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Confirmation</title>
    <!-- Add your CSS link here -->
    <style>
        .toggle-password {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Password Confirmation</h2>
    <form action="processPassword.jsp" method="POST">
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
            <span class="toggle-password" onclick="togglePasswordVisibility('password')">Show</span>
        </div>
        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword">
            <span class="toggle-password" onclick="togglePasswordVisibility('confirmPassword')">Show</span>
        </div>
        <button type="submit">Submit</button>
    </form>

    <!-- Add your JavaScript code here -->
    <script>
        function togglePasswordVisibility(inputId) {
            var input = document.getElementById(inputId);
            if (input.type === "password") {
                input.type = "text";
            } else {
                input.type = "password";
            }
        }
    </script>
</body>
</html>
