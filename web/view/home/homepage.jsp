<%-- 
    Document   : homepage
    Created on : Sep 17, 2024, 10:13:07 PM
    Author     : KEISHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Keishaa Perfume</title>
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

        <!-- Header -->
        <header class="header shop">
            <!-- Topbar -->
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-12 col-12">
                            <!-- Top Left -->
                            <div class="top-left">
                                <ul class="list-main">
                                    <li><i class="ti-headphone-alt"></i> +84 354 995 144</li>
                                    <li><i class="ti-email"></i> group6@fpt.edu.vn</li>
                                </ul>
                            </div>
                            <!--/ End Top Left -->
                        </div>
                        <div class="col-lg-7 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content">
                                <ul class="list-main">
                                    <li><i class="ti-location-pin"></i> Đại Học FPT Hà Nội</li>

                                    <li><i class="ti-user"></i> <a href="customer_profile">Tài khoản</a></li>
                                    <li><i class="ti-power-off"></i><a href="login">Đăng nhập</a></li>
                                </ul>
                            </div>
                            <!-- End Top Right -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Topbar -->
            <div class="middle-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-12">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="${pageContext.request.contextPath}/homepage"><img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"></a>
                            </div>
                            <!--/ End Logo -->
                            <!-- Search Form -->
                            <div class="search-top">
                                <div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
                                <!-- Search Form -->
                                <div class="search-top">
                                    <form class="search-form">
                                        <input type="text" placeholder="Search here..." name="search">
                                        <button value="search" type="submit"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                                <!--/ End Search Form -->
                            </div>
                            <!--/ End Search Form -->
                            <div class="mobile-nav"></div>
                        </div>
                        <div class="col-lg-8 col-md-7 col-12">
                            <div class="search-bar-top">
                                <div class="search-bar">
                                    <select>
                                        <option selected="selected">All Category</option>
                                        <option>Nam</option>
                                        <option>Nữ</option>
                                        <option>Unisex</option>
                                    </select>
                                    <form action="productSearch">
                                        <input name="search" placeholder="Tìm kiếm....." type="search">
                                        <button class="btnn"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-12">
                            <div class="right-bar">
                                <!-- Search Form -->
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-heart-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar">
                                    <a href="#" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                </div>
                                <div class="sinlge-bar shopping">
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> 
                                        <span class="total-count">
                                            <c:choose>
                                                <c:when test="${cart.items.size() >= 5}">  5+  </c:when>
                                                <c:otherwise> ${cart.items.size()}  </c:otherwise>
                                            </c:choose>     
                                        </span></a>
                                    <!-- Shopping Item -->  
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>${cart.items.size()} Sản phẩm</span>
                                            <a href="${pageContext.request.contextPath}/cart/list">Xem giỏ hàng</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <c:choose>
                                                <c:when test="${not empty cart.items}">
                                                    <c:set var="totalPrice" value="0" />
                                                    <c:set var="count" value="0" />
                                                    <c:forEach var="item" items="${cart.items}">
                                                        <c:if test="${count < 4}">
                                                            <li>                                                                
                                                                <a href="${pageContext.request.contextPath}/cart/item/delete?comm=del&itemID=${item.item_id}" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                                <a class="cart-img" href="#"><img src="${pageContext.request.contextPath}/img/${item.product.img[0].img_url}" alt="#"></a>
                                                                <h4><a href="${pageContext.request.contextPath}/product/detail?product_id=${item.product.product_id}">${item.product.name}</a></h4>
                                                                <p class="quantity">${item.quantity}x - <span class="amount">${item.product.price} VND</span></p>

                                                            </li>
                                                            <c:set var="count" value="${count + 1}" />
                                                        </c:if>
                                                        <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.product.price)}"/>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <li>Giỏ hàng của bạn đang trống</li>
                                                    </c:otherwise>
                                                </c:choose>
                                        </ul>

                                        <div class="bottom">
                                            <div class="total">
                                                <span>Tổng hóa đơn</span>
                                                <span class="total-amount">${totalPrice} VND</span>
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
                                                    <li class="active"><a href="${pageContext.request.contextPath}/homepage">Trang chủ</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/productList">Sản phẩm</a><span class="new">New</span></li>												

                                                    <li><a href="#">Đơn hàng<i class="ti-angle-down"></i></a>
                                                        <ul class="dropdown">
                                                            <li><a href="${pageContext.request.contextPath}/cart/list">Giỏ hàng</a></li>
                                                            <li><a href="${pageContext.request.contextPath}/account/order">Đơn hàng</a></li>
                                                        </ul>
                                                    </li>

                                                    <li><a href="${pageContext.request.contextPath}/blogList">Bài viết</a></li>

                                                    <li><a href="${pageContext.request.contextPath}/homepage/feedback">Đánh giá</a></li>
                                                    <li><a href="employeeProductList">Bảng</a></li>

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

        <!-- Slider Area -->
        <section class="hero-slider owl-carousel owl-theme">
            <!-- Sử dụng JSTL để lặp qua danh sách sliders -->
            <c:forEach var="slider" items="${sliders}">
                <!-- Single Slider -->
                <div class="single-slider" style="background-image: url('img/${slider.image.img_url}');">
                    <div class="container">
                        <div class="row no-gutters">
                            <div class="col-lg-9 offset-lg-3 col-12">
                                <div class="text-inner">
                                    <div class="row">
                                        <div class="col-lg-7 col-12">
                                            <div class="hero-text">
                                                <h1><span>${slider.title} </span>Shirt For Man</h1>
                                                <!-- Hiển thị mô tả từ cơ sở dữ liệu -->
                                                <p>${slider.description}</p>
                                                <div class="button">
                                                    <a href="product/detail?product_id=${slider.product.product_id}" class="btn">Xem thêm</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/ End Single Slider -->
            </c:forEach>
        </section><br><br><br><br>

        <!--/ End Slider Area -->

        <div class="col-12">
            <div class="section-title">
                <h2>Hot Blogs</h2>
            </div>
        </div>

        <!-- Start Small Banner  -->
        <section class="small-banner section">
            <div class="container-fluid">
                <div class="row">
                    <!-- Sử dụng JSTL để lặp qua danh sách banners -->
                    <c:forEach var="blog" items="${blogs}">
                        <!-- Single Banner -->
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="eshop-single-banner">
                                <!-- Đảm bảo đường dẫn ảnh là từ đối tượng banner -->
                                <img src="img/${blog.image[0].img_url}" alt="Banner Image">
                                <div class="content">
                                    <h4>${blog.title}</h4>
                                    <p>${blog.shortContent}</p>
                                    <a href="blogDetail?id=${blog.blog_id}">Discover Now</a>
                                </div>
                            </div>
                        </div>
                        <!--/ End Single Banner -->
                    </c:forEach>
                </div>
            </div>
        </section>
        <!--/ End Small Banner -->


        <!-- Start Product Area -->
        <div class="product-area section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Top seller</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">

                            <div class="tab-content" id="myTabContent">


                                <!-- Add JSP  -->   
                                <div class="tab-single">
                                    <div class="row">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                <div class="single-product">
                                                    <div class="product-img">
                                                        <a href="product/detail?product_id=${product.product_id}">
                                                            <img class="default-img" src="img/${product.img[0].img_url}" alt="#">
                                                            <img class="hover-img" src="img/${product.img[0].img_url}" alt="#">
                                                            <span class="price-dec">${product.discount.amount}% OFF</span>
                                                        </a>
                                                        <div class="button-head">
                                                            <div class="product-action">
                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>

                                                            </div>
                                                            <div class="product-action-2">
                                                                <a title="Add to cart" href="cart/item/add?pid=${product.product_id}&cartID=${sessionScope.customer.cart.cart_id}">Add to cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <h3><a href="product-details.html">${product.name}</a></h3>
                                                        <div class="product-price">
                                                            <span>${product.price}</span>

                                                        </div>
                                                        <div class="product-gender">
                                                            <span>${product.gender[0].name}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <br><br><br><br>
                                <!--End JSP -->                                   







                                <div class="row">
                                    <div class="col-12">
                                        <div class="section-title">
                                            <h2>Newest Product</h2>
                                        </div>
                                    </div>
                                </div>

                                <!-- Start Midium Banner  -->
                                <section class="midium-banner">
                                    <div class="container">
                                        <div class="row">
                                            <c:forEach var="product" items="${newProducts}">
                                                <!-- Single Banner  -->
                                                <div class="col-lg-6 col-md-6 col-12">
                                                    <div class="single-banner">
                                                        <img src="img/${product.img[0].img_url}">
                                                        <div class="content">
                                                            <p>${product.name}</p>
                                                            <h3>${product.discount.name} <br> Up to<span> ${product.discount.amount}%</span></h3>
                                                            <a href="product/detail?product_id=${product.product_id}">Shop Now</a>
                                                        </div>
                                                    </div>
                                                </div>   
                                            </c:forEach>
                                        </div>
                                    </div>
                                </section> <br><br><br><br>



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
                                                            <a href="${pageContext.request.contextPath}/homepage"><img src="${pageContext.request.contextPath}/img/logo.png" alt="logo"></a>
                                                        </div>
                                                        <p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue,  magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                                                        <p class="call">Giải đáp thắc mắc? Call us 24/7<span><a href="tel:123456789">+84 354 995 144</a></span></p>
                                                    </div>
                                                    <!-- End Single Widget -->
                                                </div>
                                                <div class="col-lg-2 col-md-6 col-12">

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
                                                                <li>Đại học FPT Hà Nội</li>
                                                                <li>49 Mục Uyên - Thạch Thất</li>
                                                                <li>group6@gmail.com</li>
                                                                <li>+84 354 995 144</li>
                                                            </ul>
                                                        </div>
                                                        <!-- End Single Widget -->
                                                        <ul>
                                                            <li><a href="https://www.facebook.com/Cybevis.Keisha"><i class="ti-facebook"></i></a></li>
                                                            <li><a href="https://www.instagram.com/iam._.nongg/"><i class="ti-twitter"></i></a></li>
                                                            <li><a href="https://www.youtube.com/watch?v=bfxJZk4SGpA&list=RDbfxJZk4SGpA&start_radio=1"><i class="ti-flickr"></i></a></li>
                                                            <li><a href="https://www.youtube.com/watch?v=ZjjmqHW7MgQ&list=RDZjjmqHW7MgQ&start_radio=1&rv=bfxJZk4SGpA"><i class="ti-instagram"></i></a></li>
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
                                                            <p>Copyright © 2020 <a href="http://www.wpthemesgrid.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-12">
                                                        <div class="right">
                                                            <img src="img/payments.png" alt="#">
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
