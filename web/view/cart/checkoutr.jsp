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
                height: 34px !important;
                padding: 10px !important;
                font-size: 1rem;
                line-height: 1rem !important;
                text-align: left  !important;
                justify-content: left  !important;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
            }

            .btn-secondary {
                background-color: #333 !important; /* Nền màu đen */
                color: white !important; /* Màu chữ trắng */
                border: 1px solid #00FF00 !important; /* Viền màu xanh lá cây */
                padding: 8px 30px !important; /* Padding tùy chỉnh */
                text-transform: uppercase !important; /* Chữ in hoa */
                transition: background-color 0.3s, color 0.3s !important;
            }

            .btn-secondary:hover {
                color: #111 !important;
                background-color: #e0a800 !important;
                border-color: #d39e00 !important;
            }
        </style>
    </head>
    <body>
        <!-- Include header -->
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>
        <section class="shop checkout section">
            <div class="container mt-5">
                <!-- Product Summary Section -->
                <div class="row">
                    <div class="col-md-8">
                        <div class="col-12">
                            <div class="section-title">
                                <h2>Feedback</h2> <!-- Giữ style tiêu đề của bạn -->
                            </div>
                        </div>

                        <!-- Kiểm tra nếu giỏ hàng có sản phẩm -->
                        <c:if test="${not empty cart.items}">
                            <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
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
                                                <td><fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="VND"/></td>
                                                <td>${item.quantity}</td>
                                                <td><fmt:formatNumber value="${item.quantity * item.product.price}" type="currency" currencySymbol="VND"/></td>
                                            </tr>
                                            <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.product.price)}"/>  
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="4" class="text-right"><strong>Total Order Price:</strong></td>
                                            <td><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/></td>
                                        </tr>
                                    </tfoot>
                                </table>


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
                                            <label for="gender">Gender</label>
                                            <select name="gender" class="gender-select form-control">
                                                <option value="1" ${user.gender == 1 ? 'selected' : ''}>Male</option>
                                                <option value="0" ${user.gender == 0 ? 'selected' : ''}>Female</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" name="email" value="${sessionScope.customer.email}" class="form-control" required />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="mobile">Mobile</label>
                                            <input type="text" name="mobile" value="${sessionScope.customer.c_phone}" class="form-control" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input type="text" name="address" value="aaaa" class="form-control" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="notes">Order Notes</label>
                                    <textarea name="notes" class="form-control"></textarea>
                                </div>

                                <div class="text-right">
                                    <a href="${pageContext.request.contextPath}/cart/list" class="btn btn-secondary">Change</a>
                                    <button type="${pageContext.request.contextPath}cart/checkout/submit" class="btn btn-primary">Submit Order</button>
                                </div>
                            </form>
                        </c:if>

                        <!-- Hiển thị thông báo nếu giỏ hàng trống -->
                        <c:if test="${empty cart.items}">
                            <p>Your cart is currently empty. <a href="/productList">Go back to product list</a></p>
                        </c:if>

                    </div>

                    <div class="col-lg-4 col-12">
                        <div class="order-details">
                            <!-- Order Widget -->
                            <div class="single-widget">
                                <h2>CART  TOTALS</h2>
                                <div class="content">
                                    <ul>
                                        <li>Total cost<span><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/></span></li>
                                        <li>Total product<span>${cart.items.size()}</span></li>
                                        <!--<li>Discount<span>${cart.items.size()}</span></li>-->
                                        <li class="last">Total<span><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/></span></li>
                                        <input type="hidden" name="totalCost" value="${totalPrice}" />
                                    </ul>
                                </div>
                            </div>
                            <!--/ End Order Widget -->
                            <!-- Order Widget -->
                            <div class="single-widget">
                                <h2>Payments</h2>
                                <div class="content">
                                    <div class="checkbox">
                                        <c:forEach var="payment" items="${requestScope.payments}"> 
                                            <input type="radio" name="paymentMethod" value="${payment.paymentID}"> ${payment.paymentName} <br>
                                            
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Order Widget -->
                            <!-- Payment Method Widget -->
                            <div class="single-widget payement">
                                <div class="content">
                                    <img src="${pageContext.request.contextPath}/images/payment-method.png" alt="#">
                                </div>
                            </div>
                            <!--/ End Payment Method Widget -->
                            <!-- Button Widget -->
                            <div class="single-widget get-button">
                                <div class="content">
                                    <div class="button">
                                        <a href="#" class="btn">proceed to checkout</a>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Button Widget -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Include footer -->
        <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/>

    </body>
</html>
