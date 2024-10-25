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
            body {
                background-color: #f8f9fa;
            }

            .order-summary {
                max-width: 800px;
                margin: 50px auto;
                background-color: #fff;
                padding: 30px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
            }

            .order-summary h2 {
                margin-bottom: 30px;
                text-align: center;
                font-size: 32px;
                color: #007bff;
            }

            .order-details {
                font-size: 18px; /* Làm to thông tin đơn hàng */
                line-height: 1.8;
                margin-bottom: 30px;
            }

            .order-details strong {
                font-size: 20px; /* Tăng kích thước chữ cho các thông tin quan trọng */
            }

            .shipping-details {
                margin-top: 30px;
                text-align: left;
                font-size: 16px;
            }

            .btn-primary {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 12px 30px;
                text-transform: uppercase;
                cursor: pointer;
                margin-top: 20px;
                border-radius: 5px;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }

            .btn-primary:hover {
                background-color: #0056b3;
            }

            ul {
                padding-left: 0;
                list-style: none;
            }

            ul li {
                margin-bottom: 10px;
            }

            h3{
                margin-bottom: 15px !important;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>

        <div class="order-summary">
            <h2>Order Submited</h2>


            <h3>Thông tin đơn hàng:</h3>
            <div class="order-details">
                <p><strong>Mã đơn hàng:</strong> ${requestScope.order.order_id}</p>
                <ul>
                    <!-- Lặp qua danh sách các sản phẩm đã đặt trong hóa đơn -->
                    <c:forEach var="p" items="${requestScope.product}">
                        <li>
                            <strong>${p.name}</strong> x${p.stock} - 
                            <fmt:formatNumber value="${p.stock * p.capacity[0].unit_price}" type="currency" currencySymbol="VND"/>
                        </li>
                    </c:forEach>
                </ul>
                <p><strong>Tổng giá trị đơn hàng:</strong> 
                    <fmt:formatNumber value="${requestScope.order.total_price}" type="currency" currencySymbol="VND"/>
                </p>
            </div>

            <!-- Thông tin giao hàng -->
            <div class="shipping-details">
                <h3>Địa chỉ giao hàng:</h3>
                <p><strong>Tên người nhận:</strong> ${requestScope.order.customer.name_cus}</p>
                <p><strong>Địa chỉ:</strong> ${requestScope.order.address.street}, ${requestScope.order.address.ward}, ${requestScope.order.address.district}, ${requestScope.order.address.city} - ${requestScope.order.address.a_phone}</p>
                <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${requestScope.order.create_at}" pattern="dd/MM/yyyy"/></p>
                <p><strong>Note:</strong> ${requestScope.order.note}</p>
            </div>

            <!-- Nút quay lại trang chủ -->
            <div class="text-right">
                <a href="${pageContext.request.contextPath}/homepage" class="btn-primary">Quay lại trang chủ</a>
            </div>
        </div>

        <!-- Include footer -->
        <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/>
    </body>
</html>
