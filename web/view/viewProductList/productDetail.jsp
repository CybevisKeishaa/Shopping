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
        label[for]:has( + input : checked){
            background-color:#F7941D;
            color:#fff;

        }
        input[type^=radio] {
            opacity: 0;
            left: 0;
            bottom:0;
            z-index: -9;
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
                        <c:if test="${data.img != null && fn:length(data.img) gt 1 }" >
                            <div class="img-container">
                                <c:forEach items="${data.img}" var="img" varStatus="i">
                                    <div class="col-2 embed-responsive embed-responsive-1by1">
                                        <img src="${pageContext.request.contextPath}/img/${img.img_url}" class="${i.index == 0 ? "border" : "" } border-primary" alt="Product Image" />
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
                    <form action="${pageContext.request.contextPath}/cart/item/add" id="add-to-bag">
                        <input type="hidden" name="pid" value="${data.product_id}"/>
                        <input type="hidden" name="cartID" value="${customer.cart.cart_id}"/>
                        <input type="hidden" name="price" value="${requestScope.data.price}">
                        <h1>${requestScope.data.name}</h1>
                        <p>SALE OFF: <strong>$${requestScope.data.getDiscount().getAmount()}</strong></p>
                        <p>PRICE: <strong id="product-price">$${requestScope.data.price}</strong></p>
                        <p>Release year: ${requestScope.data.date}</p>
                        <c:if test="${requestScope.data.status == true}">
                            <p>Status: In stock</p>
                        </c:if>
                        <c:if test="${requestScope.data.status == false}">
                            <p>Status: Out of stock</p>
                        </c:if>
                        <p>Brand: ${requestScope.data.getBrand().getName()}</p>
                        <div>Capacity: 
                            <span class="position-relative">
                                <c:forEach var="i" varStatus="v" items="${requestScope.data.getCapacity()}">
                                    <label for="capacity${v.index}" class="capacity-box" tabindex="0">
                                        ${i.getValue()} ml
                                    </label>
                                    <input type="radio" class="position-absolute" 
                                           data-max="${i.stock}" data-unit-price="${i.unit_price}"
                                           name="capacityId" value="${i.capacity_id}" required="" id="capacity${v.index}"/>
                                </c:forEach>
                            </span>                        
                        </div>

                        <div class="quantity-selector">
                            <label for="quantity">Quantity</label>
                            <div class="quantity-controls">
                                <input type="number" name="quantity" value="1" min="1" max="100" required=""/>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="button-container">
                            <button class="add-to-bag" name="action" value="add-to-bag">ADD TO BAG</button>
                            <button class="buy-now" name="action" value="buy-now">BUY NOW</button>
                        </div>
                    </form>
                </div>

            </div>
            <!-- Other Products Section -->
            <div class="other-products">
                <h3>Other Products:</h3>
                <div class="other-products-list">
                    <c:forEach var="i" items="${requestScope.list}">
                        <a href="?product_id=${i.product_id}" class="other-product-item">
                            <img src="${pageContext.request.contextPath}/img/${i.img[0].img_url}" alt="Other Product 1" />
                            <p>${i.price}</p>
                        </a>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
    <script>
        let quantityInput = document.querySelector("[name^='quantity']");
        let radios = document.querySelectorAll("[name^='capacity']");
        let priceElem = document.getElementById("product-price");
        function changeMaxQuantity(e) {
            quantityInput.max = e.target.dataset.max;
            priceElem.textContent = '$' + e.target.dataset.unitPrice;
        }
        radios.forEach(item => item.addEventListener('change', changeMaxQuantity))
    </script>
</t:mainview>