<%-- 
    Document   : leftmenu.tag
    Created on : Nov 3, 2024, 9:06:26 PM
    Author     : Thanh Binh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<c:set var="role" value="${sessionScope.employee.role.role_name}"/>
<div id="left-menu">
    <div class="sub-left-menu scroll">
        <ul class="nav nav-list">
            <li>
                <div class="left-bg"></div>
            </li>
            <c:if test="${role == 'Admin'}">
                <li class="ripple">
                    <a href="${pageContext.request.contextPath}/admin/homepage" class="tree-toggle nav-header">
                        <span class="fa-home fa"></span> Dashboard
                    </a>
                </li>
                <li class="ripple">
                    <a class="tree-toggle nav-header">
                        <span class="fa fa-table"></span> Tables
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                    </a>
                    <ul class="nav nav-list tree">
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/userlist">User List</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/employeelist">Employees List</a>
                        </li>
                        <!--                                    <li>
                                                                <a href="${pageContext.request.contextPath}/bloglist">Blogs List</a>
                                                            </li>-->
                    </ul>
                </li>
            </c:if>
            <c:if test="${role == 'Admin' || role == 'Marketer'}">
                <li>
                    <a href="${pageContext.request.contextPath}/market">MKT Dashboard</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/employeeProductList">Product List</a>
                </li>
            </c:if>
            <c:if test="${role == 'Admin' || role == 'SaleManager'}">
                <li>
                    <a href="${pageContext.request.contextPath}/saleManagement">Sale Management</a>
                </li>
            </c:if>
            <c:if test="${role == 'Admin' || role == 'Saler'}">
                <li>
                    <a href="${pageContext.request.contextPath}/sale">Sale Dashboard</a>
                </li>
            </c:if>

            <script>
                let pathname = location.pathname;
                document.querySelector(`a[href*='` + pathname + `'`)?.classList.add('active');
            </script>
        </ul>
    </div>
</div>
