<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart Details</title>
    <link rel="stylesheet" href="styles.css"> <!-- Kết nối file CSS nếu có -->
    <script>
        // JavaScript để cập nhật tổng chi phí khi thay đổi số lượng sản phẩm
        function updateTotal(productId, price) {
            let quantity = document.getElementById('quantity-' + productId).value;
            let totalCost = price * quantity;
            document.getElementById('total-cost-' + productId).innerText = '$' + totalCost.toFixed(2);

            // Update tổng giá trị đơn hàng
            let totalOrderPrice = 0;
            document.querySelectorAll('.total-cost').forEach(function(element) {
                totalOrderPrice += parseFloat(element.innerText.replace('$', ''));
            });
            document.getElementById('total-order-price').innerText = '$' + totalOrderPrice.toFixed(2);
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Sidebar với hộp tìm kiếm, danh mục sản phẩm và thông tin liên hệ -->
        <div class="sidebar">
            <div class="product-search">
                <h3>Search Products</h3>
                <form action="productSearch" method="GET">
                    <input type="text" name="query" placeholder="Search for products..." />
                    <button type="submit">Search</button>
                </form>
            </div>

            <div class="product-categories">
                <h3>Product Categories</h3>
                <ul>
                    <li><a href="#">Fragrances</a></li>
                    <li><a href="#">Skincare</a></li>
                    <li><a href="#">Makeup</a></li>
                </ul>
            </div>

            <div class="latest-products">
                <h3>Latest Products</h3>
                <ul>
                    <li><a href="#">Dior Sauvage</a></li>
                    <li><a href="#">Chanel No.5</a></li>
                    <li><a href="#">Gucci Bloom</a></li>
                </ul>
            </div>

            <div class="static-contacts">
                <h3>Contact Us</h3>
                <p>Email: support@example.com</p>
                <p>Phone: +1 234 567 890</p>
                <p><a href="#">Terms and Conditions</a></p>
            </div>
        </div>

        <!-- Main content: Danh sách sản phẩm trong giỏ hàng và thông tin người nhận -->
        <div class="main-content">
            <h2>Your Shopping Cart</h2>
            <form action="updateCart" method="POST">
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total Cost</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.title}</td>
                                <td>$${item.price}</td>
                                <td>
                                    <input type="number" id="quantity-${item.id}" name="quantity-${item.id}" value="${item.quantity}" min="1" 
                                           onchange="updateTotal(${item.id}, ${item.price})" />
                                </td>
                                <td class="total-cost" id="total-cost-${item.id}">$${item.price * item.quantity}</td>
                                <td><a href="removeProduct?id=${item.id}" class="delete-icon">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="total-order-price">
                    <strong>Total Order Price:</strong> <span id="total-order-price">$${totalOrderPrice}</span>
                </div>

                <!-- Thông tin người nhận -->
                <div class="receiver-info">
                    <h3>Receiver Information</h3>
                    <label for="fullName">Full Name:</label>
                    <input type="text" id="fullName" name="fullName" value="${user.fullName}" required /><br>

                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender" required>
                        <option value="Male" ${user.gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${user.gender == 'Female' ? 'selected' : ''}>Female</option>
                    </select><br>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" required /><br>

                    <label for="phone">Mobile:</label>
                    <input type="tel" id="phone" name="phone" value="${user.phone}" required /><br>

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${user.address}" required /><br>

                    <label for="notes">Notes:</label>
                    <textarea id="notes" name="notes" placeholder="Additional notes...">${user.notes}</textarea><br>
                </div>

                <!-- Nút hành động cho giỏ hàng -->
                <div class="cart-actions">
                    <button type="button" onclick="window.location.href='productList.jsp'">Choose More Products</button>
                    <button type="submit" formaction="checkout.jsp">Check Out</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
