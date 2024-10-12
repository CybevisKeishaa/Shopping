<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
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
            body {
                background: #f8f9fa;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #333;
            }

            /* Styling the profile section */
            .container {
                max-width: 1200px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            }

            .profile-header {
                text-align: center;
                margin-bottom: 30px;
            }

            .profile-header img {
                border-radius: 50%;
                width: 150px;
                height: 150px;
                object-fit: cover;
                margin-bottom: 10px;
            }

            .profile-header h4 {
                font-size: 22px;
                font-weight: bold;
                color: #682773;
            }

            .profile-header p {
                color: #999;
                font-size: 16px;
            }

            .form-control {
                border-radius: 8px;
                border: 1px solid #ddd;
                box-shadow: none;
                transition: border-color 0.3s ease;
            }

            .form-control:focus {
                border-color: #BA68C8;
                box-shadow: none;
            }

            .profile-button {
                background: #682773;
                border: none;
                padding: 10px 20px;
                color: white;
                border-radius: 30px;
                transition: background 0.3s ease;
            }

            .profile-button:hover {
                background: #52135b;
            }

            .labels {
                font-size: 13px;
                color: #682773;
                margin-bottom: 5px;
            }

            .back:hover {
                color: #682773;
                cursor: pointer;
            }

            .add-experience {
                background: #682773;
                color: white;
                padding: 5px 10px;
                border-radius: 30px;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .add-experience:hover {
                background: #52135b;
            }

            /* Styling the layout */
            .rounded {
                border-radius: 8px;
            }

            .border-right {
                border-right: 1px solid #ddd;
            }

            /* General Button Styling */
            button {
                transition: all 0.3s;
                padding: 10px 20px;
            }

            /* Mobile view adjustment */
            @media (max-width: 768px) {
                .border-right {
                    border-right: none;
                }

                .container {
                    margin: 20px;
                }
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


            <div class="container rounded bg-white mt-5 mb-5" style="margin-right: 40px;">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="profile-header text-center">
                            <img class="rounded-circle" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                            <h4>${requestScope.data.name_cus}</h4>
                            <p>${requestScope.data.email}</p>
                        </div>
                    </div>
                    <form action="userdetails" method="post">
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4>User Details</h4>
                                </div>
                                <input type="hidden" value="${param.cus_id}" name="cus_id"/>
                                <div class="row mt-2">
                                    <div class="col-md-6">
                                        <label class="labels">Name</label>
                                        <input type="text" class="form-control" placeholder="first name" value="${requestScope.data.name_cus}" name="name" readonly>
                                    </div>

                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select class="form-control" name="gender" readonly>
                                            <option value="true" ${requestScope.data.gender == 'true' ? 'selected' : ''}>Nam</option>
                                            <option value="false" ${requestScope.data.gender == 'false' ? 'selected' : ''}>Nữ</option>
                                        </select>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="labels">Mobile Number</label>
                                        <input type="text" class="form-control" placeholder="enter phone number" value="${requestScope.data.c_phone}" name="phone" readonly>
                                    </div>
                                    <input type="hidden" value="${requestScope.data.address.size()}" name="sizeAddress"/>

                                    <c:forEach var="i" items="${requestScope.data.address}" varStatus="status">
                                        <div class="col-md-12">
                                            <label class="labels">Address Line ${status.index + 1}</label> 
                                            <!-- The hidden field to hold the address ID -->
                                            <input type="hidden" value="${i.a_id}" name="a_id${status.index + 1}"/>
                                            <!-- The text field for the address details -->
                                            <input type="text" class="form-control" placeholder="enter address" 
                                                   value="${i.detail}, ${i.street}, ${i.ward}, ${i.district}, ${i.city}" 
                                                   name="a${status.index + 1}" readonly>
                                        </div>
                                    </c:forEach>



                                    <div class="col-md-12">
                                        <label class="labels">Email</label>
                                        <input type="text" class="form-control" placeholder="enter state" value="${requestScope.data.email}" name="email" readonly>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="labels">Role</label>
                                        <select class="form-control" name="role">
                                            <c:forEach items="${requestScope.r}" var="i"> 
                                                <option value="${i.role_id}" 
                                                        <c:if test="${i.role_id == requestScope.data.role.role_id}">
                                                            selected
                                                        </c:if>
                                                        >${i.role_name}</option>
                                            </c:forEach>
                                        </select>

                                    </div>

                                    <div class="col-md-12">
                                        <label class="labels">Status</label>
                                        <select class="form-control" name="status">
                                            <option value="true" ${requestScope.data.status == 'true' ? 'selected' : ''}>Kích Hoạt</option>
                                            <option value="false" ${requestScope.data.status == 'false' ? 'selected' : ''}>Chưa kích hoạt</option>
                                        </select>
                                    </div>


                                </div>
                                <br></br>
                                <div class="mt-5 text-center">
                                    <button class="btn profile-button" type="submit">Save Profile</button>
                                </div>

                            </div>
                        </div>
                    </form>
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
        <!-- plugins -->
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.datatables.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/datatables.bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/a/asset/js/plugins/jquery.nicescroll.js"></script>
        <!-- custom -->
        <script src="${pageContext.request.contextPath}/a/asset/js/main.js"></script>
    </body>
</html>
