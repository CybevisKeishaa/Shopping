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
        <title>Eshop - eCommerce HTML5 Template.</title>
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
                                    <li><i class="ti-headphone-alt"></i> +060 (800) 801-582</li>
                                    <li><i class="ti-email"></i> support@shophub.com</li>
                                </ul>
                            </div>
                            <!--/ End Top Left -->
                        </div>
                        <div class="col-lg-7 col-md-12 col-12">
                            <!-- Top Right -->
                            <div class="right-content">
                                <ul class="list-main">
                                    <li><i class="ti-location-pin"></i> Store location</li>
                                    <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li>
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
                                <a href="index.html"><img src="images/logo.png" alt="logo"></a>
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
                                        <option>watch</option>
                                        <option>mobile</option>
                                        <option>kid?s item</option>
                                    </select>
                                    <form action="productSearch">
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
                                                    <li ><a href="#">Home</a></li>
                                                    <li class="active"><a href="#">Product</a></li>												
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
                                                            <a href="product/detail?product_id=">
                                                                <img class="default-img" src="img/${i.img[0].img_url}" alt="#">
                                                                <img class="hover-img" src="img/${i.img[0].img_url}" alt="#">
                                                            </a>
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
                                                        <a href="productList?page=${i}&brandid=${param.genderid}">${i}</a>
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
                                        <img class="default-img" src="img/${i.img[0].img_url}" alt="#">
                                        <img class="hover-img" src="img/${i.img[0].img_url}" alt="#">
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
                                    <a href="product/detail?id=">
                                        <img class="default-img" src="img/${i.img[0].img_url}" alt="#">
                                        <img class="hover-img" src="img/${i.img[0].img_url}" alt="#">
                                        <span class="new">New</span>
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
                                                                <p>Copyright � 2020 <a href="http://www.wpthemesgrid.com" target="_blank">Wpthemesgrid</a>  -  All Rights Reserved.</p>
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