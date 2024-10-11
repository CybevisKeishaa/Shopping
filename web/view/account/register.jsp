<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

    <head>
        <!-- Meta Tag -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name='copyright' content=''>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Tag  -->
        <title>Keishaa Perfume - Register</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
              rel="stylesheet">
        <!-- StyleSheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="../css/reset.css">
        <link rel="stylesheet" href="../style.css">
        <link rel="stylesheet" href="../css/responsive.css">
        <style>

            /* Giảm kích thước chữ của placeholder */
            input::placeholder, select::placeholder {
                font-size: 0.85rem; /* Giảm kích thước chữ */
                color: #999; /* Màu chữ placeholder */
            }

            /* Đảm bảo label luôn nằm trên các input và select */
            .form-group label {
                display: block;
                margin-bottom: 0.25rem; /* Giảm khoảng cách giữa label và input */
                font-size: 1rem;
            }



            /* Chiều rộng input */
            input {
                width: 100% !important;
                padding: 0.5rem;
                font-size: 1rem;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
                margin-bottom: 16px !important;
            }

            /* Nút rộng và căn chỉnh */
            .btn {
                width: 100% !important;
                padding: 0.75rem;
                border-radius: 0.25rem;
                margin-top: 1rem;
            }

            .btn-primary {
                background-color: #333;
                color: #fff;
                border: none;
            }

            .btn-secondary {
                background-color: #666;
                color: #fff;
                border: none;
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

            /* Placeholder chỉ áp dụng cho select của gender */
            .gender-select::placeholder {
                font-size: 0.85rem; /* Giảm kích thước chữ */
                color: #999; /* Màu chữ placeholder */
            }


            /* Đảm bảo rằng các thành phần khác không bị ảnh hưởng */
            .gender-select {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                width: 100% !important;
                height: 30px !important;
                padding: 9px !important;
                font-size: 1rem;
                line-height: 0.5rem !important;
                text-align: center  !important;
                justify-content: center  !important;
                border: 1px solid #ccc;
                border-radius: 0.25rem;
            }
            /* CSS cho ô nhập Date of Birth */
            .dob-input {
                font-size: 0.75rem  !important; /* Giảm kích thước chữ */
                line-height: 0.5rem !important; /* Cân chỉnh độ cao của dòng */
                padding: 0.5rem !important; /* Điều chỉnh padding cho đẹp */
            }




        </style>
    </head>

    <jsp:include page="/Demo_Template/BasePage/Header.jsp"/> <br>





    <div class="container" style="padding: 50px 0;">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2>Đăng ký</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2">
                <form action="../account/register" method="POST" class="form-group">
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="fullname">Họ và tên:</label>
                            <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Họ và tên"
                                   value="<%= request.getParameter("fullname") != null ? request.getParameter("fullname") : "" %>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="username">Tên dăng nhập:</label>
                            <input type="text" id="username" name="username" class="form-control" placeholder="Tên đăng nhập"
                                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Email"
                                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="password">Mật khẩu:</label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="repassword">Nhập lại mật khẩu:</label>
                            <input type="password" id="repassword" name="repassword" class="form-control" placeholder="Nhập lại mật khẩu" required>
                        </div>
                    </div>
                    <div class="gender-dob-wrapper">
                        <div class="form-group">
                            <label for="gender">Giới tính:</label>
                            <select id="gender" name="gender" class="gender-select" required>
                                <option value="0" <%= "0".equals(request.getParameter("gender")) ? "selected" : "" %>>Nam</option>
                                <option value="1" <%= "1".equals(request.getParameter("gender")) ? "selected" : "" %>>Nữ</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="dob">Ngày sinh:</label>
                            <input type="date" id="dob" name="dob" class="form-control dob-input"
                                   value="<%= request.getParameter("dob") != null ? request.getParameter("dob") : "" %>" required>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="col-md-12">
                            <label for="phone">Số điện thoại:</label>
                            <input type="text" id="phone" name="phone" class="form-control" placeholder="Số điện thoại"
                                   value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>" required>
                        </div>
                    </div>

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

                    <div class="form-row mt-3">
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
                            <a href="../homepage" class="btn btn-secondary btn-block">Hủy</a>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>


    <jsp:include page="/Demo_Template/BasePage/Footer.jsp" />

    <!-- Jquery -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <!-- Popper JS -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- Color JS -->
    <script src="${pageContext.request.contextPath}/js/colors.js"></script>
    <!-- Slicknav JS -->
    <script src="${pageContext.request.contextPath}/js/slicknav.min.js"></script>
    <!-- Owl Carousel JS -->
    <script src="${pageContext.request.contextPath}/js/owl-carousel.js"></script>
    <!-- Magnific Popup JS -->
    <script src="${pageContext.request.contextPath}/js/magnific-popup.js"></script>
    <!-- Waypoints JS -->
    <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
    <!-- Countdown JS -->
    <script src="${pageContext.request.contextPath}/js/finalcountdown.min.js"></script>
    <!-- Nice Select JS -->
    <script src="${pageContext.request.contextPath}/js/nicesellect.js"></script>
    <!-- Flex Slider JS -->
    <script src="${pageContext.request.contextPath}/js/flex-slider.js"></script>
    <!-- ScrollUp JS -->
    <script src="${pageContext.request.contextPath}/js/scrollup.js"></script>
    <!-- Onepage Nav JS -->
    <script src="${pageContext.request.contextPath}/js/onepage-nav.min.js"></script>
    <!-- Easing JS -->
    <script src="${pageContext.request.contextPath}/js/easing.js"></script>
    <!-- Active JS -->
    <script src="${pageContext.request.contextPath}/js/active.js"></script>
</body>

</html>
