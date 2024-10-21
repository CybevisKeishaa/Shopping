<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                margin-left: 0;
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
                width: 200px; /* ?i?u ch?nh ?? r?ng c?a thanh tìm ki?m */
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
            <div id="left-menu">
                <div class="sub-left-menu scroll">
                    <ul class="nav nav-list">
                        <li><div class="left-bg"></div></li>
                        <li class="active ripple">
                            <a href="homepage" class="tree-toggle nav-header"><span class="fa-home fa"></span> Dashboard 
                            </a>
                        </li>
                        <li class="ripple"><a class="tree-toggle nav-header"><span class="fa fa-table"></span> Tables  <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                            <ul class="nav nav-list tree">
                                <li><a href="userlist">User List</a></li>
                                <li><a href="employeelist">Products List</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
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
                                <!-- Nút Create và Thanh tìm ki?m n?m trên cùng, ngang hàng nhau -->
                                <div class="search-container">
                                    <a href="employeeAddProduct" class="btn btn-success btn-create">
                                        <b>Create</b>
                                    </a>
                                    <form action="employeeProductList" method="GET">
                                        <input type="text" id="custom-search" class="form-control" placeholder="Search by name..." name="search"/>
                                        <input type="submit" value="Search" class="btn btn-primary ml-2"/>
                                    </form>
                                </div>

                                <div class="responsive-table">
                                    <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Image</th>
                                                <th>Full Name</th>
                                                <th>Price</th>
                                                <th>Stock</th>
                                                <th>Discount</th>
                                                <th>Status</th>
                                                <th>Actions</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${requestScope.data}">
                                                <tr>
                                                    <td>${i.product_id}</td>
                                                    <td>
                                                        <c:forEach var="j" items="${i.img}">
                                                            <img src="${pageContext.request.contextPath}/img/${j.name}" alt="${j.name}" width="100" height="100">
                                                        </c:forEach>
                                                    </td>
                                                    <td>${i.name}</td>
                                                    <td>${i.price}</td>
                                                    <td>${i.stock}</td>
                                                    <td>${i.discount.amount}</td>
                                                    <c:if test="${i.status == 'true'}">
                                                        <td>Kich hoat</td>
                                                    </c:if>
                                                    <c:if test="${i.status == 'false'}">
                                                        <td>Chua kich hoat</td>
                                                    </c:if>
                                                    <td>
                                                        <a href="employeeUpdateProduct?product_id=${i.product_id}" class="btn btn-primary btn-sm">Update</a>
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

                    "searching": false, // T?t tìm ki?m m?c ??nh
                    "paging": true, // B?t phân trang
                    "pageLength": 6, // S? hàng trên m?i trang
                    "lengthChange": false   // T?t "Show ... entries"
                });
                // Tìm ki?m theo Full Name, Email, ho?c Mobile
                $('#custom-search').on('keyup', function () {
                    var searchTerm = this.value.toLowerCase();
                    var searchType = $('#search-type').val();
                    table.rows().every(function (rowIdx, tableLoop, rowLoop) {
                        var data = this.data();
                        var fullName = data[1].toLowerCase(); // Full Name
                        var email = data[3].toLowerCase(); // Email
                        var mobile = data[4].toLowerCase(); // Mobile

                        // Ki?m tra n?u searchTerm t?n t?i trong lo?i tìm ki?m ?ã ch?n
                        var match = false;
                        if (searchType === 'name' && fullName.includes(searchTerm)) {
                            match = true;
                        } else if (searchType === 'email' && email.includes(searchTerm)) {
                            match = true;
                        } else if (searchType === 'mobile' && mobile.includes(searchTerm)) {
                            match = true;
                        }

                        // Hi?n ho?c ?n hàng d?a trên k?t qu? tìm ki?m
                        if (match) {
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
