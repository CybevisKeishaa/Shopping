<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:dashboard>
    <!-- Order revenues by week -->
    <div class="col-md-6">
        <div class="panel">
            <div class="panel-heading bg-white border-none" style="padding:20px;">
                <div class="col-md-6 col-sm-6 col-sm-12 text-left">
                    <h4>Sale Statistics</h4>
                </div>
            </div>
            <div class="panel-body" style="padding-bottom:50px;">
                <div id="canvas-holder1">
                    <canvas class="line-chart" style="margin-top:30px;height:200px;"></canvas>
                </div>
            </div>
        </div>
    </div>
    <!-- Order Totals chart -->
    <div class="col-md-6">
        <div class="panel">
            <div class="panel-heading bg-white border-none" style="padding:20px;">
                <div class="col-md-6 col-sm-6 col-sm-12 text-left">
                    <h4>Order Status Totals</h4>
                </div>
            </div>
            <div class="panel-body" style="padding-bottom:50px;display: flex;flex-flow: column;width: 100%;">
                <div id="canvas-holder1" class="col-md-10" style="margin: auto">
                    <canvas class="doughnut-chart"></canvas>
                </div>
                <div class="col-md-10 " style="padding-top:20px;display: flex; justify-content: space-evenly; flex-wrap: wrap; margin: auto" >
                    <c:forEach var="st" items="${statusTotals}" >
                        <div class="col-md-4 col-sm-4 col-xs-6 text-center status-display">
                            <p><i class="fa fa-square" style="margin-right: 0.25em" data-status="${st.status}" ></i>${st.status}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading"><h3>Sales</h3></div>
            <div class="panel-body">
                <form action="sale" class="row" method="GET">
                    <div class="form-group col-md-2">
                        <label for="startdate">Start Date:</label>
                        <input type="date" id="startdate" value="${param.startdate}" class="form-control" name="startdate"/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="enddate">End Date:</label>
                        <input type="date" id="enddate" value="${param.enddate}" class="form-control" name="enddate"/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sortby">Sort By:</label>
                        <select id="sort" class="form-control" name="sort">
                            <option value="orderdate" ${param.sort == 'orderdate' ? 'selected':''}>Order Date</option>
                            <option value="customername" ${param.sort == 'customername' ? 'selected':''}>Customer Name</option>
                            <option value="totalcost" ${param.sort == 'totalcost' ? 'selected':''}>Total Cost</option>
                            <option value="status" ${param.sort == 'status' ? 'selected':''}>Status</option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for='desc' >Thứ tự</label>
                        <select id="desc" class="form-control" name="desc">
                            <option value="on" ${param.desc == 'on' ? 'selected':''}>Giảm Dần</option>
                            <option value="off" ${param.desc == 'off' ? 'selected':''}>Tăng Dần</option>
                        </select>
                    </div>
                    <div class="form-group align-items-center col-md-3" >
                        <label for="startdate">Search:</label>
                        <input type="text" id="custom-search" class="form-control " value="${param.search}" placeholder="Search..." name="search"/>
                    </div>
                    <div class="form-group col-md">
                        <label for="submit"> </label>
                        <input type="submit" value="Search" class="btn btn-primary " style="display: block"/>
                    </div>
                </form>
                <div class="responsive-table">
                    <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Order Id</th>
                                <th>Customer Name</th>
                                <th>Order Date</th>
                                <th>Total Cost</th>
                                <th>Status</th>
                                <th>Product Count</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.order_id}</td>
                                    <td>${order.customer.name_cus}</td>
                                    <td>${order.create_at}</td>
                                    <td>$${order.total_price}</td>
                                    <td>${order.status.status_name}</td>
                                    <td>${order.numberOfOtherProducts}</td>
                                    <td>
                                        <a href="./sale/orderDetail?orderId=${order.order_id}" class="btn btn-primary btn-sm text-bold">
                                            <b>View</b>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <div class="container">
<!--                        <div class="pagination-container d-flex justify-content-center">
                            <div class="pagination">
                                 Previous Button 
                                <c:if test="${currentPage > 1}">
                                    <a href="?page=${currentPage - 1}" class="prev">&lt;</a>
                                </c:if>

                                 Page Numbers 
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                            <a disabled>${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="?page=${i}">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                 Next Button 
                                <c:if test="${currentPage < totalPages}">
                                    <a href="?page=${currentPage + 1}" class="next">&gt;</a>
                                </c:if>
                            </div>
                        </div>-->
                        <div class="pagination-container dataTables_paginate paging_simple_numbers" id="datatables-example_paginate">
                            <ul class="pagination">
                                <c:choose >
                                    <c:when test="${currentPage > 1}">
                                        <li class="paginate_button previous" id="datatables-example_previous">
                                            <a href="?page=${currentPage - 1}" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="paginate_button previous disabled" id="datatables-example_previous">
                                            <a href="#" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <c:choose>
                                        <c:when test="${i == currentPage}">
                                            <li class="paginate_button active">
                                                <a href="#" aria-controls="datatables-example" data-dt-idx="${i}" tabindex="0">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="paginate_button ">
                                                <a href="?page=${i}" aria-controls="datatables-example" data-dt-idx="${i}" tabindex="0">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose >
                                    <c:when test="${currentPage < totalPages}">
                                        <li class="paginate_button next" id="datatables-example_previous">
                                            <a href="?page=${currentPage + 1}" aria-controls="datatables-example" data-dt-idx="${currentPage + 1}" tabindex="0">Next</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>

                                        <li class="paginate_button next disabled" id="datatables-example_next">
                                            <a href="#" aria-controls="datatables-example" data-dt-idx="3" tabindex="0">Next</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>        
        </div>        
    </div>
    <!-- start script --> 

    <script async="">
        var orderBoughtData = ${orderCount}.reverse();
        var statusTotals = ${statusTotals};

        document.addEventListener("DOMContentLoaded", function () {
            let container = document.querySelector('body');
            let scr = document.createElement("script")
            scr.setAttribute('src', "${pageContext.request.contextPath}/a/asset/js/sales.js")
            container.append(scr);
        });
    </script>
    <!-- end script --> 

</t:dashboard>