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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerProfile.css" />
    <jsp:include page="/Demo_Template/BasePage/Header.jsp" /> <br><br><br><br>
</head>


<!-- Start Edit Profile -->
<div class="cusomerprofile">

    <h1>Thông tin cá nhân</h1>
    <form action="${pageContext.request.contextPath}/customer_profile" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="avatar">Ảnh đại diện</label>
            <div class="avatar-container">
                <img id="avatarPreview" src="${customer.avatar}" alt="Avatar" class="avatar" />
                <input type="file" id="avatar" name="avatar" accept="image/*">
            </div>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${customer.email}" readonly>
        </div>
        <div class="form-group">
            <label for="name_cus">Họ và Tên:</label>
            <input type="text" id="name_cus" name="name_cus" value="${customer.name_cus}" required>
        </div>
        <div class="form-group">
            <label for="c_phone">Số điện thoại:</label>
            <input type="text" id="c_phone" name="c_phone" value="${customer.c_phone}" required>
        </div>
        <div class="form-group">
            <label for="gender">Giới tính:</label>
            <select id="gender" name="gender">
                <option value="true" <c:if test="${customer.gender}">selected</c:if>>Nam</option>
                <option value="false" <c:if test="${!customer.gender}">selected</c:if>>Nữ</option>
                </select>
            </div>
            <button type="button" class="full-width-button" onclick="location.href = 'change_password'">Thay đổi mật khẩu</button>
            <br><br>
            <h2>Địa chỉ</h2>
        <c:forEach items="${addresses}" var="address">
            <div class="address-group">
                <h3>Địa chỉ</h3>
                <input type="hidden" name="a_id" value="${address.a_id}">
                <div class="form-group">
                    <label for="a_phone">Số điện thoại:</label>
                    <input type="text" id="a_phone" name="a_phone" value="${address.a_phone}" required>
                </div>
                <div class="form-group">
                    <label for="city">Thành phố:</label>
                    <input type="text" id="city" name="city" value="${address.city}" required>
                </div>
                <div class="form-group">
                    <label for="district">Quận/Huyện:</label>
                    <input type="text" id="district" name="district" value="${address.district}" required>
                </div>
                <div class="form-group">
                    <label for="ward">Phường/Xã:</label>
                    <input type="text" id="ward" name="ward" value="${address.ward}" required>
                </div>
                <div class="form-group">
                    <label for="street">Đường:</label>
                    <input type="text" id="street" name="street" value="${address.street}">
                </div>
                <div class="form-group">
                    <label for="detail">Chi tiết:</label>
                    <input type="text" id="detail" name="detail" value="${address.detail}">
                </div>
            </div> 
            <br>
        </c:forEach>
        <button type="submit">Cập nhật thông tin</button>
    </form>
    <c:if test="${not empty sessionScope.successMessage}">
        <div class="alert alert-success">${sessionScope.successMessage}</div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>
</div>
<br><br><br><br>

<jsp:include page="/Demo_Template/BasePage/Footer.jsp" />     
</body>
</html>


