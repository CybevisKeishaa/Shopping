<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="copyright" content="" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <!-- Title Tag  -->
        <title>Change Password</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png" />
        <!-- Web Font -->
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
            rel="stylesheet"
            />

    <jsp:include page="/Demo_Template/BasePage/Header.jsp" /> <br><br><br><br>
</head>


<!-- Start Change Password -->
<div class="change_password">
    <h2>Change Password</h2>

    <form action="${pageContext.request.contextPath}/change_password" method="post">
        <label for="currentPassword">Current Password:</label>
        <input type="password" id="currentPassword" name="currentPassword" required /><br />

        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required /><br />

        <label for="confirmPassword">Confirm New Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required /><br />

        <div class="change_password-actions">
            <a href="${pageContext.request.contextPath}/customer_profile"> < Back to Profile</a>
            <input type="submit" value="Change" />
        </div>
    </form>

    <c:if test="${not empty sessionScope.errorMessage}">
        <p class="message error">${sessionScope.errorMessage}</p>
        <c:remove var="errorMessage" scope="session" />
    </c:if>

    <c:if test="${not empty sessionScope.successMessage}">
        <p class="message success">${sessionScope.successMessage}</p>
        <c:remove var="successMessage" scope="session" />
    </c:if>

    <div class="password-requirements">
        <h3>Yêu Cầu Mật Khẩu:</h3>
        <ul class="requirements-list">
            <li>Tối thiểu 5 ký tự</li>
            <li>Chứa ít nhất một chữ cái</li>
            <li>Chứa ít nhất một số</li>
            <li>Không chứa ký tự đặc biệt</li>
        </ul>
    </div>
</div>
<!-- End Change Password -->

<br><br><br> 
<jsp:include page="/Demo_Template/BasePage/Footer.jsp" />    

</body>
</html>


