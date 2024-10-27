<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">
    <head>
        <style>
            /* Chỉnh sửa kích thước của nice-select khi sử dụng form-control-sm */
            .form-inline .form-group select.form-control-sm {
                height: 28px !important;    /* Điều chỉnh chiều cao */
                font-size: 0.85rem !important; /* Điều chỉnh kích thước font */
                padding: 2px 10px !important; /* Điều chỉnh padding để ô nhỏ hơn */
                width: auto !important;     /* Điều chỉnh chiều rộng tự động phù hợp với nội dung */
                margin-top: 0px !important;
            }

            /* Nếu nice-select đang được áp dụng */
            .nice-select.form-control-sm {
                height: 35px !important;
                font-size: 0.85rem !important;
                line-height: 35px !important; /* Đảm bảo chữ căn giữa dọc theo chiều cao */
                padding: 0 8px !important;
                width: 100px !important; /* Chiều rộng tự động để phù hợp nội dung */
                margin-top: 0px !important;
            }

            .form-inline .form-group select.form-control-sm{
                height: 30px !important;    /* Điều chỉnh chiều cao */
                font-size: 12px !important; /* Điều chỉnh kích thước font */
                padding: 2px 8px !important; /* Điều chỉnh padding */
                width: auto !important;     /* Điều chỉnh chiều rộng để phù hợp nội dung */
            }
            .form-inline .form-group input.form-control-sm {
                height: 30px !important;    /* Điều chỉnh chiều cao */
                font-size: 12px !important; /* Điều chỉnh kích thước font */
                padding: 2px 8px !important; /* Điều chỉnh padding */
                width: auto !important;     /* Điều chỉnh chiều rộng để phù hợp nội dung */
            }

            .btn-sm {
                padding: 5px 10px !important; /* Điều chỉnh padding cho nút */
                font-size: 12px !important;   /* Giảm kích thước font cho nút */
            }
            .pagination {
                display: flex;
                gap: 10px;
            }

            .pagination a, .pagination span {
                display: inline-block;
                padding: 8px 12px;
                border: 1px solid #ddd;
                color: #007bff;
                text-decoration: none;
                border-radius: 4px;
            }

            /* Active page styling */
            .pagination .current-page {
                background-color: #ff5722;
                color: white;
                border-color: #ff5722;
            }

            /* Previous and Next button styling */
            .pagination .prev, .pagination .next {
                font-weight: bold;
                padding: 8px 12px;
            }

            /* Hover effect for page links */
            .pagination a:hover {
                background-color: #f0f0f0;
                border-color: #ccc;
            }
        </style>
        <!-- Giữ nguyên tất cả các phần style của bạn -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Eshop - My Orders</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nicesellect.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flex-slider.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl-carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    </head>

    <body class="js">
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>
        <!-- Preloader và các thành phần khác của bạn không thay đổi -->

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






                                        <table class="table table-bordered table-striped"> <!-- Dùng style bảng của Bootstrap -->
                                            <thead>
                                                <tr>
                                                    <th scope="col">Mã đơn</th>
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
                                                            <a href="${pageContext.request.contextPath}/account/order/detail?orderId=${order.order_id}">
                                                                ${order.order_id}
                                                            </a>
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

        <jsp:include page="/Demo_Template/BasePage/Footer.jsp" />
        <!-- JS Files -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scrollup.js"></script>
        <script src="${pageContext.request.contextPath}/js/nicesellect.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl-carousel.js"></script>
        <script src="${pageContext.request.contextPath}/js/flex-slider.js"></script>
        <script src="${pageContext.request.contextPath}/js/slicknav.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/active.js"></script>
    </body>
</html>
