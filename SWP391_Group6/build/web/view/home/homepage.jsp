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
        <link rel="icon" type="image/png" href="images/favicon.png">
        <!-- Web Font -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

        <!-- StyleSheet -->

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

                                    <li><i class="ti-user"></i> <a href="#">My account</a></li>
                                    <li><i class="ti-power-off"></i><a href="login.html#">Login</a></li>
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
                                <a href="index.html"><img src="img/logo.png" alt="logo"></a>
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
                                        <option>Man</option>
                                        <option>Woman</option>
                                        <option>Unisex</option>
                                    </select>
                                    <form>
                                        <input name="search" placeholder="Search Products Here....." type="search">
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
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">2</span></a>
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
                                                <h4><a href="#">Dior Sauvage</a></h4>
                                                <p class="quantity">1x - <span class="amount">2.800.000 VND</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Channel</a></h4>
                                                <p class="quantity">1x - <span class="amount">2.000.000 VND</span></p>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Total</span>
                                                <span class="total-amount">4.800.000 VND</span>
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
                                <div class="all-category">
                                    <h3 class="cat-heading"><i class="fa fa-bars" aria-hidden="true"></i>CATEGORIES</h3>
                                    <ul class="main-category">

                                        <!--                                        <li class="main-mega"><a href="#">best selling <i class="fa fa-angle-right" aria-hidden="true"></i></a>
                                                                                    <ul class="mega-menu">
                                                                                        <li class="single-menu">
                                                                                            <a href="#" class="title-link">Shop men's</a>
                                                                                            <div class="image">
                                                                                                <img src="https://via.placeholder.com/225x155" alt="#">
                                                                                            </div>
                                                                                            <div class="inner-link">
                                                                                                <a href="#">Dior Sauvage</a>
                                                                                                <a href="#">Creed Aventus</a>
                                                                                                <a href="#">Valentino Uomo</a>
                                        
                                                                                            </div>
                                                                                        </li>
                                                                                        <li class="single-menu">
                                                                                            <a href="#" class="title-link">Shop woman's</a>
                                                                                            <div class="image">
                                                                                                <img src="https://via.placeholder.com/225x155" alt="#">
                                                                                            </div>
                                                                                            <div class="inner-link">
                                                                                                <a href="#">YSL Yves Saint Laurent</a>
                                                                                                <a href="#">Prada Paradoxe</a>
                                                                                                <a href="#">Kenzo Flower</a>
                                        
                                                                                            </div>
                                                                                        </li>
                                                                                        <li class="single-menu">
                                                                                            <a href="#" class="title-link">Shop unisex's</a>
                                                                                            <div class="image">
                                                                                                <img src="https://via.placeholder.com/225x155" alt="#">
                                                                                            </div>
                                                                                            <div class="inner-link">
                                                                                                <a href="#">Le Labo Another 13</a>
                                                                                                <a href="#">Moschino Toy 2</a>
                                                                                                <a href="#">Maison Martin Margiela Replica</a>
                                        
                                                                                            </div>
                                                                                        </li>
                                                                                    </ul>
                                                                                </li>-->
                                        <li><a href="#">Best Seller</a></li>
                                        <li><a href="#">newest</a></li>
                                        <li><a href="#">top offers</a></li>																																			<li><a href="#">man’s product</a></li>
                                        <li><a href="#">ladies</a></li>
                                        <li><a href="#">for man</a></li>
                                        <li><a href="#">unisex</a></li>
                                    </ul>
                                </div>
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

                                                    <li><a href="#">Shop<i class="ti-angle-down"></i><span class="new">New</span></a>
                                                        <ul class="dropdown">
                                                            <li><a href="cart.html">Cart</a></li>
                                                            <li><a href="checkout.html">Checkout</a></li>
                                                        </ul>
                                                    </li>

                                                    <li><a href="#">Blog</a></li>

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

        <!-- Slider Area -->
        <section class="hero-slider">
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
                                                    <a href="#" class="btn">Xem thêm</a>
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
                                <img src="img/${blog.image.img_url}" alt="Banner Image">
                                <div class="content">
                                    <h4>${blog.title}</h4>
                                    <p>${blog.shortContent}</p>
                                    <a href="${banner.link}">Discover Now</a>
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
                                                        <a href="product-details.html">
                                                            <img class="default-img" src="img/${product.img[0].img_url}" alt="#">
                                                            <img class="hover-img" src="img/${product.img[0].img_url}" alt="#">
                                                            <span class="price-dec">${product.discount.amount}% OFF</span>
                                                        </a>
                                                        <div class="button-head">
                                                            <div class="product-action">
                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                            </div>
                                                            <div class="product-action-2">
                                                                <a title="Add to cart" href="#">Add to cart</a>
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

                                <!--End JSP -->                                   



                                <!-- Top 3  -->


                                <!--  Start Single Tab -->
                                <!--                                <div class="tab-pane fade show active" id="man" role="tabpanel">
                                                                    <div class="tab-single">
                                                                        <div class="row">
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="new">New</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="price-dec">30% Off</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="out-of-stock">Hot</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span class="old">$60.00</span>
                                                                                            <span>$50.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                  End Single Tab 
                                                                  Start Single Tab 
                                                                <div class="tab-pane fade" id="women" role="tabpanel">
                                                                    <div class="tab-single">
                                                                        <div class="row">
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="new">New</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="price-dec">30% Off</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="out-of-stock">Hot</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span class="old">$60.00</span>
                                                                                            <span>$50.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                 End Single Tab 
                                                                   Start Single Tab 
                                                                <div class="tab-pane fade" id="kids" role="tabpanel">
                                                                    <div class="tab-single">
                                                                        <div class="row">
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="new">New</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="price-dec">30% Off</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="out-of-stock">Hot</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span class="old">$60.00</span>
                                                                                            <span>$50.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>-->
                                <!--  End Single Tab -->



                                <!-- top 3 end -->                                  














                                <!--                                 Start Single Tab 
                                                                <div class="tab-pane fade" id="accessories" role="tabpanel">
                                                                    <div class="tab-single">
                                                                        <div class="row">
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="new">New</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="price-dec">30% Off</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="out-of-stock">Hot</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span class="old">$60.00</span>
                                                                                            <span>$50.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                / End Single Tab 
                                                                 Start Single Tab 
                                                                <div class="tab-pane fade" id="essential" role="tabpanel">
                                                                    <div class="tab-single">
                                                                        <div class="row">
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="new">New</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="price-dec">30% Off</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="out-of-stock">Hot</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span class="old">$60.00</span>
                                                                                            <span>$50.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                / End Single Tab 
                                                                 Start Single Tab 
                                                                <div class="tab-pane fade" id="prices" role="tabpanel">
                                                                    <div class="tab-single">
                                                                        <div class="row">
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Hot Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Pink Show</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="new">New</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Women Pant Collectons</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Bags Collection</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="price-dec">30% Off</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Awesome Cap For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Polo Dress For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span>$29.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                                                <div class="single-product">
                                                                                    <div class="product-img">
                                                                                        <a href="product-details.html">
                                                                                            <img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
                                                                                            <span class="out-of-stock">Hot</span>
                                                                                        </a>
                                                                                        <div class="button-head">
                                                                                            <div class="product-action">
                                                                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
                                                                                                <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
                                                                                                <a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
                                                                                            </div>
                                                                                            <div class="product-action-2">
                                                                                                <a title="Add to cart" href="#">Add to cart</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="product-content">
                                                                                        <h3><a href="product-details.html">Black Sunglass For Women</a></h3>
                                                                                        <div class="product-price">
                                                                                            <span class="old">$60.00</span>
                                                                                            <span>$50.00</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                / End Single Tab -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Product Area -->



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
                                    <a href="#">Shop Now</a>
                                </div>
                            </div>
                        </div>   
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- End Midium Banner -->

        <!-- Start Most Popular -->
        <div class="product-area most-popular section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Hot Item</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="owl-carousel popular-slider">
                            <!-- Sử dụng JSTL forEach để lặp qua danh sách sản phẩm -->
                            <c:forEach var="product" items="${productsss}">
                                <!-- Single Product -->
                                <div class="single-product">
                                    <div class="product-img">
                                        <a href="product-details.html?id=${product.id}">
                                            <img class="default-img" src="${product.defaultImgUrl}" alt="${product.name}">
                                            <img class="hover-img" src="${product.hoverImgUrl}" alt="${product.name}">
                                            <span class="${product.label}">${product.labelText}</span>
                                        </a>
                                        <div class="button-head">
                                            <div class="product-action">
                                                <a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#">
                                                    <i class=" ti-eye"></i><span>Quick Shop</span>
                                                </a>
                                                <a title="Wishlist" href="#">
                                                    <i class=" ti-heart "></i><span>Add to Wishlist</span>
                                                </a>
                                                <a title="Compare" href="#">
                                                    <i class="ti-bar-chart-alt"></i><span>Add to Compare</span>
                                                </a>
                                            </div>
                                            <div class="product-action-2">
                                                <a title="Add to cart" href="#">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-content">
                                        <h3><a href="product-details.html?id=${product.id}">${product.name}</a></h3>
                                        <div class="product-price">
                                            <span class="old">${product.oldPrice != null ? '$' + product.oldPrice : ''}</span>
                                            <span>${'$' + product.price}</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Single Product -->
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        
        
        <!--
        
                <section class="section free-version-banner">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-8 offset-md-2 col-xs-12">
                                <div class="section-title mb-60">
                                    <span class="text-white wow fadeInDown" data-wow-delay=".2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInDown;">Eshop Free Lite version</span>
                                    <h2 class="text-white wow fadeInUp" data-wow-delay=".4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;">Currently You are using free<br> lite Version of Eshop.</h2>
                                    <p class="text-white wow fadeInUp" data-wow-delay=".6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInUp;">Please, purchase full version of the template to get all pages,<br> features and commercial license.</p>
        
                                    <div class="button">
                                        <a href="https://wpthemesgrid.com/downloads/eshop-ecommerce-html5-template/" target="_blank" rel="nofollow" class="btn wow fadeInUp" data-wow-delay=".8s">Purchase Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
        
                 Start Shop Home List  
                <section class="shop-home-list section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="shop-section-title">
                                            <h1>On sale</h1>
                                        </div>
                                    </div>
                                </div>
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h4 class="title"><a href="#">Licity jelly leg flat Sandals</a></h4>
                                                <p class="price with-discount">$59</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$44</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$89</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="shop-section-title">
                                            <h1>Best Seller</h1>
                                        </div>
                                    </div>
                                </div>
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$65</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$33</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$77</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="shop-section-title">
                                            <h1>Top viewed</h1>
                                        </div>
                                    </div>
                                </div>
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$22</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$35</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                                 Start Single List  
                                <div class="single-list">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="list-image overlay">
                                                <img src="https://via.placeholder.com/115x140" alt="#">
                                                <a href="#" class="buy"><i class="fa fa-shopping-bag"></i></a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                                            <div class="content">
                                                <h5 class="title"><a href="#">Licity jelly leg flat Sandals</a></h5>
                                                <p class="price with-discount">$99</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 End Single List  
                            </div>
                        </div>
                    </div>
                </section>
                 End Shop Home List  
        
                 Start Shop Blog  
                <section class="shop-blog section">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="section-title">
                                    <h2>From Our Blog</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12">
                                 Start Single Blog  
                                <div class="shop-single-blog">
                                    <img src="https://via.placeholder.com/370x300" alt="#">
                                    <div class="content">
                                        <p class="date">22 July , 2020. Monday</p>
                                        <a href="#" class="title">Sed adipiscing ornare.</a>
                                        <a href="#" class="more-btn">Continue Reading</a>
                                    </div>
                                </div>
                                 End Single Blog  
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                 Start Single Blog  
                                <div class="shop-single-blog">
                                    <img src="https://via.placeholder.com/370x300" alt="#">
                                    <div class="content">
                                        <p class="date">22 July, 2020. Monday</p>
                                        <a href="#" class="title">Man’s Fashion Winter Sale</a>
                                        <a href="#" class="more-btn">Continue Reading</a>
                                    </div>
                                </div>
                                 End Single Blog  
                            </div>
                            <div class="col-lg-4 col-md-6 col-12">
                                 Start Single Blog  
                                <div class="shop-single-blog">
                                    <img src="https://via.placeholder.com/370x300" alt="#">
                                    <div class="content">
                                        <p class="date">22 July, 2020. Monday</p>
                                        <a href="#" class="title">Women Fashion Festive</a>
                                        <a href="#" class="more-btn">Continue Reading</a>
                                    </div>
                                </div>
                                 End Single Blog  
                            </div>
                        </div>
                    </div>
                </section>
                 End Shop Blog  
        
                 Start Shop Services Area 
                <section class="shop-services section home">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-3 col-md-6 col-12">
                                 Start Single Service 
                                <div class="single-service">
                                    <i class="ti-rocket"></i>
                                    <h4>Giao hàng miễn phí</h4>
                                    <p>Đơn hàng trên 2 triệu</p>
                                </div>
                                 End Single Service 
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                 Start Single Service 
                                <div class="single-service">
                                    <i class="ti-reload"></i>
                                    <h4>Hỗ trợ trả hàng</h4>
                                    <p>Nếu có lỗi trong 30 ngày</p>
                                </div>
                                 End Single Service 
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                 Start Single Service 
                                <div class="single-service">
                                    <i class="ti-lock"></i>
                                    <h4>Bảo mật thông tin</h4>
                                    <p>Bảo mật giao dịch 100%</p>
                                </div>
                                 End Single Service 
                            </div>
                            <div class="col-lg-3 col-md-6 col-12">
                                 Start Single Service 
                                <div class="single-service">
                                    <i class="ti-tag"></i>
                                    <h4>Giá rẻ bất ngờ</h4>
                                    <p>Chất lượng hết mình</p>
                                </div>
                                 End Single Service 
                            </div>
                        </div>
                    </div>
                </section>
                 End Shop Services Area 
        
                 Start Shop Newsletter  
                <section class="shop-newsletter section">
                    <div class="container">
                        <div class="inner-top">
                            <div class="row">
                                <div class="col-lg-8 offset-lg-2 col-12">
                                     Start Newsletter Inner 
                                    <div class="inner">
                                        <h4>Newsletter</h4>
                                        <p> Subscribe to our newsletter and get <span>10%</span> off your first purchase</p>
                                        <form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
                                            <input name="EMAIL" placeholder="Your email address" required="" type="email">
                                            <button class="btn">Subscribe</button>
                                        </form>
                                    </div>
                                     End Newsletter Inner 
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                 End Shop Newsletter 
        
                 Modal 
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
        Modal end -->

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
                                    <a href="index.html"><img src="img/logo.png" alt="#"></a>
                                </div>
                                <p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue,  magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.</p>
                                <p class="call">Giải đáp thắc mắc? Call us 24/7<span><a href="tel:123456789">+84 354 995 144</a></span></p>
                            </div>
                            <!-- End Single Widget -->
                        </div>
                        <div class="col-lg-2 col-md-6 col-12">
                            <!-- Single Widget -->
                            <!--                                                            <div class="single-footer links">
                                                                                            <h4>Information</h4>
                                                                                            <ul>
                                                                                                <li><a href="#">About Us</a></li>
                                                                                                <li><a href="#">Faq</a></li>
                                                                                                <li><a href="#">Terms & Conditions</a></li>
                                                                                                <li><a href="#">Contact Us</a></li>
                                                                                                <li><a href="#">Help</a></li>
                                                                                            </ul>
                                                                                        </div>
                            -->

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
