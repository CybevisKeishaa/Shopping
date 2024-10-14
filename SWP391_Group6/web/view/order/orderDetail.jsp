<%-- 
    Document   : orderDetail.jsp
    Created on : Oct 3, 2024, 2:08:07 PM
    Author     : KEISHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<t:mainview>
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
        <!-- Order Details Section -->
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
                <p><strong>Mã đơn:</strong> ${requestScope.order.order_id}</p>
                <p><strong>Ngày tạo:</strong> ${requestScope.order.create_at}</p>
                <p><strong>Tổng tiền:</strong> ${requestScope.order.total_price} VND</p>
                <p><strong>Trạng thái:</strong> ${requestScope.order.status.status_name}</p>
                <c:if test="${requestScope.order.status.status_name == 'Shipping  ' || requestScope.order.status.status_name == 'Completed '}">
                    <p><strong>Phương thức vận chuyển:</strong> ${requestScope.order.shipping_method}</p>
                </c:if>

                <!-- Buttons for updating or canceling the order -->
                <div class="order-actions">
                    <c:if test="${requestScope.order.status.status_name != 'Pending   '}">
                        <form action="update" method="post" onsubmit="return confirmReceived();">
                            <input type="hidden" name="order_id" value="${order.order_id}">
                            <button type="submit" class="btn btn-primary">Giao hàng thành công</button>
                        </form>
                    </c:if>
                    <form action="CancelOrder" method="post" onsubmit="return confirmCancel();">
                        <input type="hidden" name="order_id" value="${order.order_id}">
                        <!-- Nút hủy đơn hàng sẽ bị mờ nếu trạng thái là 'shipping' hoặc 'completed' -->
                        <button type="submit" class="btn btn-danger" 
                                <c:if test="${requestScope.order.status.status_name == 'Shipping  ' || requestScope.order.status.status_name == 'Completed '}">disabled</c:if>>Hủy đơn hàng</button>
                        </form>
                    </div>
                </div>

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
                            <th>Thêm</th>
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
                                <td>
                                    <form action="RebuyProduct" method="post">
                                        <input type="hidden" name="product_id" value="${product.product_id}">
                                        <button type="submit" class="btn btn-primary btn-sm">Mua thêm</button>
                                    </form>

                                    <!-- Điều kiện hiển thị nút Feedback -->
                                    <c:if test="${requestScope.order.status.status_name == 'Completed '}">
                                        <form action="../feedback" method="GET">
                                            <input type="hidden" name="product_id" value="${product.product_id}">                                            
                                            <input type="hidden" name="product_name" value="${product.name}">  
                                            <button type="submit" class="btn btn-secondary btn-sm">Feedback</button>
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
        <script type="text/javascript">
            function confirmReceived() {
                return confirm("Bạn có chắc chắn muốn xác nhận đã nhận được hàng?");
            }

            function confirmCancel() {
                return confirm("Bạn có chắc chắn hủy đơn hàng?");
            }
        </script>
        </t:mainview>