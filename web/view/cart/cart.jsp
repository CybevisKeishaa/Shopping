<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng của bạn</title>

        <style>
            .btn-secondary {
                background-color: #333 !important; /* Nền màu đen */
                color: white !important; /* Màu chữ trắng */
                border: 0px solid #00FF00 !important; /* Viền màu xanh lá cây */
                padding: 18.15px 50px !important; /* Padding tùy chỉnh */
                text-transform: uppercase !important; /* Chữ in hoa */
                transition: background-color 0.3s, color 0.3s !important;
            }

            .btn-secondary:hover {
                color: #111 !important;
                background-color: #e0a800 !important;
                border-color: #d39e00 !important;
            }

            .btn-primary {
                padding: 18.15px 50px !important; /* Padding tùy chỉnh */
            }
            h3 {
                font-size: 24px;
                margin-top: 20px !important;
            }
            .order-info, .receiver-info, .ordered-products {
                margin-bottom: 30px;
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
            }
            table {
                width: 100%;
                margin-top: 20px;
                border-collapse: collapse;
            }
            table th, table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            table th {
                background-color: #f2f2f2;
            }
            .order-actions button {
                margin-right: 10px;
            }
            .order-actions form {
                display: inline-block;
            }
            .order-actions button, .ordered-products button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
            }
            .order-actions button:hover, .ordered-products button:hover {
                background-color: #0056b3;
                margin-bottom: 10px;
            }



        </style>


    </head>
    <body>

        <!-- Include Header -->
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/> <br><br><br>

        <div class="container">
            <div class="row">
                <!-- Main content: Cart Details -->
                <div class="col-md-8">
                    <div class="section-title">
                        <h2>Thông tin đặt hàng</h2> 
                    </div>
                    <c:if test="${not empty cart.items}">
                        <form id="cartForm" action="list" method="post">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>

                                        <th>Title</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total Cost</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="totalPrice" value="0"/>
                                    <c:forEach var="item" items="${cart.items}">
                                        <tr>                        
                                            <td>${item.product.name}</td>
                                            <td><fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="VND"/></td>
                                            <td>
                                                <!-- Đặt tên input là mảng itemId[] và quantity[] -->
                                                <input type="hidden" name="itemId[]" value="${item.item_id}" />
                                                <input type="number" name="quantity[]" value="${item.quantity}" min="1" onchange="updateTotal(${item.item_id}, this.value)" />
                                            </td>
                                            <td>
                                                <span id="total_cost_${item.item_id}">
                                                    <fmt:formatNumber value="${item.quantity * item.product.price}" type="currency" currencySymbol="VND"/>
                                                </span>
                                            </td>
                                            <td>
                                                <a href="../cart/item/delete?comm=del&itemID=${item.item_id}" class="btn btn-danger">
                                                    <i class="fa fa-remove"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.product.price)}"/>  
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="3" class="text-right"><strong>Total Order Price:</strong></td>
                                        <td colspan="3">
                                            <span id="total_order_price">
                                                <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/>
                                            </span>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="text-right">
                                <button type="submit" class="btn btn-secondary">Update Cart</button>
                                <a href="${pageContext.request.contextPath}/productList" class="btn btn-success">More Products</a>
                                <a href="${pageContext.request.contextPath}/cart/checkout" class="btn btn-warning">Check Out</a>
                            </div>
                        </form>


                    </c:if>
                    <c:if test="${empty cart.items}">
                        <p>Your cart is currently empty.</p>
                        <a href="productsList.jsp" class="btn btn-success">Choose Products</a>
                    </c:if>
                </div>

                <!-- Sidebar -->
                <div class="col-md-4">
                    <div class="sidebar">
                        <h3 class="feedback-title">Tìm kiếm sản phẩm</h3>
                        <form action="${pageContext.request.contextPath}/productSearch">
                            <div class="form-group">
                                <input type="text" class="form-control" name="search" placeholder="Tìm kiếm sản phẩm">
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm">Tìm kiếm</button>
                        </form>

                        <h3 class="feedback-title">Danh mục sản phẩm</h3>
                        <ul>
                            <li><a href="/category/perfume">Nước hoa</a></li>
                            <li><a href="/category/skincare">Chăm sóc da</a></li>
                            <li><a href="/category/makeup">Trang điểm</a></li>
                        </ul>

                        <h3 class="feedback-title">Liên hệ</h3>
                        <p>Email: Group6@gmail.com</p>
                        <p>Điện thoại: 0354995144</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include Footer -->
        <br><br><br>

        <script>
            function updateTotal(itemId, quantity) {
                // Tìm hàng chứa sản phẩm đang được thay đổi số lượng
                const row = document.querySelector(`input[value="${itemId}"]`).closest('tr');

                // Lấy giá của sản phẩm từ cột thứ hai (vị trí cột giá)
                let priceText = row.querySelector('td:nth-child(2)').innerText;
                priceText = priceText.replace(/\./g, '').replace(',', '.').replace(/[^0-9.]/g, '');

                const price = parseFloat(priceText);

                // Cập nhật tổng chi phí của sản phẩm (quantity * price)
                const totalCost = price * quantity;

                // Hiển thị tổng chi phí mới cho sản phẩm
                row.querySelector(`#total_cost_${itemId}`).innerText = new Intl.NumberFormat('de-DE').format(totalCost) + " VND";

                // Cập nhật tổng giá đơn hàng
                updateTotalOrderPrice();
            }

            function updateTotalOrderPrice() {
                let totalOrderPrice = 0;

                // Lặp qua tất cả các hàng trong bảng và tính tổng đơn hàng
                document.querySelectorAll('tr').forEach(function (row) {
                    const quantityInput = row.querySelector('input[type="number"]');
                    if (quantityInput) {
                        const quantity = parseFloat(quantityInput.value);

                        let priceText = row.querySelector('td:nth-child(2)').innerText;
                        priceText = priceText.replace(/\./g, '').replace(',', '.').replace(/[^0-9.]/g, '');

                        const price = parseFloat(priceText);

                        // Cộng tổng giá của từng sản phẩm vào tổng đơn hàng
                        totalOrderPrice += price * quantity;
                    }
                });

                // Hiển thị tổng giá đơn hàng mới
                document.querySelector('#total_order_price').innerText = new Intl.NumberFormat('de-DE').format(totalOrderPrice) + " VND";
            }

        </script>
        <jsp:include page="/Demo_Template/BasePage/Footer.jsp" />

        


    </body>
</html>
