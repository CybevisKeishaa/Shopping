<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:dashboard>
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
                                <td> ${order.status.status_name}</td>
                                <td> ${order.numberOfOtherProducts}</td>
                                <td>
                                    <a href="./sale/order-details?order-id=${order.order_id}" class="btn btn-primary btn-sm">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                   
                    </tbody>
                </table>
            </div>

        </div>
<!--        <script>
            var series = [
                {
                    name: "Orders",
                    data: ${orderCount}.reverse(),
                },
            ]
            document.addEventListener("DOMContentLoaded", function () {
                let container = document.querySelector('body');
                let scr = document.createElement("script")
                scr.setAttribute('src', "${cPath}/assets/js/sales.js")
                container.prepend(scr);
            });
        </script>-->
    </t:dashboard>