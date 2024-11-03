<%-- 
    Document   : employeeImportGoods
    Created on : Nov 1, 2024, 10:48:32 PM
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
        <form action="employeeImportGoods" method="post">
            <input type="hidden" value="${requestScope.product_id}" name="product_id"/>
            Name:<input type="text" name="name"/>
            Stock:<input type="number" name="stock"/>
            <select name="cid">
                <c:forEach var="i" items="${requestScope.clist}">
                    <option value="${i.capacity_id}">${i.value}</option>
                </c:forEach>
            </select>
            <input type="submit" value="save"/>
        </form>
    </body>
</html>
