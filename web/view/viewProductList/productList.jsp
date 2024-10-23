<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>
<t:mainview>

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
                                        <c:catch var="e">
                                            <c:forEach var="i" items="${requestScope.data}">
                                                <!-- Set each product to take up 4 columns on large screens -->
                                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="product/detail?product_id=${i.product_id}">
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
                                        </c:catch>
                                                ${e}
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


</t:mainview>