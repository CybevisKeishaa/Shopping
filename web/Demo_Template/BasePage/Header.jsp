<%-- 
    Document   : Header
    Created on : Oct 4, 2024, 10:57:42 PM
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

                                    <li><i class="ti-user"></i> <a href="${pageContext.request.contextPath}/customer_profile">Tài khoản</a></li>
                                    <li><i class="ti-power-off"></i><a href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
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
                                    <a href="${pageContext.request.contextPath}/customer_profile" class="single-icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
                                </div>
                                <!-- Phần giỏ hàng trong header -->
                                <div class="sinlge-bar shopping">
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> 
                                        <span class="total-count">
                                            <c:choose>
                                                <c:when test="${sessionScope.cart != null && sessionScope.cart.items.size() >= 5}">
                                                    5+
                                                </c:when>
                                                <c:otherwise>
                                                    ${sessionScope.cart != null ? sessionScope.cart.items.size() : 0}
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                    </a>

                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>${sessionScope.cart != null ? sessionScope.cart.items.size() : 0} Sản phẩm</span>
                                            <a href="${pageContext.request.contextPath}/cart/list">Xem giỏ hàng</a>
                                        </div>

                                        <ul class="shopping-list">
                                            <c:choose>
                                                <c:when test="${sessionScope.cart != null && not empty sessionScope.cart.items}">
                                                    <c:set var="totalPrice" value="0" />
                                                    <c:forEach var="item" items="${sessionScope.cart.items}">
                                                        <li>
                                                            <a href="${pageContext.request.contextPath}/cart/item/delete?comm=del&itemID=${item.item_id}" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                            <a class="cart-img" href="#"><img src="${pageContext.request.contextPath}/img/${item.product.img[0].img_url}" alt="#"></a>
                                                            <h4><a href="${pageContext.request.contextPath}/product/detail?product_id=${item.product.product_id}">${item.product.name}</a></h4>
                                                            <p class="quantity">${item.quantity}x - <span class="amount">${item.capacity.unit_price} VND</span></p>
                                                        </li>
                                                        <c:set var="totalPrice" value="${totalPrice + (item.quantity * item.capacity.unit_price)}" />
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
                                            <a href="${pageContext.request.contextPath}/cart/checkout" class="btn animate">Checkout</a>
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
                                                    <li><a href="${pageContext.request.contextPath}/productList">Sản phẩm</a></li>												

                                                    <li><a href="#">Đơn hàng<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="cart.html">Giỏ hàng</a></li>
                                                            <li><a href="${pageContext.request.contextPath}/account/order">Đơn hàng</a></li>
                                                        </ul>
                                                    </li>

                                                    <li><a href="${pageContext.request.contextPath}/blogList">Bài viết</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/homepage/feedback">Đánh giá</a></li>
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

        <!-- Jquery -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
        <!-- Popper JS -->
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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