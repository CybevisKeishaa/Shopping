<%-- 
    Document   : demo
    Created on : Sep 21, 2024, 6:17:18 PM
    Author     : KEISHA
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
</head>
<body>

    <!-- Main Container -->
    <div class="container mt-5">
        <h1 class="text-center mb-4">My Orders</h1>

        <!-- Order Table -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Ordered Date</th>
                    <th scope="col">Product</th>
                    <th scope="col">Total Cost</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="order-detail.html?orderId=123">123456789</a></td>
                    <td>29/09/2024</td>
                    <td>iPhone 14 Pro + 2 more items</td>
                    <td>$1500</td>
                    <td><span class="badge bg-success"><i class="fa fa-check"></i> Delivered</span></td>
                </tr>
                <tr>
                    <td><a href="order-detail.html?orderId=124">124456789</a></td>
                    <td>28/09/2024</td>
                    <td>MacBook Pro</td>
                    <td>$2000</td>
                    <td><span class="badge bg-warning"><i class="fa fa-clock-o"></i> Pending</span></td>
                </tr>
                <!-- More orders can be added here -->
            </tbody>
        </table>

        <!-- Pagination -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Scroll to Top -->
    <a href="#" id="scrollUp" style="position: fixed; bottom: 10px; right: 10px;">
        <i class="fa fa-arrow-up"></i>
    </a>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scrollup.js"></script>
</body>
</html>
