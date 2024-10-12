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
            .btn-primary {
                background-color: #333 !important; /* Nền màu đen */
                color: white !important; /* Màu chữ trắng */
                border: 0px solid #00FF00 !important; /* Viền màu xanh lá cây */
                padding: 18.15px 50px !important; /* Padding tùy chỉnh */
                text-transform: uppercase !important; /* Chữ in hoa */
                transition: background-color 0.3s, color 0.3s !important;
            }

            .btn-primary:hover {
                color: #111 !important;
                background-color: #e0a800 !important;
                border-color: #d39e00 !important;
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
                        <form id="cartForm" action="updateCart" method="post">
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
                                                <input type="number" name="quantity" value="${item.quantity}" min="1" onchange="updateTotal(${item.product.product_id}, this.value)" />
                                            </td>


                                            <td>
                                                <span id="total_cost_${item.product.product_id}">
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
                                <button type="submit" class="btn btn-primary">Update Cart</button>
                                <a href="${pageContext.request.contextPath}/productList" class="btn btn-success">More Products</a>
                                <a href="checkout.jsp" class="btn btn-warning">Check Out</a>
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
                    <div class="sidebar-widget">
                        <h3>Search Products</h3>
                        <form action="searchProduct" method="get">
                            <input type="text" name="query" class="form-control" placeholder="Search for products...">
                            <button type="submit" class="btn btn-primary">Search</button>
                        </form>
                    </div>

                    <div class="sidebar-widget">
                        <h3>Categories</h3>
                        <ul class="list-unstyled">
                            <c:forEach var="category" items="${categories}">
                                <li><a href="category.jsp?category_id=${category.id}">${category.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h3>Latest Products</h3>
                        <ul class="list-unstyled">
                            <c:forEach var="product" items="${latestProducts}">
                                <li>
                                    <a href="productDetail.jsp?product_id=${product.product_id}">
                                        <img src="${pageContext.request.contextPath}/img/${product.img[0].img_url}" alt="${product.name}" style="width: 50px; height: 50px;">
                                        ${product.name} - <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h3>Contact Us</h3>
                        <p>Email: contact@example.com</p>
                        <p>Phone: 0123456789</p>
                        <p>Address: 123 Example Street, City, Country</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include Footer -->
        <br><br><br>

        <script>
            function updateTotal(productId, quantity) {
                console.log("Product ID: ", productId);
                console.log("Quantity: ", quantity);

                const quantityInput = document.querySelector(`input[name="quantity"]`);
                const row = quantityInput.closest('tr');

                let priceText = row.querySelector('td:nth-child(2)').innerText;
                priceText = priceText.replace(/\./g, '').replace(',', '.').replace(/[^0-9.]/g, '');

                const price = parseFloat(priceText);

                updateTotalOrderPrice();
            }

            function updateTotalOrderPrice() {
                let totalOrderPrice = 0;

                document.querySelectorAll('tr').forEach(function (row) {
                    const quantityInput = row.querySelector('input[type="number"]');                   
                    if (quantityInput) {
                        const quantity = parseFloat(quantityInput.value);

                        let priceText = row.querySelector('td:nth-child(2)').innerText;
                        priceText = priceText.replace(/\./g, '').replace(',', '.').replace(/[^0-9.]/g, '');

                        const price = parseFloat(priceText);

                        totalOrderPrice += price * quantity;
                    }
                });

                document.querySelector('#total_order_price').innerText = new Intl.NumberFormat('de-DE').format(totalOrderPrice) + " VND";
            }
        </script>
        <jsp:include page="/Demo_Template/BasePage/Footer.jsp" />

        <!-- Include JS files -->
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/bootstrap.min.js"></script>


    </body>
</html>
