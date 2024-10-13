<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:dashboard>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    Task: Show the trend of success/total orders, and the revenues trends by day for the last 7 days for all or a specific sale person (the start date, end date, sale, order status can be adjustable)
                    <h5 class="card-title">Sales</h5>
                    <div class="table-responsive">
                        <table class="table text-nowrap align-middle mb-0">
                            <thead>
                                <tr class="border-2 border-bottom border-primary border-0"> 
                                    <th scope="col" class="ps-0">Order Id</th>
                                    <th scope="col" class="">Product</th>
                                    <th scope="col">Order Date</th>
                                    <th scope="col" class="text-center">Total Cost</th>
                                    <th scope="col" class="text-center">Status</th>
                                    <th scope="col" class="text-center">Product Count</th>
                                    <th scope="col" class="text-end">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="table-group-divider">

                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <!-- Order ID -->
                                        <th scope="row" class="ps-0 fw-medium">
                                            ${order.order_id}                                        

                                        </th>
                                        <th scope="row" class="">
                                            ${order.firstProductName}                                        
                                        </th>
                                        <!-- Order Date -->
                                        <td>
                                            <span class="text-dark d-block">${order.create_at}</span>
                                        </td>

                                        <!-- Total Cost -->
                                        <td class="text-center fw-medium">
                                            $${order.total_price}
                                        </td>

                                        <!-- Status -->
                                        <td class="text-center fw-medium">
                                            ${order.status.status_name}
                                        </td>

                                        <!-- Product Count -->
                                        <td class="text-center fw-medium">
                                            ${order.numberOfOtherProducts}
                                        </td>

                                        <!-- Actions -->
                                        <td class="text-end">
                                            <a href="./sale/orderDetails?orderId=${order.order_id}" 
                                               class="btn btn-sm btn-primary">View</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:dashboard>