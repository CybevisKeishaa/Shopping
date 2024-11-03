<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<t:mainview>
    <style>
        .flex-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* C?n gi?a các ph?n t? */
            margin: 0 auto; /* C?n gi?a container */
            max-width: 1200px; /* ??t gi?i h?n chi?u r?ng cho container ?? n?i dung không tr?i r?ng toàn b? màn hình */
            gap: 20px; /* Kho?ng cách gi?a các ph?n t? */
        }

        .flex-item {
            flex: 0 1 calc(48% - 10px); /* M?i ph?n t? chi?m kho?ng 48% chi?u r?ng, tr? kho?ng cách gi?a chúng */
            box-sizing: border-box; /* ??m b?o padding và margin không ?nh h??ng ??n kích th??c */
            margin-bottom: 20px; /* Kho?ng cách gi?a các hàng */
        }

        @media (max-width: 768px) {
            .flex-item {
                flex: 0 1 100%; /* Trên màn hình nh? h?n, m?i ph?n t? chi?m 100% chi?u r?ng */
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

    </style>    
    <div class="flex-container">
        <c:forEach items="${requestScope.data}" var="i">
            <div class="flex-item">
                <section class="blog-single section">
                    <div class="blog-single-main">
                        <div class="image">
                            <a href="blogDetail?id=${i.blog_id}"> 
                                <img src="${pageContext.request.contextPath}/img/${i.image[0].img_url}" alt="#" />
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
                    <a href="blogSearch?page=${currentPage - 1}&search=${requestScope.search}" class="prev">&lt;</a>
                </c:if>

                <!-- Page Numbers -->
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <span class="current-page">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="blogSearch?page=${i}&${requestScope.search}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- Next Button -->
                <c:if test="${currentPage < totalPages}">
                    <a href="blogSearch?page=${currentPage + 1}&${requestScope.search}" class="next">&gt;</a>
                </c:if>
            </div>
        </div>
    </div>




</t:mainview>