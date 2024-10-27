<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="title" required="false" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="description" content="Miminium Admin Template v.1">
        <meta name="author" content="Isna Nur Azis">
        <meta name="keyword" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Miminium | ${title}</title>

        <!-- start: Css -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/bootstrap.min.css">

        <!-- plugins -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/simple-line-icons.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/animate.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/a/asset/css/plugins/fullcalendar.min.css"/>
        <link href="${pageContext.request.contextPath}/a/asset/css/style.css" rel="stylesheet">
        <!-- end: Css -->

        <link rel="shortcut icon" href="${pageContext.request.contextPath}/a/asset/img/logomi.png">
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <c:set var="role" value="${sessionScope.employee.role.role_name}"/>
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

                    <ul class="nav navbar-nav search-nav">
                        <li>
                            <div class="search">
                                <span class="fa fa-search icon-search" style="font-size:23px;"></span>
                                <div class="form-group form-animate-text">
                                    <input type="text" class="form-text" required>
                                    <span class="bar"></span>
                                    <label class="label-search">Type anywhere to <b>Search</b> </label>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right user-nav">
                        <li class="user-name"><span>${employee.name_emp}</span></li>
                        <li class="dropdown avatar-dropdown">
                            <img src="${pageContext.request.contextPath}/a/asset/img/avatar.jpg" class="img-circle avatar" alt="${employee.name_emp}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                            <ul class="dropdown-menu user-dropdown">
                                <li><a href="#"><span class="fa fa-user"></span> My Profile</a></li>
                                <li><a href="#"><span class="fa fa-calendar"></span> My Calendar</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="more">
                                    <ul>
                                        <li><a href=""><span class="fa fa-cogs"></span></a></li>
                                        <li><a href=""><span class="fa fa-lock"></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/logout"><span class="fa fa-power-off "></span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li ><a href="#" class="opener-right-menu"><span class="fa fa-coffee"></span></a></li>
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
            <!-- end: Left Menu -->

            <!-- start: content -->
            <div id="content">
                <div class="col-md-12" style="padding:20px;">

                    <jsp:doBody/>
                </div>
            </div>
            <!-- end: content -->

            <!-- start: right menu -->
            <div id="right-menu">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#right-menu-user">
                            <span class="fa fa-comment-o fa-2x"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#right-menu-notif">
                            <span class="fa fa-bell-o fa-2x"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#right-menu-config">
                            <span class="fa fa-cog fa-2x"></span>
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="right-menu-user" class="tab-pane fade in active">
                        <div class="search col-md-12">
                            <input type="text" placeholder="search.."/>
                        </div>
                        <div class="user col-md-12">
                            <ul class="nav nav-list">
                                <!-- User items here -->
                            </ul>
                        </div>
                    </div>

                    <div id="right-menu-notif" class="tab-pane fade">
                        <!-- Notification items here -->
                    </div>

                    <div id="right-menu-config" class="tab-pane fade">
                        <!-- Configuration items here -->
                    </div>
                </div>
            </div>  
            <!-- end: right menu -->

        </div>

        <!-- start: Mobile -->
        <div id="mimin-mobile" class="reverse">
            <div class="mimin-mobile-menu-list">
                <div class="col-md-12 sub-mimin-mobile-menu-list animated fadeInLeft">
                    <ul class="nav nav-list">
                        <!-- Mobile menu items here -->
                    </ul>
                </div>
            </div>       
        </div>
        <button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
            <span class="fa fa-bars"></span>
        </button>
        <!-- end: Mobile -->

        <!-- start: Javascript -->
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/jquery.ui.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/pagination.js"></script>

        <!-- plugins -->
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/fullcalendar.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.nicescroll.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.vmap.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/maps/jquery.vmap.world.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.vmap.sampledata.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/chart.min.js"></script>

        <script src="${pageContext.request.contextPath}/a/asset/js/main.js"></script>

    </body>
</html>
