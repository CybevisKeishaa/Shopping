<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="t" tagdir="/WEB-INF/tags/" %>
<!DOCTYPE html>
<html lang="en">
   <t:dashboard>
            <!-- start: Content -->
            <div id="">
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
                                                <th>Actions</th> 
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
                                                    <td>
                                                        <a href="userdetails?cus_id=${i.cus_id}" class="btn btn-primary btn-sm">View</a>
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

            <!-- start: right menu -->
            <!-- end: right menu -->

        </div>


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
    </t:dashboard>
</html>
