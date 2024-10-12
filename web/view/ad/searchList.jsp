<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
          <![endif]-->

        <style>
            /* Custom styles to adjust the dropdown size */
            #search-type {
                width: auto; /* Allow Bootstrap to handle width automatically */
                margin-right: 5px; /* Space between dropdown and search input */
            }
            #custom-search {
                width: auto; /* Allow Bootstrap to handle width automatically */
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
                    <a href="index.html" class="navbar-brand"> 
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
                                <li><a href="employeelist">Employees List</a></li>
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
                            <h3 class="animated fadeInLeft">Users List</h3>
                            <p class="animated fadeInDown">
                                Table <span class="fa-angle-right fa"></span> Data Tables
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 top-20 padding-0">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-heading"><h3>Users List</h3></div>
                            <div class="panel-body">
                                <form action="search" method="GET">
                                    <div class="form-group d-flex align-items-center">
                                        <select id="search-type" class="form-control" name="op">
                                            <option value="name">Full Name</option>
                                            <option value="email">Email</option>
                                            <option value="mobile">Mobile</option>
                                        </select>
                                        <input type="text" id="custom-search" class="form-control" placeholder="Search..." name="search"/>
                                        <input type="submit" value="Search"/>
                                    </div>
                                </form>

                                <div class="responsive-table">
                                    <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">

                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Full Name</th>
                                                <th>Gender</th>
                                                <th>Email</th>
                                                <th>Mobile</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${requestScope.data}">
                                                <tr>
                                                    <td>${i.cus_id}</td>
                                                    <td>${i.name_cus}</td>
                                                    <c:if test="${i.gender == 'true'}">
                                                        <td>Nam</td>
                                                    </c:if>
                                                    <c:if test="${i.gender == 'false'}">
                                                        <td>Nu</td>
                                                    </c:if>


                                                    <td>${i.email}</td>
                                                    <td>${i.c_phone}</td>
                                                    <td>${i.role.role_name}</td>
                                                    <c:if test="${i.status == 'true'}">
                                                        <td>Kich hoat</td>
                                                    </c:if>
                                                    <c:if test="${i.status == 'false'}">
                                                        <td>Chua kich hoat</td>
                                                    </c:if>
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

            <!-- start: right menu -->
            <!-- end: right menu -->

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
        <!-- custom -->
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
