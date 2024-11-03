<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Eshop - eCommerce HTML5 Template.</title>
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- StyleSheet -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="css/niceselect.css">
        <!-- Animate CSS -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Flex Slider CSS -->
        <link rel="stylesheet" href="css/flex-slider.min.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl-carousel.css">
        <!-- Slicknav -->
        <link rel="stylesheet" href="css/slicknav.min.css">

        <!-- Eshop StyleSheet -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <style>
            .flex-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center; /* C?n gi?a c�c ph?n t? */
                margin: 0 auto; /* C?n gi?a container */
                max-width: 1200px; /* ??t gi?i h?n chi?u r?ng cho container ?? n?i dung kh�ng tr?i r?ng to�n b? m�n h�nh */
                gap: 20px; /* Kho?ng c�ch gi?a c�c ph?n t? */
            }

            .flex-item {
                flex: 0 1 calc(48% - 10px); /* M?i ph?n t? chi?m kho?ng 48% chi?u r?ng, tr? kho?ng c�ch gi?a ch�ng */
                box-sizing: border-box; /* ??m b?o padding v� margin kh�ng ?nh h??ng ??n k�ch th??c */
                margin-bottom: 20px; /* Kho?ng c�ch gi?a c�c h�ng */
            }

            @media (max-width: 768px) {
                .flex-item {
                    flex: 0 1 100%; /* Tr�n m�n h�nh nh? h?n, m?i ph?n t? chi?m 100% chi?u r?ng */
                }
            }
            .pagination-container {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            /* Pagination links styling */
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

            .blog-image{
                aspect-ratio: 16/9;
                object-fit: cover;
            }
        </style>


    </head>
    <body class="js">

        <!-- Preloader -->
        <div class="preloader">
            <div class="preloader-inner">
                <div class="preloader-icon">
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- End Preloader -->


        <!-- Header -->
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/> <br>

        <!--/ End Header -->
        <div class="flex-container">
            <c:forEach items="${requestScope.data}" var="i">
                <div class="flex-item">
                    <section class="blog-single section">
                        <div class="blog-single-main">
                            <div class="image">
                                <a href="blogDetail?id=${i.blog_id}" > 
                                    <img class="blog-image" src="img/${i.image[0].img_url}" alt="#" />
                                </a>


                            </div>
                            <div class="blog-detail">
                                <h2 class="blog-title">${i.title}</h2>
                                <div class="blog-meta">
                                    <span class="author">
                                        <a href="#"><i class="fa fa-user"></i>${i.getEmployee().getName_emp()}</a>
                                        <a href="#"><i class="fa fa-calendar"></i>${i.getDate()}</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </c:forEach>
        </div>
        <div class="container">
            <div class="pagination-container d-flex justify-content-center">
                <div class="pagination">
                    <!-- Previous Button -->
                    <c:if test="${currentPage > 1}">
                        <a href="blogList?page=${currentPage - 1}" class="prev">&lt;</a>
                    </c:if>

                    <!-- Page Numbers -->
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="current-page">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="blogList?page=${i}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- Next Button -->
                    <c:if test="${currentPage < totalPages}">
                        <a href="blogList?page=${currentPage + 1}" class="next">&gt;</a>
                    </c:if>
                </div>
            </div>
        </div>








        <!-- Start Footer Area -->
            <jsp:include page="/Demo_Template/BasePage/Footer.jsp"/> <br>

        <!-- /End Footer Area -->

        <!-- Jquery -->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.0.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Color JS -->
        <script src="js/colors.js"></script>
        <!-- Slicknav JS -->
        <script src="js/slicknav.min.js"></script>
        <!-- Owl Carousel JS -->
        <script src="js/owl-carousel.js"></script>
        <!-- Magnific Popup JS -->
        <script src="js/magnific-popup.js"></script>
        <!-- Waypoints JS -->
        <script src="js/waypoints.min.js"></script>
        <!-- Countdown JS -->
        <script src="js/finalcountdown.min.js"></script>
        <!-- Nice Select JS -->
        <script src="js/nicesellect.js"></script>
        <!-- Flex Slider JS -->
        <script src="js/flex-slider.js"></script>
        <!-- ScrollUp JS -->
        <script src="js/scrollup.js"></script>
        <!-- Onepage Nav JS -->
        <script src="js/onepage-nav.min.js"></script>
        <!-- Easing JS -->
        <script src="js/easing.js"></script>
        <!-- Active JS -->
        <script src="js/active.js"></script>
    </body>
</html>