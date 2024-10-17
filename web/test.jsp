<%-- 
    Document   : test
    Created on : Oct 6, 2024, 1:31:50 PM
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
    <h1>Map Key-Value Pairs</h1>
<ul>
    <c:forEach var="entry" items="${requestScope.m.entrySet()}">
        <li>Key: ${entry.key} Value: ${entry.value}</li>
    </c:forEach>
</ul>
        <h1>${requestScope.sizeAddress}</h1>
        <h1>${requestScope.m.size()}</h1>
    </body>
</html>
