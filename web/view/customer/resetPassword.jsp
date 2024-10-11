<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <style>
            /* Body styles */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */
                height: 100vh; /* Chiều cao toàn bộ viewport */
            }

            /* Form styles */
            form {
                width: 90%;
                max-width: 400px;
                padding: 20px;
                background: white;
                border: 2px solid #ccc; /* Viền khung */
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                text-align: center; /* Căn giữa nội dung */
            }

            /* Input styles */
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Button styles */
            button {
                width: 100%;
                padding: 10px;
                background-color: #5cb85c;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            button:hover {
                background-color: #4cae4c;
            }

            /* Error and success message styles */
            p {
                margin: 10px 0;
                font-weight: bold;
            }

            .error-message {
                color: red;
            }

            .success-message {
                color: green;
            }
            /* Error and success message styles */
            .error-message {
                color: red;
                font-weight: bold;
                margin: 10px 0;
            }
            .success-message {
                color: green;
                font-weight: bold;
                margin: 10px 0;
            }
        </style>
    </head>
    <body>
        <form action="reset_password" method="post">
            <input type="hidden" name="token" value="${token}" />
            <input type="password" name="newPassword" required placeholder="Mật khẩu mới" />
            <input type="password" name="confirmPassword" required placeholder="Xác nhận mật khẩu mới" />
            <button type="submit">Đặt lại mật khẩu</button>
            <c:if test="${not empty sessionScope.errorMessage}">
                <p class="error-message">${sessionScope.errorMessage}</p>
                <c:remove var="errorMessage" scope="session" />
            </c:if>
            <c:if test="${not empty sessionScope.successMessage}">
                <p class="success-message">${sessionScope.successMessage}</p>
                <c:remove var="successMessage" scope="session" />
            </c:if>
        </form>
    </body>
</html>
