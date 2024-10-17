<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-container {
                width: 90%;
                max-width: 400px;
                padding: 20px;
                background: white;
                border: 2px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                margin-bottom: 20px;
            }

            input[type="password"],
            input[type="text"],
            input[type="email"] {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

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

            .error-message {
                color: red;
            }

            .success-message {
                color: green;
            }

            .error-message {
                color: red;
                text-align: center;
                font-weight: bold;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            }

            .success-message {
                color: green;
                text-align: center;
                font-weight: bold;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
            }

            .note-container {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100%;
                margin-top: 20px;
            }

            .note {
                font-size: 18px;
                color: #555;
                text-align: left;
                font-weight: bold;
            }

            .note p {
                margin: 5px 0;
                padding-left: 20px;
            }

        </style>
    </head>
    <body>
        <div class="form-container">
            <form action="link_reset" method="post">
                <input type="email" name="email" required placeholder="Nhập email đã đăng ký" />
                <button type="submit">Gửi yêu cầu đặt lại mật khẩu</button>

                <c:if test="${not empty sessionScope.successMessage}">
                    <p class="success-message">${sessionScope.successMessage}</p>
                    <c:remove var="successMessage" scope="session" />
                </c:if>

                <c:if test="${not empty sessionScope.errorMessage}">
                    <p class="error-message">${sessionScope.errorMessage}</p>
                    <c:remove var="errorMessage" scope="session" />
                </c:if>
            </form>
        </div>

        <div class="note-container">
            <div class="note">
                <p>- Sử dụng email đã đăng ký để nhận mã xác thực.</p>
                <p>- Mã xác thực có thời gian trong 5 phút.</p>
                <p>- Vui lòng không chia sẻ mã xác thực.</p>
            </div>
        </div>
    </body>
</html>
