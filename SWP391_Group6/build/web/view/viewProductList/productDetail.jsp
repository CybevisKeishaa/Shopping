<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <style>
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
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: Arial, sans-serif;
                padding: 20px;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .header a {
                text-decoration: none;
                color: #333;
            }

            .blog-button {
                padding: 5px 10px;
                border: 1px solid #333;
                background-color: white;
                cursor: pointer;
            }

            .product-container {
                display: flex;
                gap: 20px;
            }

            .image-section img {
                width: 300px;
                height: 300px;
                object-fit: cover;
            }

            .product-info h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .stars {
                color: gold;
            }

            .product-info p {
                margin: 10px 0;
            }

            .button-container {
                margin-top: 20px;
            }

            .add-to-bag,
            .buy-now {
                padding: 10px 20px;
                margin-right: 10px;
                border: 1px solid #333;
                background-color: white;
                cursor: pointer;
            }

            .add-to-bag:hover,
            .buy-now:hover {
                background-color: #f0f0f0;
            }

            .other-products {
                margin-top: 30px;
            }

            .other-products h3 {
                margin-bottom: 20px;
            }

            .other-products-list {
                display: flex;
                gap: 20px;
            }

            .other-product-item {
                text-align: center;
            }

            .other-product-item img {
                width: 100px;
                height: 100px;
                object-fit: cover;
            }
            .quantity-selector {
                display: flex;
                align-items: center;
                font-family: Arial, sans-serif;
            }

            .quantity-controls {
                display: flex;
                align-items: center;
                margin-left: 10px;
            }

            .quantity-controls button {
                width: 30px;
                height: 30px;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                color: #333;
                font-size: 16px;
                cursor: pointer;
            }

            .quantity-controls input {
                width: 50px;
                height: 30px;
                text-align: center;
                border: 1px solid #ccc;
                margin: 0 5px;
            }

            .quantity-controls button:hover {
                background-color: #ddd;
            }

            label {
                font-size: 14px;
            }
            .capacity-box {
                display: inline-block;
                padding: 5px; /* Reduced padding */
                margin: 3px; /* Slightly smaller margin */
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                font-size: 14px; /* Smaller font size */
                text-align: center;
                width: 40px; /* Smaller width */
            }

            .capacity-box:hover {
                background-color: #e0e0e0;
                border-color: #bbb;
            }




        </style>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">



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
        <header class="header shop">
            <!-- Topbar -->

            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">


                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->

                                <div class="sinlge-bar shopping">

                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>2 Items</span>
                                            <a href="#">View Cart</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Ring</a></h4>
                                                <p class="quantity">1x - <span class="amount">$99.00</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Woman Necklace</a></h4>
                                                <p class="quantity">1x - <span class="amount">$35.00</span></p>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Total</span>
                                                <span class="total-amount">$134.00</span>
                                            </div>
                                            <a href="checkout.html" class="btn animate">Checkout</a>
                                        </div>
                                    </div>
                                    <!--/ End Shopping Item -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Inner -->
            <div class="header-inner">
                <div class="container">
                    <div class="cat-nav-head">
                        <div class="row">
                            <div class="col-lg-3">

                            </div>
                            <div class="col-lg-9 col-12">
                                <div class="menu-area">
                                    <!-- Main Menu -->
                                    <nav class="navbar navbar-expand-lg">
                                        <div class="navbar-collapse">	
                                            <div class="nav-inner">	
                                                <ul class="nav main-menu menu navbar-nav">
                                                    <li class="active"><a href="#">Home</a></li>
                                                    <li><a href="#">Product</a></li>												
                                                    <li><a href="#">Service</a></li>
                                                    <li><a href="#">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="cart.html">Cart</a></li>
                                                            <li><a href="checkout.html">Checkout</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Pages</a></li>									
                                                    <li><a href="#">Blog<i class="ti-angle-down"></i></a>
                                                        <ul class="dropdown">
                                                            <li><a href="blog-single-sidebar.html">Blog Single Sidebar</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="contact.html">Contact Us</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </nav>
                                    <!--/ End Main Menu -->	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ End Header Inner -->
        </header>
        <!--/ End Header -->


        <!-- Start Product Area -->
        <div class="product-area section">
            <div class="container">
                <!-- Header Section -->


                <!-- Product Section -->
                <div class="product-container">
                    <!-- Image Section -->
                    <div class="image-section">
                        <img src="${pageContext.request.contextPath}/images/test.jpg" alt="Product Image" />
                    </div>

                    <!-- Product Info Section -->
                    <div class="product-info">
                        <h1>${requestScope.data.name}</h1>
                        <p>SALE OFF: <strong>$${requestScope.data.getDiscount().getAmount()}</strong></p>
                        <p>PRICE: <strong>$${requestScope.data.price}</strong></p>
                        <p>Release year: ${requestScope.data.date}</p>
                        <c:if test="${requestScope.data.status == true}">
                            <p>Status: In stock</p>
                        </c:if>
                        <c:if test="${requestScope.data.status == false}">
                            <p>Status: Out of stock</p>
                        </c:if>
                        <p>Brand: ${requestScope.data.getBrand().getName()}</p>
                        <p>Capacity: 
                            <c:forEach var="i" items="${requestScope.data.getCapacity()}">
                            <div class="capacity-box">
                                ${i.getValue()} ml
                            </div>
                        </c:forEach>
                        </p>



                        <div class="quantity-selector">
                            <label for="quantity">Quantity</label>
                            <div class="quantity-controls">
                                <input type="number" id="quantity" value="1" min="1" max="10">
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="button-container">
                            <button class="add-to-bag">ADD TO BAG</button>
                            <button class="buy-now">BUY NOW</button>
                        </div>
                    </div>
                </div>
                <!-- Other Products Section -->
                <div class="other-products">
                    <h3>Other Products:</h3>
                    <div class="other-products-list">
                        <c:forEach var="i" items="${requestScope.list}">
                            <div class="other-product-item">
                                <img src="${pageContext.request.contextPath}/images/test.jpg" alt="Other Product 1" />
                                <p>${i.price}</p>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="pagination-container d-flex justify-content-center">
                <div class="pagination">
                    <!-- Previous Button -->
                    <c:if test="${currentPage > 1}">
                        <a href="productDetail?page=${currentPage - 1}&id=${requestScope.id}" class="prev">&lt;</a>
                    </c:if>

                    <!-- Page Numbers -->
                    <c:forEach var="i" begin="1" end="${totalPages}">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="current-page">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="productDetail?page=${i}&id=${requestScope.id}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <!-- Next Button -->
                    <c:if test="${currentPage < totalPages}">
                        <a href="productDetail?page=${currentPage + 1}&id=${requestScope.id}" class="next">&gt;</a>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- End Product Area -->

        <!-- Start Midium Banner  -->

        <!-- End Midium Banner -->

        <!-- Start Most Popular -->



        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="ti-close" aria-hidden="true"></span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row no-gutters">
                            <div class="col-lg-6 offset-lg-3 col-12">
                                <h4 style="margin-top:100px;font-size:14px; font-weight:500; color:#F7941D; display:block; margin-bottom:5px;">Eshop Free Lite</h4>
                                <h3 style="font-size:30px;color:#333;">Currently You are using free lite Version of Eshop.<h3>
                                        <p style="display:block; margin-top:20px; color:#888; font-size:14px; font-weight:400;">Please, purchase full version of the template to get all pages, features and commercial license</p>
                                        <div class="button" style="margin-top:30px;">
                                            <a href="https://wpthemesgrid.com/downloads/eshop-ecommerce-html5-template/" target="_blank" class="btn" style="color:#fff;">Buy Now!</a>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        <!-- Modal end -->

                                        <!-- Start Footer Area -->
                                        <footer class="footer">
                                            <!-- Footer Top -->
                                            <div class="footer-top section">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-lg-5 col-md-6 col-12">
                                                            <!-- Single Widget -->
                                                            <div class="single-footer about">
                                                                <div class="logo">
                                                                    <a href="index.html"><img src="images/logo2.png" alt="#"></a>
                                                                </div>
                                                                <p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue,  magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                                                                <p class="call">Got Question? Call us 24/7<span><a href="tel:123456789">+0123 456 789</a></span></p>
                                                            </div>
                                                            <!-- End Single Widget -->
                                                        </div>
                                                        <div class="col-lg-2 col-md-6 col-12">
                                                            <!-- Single Widget -->
                                                            <div class="single-footer links">
                                                                <h4>Information</h4>
                                                                <ul>
                                                                    <li><a href="#">About Us</a></li>
                                                                    <li><a href="#">Faq</a></li>
                                                                    <li><a href="#">Terms & Conditions</a></li>
                                                                    <li><a href="#">Contact Us</a></li>
                                                                    <li><a href="#">Help</a></li>
                                                                </ul>
                                                            </div>
                                                            <!-- End Single Widget -->
                                                        </div>
                                                        <div class="col-lg-2 col-md-6 col-12">
                                                            <!-- Single Widget -->
                                                            <div class="single-footer links">
                                                                <h4>Customer Service</h4>
                                                                <ul>
                                                                    <li><a href="#">Payment Methods</a></li>
                                                                    <li><a href="#">Money-back</a></li>
                                                                    <li><a href="#">Returns</a></li>
                                                                    <li><a href="#">Shipping</a></li>
                                                                    <li><a href="#">Privacy Policy</a></li>
                                                                </ul>
                                                            </div>
                                                            <!-- End Single Widget -->
                                                        </div>
                                                        <div class="col-lg-3 col-md-6 col-12">
                                                            <!-- Single Widget -->
                                                            <div class="single-footer social">
                                                                <h4>Get In Tuch</h4>
                                                                <!-- Single Widget -->
                                                                <div class="contact">
                                                                    <ul>
                                                                        <li>NO. 342 - London Oxford Street.</li>
                                                                        <li>012 United Kingdom.</li>
                                                                        <li>info@eshop.com</li>
                                                                        <li>+032 3456 7890</li>
                                                                    </ul>
                                                                </div>
                                                                <!-- End Single Widget -->
                                                                <ul>
                                                                    <li><a href="#"><i class="ti-facebook"></i></a></li>
                                                                    <li><a href="#"><i class="ti-twitter"></i></a></li>
                                                                    <li><a href="#"><i class="ti-flickr"></i></a></li>
                                                                    <li><a href="#"><i class="ti-instagram"></i></a></li>
                                                                </ul>
                                                            </div>
                                                            <!-- End Single Widget -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Footer Top -->
                                            <div class="copyright">
                                                <div class="container">
                                                    <div class="inner">
                                                        <div class="row">
                                                            <div class="col-lg-6 col-12">
                                                                <div class="left">
                                                                    <p>Copyright  2020 <a href="http://www.wpthemesgrid.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-12">
                                                                <div class="right">
                                                                    <img src="images/payments.png" alt="#">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </footer>
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