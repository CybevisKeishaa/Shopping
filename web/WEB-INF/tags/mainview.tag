<%@tag description="Default Page template" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@attribute name="title" required="false" %>
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
        <title>${title == null ? "KETO":title}</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->

        <!-- Bootstrap -->
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">


        <style>
            .single-slider {
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 510px;
                position: relative;
            }
            .hero-text {
                position: relative;
                z-index: 2;
                color: white;
            }

            .hero-text p {
                white-space: normal; /* Tự động ngắt dòng khi cần thiết */
                word-wrap: break-word; /* Ngắt từ nếu cần để tránh tràn ra ngoài */
                max-width: 100%; /* Điều chỉnh chiều rộng tối đa */
                margin-bottom: 35px; /* Khoảng cách phía dưới */
            }

            .eshop-single-banner img {
                width: 100%; /* Đảm bảo ảnh bao phủ toàn bộ vùng cha */
                height: auto; /* Giữ nguyên tỷ lệ của ảnh */
                max-width: 600px; /* Kích thước tối đa của ảnh */
                max-height: 370px; /* Kích thước tối đa của ảnh */
                display: block; /* Đảm bảo ảnh không bị ảnh hưởng bởi phần tử xung quanh */
                margin: 0 auto; /* Căn giữa ảnh */
                object-fit: cover; /* Đảm bảo ảnh bao phủ toàn bộ vùng mà không bị méo */
            }
            .eshop-single-banner .content {
                text-align: center; /* Căn giữa nội dung văn bản */
                padding: 10px 0; /* Khoảng cách trên và dưới cho nội dung */
            }
        </style>
    </head>
    <body class="js">
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- Header -->
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/> <br>
        <!--/ End Header -->
        <!-- Main Content -->
        <jsp:doBody/>
        <!--End Main Content -->
        <!-- Start Footer Area -->
        <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/> <br>
        <!-- /End Footer Area -->

        <!-- Jquery -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <!--<script src="${pageContext.request.contextPath}/js/colors.js"></script>-->
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
