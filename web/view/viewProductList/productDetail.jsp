<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="t" %>

<t:mainview>
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


        .blog-button {
            padding: 5px 10px;
            border: 1px solid #333;
            background-color: white;
            cursor: pointer;
        }

        .product-container {
            gap: 20px;
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
        }

        .capacity-box:hover {
            background-color: #e0e0e0;
            border-color: #bbb;
        }
        #main-image , div.img-container > img{
            width: 100%;
            aspect-ratio: 1;
            object-fit: cover;
        }
        label[for]:has( + input:checked){
            background-color:#F7941D;
            color:#fff;
        }


    </style>

    <!-- Start Product Area -->
    <div class="product-area section">
        <div class="container">
            <!-- Header Section -->


            <!-- Product Section -->
            <div class="row">
                <!-- Image Section -->
                <div class="image-section col-lg-4">
                    <img id="main-image" src="${pageContext.request.contextPath}/img/${data.img[0].img_url}" alt="Product Image"  />
                    <c:catch var="e">
                        <c:if test="${data.img != null }" >
                            <div class="img-container">
                                <c:forEach items="${data.img}" var="img">
                                    <div class="col-2 embed-responsive embed-responsive-1by1">
                                        <img src="${pageContext.request.contextPath}/img/${img.img_url}" class="border-primary" alt="Product Image" />
                                    </div>
                                </c:forEach> 
                            </div>
                            <script>
                                let images = document.querySelectorAll(".image-section .img-container img");
                                let mainImage = document.getElementById("main-image");
                                let currentImage = null;
                                images.forEach(image => image.addEventListener("click", (e) => {
                                        mainImage.src = e.target.src
                                        if (currentImage) {
                                            currentImage.classList.remove("border")
                                        }
                                        currentImage = e.target;
                                        currentImage.classList.add("border");
                                    }))
                            </script> 
                        </c:if>
                    </c:catch>
                    ${e}
                </div>

                <!-- Product Info Section -->
                <div class="product-info col-lg-8">
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
                    <div>Capacity: 
                        <c:forEach var="i" varStatus="v" items="${requestScope.data.getCapacity()}">
                            ${i}
                            <label for="capacity${v.index}" class="capacity-box">
                                ${i.getValue()} ml
                            </label>
                            <input type="radio" class="d-none" name="capacity" id="capacity${v.index}"/>
                        </c:forEach>
                    </div>



                    <div class="quantity-selector">
                        <label for="quantity">Quantity</label>
                        <div class="quantity-controls">
                            <input type="number" id="quantity" value="1" min="1" max="10"/>
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

</t:mainview>