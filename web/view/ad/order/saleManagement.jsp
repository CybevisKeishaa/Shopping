<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="t" tagdir="/WEB-INF/tags/" %>
<t:dashboard>

    <div class="all-content-wrapper">
        <!-- Sidebar -->
        <nav id="sidebar" class="left-sidebar-pro">
            <div class="sidebar-header">
                <h3>Order Management</h3>
            </div>
        </nav>
        <c:catch var="e">
            <!-- Main Content Area -->
            <div class="container-fluid">
                <!-- Employee Order Counts -->
                <div class="employee-orders">
                    <h4>Số đơn hàng cho từng nhân viên</h4>
                    <ul class="order-count-list">
                        <c:forEach var="employee" items="${employees}" varStatus="status">
                            <li>
                                <h4><i class="fa fa-user"></i> ${employee.name_emp}</h4> 
                                <h5>${employeeOrders[status.index]}</h5>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- Order Counts -->
                <div class="product-status-wrap">
                    <h4>Order List</h4>
                    <div class="responsive-table">
                        <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Order Id</th>
                                    <th>Tên Khách Hàng</th>
                                    <th>Tổng Giá</th>
                                    <th>Ngày Đặt</th>
                                    <th>Trạng Thái</th>
                                    <th>Trạng Thái Tiền</th>
                                    <th>Số Sản Phẩm</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td>${order.order_id}</td>
                                        <td>${order.customer.name_cus}</td>
                                        <td>$${order.total_price}</td>
                                        <td>${order.create_at}</td>
                                        <td>${order.status.status_name} </td>
                                        <td style="color:${order.paidStatus?"green":'red'};" >${order.paidStatus_str}</td>
                                        <td>${order.numberOfOtherProducts}</td>
                                        <td>
                                            <label for="order-to-employee" class="form-label">Chọn Nhân Viên <i class="fa fa-user"></i></label>
                                            <select class="form-control" name="order-to-employee" form="form">
                                                <option value="">-- Không Chọn --</option>
                                                <c:forEach var="employee" items="${employees}">
                                                    <option value="${order.order_id}-${employee.emp_id}">${employee.name_emp}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <form id="form" action="saleManagement" method="post">
                        <button class="btn btn-primary" type="submit" 
                                style="display: block;float: right">
                            Cập Nhật 
                        </button>
                    </form>
                </div>
            </div>
        </c:catch>
        ${e}
    </div>
</t:dashboard>