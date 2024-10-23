<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            .product-img img{
                width: 100%;
                height: auto;
                object-fit: cover;
                aspect-ratio:1/1
            }


        </style>
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
                                <div class="sinlge-bar shopping">
                                    <a href="#" class="single-icon"><i class="ti-bag"></i> <span class="total-count">2</span></a>
                                    <!-- Shopping Item -->
                                    <div class="shopping-item">
                                        <div class="dropdown-cart-header">
                                            <span>2 Sản phẩm</span>
                                            <a href="#">Xem giỏ hàng</a>
                                        </div>
                                        <ul class="shopping-list">
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="${pageContext.request.contextPath}/https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Dior Sauvage</a></h4>
                                                <p class="quantity">1x - <span class="amount">2.800.000 VND</span></p>
                                            </li>
                                            <li>
                                                <a href="#" class="remove" title="Remove this item"><i class="fa fa-remove"></i></a>
                                                <a class="cart-img" href="#"><img src="${pageContext.request.contextPath}/https://via.placeholder.com/70x70" alt="#"></a>
                                                <h4><a href="#">Channel</a></h4>
                                                <p class="quantity">1x - <span class="amount">2.000.000 VND</span></p>
                                            </li>
                                        </ul>
                                        <div class="bottom">
                                            <div class="total">
                                                <span>Tổng hóa đơn</span>
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



        <!-- Start Product Area -->
        <div class="product-area section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title">
                            <h2>Product List</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-info">
                            <div class="nav-main">
                                <!-- Tab Nav -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <form id="filterForm" method="get" action="productList">
                                        <!-- Dropdown for Brand -->
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                                Brand 
                                            </a>
                                            <div class="dropdown-menu">
                                                <c:forEach var="i" items="${requestScope.listBrand}">
                                                    <div class="dropdown-item">
                                                        <input type="checkbox" name="brandid" value="${i.brand_id}" id="brand${i.brand_id}">
                                                        <label for="brand${i.brand_id}">${i.name}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </li>

                                        <!-- Dropdown for Capacity -->
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                                Capacity
                                            </a>
                                            <div class="dropdown-menu">
                                                <c:forEach var="i" items="${requestScope.listCapacity}">
                                                    <div class="dropdown-item">
                                                        <input type="checkbox" name="capacityid" value="${i.capacity_id}" id="capacity${i.capacity_id}">
                                                        <label for="capacity${i.capacity_id}">${i.value}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </li>

                                        <!-- Dropdown for Gender -->
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                                Gender 
                                            </a>
                                            <div class="dropdown-menu">
                                                <c:forEach var="i" items="${requestScope.genderList}">
                                                    <div class="dropdown-item">
                                                        <input type="checkbox" name="genderid" value="${i.gender_id}" id="gender${i.gender_id}">
                                                        <label for="gender${i.gender_id}">${i.name}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </li>

                                        <!-- Dropdown for Price -->
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                                Price
                                            </a>
                                            <div class="dropdown-menu">
                                                <c:forEach var="i" items="${requestScope.priceRanges}">
                                                    <div class="dropdown-item">
                                                        <input type="checkbox" name="priceid" value="${i.id}" id="price${i.id}">
                                                        <label for="price{i.id}">${i.min} - ${i.max} VND</label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </li>
                                        <!-- Submit button to filter based on selected brands, capacities, and genders -->
                                        <button type="submit" class="btn btn-primary mt-3">Filter</button>
                                    </form>

                                </ul>


                                <!--/ End Tab Nav -->
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <!-- Start Single Tab -->
                                <div class="tab-pane fade show active" id="man" role="tabpanel">
                                    <div class="tab-single">
                                        <!-- The row div should be outside the loop -->
                                        <div class="row">
                                            <c:forEach var="i" items="${requestScope.data}">
                                                <!-- Set each product to take up 4 columns on large screens -->
                                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <c:forEach var="j" items="${i.img}">
                                                                <a href="product/detail?product_id=${i.product_id}">
                                                                    <img src="${pageContext.request.contextPath}/img/${j.name}" alt="${j.name}" class="default-img" >
                                                                <span class="price-dec">${i.discount.amount}% OFF</span>
                                                                </a>
                                                                
                                                            </c:forEach>

                                                            <div class="button-head">
                                                                <div class="product-action-2">
                                                                    <a title="Add to cart" href="#">Add to cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="product/detail">${i.name}</a></h3>
                                                            <div class="product-price">
                                                                <span>${i.price}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:forEach>
                                        </div> <!-- Close row here -->
                                    </div>
                                </div>
                            </div>

                            <div class="container">
                                <div class="pagination-container d-flex justify-content-center">
                                    <div class="pagination">
                                        <!-- Previous Button -->
                                        <c:if test="${currentPage > 1}">
                                            <c:if test="${param.brandid != null}">

                                                <a href="productList?page=${currentPage - 1}&brandid=${param.brandid}" class="prev">&lt;</a>
                                            </c:if>
                                            <c:if test="${param.genderid != null}">
                                                <a href="productList?page=${currentPage - 1}&genderid=${param.genderid}" class="prev">&lt;</a>

                                            </c:if>
                                            <c:if test="${param.capacityid != null}">   
                                                <a href="productList?page=${currentPage - 1}&capacityid=${param.capacityid}" class="prev">&lt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid != null and param.genderid != null}">

                                                <a href="productList?page=${currentPage - 1}&brandid=${param.brandid}&genderid=${param.genderid}" class="prev">&lt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid != null and param.capacityid != null}">

                                                <a href="productList?page=${currentPage - 1}&brandid=${param.brandid}&capacityid=${param.capacityid}" class="prev">&lt;</a>
                                            </c:if>
                                            <c:if test="${param.genderid != null and param.capacityid != null}">

                                                <a href="productList?page=${currentPage - 1}&genderid=${param.genderid}&capacityid=${param.capacityid}" class="prev">&lt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid != null and param.genderid != null and param.capacityid != null}">

                                                <a href="productList?page=${currentPage - 1}&brandid=${param.brandid}&genderid=${param.genderid}&capacityid=${param.capacityid}" class="prev">&lt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid == null and param.genderid == null and param.capacityid == null}">

                                                <a href="productList?page=${currentPage - 1}" class="prev">&lt;</a>
                                            </c:if>


                                        </c:if>

                                        <!-- Page Numbers -->
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <c:choose>
                                                <c:when test="${i == currentPage}">
                                                    <span class="current-page">${i}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${param.brandid != null}">
                                                        <a href="productList?page=${i}&brandid=${param.brandid}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${param.genderid != null}">
                                                        <a href="productList?page=${i}&genderid=${param.genderid}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${param.capacityid != null}">
                                                        <a href="productList?page=${i}&capacityid=${param.capacityid}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${param.brandid != null and param.genderid != null}">
                                                        <a href="productList?page=${i}&brandid=${param.brandid}&genderid=${param.genderid}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${param.brandid != null and param.capacityid != null}">
                                                        <a href="productList?page=${i}&brandid=${param.brandid}&capacityid=${param.capacityid}">${i}</a>

                                                    </c:if>
                                                    <c:if test="${param.genderid != null and param.capacityid != null}">
                                                        <a href="productList?page=${i}&genderid=${param.genderid}&capacityid=${param.capacityid}">${i}</a>

                                                    </c:if>
                                                    <c:if test="${param.brandid != null and param.genderid != null and param.capacityid != null}">
                                                        <a href="productList?page=${i}&brandid=${param.brandid}&genderid=${param.genderid}&capacityid=${param.capacityid}">${i}</a>

                                                    </c:if>
                                                    <c:if test="${param.brandid == null and param.genderid == null and param.capacityid == null}">
                                                        <a href="productList?page=${i}">${i}</a>

                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                        <!-- Next Button -->
                                        <c:if test="${currentPage < totalPages}">
                                            <c:if test="${param.brandid != null}">

                                                <a href="productList?page=${currentPage + 1}&brandid=${param.brandid}" class="prev">&gt;</a>
                                            </c:if>
                                            <c:if test="${param.genderid != null}">
                                                <a href="productList?page=${currentPage + 1}&genderid=${param.genderid}" class="prev">&gt;</a>

                                            </c:if>
                                            <c:if test="${param.capacityid != null}">   
                                                <a href="productList?page=${currentPage + 1}&capacityid=${param.capacityid}" class="prev">&gt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid != null and param.genderid != null}">

                                                <a href="productList?page=${currentPage + 1}&brandid=${param.brandid}&genderid=${param.genderid}" class="prev">&gt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid != null and param.capacityid != null}">

                                                <a href="productList?page=${currentPage + 1}&brandid=${param.brandid}&capacityid=${param.capacityid}" class="prev">&gt;</a>
                                            </c:if>
                                            <c:if test="${param.genderid != null and param.capacityid != null}">

                                                <a href="productList?page=${currentPage + 1}&genderid=${param.genderid}&capacityid=${param.capacityid}" class="prev">&gt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid != null and param.genderid != null and param.capacityid != null}">

                                                <a href="productList?page=${currentPage + 1}&brandid=${param.brandid}&genderid=${param.genderid}&capacityid=${param.capacityid}" class="prev">&gt;</a>
                                            </c:if>
                                            <c:if test="${param.brandid == null and param.genderid == null and param.capacityid == null}">

                                                <a href="productList?page=${currentPage + 1}" class="prev">&gt;</a>
                                            </c:if>

                                        </c:if>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Area -->



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
                        <!-- Start Single Product -->
                        <c:forEach var="i" items="${requestScope.hotItems}">
                            <div class="single-product">
                                <div class="product-img">
                                    <a href="product/detail?id=">
                                        <c:forEach var="j" items="${i.img}">
                                            <a href="product/detail?product_id=">
                                                <img src="${pageContext.request.contextPath}/img/${j.name}" alt="${j.name}" class="default-img" >
                                                <span class="price-dec">${i.discount.amount}% OFF</span>
                                            </a>
                                            
                                            
                                        </c:forEach>

                                        <span class="out-of-stock">Hot</span>
                                    </a>
                                    <div class="button-head">
                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product/detail?id=">${i.name}</a></h3>
                                    <div class="product-price">
                                        <span class="old">${i.price}</span>
                                        <span>${i.discountedPrice}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- End Single Product -->


                        <c:forEach var="i" items="${requestScope.hotItems}">
                            <!-- Start Single Product -->
                            <div class="single-product">
                                <div class="product-img">
                                  
                                        <c:forEach var="j" items="${i.img}">
                                            <a href="product/detail?product_id=">
                                                <img src="${pageContext.request.contextPath}/img/${j.name}" alt="${j.name}" class="default-img" >
                                                                                        <span class="new">New</span>

                                            </a>
                                            
                                            
                                        </c:forEach>
                                    <div class="button-head">

                                        <div class="product-action-2">
                                            <a title="Add to cart" href="#">Add to cart</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h3><a href="product/detail?id=">${i.name}</a></h3>
                                    <div class="product-price">
                                        <span>${i.price}</span>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Product -->
                        </c:forEach>
                        <!-- Start Single Product -->

                        <!-- End Single Product -->
                    </div>
                </div>
            </div>
        </div>
    </div>


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
                                    <footer class="footer">
                                        <!-- Footer Top -->
                                        <div class="footer-top section">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-lg-5 col-md-6 col-12">
                                                        <!-- Single Widget -->
                                                        <div class="single-footer about">
                                                            <div class="logo">
                                                                <a href="index.html"><img src="${pageContext.request.contextPath}/img/logo.png" alt="#"></a>
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
                                    <!-- Start Footer Area -->
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