<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout Page</title>

        <style>
            .gender-select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                width: 100% !important;
                height: 33px !important;
                padding: 13px !important;
                font-size: 1rem;
                line-height: 0.5rem !important;
                text-align: center !important;
                justify-content: center !important;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
            }

            .nice-select {
                display: block !important;
                width: 100% !important;
                min-height: 30px;
                border: 1px solid #ccc;
                border-radius: 5px;
                padding: 10px;
                background-color: white;
                position: relative;
                z-index: 10;
            }

            .nice-select.open .list {
                display: block !important;
                opacity: 0 !important;
                visibility: visible !important;
            }

            .nice-select .list {
                max-height: 300px;
                overflow-y: auto;
            }

            .nice-select .option.selected {
                background-color: #3164F4 !important;
                color: white !important;
            }

            .btn-secondary {
                background-color: #333 !important;
                color: white !important;
                border: 1px solid #00FF00 !important;
                padding: 8px 30px !important;
                text-transform: uppercase !important;
                transition: background-color 0.3s, color 0.3s !important;
            }

            .btn-secondary:hover {
                color: #111 !important;
                background-color: #e0a800 !important;
                border-color: #d39e00 !important;
            }

            .order-details button[type="submit"] {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 20px;
                text-transform: uppercase;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
            }

            .order-details button[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>
        <section class="shop checkout section">
            <div class="container mt-5">
                <div class="row">
                    <!-- Main content -->
                    <div class="col-md-8">
                        <div class="col-12">
                            <div class="section-title">
                                <h2>Checkout</h2>
                            </div>
                        </div>
                        <!-- Kiểm tra nếu giỏ hàng có sản phẩm -->
                        <c:if test="${not empty cart.items}">
                            <!-- Đặt form bao quanh toàn bộ phần checkout -->
                            <form id="cartForm" action="${pageContext.request.contextPath}/cart/checkout" method="post">
                                <!-- Thông tin giỏ hàng -->
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total Cost</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="totalPrice" value="0"/>
                                        <c:forEach var="item" items="${requestScope.cart.items}">
                                            <tr>
                                                <td>${item.product.product_id}</td>
                                                <td>${item.product.name}</td>
                                                <td><fmt:formatNumber value="${item.capacity.unit_price}" type="currency" currencySymbol="VND"/></td>
                                                <td>${item.quantity}</td>
                                                <td><fmt:formatNumber value="${item.quantity * item.capacity.unit_price}" type="currency" currencySymbol="VND"/></td>

                                                <!-- Các trường hidden để lưu thông tin sản phẩm -->
                                        <input type="hidden" name="productID" value="${item.product.product_id}">
                                        <input type="hidden" name="quantity" value="${item.quantity}">
                                        <input type="hidden" name="unit_price" value="${item.capacity.unit_price}">
                                        <input type="hidden" name="capacity_id" value="${item.capacity.capacity_id}">
                                        <input type="hidden" name="capacity_stock" value="${item.capacity.stock}">
                                        </tr>
                                        <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.capacity.unit_price)}"/>  
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="4" class="text-right"><strong>Total Order Price:</strong></td>
                                            <td><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/></td>
                                    <input type="hidden" name="totalCost" value="${totalPrice}">
                                    </tr>
                                    </tfoot>
                                </table>

                                <!-- Thông tin người nhận -->
                                <h3>Receiver Information</h3> <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fullname">Full Name</label>
                                            <input type="text" name="fullname" value="${sessionScope.customer.name_cus}" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" name="email" value="${sessionScope.customer.email}" class="form-control" required />
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="address">Select Address:</label>
                                            <select name="selectedAddress" class="form-control" required>
                                                <c:forEach var="address" items="${requestScope.address}">
                                                    <option value="${address.a_id}">
                                                        ${address.street}, ${address.ward}, ${address.district}, ${address.city} - Phone: ${address.a_phone}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- Ghi chú đơn hàng -->
                                <div class="form-group">
                                    <label for="notes">Order Notes</label>
                                    <textarea name="notes" class="form-control"></textarea>
                                </div>

                                <!-- Nút xử lý đơn hàng -->
                                <div class="text-right">
                                    <a href="${pageContext.request.contextPath}/cart/list" class="btn btn-secondary">Change</a>
                                </div>
                            </form> <!-- Kết thúc form -->
                        </c:if>

                        <!-- Hiển thị thông báo nếu giỏ hàng trống -->
                        <c:if test="${empty cart.items}">
                            <p>Your cart is currently empty. <a href="/productList">Go back to product list</a></p>
                        </c:if>
                    </div>

                    <!-- Chi tiết đơn hàng và thanh toán -->
                    <div class="col-lg-4 col-12">
                        <div class="order-details">
                            <!-- Thông tin tổng đơn hàng -->
                            <div class="single-widget">
                                <h2>CART TOTALS</h2>
                                <div class="content">
                                    <ul>
                                        <li>Total cost<span><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/></span></li>
                                        <li>Total product<span>${cart.items.size()}</span></li>
                                        <li class="last">Total<span><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/></span></li>
                                        <input type="hidden" name="totalCost" value="${totalPrice}" form="cartForm" />
                                    </ul>
                                </div>
                            </div>

                            <!-- Phương thức thanh toán -->
                            <div class="single-widget">
                                <h2>Payments</h2>
                                <div class="content">
                                    <div class="checkbox">
                                        <c:forEach var="payment" items="${requestScope.payments}"> 
                                            <input type="radio" name="paymentMethod" value="${payment.paymentID}" form="cartForm"> ${payment.paymentName} <br>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                    ${errorMessage}
                                </div>
                            </c:if>



                            <div class="single-widget get-button text-right">                                    
                                <button type="submit" form="cartForm" class="btn btn-primary">Proceed to checkout</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Include footer -->
        <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/>
        <script>
            $(document).ready(function () {
                $('select').niceSelect();
            });
        </script>
    </body>
</html>
