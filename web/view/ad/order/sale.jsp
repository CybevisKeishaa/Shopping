<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:dashboard>
    <div class="col-md-6">
        <div class="panel">
            <div class="panel-heading bg-white border-none" style="padding:20px;">
                <div class="col-md-6 col-sm-6 col-sm-12 text-left">
                    <h4>Sale Statistics</h4>
                </div>
                <div class="col-md-6 col-sm-6 col-sm-12">
                    <div class="mini-onoffswitch pull-right onoffswitch-danger" style="margin-top:10px;">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch1" checked>
                        <label class="onoffswitch-label" for="myonoffswitch1"></label>
                    </div>
                </div>
            </div>
            <div class="panel-body" style="padding-bottom:50px;">
                <div id="canvas-holder1">
                    <canvas class="line-chart" style="margin-top:30px;height:200px;"></canvas>
                </div>
                <!--                <div class="col-md-12" style="padding-top:20px;">
                                    <div class="col-md-4 col-sm-4 col-xs-6 text-center">
                                        <h2 style="line-height:.4;">$100.21</h2>
                                        <small>Total Laba</small>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-6 text-center">
                                        <h2 style="line-height:.4;">2000</h2>
                                        <small>Total Barang</small>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-12 text-center">
                                        <h2 style="line-height:.4;">$291.1</h2>
                                        <small>Total Pengeluaran</small>
                                    </div>
                                </div>-->
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading"><h3>Sales</h3></div>
            <div class="panel-body">
                <form action="sale" method="GET">
                    <div class="form-group d-flex align-items-center">
                        <input type="text" id="custom-search" class="form-control" placeholder="Search..." name="search"/>
                        <input type="submit" value="Search"/>
                    </div>
                </form>
                <div class="responsive-table">
                    <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Order Id</th>
                                <th>Product</th>
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
                                    <td>${order.firstProductName}  </td>
                                    <td>${order.create_at}</td>
                                    <td>$${order.total_price}</td>
                                    <td>${order.status.status_name}</td>
                                    <td>${order.numberOfOtherProducts}</td>
                                    <td>
                                        <a href="./sale/orderdetail?order-id=${order.order_id}" class="btn btn-primary btn-sm text-bold">
                                            <b>View</b>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <div class="container">
                        <div class="pagination-container d-flex justify-content-center">
                            <div class="pagination">
                                <!-- Previous Button -->
                                <c:if test="${currentPage > 1}">
                                    <a href="?page=${currentPage - 1}" class="prev">&lt;</a>
                                </c:if>

                                <!-- Page Numbers -->
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
                                <!-- Next Button -->
                                <c:if test="${currentPage < totalPages}">
                                    <a href="?page=${currentPage + 1}" class="next">&gt;</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>        
        </div>        
    </div>
    <script src="${pageContext.request.contextPath}/a/asset/js/pagination.js"/>
    <script>

            var orderBoughtData = ${orderCount}.reverse();
        document.addEventListener("DOMContentLoaded", function () {
            let container = document.querySelector('body');
            let scr = document.createElement("script")
            scr.setAttribute('src', "${pageContext.request.contextPath}/a/asset/js/sales.js")
            container.append(scr);
        });
    </script>
</t:dashboard>