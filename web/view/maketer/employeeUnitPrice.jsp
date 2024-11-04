<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="t" tagdir="/WEB-INF/tags/" %>


<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', Arial, sans-serif;
                background-color: #f9fafb;
                padding: 30px;
                color: #333;
                line-height: 1.6;
            }

            .container {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 700px;
                margin: 0 auto;
            }

            .product-name {
                font-size: 28px;
                font-weight: 600;
                color: #222;
                text-align: center;
                margin-bottom: 30px;
            }

            .product-name img {
                display: block;
                margin: 20px auto;
                max-width: 100%;
                width: 300px;
                height: auto;
                border-radius: 8px;
                border: 1px solid #ddd;
            }

            label {
                display: block;
                font-weight: 400;
                margin-bottom: 5px;
                font-size: 16px;
                color: #444;
            }

            input[type="number"] {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
                margin-bottom: 20px;
                box-sizing: border-box;
            }

            button {
                background-color: #007bff;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                font-weight: 600;
                transition: background-color 0.3s;
                width: 100%;
            }

            button:hover {
                background-color: #0056b3;
            }

            h1 {
                font-size: 24px;
                font-weight: 600;
                color: #222;
                margin-bottom: 20px;
                text-align: center;
            }

            h2 {
                font-size: 20px;
                font-weight: 400;
                color: #333;
                margin-bottom: 15px;
            }

            .capacity-label {
                margin-bottom: 10px;
                font-weight: 400;
            }

            .capacity-input {
                margin-bottom: 25px;
            }

            .capacity-input input {
                font-size: 16px;
            }

            form {
                margin-top: 20px;
            }

            /* Add responsive design */
            @media (max-width: 768px) {
                body {
                    padding: 15px;
                }
                .container {
                    padding: 20px;
                }
                button {
                    padding: 10px;
                    font-size: 16px;
                }
            }
        </style>
    </head>
    <t:dashboard>
        <body>
            <div class="container">
                <div class="product-name">
                    ${p.name}
                </div>
                <c:forEach var="j" items="${p.img}">
                    <div class="product-name">
                        <img src="${pageContext.request.contextPath}/img/${j.img_url}" alt="Product Image" style="width: 300px; height: auto;">
                    </div>
                </c:forEach>
                <form action="employeeUnitPrice" method="post">
                    <input type="hidden" name="p" value="${requestScope.p.getProduct_id()}">
                    <h1>Bảng nhập giá bán</h1>
                        
                    <c:forEach var="c" items="${requestScope.l}">
                        <label>Dung tích: ${c.value}ml</label>
                        <input type="hidden" name="capacity_id" value="${c.capacity_id}">
                        <input type="number" name="price_${c.capacity_id}" placeholder="Nhập giá bán của dung tích ${c.value}ml">
                        <br>
                    </c:forEach>
                    <button type="submit">Submit</button>
                    <a href="employeeProductList" class="btn btn-secondary">Quay về danh sách sản phẩm</a>
                </form>

            </div>
        </body>
    </t:dashboard>
</html>
