<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="t" tagdir="/WEB-INF/tags/" %>
<html>
    <head>
        <title>Employee Import Goods</title>
        <style>
            form {
                background-color: #f2f2f2;
                padding: 20px;
                border-radius: 8px;
                max-width: 400px;
                margin: 0 auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            form input[type="text"],
            form input[type="number"],
            form select {
                width: 100%;
                padding: 10px;
                margin: 10px 0 20px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            form input[type="submit"] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            form input[type="submit"]:hover {
                background-color: #45a049;
            }

            label {
                font-weight: bold;
                margin-bottom: 10px;
                display: block;
            }

            select {
                padding: 10px;
                background-color: #f9f9f9;
            }

            form h2 {
                text-align: center;
                color: #333;
            }

            .error {
                color: red;
                font-size: 14px;
                display: none;
                margin-top: -15px;
                margin-bottom: 10px;
            }
        </style>
        <script>
            function validateForm() {
                const stock = document.getElementById("stock").value;
                const errorMessage = document.getElementById("errorMessage");

                if (stock < 0) {
                    errorMessage.style.display = "block";
                    return false;
                } else {
                    errorMessage.style.display = "none";
                    return true;
                }
            }
        </script>
    </head>
    <body>
       
        <t:dashboard>
            <h2>Import Product</h2>
            <form action="employeeImportGoods" method="post" onsubmit="return validateForm()">
                <input type="hidden" value="${requestScope.product_id}" name="product_id"/>
                <label for="name">Tên lô hàng:</label>
                <input type="text" id="name" name="name" placeholder="Enter product name"/>
                
                <label for="stock">Số lượng:</label>
                <input type="number" id="stock" name="stock" placeholder="Enter stock amount" min="0"/>
                <span id="errorMessage" class="error">Số lượng không thể là số âm!</span>
                <label for="stock">Gía:</label>
                <input type="number" name="i" placeholder="Enter price"/>
                <label for="cid">Dung tích:</label>
                <select id="cid" name="cid">
                    <c:forEach var="i" items="${requestScope.clist}">
                        <option value="${i.capacity_id}">${i.value}</option>
                    </c:forEach>
                </select>
                
                <input type="submit" value="Save"/>
                <a href="employeeProductList" class="btn btn-secondary">Quay về danh sách sản phẩm</a>
            </form>
                
        </t:dashboard>
    </body>
</html>
