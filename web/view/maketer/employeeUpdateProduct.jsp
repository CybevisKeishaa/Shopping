<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">

        <meta name="description" content="Miminium Admin Template v.1">
        <meta name="author" content="Isna Nur Azis">
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
            .panel-body form {
                margin-top: 20px;
            }

            .form-group {
                margin-bottom: 10px; /* Spacing between fields */
                display: flex; /* Flexbox for alignment */
                flex-direction: column; /* Stack elements vertically */
            }

            .form-group label {
                font-weight: bold; /* Bold labels */
                margin-bottom: 3px; /* Space between label and input */
            }

            .panel-body form input[type="text"],
            .panel-body form select,
            .panel-body form input[type="file"] {
                width: 230px; /* Set fixed width for shorter inputs */
                padding: 5px; /* Smaller padding */
                border: 1px solid #ccc;
                border-radius: 4px;
                transition: border-color 0.3s; /* Smooth transition for focus */
                font-size: 14px; /* Standard font size */
            }

            .panel-body form input[type="text"]:focus,
            .panel-body form select:focus {
                border-color: #5cb85c; /* Change border color on focus */
                outline: none; /* Remove default outline */
            }

            .panel-body form input[type="submit"] {
                background-color: #5cb85c;
                color: white;
                border: none;
                padding: 8px 12px; /* Smaller padding for the button */
                border-radius: 4px;
                cursor: pointer;
                margin-top: 10px; /* Space above the submit button */
                transition: background-color 0.3s; /* Smooth transition for hover */
                width: 100%; /* Full width for button */
                max-width: 150px; /* Set max width for button */
            }

            .panel-body form input[type="submit"]:hover {
                background-color: #4cae4c;
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
                                        <li><a href=""><span class="fa fa-power-off"></span></a></li>
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

            <!-- start: Left Menu -->
            <div id="left-menu">
                <div class="sub-left-menu scroll">
                    <ul class="nav nav-list">
                        <li><div class="left-bg"></div></li>
                        <li class="active ripple">
                            <a href="homepage" class="tree-toggle nav-header"><span class="fa-home fa"></span> HomePage 
                            </a>
                        </li>
                        <li class="ripple">
                            <a class="tree-toggle nav-header"><span class="fa fa-table"></span> Tables <span class="fa-angle-right fa right-arrow text-right"></span></a>
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
                            <p class="animated fadeInDown">Table <span class="fa-angle-right fa"></span> Data Tables</p>
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
                                <form action="employeeUpdateProduct" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="eid" value="${requestScope.eid}" />
                                    <input type="hidden" name="pid" value="${requestScope.pid}" />

                                    <div class="form-group">
                                        <label for="name">Name:</label>
                                        <input type="text" name="name" id="name" value="${requestScope.p.name}" required />
                                    </div>

                                    <div class="form-group">
                                        <label for="price">Price:</label>
                                        <input type="text" name="price" id="price" value="${requestScope.p.price}" required />
                                    </div>

                                    <div class="form-group">
                                        <label for="stock">Stock:</label>
                                        <input type="text" name="stock" id="stock" value="${requestScope.p.stock}" required />
                                    </div>

                                    <div class="form-group">
                                        <label for="dis">Discount:</label>
                                        <select name="dis" id="dis" required>
                                            <option value="" disabled selected>-- Select discount --</option>
                                            <c:forEach var="i" items="${requestScope.datad}">
                                                <option value="${i.discount_id}" 
                                                        <c:if test="${i.discount_id == requestScope.p.discount.discount_id}">
                                                            selected
                                                        </c:if>
                                                        >${i.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="brand">Brand:</label>
                                        <select name="brand" id="brand" required>
                                            <c:forEach var="i" items="${requestScope.datab}">
                                                <option value="${i.brand_id}" 
                                                        ${i.brand_id == requestScope.p.brand.brand_id ? 'selected' : ''}>
                                                    ${i.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="status">Status:</label>
                                        <select name="status" required>
                                            <option value="true" ${requestScope.p.status == 'true' ? 'selected' : ''}>Kích Hoạt</option>
                                            <option value="false" ${requestScope.p.status == 'false' ? 'selected' : ''}>Chưa kích Hoạt</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <c:forEach var="j" items="${requestScope.p.img}" varStatus="status">
                                            <img src="${pageContext.request.contextPath}/img/${j.name}" alt="${j.name}" width="100" height="100">
                                            <label for="file${status.index}">Choose Image:</label>
                                            <input type="hidden" name="img_id_${status.index}" value="${j.img_id}" />
                                            <input type="file" name="file_${status.index}" id="file${status.index}" accept="image/*" />
                                        </c:forEach>
                                        <input type="hidden" name="size" value="${requestScope.p.img.size()}" />
                                    </div>

                                    <input type="submit" value="Save" />
                                </form>

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
        <!-- end: Javascript -->

    </body>
</html>
