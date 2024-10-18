<%-- 
    Document   : feedback
    Created on : Oct 5, 2024, 12:37:56 PM
    Author     : KEISHA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .feedback-form {
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                border-radius: 5px;
                margin-top: 20px;
            }
            .star-rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: flex-start;
                margin-bottom: 15px;
            }
            .star-rating input[type="radio"] {
                display: none;
            }
            .star-rating label {
                font-size: 24px;
                color: #ff5722;
                cursor: pointer;
            }
            .star-rating label:hover,
            .star-rating label:hover ~ label,
            .star-rating input[type="radio"]:checked ~ label {
                color: #ff9800;
            }
            .sidebar {
                padding: 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                border-radius: 5px;
                margin-top: 20px;
            }
            /* Điều chỉnh nút để làm nhỏ hơn */
            .btn-sm {
                padding: 7px 10px !important; /* Giảm padding */
                font-size: 12px; /* Giảm kích thước font */
            }
            .gender-select .list {
                width: 100% !important; /* Đảm bảo danh sách các tùy chọn mở ra đầy đủ */
            }

            /* Ghi đè class current chỉ cho .gender-select */
            .gender-select .current {
                position: static !important; /* Đảm bảo không thay đổi vị trí */
                width: auto !important;
                padding: 0 !important;
            }
            .gender-select::placeholder {
                font-size: 0.85rem; /* Giảm kích thước chữ */
                color: #999; /* Màu chữ placeholder */
            }

            .feedback-title{
                margin-top: 15px;
                margin-bottom: 13px;
            }

            /* Đảm bảo rằng các thành phần khác không bị ảnh hưởng */
            .gender-select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                width: 100% !important;
                height: 45px !important;
                padding: 13px !important;
                font-size: 1rem;
                line-height: 1rem !important;
                text-align: left  !important;
                justify-content: left  !important;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
            }
            /* Đánh giá sao */
            .star-rating {
                display: flex !important;
                flex-direction: row-reverse !important;
                justify-content: flex-start !important;
                margin-top: 15px !important;
            }

            .star-rating input[type="radio"] {
                opacity: 0 !important; /* Làm radio buttons vô hình nhưng vẫn có thể click */
                position: absolute !important;
                width: 100% !important; /* Tăng kích thước để dễ dàng click */
                height: 100% !important;
            }


            .star-rating label {
                font-size: 24px !important;
                color: #ff5722 !important;
                padding: 0 5px !important;
                cursor: pointer !important;
                position: relative !important; /* Đảm bảo rằng label có thể được click */
            }

            .star-rating label:hover,
            .star-rating label:hover ~ label,
            .star-rating input[type="radio"]:checked ~ label {
                color: #ff9800 !important;
            }

            /* Thêm lớp cho product-select để định dạng như gender-select */
            .product-select {
                width: 100% !important;
                height: auto !important;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
            }


            /* Đảm bảo các tùy chọn bên trong select có giao diện nhất quán */
            .product-select option {
                padding: 10px;
                background-color: #fff;
                color: #333;
            }
            .nice-select {
                display: none !important; /* Đảm bảo rằng nó luôn hiển thị */

            }

            select {
                display: block !important; /* Tạm thời hiển thị dropdown mặc định để kiểm tra */
            }



        </style>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/niceselect.css">

        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>
    </head>
    <body>
        <script>
            document.querySelectorAll('.star-rating input[type="radio"]').forEach(function (radio) {
                radio.addEventListener('change', function () {
                    console.log('Selected rating:', this.value);
                });
            });

        </script>

        <br><br><br>
        <div class="container">
            <div class="row">
                <!-- Main Content -->
                <div class="col-md-8">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Feedback</h2> <!-- Giữ style tiêu đề của bạn -->
                        </div>
                    </div>
                    <form action="feedback" method="POST" class="feedback-form">
                        <!-- Thông tin liên hệ -->
                        <div class="form-group">

                            <c:choose>
                                <c:when test="${not empty requestScope.ps}">
                                    <div class="form-group">
                                        <label for="product">Chọn sản phẩm trong đơn hàng</label>
                                        <select class="product-select form-control" id="product" name="productID" required>
                                            <c:forEach var="product" items="${requestScope.ps}">
                                                <option value="${product.product_id}">${product.name}</option>
                                            </c:forEach>
                                        </select>




                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <input type="hidden" name="productID" value="${productID}" />
                                    <div class="form-group">
                                        <label for="productName">Sản phẩm:</label>
                                        <input type="text" class="product-select form-control" id="productName" name="productName" value="${productName}" readonly>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <div class="form-group">
                                <label for="name">Họ và tên:</label>
                                <input type="text" class="form-control" id="name" name="name" 
                                       value="${sessionScope.customer.name_cus != null ? sessionScope.customer.name_cus : ''}" required>
                            </div>

                            <div class="form-group">
                                <label for="gender">Giới tính:</label>
                                <select class="gender-select form-control" id="gender" name="gender" required>
                                    <option value="0" ${sessionScope.user.gender != null && sessionScope.user.gender == 0 ? 'selected' : ''}>Nam</option>
                                    <option value="1" ${sessionScope.user.gender != null && sessionScope.user.gender == 1 ? 'selected' : ''}>Nữ</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                       value="${sessionScope.customer.email != null ? sessionScope.customer.email : ''}" required>
                            </div>

                            <div class="form-group">
                                <label for="mobile">Số điện thoại:</label>
                                <input type="text" class="form-control" id="mobile" name="mobile" 
                                       value="${sessionScope.customer.c_phone != null ? sessionScope.customer.c_phone : ''}" required>
                            </div>



                            <div class="form-group d-flex align-items-center">
                                <label for="rating" class="mr-2">Đánh giá:</label>
                                <div class="star-rating">



                                    <input type="radio" id="5-stars" name="starrr" value= "5" required />
                                    <label for="5-stars" class="star">&#9733;</label>

                                    <input type="radio" id="4-stars" name="starrr" value= "4"  />
                                    <label for="4-stars" class="star">&#9733;</label>

                                    <input type="radio" id="3-stars" name="starrr" value= "3" />
                                    <label for="3-stars" class="star">&#9733;</label>

                                    <input type="radio" id="2-stars" name="starrr" value= "2" />
                                    <label for="2-stars" class="star">&#9733;</label>

                                    <input type="radio" id="1-star" name="starrr" value= "1" />
                                    <label for="1-star" class="star">&#9733;</label>
                                </div>
                            </div>

                            <!-- Thêm input ẩn ngay sau phần đánh giá sao -->






                            <!-- Hộp văn bản phản hồi -->
                            <div class="form-group">
                                <label for="feedback">Phản hồi của bạn:</label>
                                <textarea class="form-control" id="feedback" name="feedback" rows="5" required></textarea>
                            </div>

                            <!-- Tải lên hình ảnh -->
                            <!--                        <div class="form-group">
                                                        <label for="images">Đính kèm hình ảnh (tùy chọn):</label>
                                                        <input type="file" class="form-control-file" id="images" name="images[]" multiple>
                                                    </div>-->

                            <div class="form-row">
                                <div class="col-md-12 text-center" style="color: red;">
                                    <%
                                        String errorMessage = (String) request.getAttribute("errorMessage");
                                        if (errorMessage != null) {
                                            out.println(errorMessage);
                                        }
                                    %>
                                </div>
                            </div>
                            <!-- Nút gửi -->
                            <!-- Đảm bảo sử dụng lớp btn-sm để giảm kích thước button -->
                            <button type="submit" class="btn btn-primary btn-sm">Gửi phản hồi</button>

                    </form>
                </div>
            </div>
            <br><br>
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
    </div> <br><br><br><br>
    <jsp:include page="/Demo_Template/BasePage/Footer.jsp" />
    <!-- Bootstrap JS and dependencies -->
            <script src="${pageContext.request.contextPath}/js/nicesellect.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
