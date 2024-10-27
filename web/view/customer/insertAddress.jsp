<%-- 
    Document   : insertAddress
    Created on : Oct 27, 2024, 7:59:43 PM
    Author     : KEISHA
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Địa Chỉ</title>

    <style>
        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input, 
        .form-group select, 
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .sidebar {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        .sidebar h3 {
            font-size: 1.2rem;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s;
        }

        .sidebar ul li a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Include header -->
    <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>

    <section class="container mt-5">
        <div class="row">
            <!-- Nội dung chính -->
            <div class="col-md-8">
                <div class="section-title">
                    <h2>Thêm Địa Chỉ</h2>
                </div>
                <!-- Form thêm địa chỉ -->
                <form action="${pageContext.request.contextPath}/account/address/add" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="a_phone">Số Điện Thoại</label>
                                <input type="text" name="a_phone" placeholder="Số điện thoại" required />
                            </div>
                            <div class="form-group">
                                <label for="city">Thành Phố</label>
                                <input type="text" name="city" placeholder="Thành phố" required />
                            </div>
                            <div class="form-group">
                                <label for="ward">Phường/Xã</label>
                                <input type="text" name="ward" placeholder="Phường/xã" required />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="district">Quận/Huyện</label>
                                <input type="text" name="district" placeholder="Huyện" required />
                            </div>
                            <div class="form-group">
                                <label for="street">Đường</label>
                                <input type="text" name="street" placeholder="Đường" required />
                            </div>
                            <div class="form-group">
                                <label for="detail">Chi Tiết Khác</label>
                                <textarea name="detail" rows="3" placeholder="Nhập chi tiết khác nếu có"></textarea>
                            </div>
                        </div>
                    </div>

                    <input type="hidden" name="cus_id" value="${sessionScope.customer.cus_id}"/>

                    <div class="">
                        <button type="submit" class="btn-primary">Lưu Địa Chỉ</button>
                    </div>
                </form>
            </div>

            <!-- Sidebar -->
            <div class="col-md-4">
                <div class="sidebar">
                    <h3>Điều Hướng</h3>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/profile">Hồ Sơ Cá Nhân</a></li>
                        <li><a href="${pageContext.request.contextPath}/account/order">Đơn Hàng</a></li>
                        <li><a href="${pageContext.request.contextPath}/cart/list">Giỏ Hàng</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Include footer -->
    <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/>

</body>
</html>