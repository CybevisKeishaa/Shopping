<%-- 
    Document   : cartComplete
    Created on : Oct 23, 2024, 7:45:09 PM
    Author     : KEISHA
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Complete</title>

    <style>
        .order-summary {
            margin-top: 50px;
        }

        .order-summary h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 0.75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }

        .table thead th {
            vertical-align: bottom;
            border-bottom: 2px solid #dee2e6;
        }

        .table tbody + tbody {
            border-top: 2px solid #dee2e6;
        }

        .text-right {
            text-align: right;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 20px;
            text-transform: uppercase;
            cursor: pointer;
            display: inline-block;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Include header -->
    <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>

    <div class="container order-summary">
        <h2>Order Complete</h2>
        <!-- Thông tin đơn hàng -->
        <div class="order-details">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Lặp qua danh sách các sản phẩm đã đặt trong hóa đơn -->
                    <c:forEach var="item" items="${orderDetails.items}">
                        <tr>
                            <td>${item.product.product_id}</td>
                            <td>${item.product.name}</td>
                            <td><fmt:formatNumber value="${item.capacity.unit_price}" type="currency" currencySymbol="VND"/></td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.quantity * item.capacity.unit_price}" type="currency" currencySymbol="VND"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4" class="text-right"><strong>Total Order Price:</strong></td>
                        <td><fmt:formatNumber value="${orderDetails.totalPrice}" type="currency" currencySymbol="VND"/></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <!-- Thông tin giao hàng -->
        <div class="shipping-details">
            <h3>Shipping Information</h3>
            <p><strong>Receiver Name:</strong> ${orderDetails.customer.name_cus}</p>
            <p><strong>Email:</strong> ${orderDetails.customer.email}</p>
            <p><strong>Phone:</strong> ${orderDetails.address.a_phone}</p>
            <p><strong>Shipping Address:</strong> ${orderDetails.address.street}, ${orderDetails.address.ward}, ${orderDetails.address.district}, ${orderDetails.address.city}</p>
            <p><strong>Order Date:</strong> <fmt:formatDate value="${orderDetails.orderDate}" pattern="dd/MM/yyyy"/></p>
        </div>

        <!-- Nút quay lại trang chủ -->
        <div class="text-right">
            <a href="${pageContext.request.contextPath}/homepage" class="btn btn-primary">Go Back to Homepage</a>
        </div>
    </div>

    <!-- Include footer -->
    <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/>
</body>
</html>
