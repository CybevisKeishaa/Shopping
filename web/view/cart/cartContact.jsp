<%-- 
    Document   : cart
    Created on : Oct 10, 2024, 8:10:15 AM
    Author     : KEISHA
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Checkout</title>
    <link rel="stylesheet" href="styles.css"> <!-- Thêm đường dẫn tới file CSS nếu có -->
</head>
<body>
    <div class="container">
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
                    <li><a href="#">Category 1</a></li>
                    <li><a href="#">Category 2</a></li>
                    <li><a href="#">Category 3</a></li>
                </ul>
            </div>

            <div class="latest-products">
                <h3>Latest Products</h3>
                <ul>
                    <li><a href="#">Product A</a></li>
                    <li><a href="#">Product B</a></li>
                    <li><a href="#">Product C</a></li>
                </ul>
            </div>

            <div class="static-contacts">
                <h3>Contact Us</h3>
                <p>Email: support@example.com</p>
                <p>Phone: +1 234 567 890</p>
                <p><a href="#">Terms and Conditions</a></p>
            </div>
        </div>

        <div class="main-content">
            <h2>Order Details</h2>

            <div class="cart-details">
                <table>
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.title}</td>
                                <td>${item.price}</td>
                                <td>${item.quantity}</td>
                                <td>${item.price * item.quantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="total-order-price">
                    <strong>Total Order Price:</strong> $<span>${totalOrderPrice}</span>
                </div>

                <button onclick="window.location.href='cartDetails.jsp'">Change Products</button>
            </div>

            <h3>Receiver Information</h3>
            <form action="submitOrder" method="POST">
                <label>Full Name:</label>
                <input type="text" name="fullName" value="${user != null ? user.fullName : ''}" required />

                <label>Gender:</label>
                <select name="gender">
                    <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
                    <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
                </select>

                <label>Email:</label>
                <input type="email" name="email" value="${user != null ? user.email : ''}" required />

                <label>Mobile:</label>
                <input type="text" name="mobile" value="${user != null ? user.mobile : ''}" required />

                <label>Address:</label>
                <textarea name="address" required>${user != null ? user.address : ''}</textarea>

                <label>Notes:</label>
                <textarea name="notes"></textarea>

                <button type="submit">Submit Order</button>
            </form>
        </div>
    </div>
</body>
</html>
