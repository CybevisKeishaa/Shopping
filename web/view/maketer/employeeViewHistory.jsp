<%-- 
    Document   : employeeViewHistory
    Created on : Nov 2, 2024, 12:43:10 AM
    Author     : DINH SON
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1px">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Product</th>
                    <th>TotalPrice</th>
                    <th>Stock</th>
                    <th>Date</th>

                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="i" items="${requestScope.data}">
                    <tr>
                        <td>${i.name}</td>
                        <td>
                    <c:forEach var="j" items="${i.products}">
                        ${j.name}
                    </c:forEach>
                        </td>
                        <td>${i.getTotalPrice()}</td>
                        <td>${i.stock}</td>
                        <td>${i.date}</td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
