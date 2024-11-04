<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Miminium Admin Template v.1">
        <meta name="author" content="Isna Nur Azis">
        <meta name="keyword" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Miminium</title>

        <!-- start: Css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/bootstrap.min.css">
        <!-- plugins -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/datatables.bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/animate.min.css"/>
        <link href="${pageContext.request.contextPath}/a/asset/css/style.css" rel="stylesheet">
        <!-- end: Css -->

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/a/asset/img/logomi.png">

        <style>
            .ml-2 {
                margin-left: 10px;
            }

            .btn-create {
                font-size: 16px;
                padding: 8px 15px;
            }

            .search-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .search-container form {
                display: flex;
                justify-content: flex-end;
            }

            .search-container input[type="text"] {
                width: 200px; /* Điều chỉnh độ rộng của thanh tìm kiếm */
            }

            /* Style cho phần Filter */
            .filter-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .filter-form {
                display: flex;
                align-items: center;
            }

            .filter-form ul {
                list-style-type: none;
                padding: 0;
                margin: 0;
                display: flex;
            }

            .filter-form li {
                margin-right: 20px;
            }

            .dropdown-menu {
                max-height: 200px;
                overflow-y: auto;
            }
            .action-buttons {
                white-space: nowrap; /* Giữ các nút trên cùng một dòng */
            }

            .action-buttons a {
                display: inline-block;
                margin-right: 5px;
                vertical-align: middle; /* Giữ nút ngang hàng */
            }
        </style>
    </head>

    <body id="mimin" class="dashboard">
        <!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
            <div class="col-md-12 nav-wrapper">
                <div class="navbar-header" style="width:100%;">
                    <div class="opener-left-menu is-open">
                        <span class="top"></span>
                        <span class="middle"></span>
                        <span class="bottom"></span>
                    </div>
                    <a href="employeeAddProduct" class="navbar-brand"> 
                        <b>MIMIN</b>
                    </a>
                    <ul class="nav navbar-nav navbar-right user-nav">
                        <li class="user-name"><span>Akihiko Avaron</span></li>
                        <li class="dropdown avatar-dropdown">
                            <img src="${pageContext.request.contextPath}/a/asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                            <ul class="dropdown-menu user-dropdown">
                                <li><a href="#"><span class="fa fa-user"></span> My Profile</a></li>
                                <li><a href="#"><span class="fa fa-calendar"></span> My Calendar</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="more">
                                    <ul>
                                        <li><a href=""><span class="fa fa-cogs"></span></a></li>
                                        <li><a href=""><span class="fa fa-lock"></span></a></li>
                                        <li><a href=""><span class="fa fa-power-off "></span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#" class="opener-right-menu"><span class="fa fa-coffee"></span></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end: Header -->

        <div class="container-fluid mimin-wrapper">

            <!-- start:Left Menu -->
            <t:leftmenu></t:leftmenu>
            <!-- end: Left Menu -->

            <!-- start: Content -->
            <div id="content">
                <div class="panel box-shadow-none content-header">
                    <div class="panel-body">
                        <div class="col-md-12">
                            <h3 class="animated fadeInLeft">Product List</h3>
                            <p class="animated fadeInDown">
                                Table <span class="fa-angle-right fa"></span> Data Tables
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 top-20 padding-0">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3>Product List</h3>
                            </div>
                            <div class="panel-body">

                                <!-- Phần điều khiển: Create, Filter, và Search trên cùng một hàng -->
                                
                                <!-- Bảng sản phẩm -->
                                <div class="responsive-table">
                                            <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Product</th>
                                                        <th>PriceImport</th>
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
                                                                                                                <td>${i.getImportPrice()}</td>

                                                        <td>${i.getTotalPrice()}</td>
                                                        <td>${i.stock}</td>
                                                        <td>${i.date}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>


                                        </table>
                                    <a href="employeeProductList" class="btn btn-secondary">Quay về danh sách sản phẩm</a>
                                    </div>

                            </div>
                        </div>
                    </div>  
                </div>
            </div>
            <!-- end: content -->

        </div>

        <!-- start: Mobile -->
        <button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
            <span class="fa fa-bars"></span>
        </button>
        <!-- end: Mobile -->

        <!-- start: Javascript -->
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/bootstrap.min.js"></script>
        <!-- plugins -->
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.datatables.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/datatables.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.nicescroll.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/main.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#datatables-example').DataTable({

                    "searching": false, // Tắt tìm kiếm mặc định
                    "paging": true, // Bật phân trang
                    "pageLength": 6, // Số hàng trên mỗi trang
                    "lengthChange": false   // Tắt "Show ... entries"
                });
                // Tìm kiếm theo Full Name
                $('#custom-search').on('keyup', function () {
                    var searchTerm = this.value.toLowerCase();
                    table.rows().every(function (rowIdx, tableLoop, rowLoop) {
                        var data = this.data();
                        var fullName = data[1].toLowerCase(); // Full Name
                        if (fullName.includes(searchTerm)) {
                            this.show();
                        } else {
                            this.hide();
                        }
                    });
                    table.draw();
                });
            });
        </script>
        <!-- end: Javascript -->
    </body>
</html>
