<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/"%>

<!-- Preloader và các thành phần khác của bạn không thay đổi -->
<t:mainview>
    <!-- Start Product Area -->
    <div class="product-area section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2>Đơn hàng</h2> <!-- Giữ style tiêu đề của bạn -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="product-info">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="orders" role="tabpanel">
                                <div class="tab-single">
                                    <!-- Bảng hiển thị đơn hàng -->
                                    <form method="GET" action="order" class="form-inline">
                                        <div class="form-group mb-2">
                                            <label for="startDate">Từ:</label>
                                            <input type="date" class="form-control form-control-sm ml-2" id="startDate" name="startDate" value="${startDate}">
                                        </div>

                                        <div class="form-group mb-2 ml-3">
                                            <label for="endDate">Đến:</label>
                                            <input type="date" class="form-control form-control-sm ml-2" id="endDate" name="endDate" value="${endDate}">
                                        </div>

                                        <div class="form-group mb-2 ml-3">
                                            <label for="sortColumn">Sắp xếp:</label>
                                            <select id="sortColumn" class="form-control form-control-sm ml-2" name="sortColumn">
                                                <option value="created_at" ${sortColumn == 'created_at' ? 'selected' : ''}>Ngày đặt</option>
                                                <option value="total" ${sortColumn == 'total' ? 'selected' : ''}>Tổng tiền</option>
                                            </select>
                                        </div>

                                        <div class="form-group mb-2 ml-3">
                                            <label for="sortOrder">Thứ tự:</label>
                                            <select id="sortOrder" class="form-control form-control-sm ml-2" name="sortOrder">
                                                <option value="ASC" ${sortOrder == 'ASC' ? 'selected' : ''}>Tăng dần</option>
                                                <option value="DESC" ${sortOrder == 'DESC' ? 'selected' : ''}>Giảm dần</option>
                                            </select>
                                        </div>

                                        <!-- Nút Reset -->
                                        <div class="form-group mb-2 ml-3">
                                            <a href="order" class="btn btn-secondary btn-sm">Đặt lại</a> 
                                        </div>

                                        <div class="form-group mb-2 ml-3">
                                            <input type="submit" class="btn btn-primary btn-sm" value="Tìm kiếm">
                                        </div>
                                    </form>
                                    <table class="table table-bordered table-striped table-hover"> <!-- Dùng style bảng của Bootstrap -->
                                        <thead>
                                            <tr>
                                                <th scope="col-1">Mã đơn</th>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Tổng tiền</th>
                                                <th scope="col">Ngày đặt</th>
                                                <th scope="col">Trạng thái</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Vòng lặp qua các đơn hàng -->
                                            <c:forEach var="order" items="${requestScope.orders}">
                                                <tr>
                                                    <td>
                                                        <u>
                                                            <a class="text-decoration-underline text-primary  " href="${pageContext.request.contextPath}/account/order/detail?orderId=${order.order_id}">
                                                                ${order.order_id}
                                                            </a>
                                                        </u>
                                                    </td>
                                                    <td>
                                                        ${order.firstProductName} 
                                                        <c:if test="${order.numberOfOtherProducts > 1}">and ${order.numberOfOtherProducts - 1 } other...</c:if>
                                                        </td> 
                                                        <td>${order.total_price} $</td> <!-- Tổng giá trị đơn hàng -->
                                                    <td>${order.create_at}</td> <!-- Ngày đặt hàng -->
                                                    <td>${order.status.status_name}</td> <!-- Trạng thái đơn hàng -->
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <!-- Pagination -->
                        <div class="container">
                            <div class="pagination-container d-flex justify-content-center">
                                <div class="pagination">
                                    <!-- Previous Button -->
                                    <c:if test="${currentPage > 1}">
                                        <a href="order?page=${currentPage - 1}&startDate=${startDate}&endDate=${endDate}&sortColumn=${sortColumn}&sortOrder=${sortOrder}" class="prev">&lt;</a>
                                    </c:if>

                                    <!-- Page Numbers -->
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <span class="current-page">${i}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="order?page=${i}&startDate=${startDate}&endDate=${endDate}&sortColumn=${sortColumn}&sortOrder=${sortOrder}">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>

                                    <!-- Next Button -->
                                    <c:if test="${currentPage < totalPages}">
                                        <a href="order?page=${currentPage + 1}&startDate=${startDate}&endDate=${endDate}&sortColumn=${sortColumn}&sortOrder=${sortOrder}" class="next">&gt;</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</t:mainview>