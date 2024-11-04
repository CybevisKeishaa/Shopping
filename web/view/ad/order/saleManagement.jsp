<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="t" tagdir="/WEB-INF/tags/" %>
<t:dashboard>
    <style>
        .order-count-list  {
            display:flex;
            gap: 1em;
        }
        .order-count-list li{
            display: inline-block;
        }
    </style>
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
                        <li>
                            <h4><a class="page-link ${param.employeeId == null? 'text-success':""}" href="?">X</a></h4> 
                            <h5> </h5>
                        </li>
                        <c:forEach var="employee" items="${employees}" varStatus="status">
                            <li>
                                <h4><a class="page-link ${employee.emp_id== param.employeeId? 'text-success':""}" href="?employeeId=${employee.emp_id}"><i class="fa fa-user"></i> ${employee.name_emp}</a></h4> 
                                <h5>${employeeOrders[status.index]}</h5>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- Order Counts -->
                <h3>Order List</h3>

                <div class="panel">
                    <div class="responsive-table panel-body">
                        <form action="saleManagement" class="row" method="GET">
                            <div class="form-group col-md-2">
                                <label for="startdate">Start Date:</label>
                                <input type="date" id="startdate" value="${param.startdate}" class="form-control" name="startdate"/>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="enddate">End Date:</label>
                                <input type="date" id="enddate" value="${param.enddate}" class="form-control" name="enddate"/>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="sortby">Sort By:</label>
                                <select id="sort" class="form-control" name="sort">
                                    <option value="orderdate" ${param.sort == 'orderdate' ? 'selected':''}>Ngày Đặt</option>
                                    <option value="customername" ${param.sort == 'customername' ? 'selected':''}>Tên Khách Hàng</option>
                                    <option value="totalcost" ${param.sort == 'totalcost' ? 'selected':''}>Tổng Giá</option>
                                    <option value="status" ${param.sort == 'status' ? 'selected':''}>Trạng Thái</option>
                                </select>
                                <p></p>
                                <label for='desc' >Thứ tự</label>
                                <select id="desc" class="form-control" name="desc">
                                    <option value="on" ${param.desc == 'on' ? 'selected':''}>Giảm Dần</option>
                                    <option value="off" ${param.desc == 'off' ? 'selected':''}>Tăng Dần</option>
                                </select>
                            </div>
                            <div class="form-group align-items-center col-md-2" >
                                <label for="employeeid">Nhân Viên</label>
                                <select id="empid" class="form-control" name="employeeId">
                                    <option value="" ${param.employeeId == null ? 'selected':''}>--Chọn Nhân Viên--</option>
                                    <c:forEach items="${employees}" var="e">
                                        <option value="${e.emp_id}" ${e.emp_id == param.employeeId ? 'selected':''}>${e.name_emp}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group align-items-center col-md-3" >
                                <label for="search">Search:</label>
                                <input type="text" id="custom-search" class="form-control " value="${param.search}" placeholder="Search..." name="search"/>
                            </div>
                            <div class="form-group col-md">
                                <label for="submit"> </label>
                                <input type="submit" value="Search" class="btn btn-primary " style="display: block"/>
                            </div>
                        </form>
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
                                    <th>Thay Đổi Nhân Viên <i class="fa fa-user"></i></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td><a href="./sale/orderDetail?orderId=${order.order_id}">${order.order_id}</a></td>
                                        <td>${order.customer.name_cus}</td>
                                        <td>$${order.total_price}</td>
                                        <td>${order.create_at}</td>
                                        <td>${order.status.status_name_vn} </td>
                                        <td style="color:${order.paidStatus?"green":'red'};" >${order.paidStatus_str}</td>
                                        <td>${order.numberOfOtherProducts}</td>
                                        <td>
                                            <div class="order-count-list">
                                                <input class="form-check" form="form" name="change" type="checkbox" value="${order.order_id}" />
                                                <select class="form-control" name="order${order.order_id}" form="form">
                                                    <c:forEach var="employee" items="${employees}">
                                                        <option value="${employee.emp_id}" ${order.employee.emp_id == employee.emp_id ?'selected' : ''}>${employee.name_emp}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <form id="form" action="saleManagement" method="post">
                            <button class="btn btn-primary" type="submit" 
                                    style="display: block;float: right">
                                Cập Nhật 
                            </button>
                        </form>
                        <div class="container">
                            <div class="pagination-container dataTables_paginate paging_simple_numbers" id="datatables-example_paginate">
                                <ul class="pagination">
                                    <c:choose >
                                        <c:when test="${currentPage > 1}">
                                            <li class="paginate_button previous" id="datatables-example_previous">
                                                <a href="?page=${currentPage - 1}" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="paginate_button previous disabled" id="datatables-example_previous">
                                                <a href="#" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <li class="paginate_button active">
                                                    <a href="#" aria-controls="datatables-example" data-dt-idx="${i}" tabindex="0">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="paginate_button ">
                                                    <a href="?page=${i}" aria-controls="datatables-example" data-dt-idx="${i}" tabindex="0">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:choose >
                                        <c:when test="${currentPage < totalPages}">
                                            <li class="paginate_button next" id="datatables-example_previous">
                                                <a href="?page=${currentPage + 1}" aria-controls="datatables-example" data-dt-idx="${currentPage + 1}" tabindex="0">Next</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>

                                            <li class="paginate_button next disabled" id="datatables-example_next">
                                                <a href="#" aria-controls="datatables-example" data-dt-idx="3" tabindex="0">Next</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </c:catch>
        ${e}
    </div>
</t:dashboard>