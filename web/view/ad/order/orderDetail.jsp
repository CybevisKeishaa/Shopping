<%@page import="model.Status_Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    pageContext.setAttribute("PENDING", 1);
    pageContext.setAttribute("CONFIRMED", 2);
    pageContext.setAttribute("SHIPPING", 3);
    pageContext.setAttribute("COMPLETED", 4);
    pageContext.setAttribute("CANCELLED", 5);
    pageContext.setAttribute("CANCEL_REQUEST", 6);
%>
<t:dashboard>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2>Thông tin đặt hàng</h2> 
                </div>
            </div>
        </div>

        <!-- Order Information Section -->

        <div class="order-info">
            <h2>Thông tin đơn hàng</h2>
            <a href="${pageContext.request.contextPath}/sale" class="nav-link" >&Lt;Trở Về</a>
            <p><strong>Mã đơn:</strong> ${requestScope.order.order_id}</p>
            <p><strong>Ngày tạo:</strong> ${requestScope.order.create_at}</p>
            <p><strong>Tổng tiền:</strong> ${requestScope.order.total_price} VND</p>
            <span>
                <span><strong>Trạng thái:</strong> ${requestScope.order.status.status_name.trim()}</span>
                <c:set scope="page" var="status" value="${requestScope.order.status}"/>
                <c:if test="${order.paidStatus}" var="is_paid"></c:if>
                    <!-- Only show status update options if the order is not 'Completed' or 'Cancelled' -->
                <c:if test="${status.status_id != COMPLETED and status.status_id != CANCELLED}">
                    <!-- Dropdown to update order status -->
                    <select class="input-sm" name="statusId" form="update-status">
                        <!-- Pending can be updated to Confirmed or Cancelled -->
                        <c:if test="${status.status_id == PENDING}">
                            <option value="${CONFIRMED}">Confirmed</option>
                            <option value="${CANCELLED}">Cancelled</option>
                        </c:if>
                        <!-- Confirmed can be updated to Shipping or Cancelled -->
                        <c:if test="${status.status_id == CONFIRMED}">
                            <option value="${SHIPPING}">Shipping</option>
                            <option value="${CANCELLED}">Cancelled</option>
                        </c:if>
                        <!-- Shipping can be updated to Completed or Cancelled -->
                        <c:if test="${status.status_id == SHIPPING}">
                            <option value="${COMPLETED}">Completed</option>
                            <option value="${CANCELLED}">Cancelled</option>
                        </c:if>
                        <!-- CancelRequest can only be updated to Cancelled -->
                        <c:if test="${status.status_id == CANCEL_REQUEST}">
                            <option value="${CANCELLED}">Cancelled</option>
                        </c:if>
                    </select>
                    <!-- Update button -->
                    <button class="btn btn-primary" form="update-status">Cập nhật</button>
                    <!-- Hidden form to handle the status update with POST method -->
                    <form id="update-status" method="post" action="?orderId=${param.orderId}" onsubmit="return confirm('Thay đổi trạng thái của sản phẩm này?')">
                        <input type="hidden" name="method" value="PUT">
                    </form>

                </c:if>
                <p></p>
            </span>
            <div style="color:red">${errorMessage}</div>
            <span><strong>Đã trả tiền:</strong> 
                <span style="color:${is_paid?'green':'red'}">${is_paid ? "Đã Trả️":"️Chưa Trả"}
                    <c:if test="${not is_paid}">
                        <button class="btn btn-warning" form="update-paid-status">Đã Thanh Toán</button>

                        <form id="update-paid-status" method="post" action="?orderId=${param.orderId}" onsubmit="return confirm('Thay đổi trạng thái của sản phẩm này?')">
                            <input type="hidden" name="method" value="POST">
                        </form>
                    </c:if>
                </span> 
                <p></p>
            </span>
            <c:if test="${requestScope.order.status.status_name.trim() == 'Shipping' || requestScope.order.status.status_name.trim() == 'Completed'}">
                <p><strong>Phương thức vận chuyển:</strong> ${requestScope.order.shipping_method}</p>
            </c:if>

            <!-- Receiver Information Section -->
            <div class="receiver-info">
                <h2>Thông tin người nhận</h2>
                <p><strong>Tên khách hàng:</strong> ${requestScope.order.customer.name_cus}</p>
                <p><strong>Giới tính:</strong> ${requestScope.order.customer.gender?'Nam':'Nữ'}</p>
                <p><strong>Email:</strong> ${requestScope.order.customer.email}</p>
                <p><strong>Số điện thoại:</strong> ${requestScope.order.customer.c_phone}</p>
                <p><strong>Địa chỉ:</strong> ${requestScope.order.customer.address[0].city}, ${requestScope.order.customer.address[0].district}, ${requestScope.order.customer.address[0].ward},${requestScope.order.customer.address[0].street} </p>
            </div>


            <!-- Ordered Products Section -->
            <div class="ordered-products">
                <h2>Ordered Products</h2>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Ảnh sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Phân loại</th>
                            <th>Giá sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Tổng giá trị</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${requestScope.products}">
                            <tr>
                                <td>
                                    <img src="${pageContext.request.contextPath}/img/${product.img[0].img_url}" width="100">
                                </td>
                                <td>${product.name}</td>
                                <td>${product.gender[0].name}</td>
                                <td>${product.price} VND</td>
                                <td>${product.stock}</td>
                                <td>
                                    <c:out value="${product.stock * product.price}"/> VND
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <style>
            .container {
                margin-top: 20px;
            }
            h1 {
                font-size: 24px;
                margin-bottom: 20px;
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
    </t:dashboard>