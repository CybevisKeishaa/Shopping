<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<t:dashboard>
    <style>
        .line-clamp {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        td.line-clamp {
            max-width: 300px;
        }
    </style>
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading"><h3>Sales</h3></div>
            <div class="panel-body">
                <a href="market/blog/create" class="btn btn-secondary mb-3">
                    <i class="fa fa-plus"></i>
                    <b>Tạo Bài Viết</b>
                </a>
                <c:catch var="e">
                    <form action="market" class="row" method="GET">
                        <div class="form-group col-md-2">
                            <label for="startdate">Ngày bắt đầu:</label>
                            <input type="date" id="startdate" value="${param.startdate}" class="form-control" name="startdate"/>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="enddate">Ngày kết thúc:</label>
                            <input type="date" id="enddate" value="${param.enddate}" class="form-control" name="enddate"/>
                        </div>
                        <div class="form-group align-items-center col-md-3" >
                            <label for="status">Tìm kiếm:</label>
                            <select id="status" class="form-control" name="status">
                                <option value="true" ${param.status == 'true' ? 'selected':''}>Tồn tại</option>
                                <option value="false" ${param.status == 'false' ? 'selected':''}>Đã ẩn</option>
                                <option value="all" ${param.status == 'all' ? 'selected':''}>Tất cả</option>
                            </select>
                        </div>
                        <div class="form-group align-items-center col-md-3" >
                            <label for="search">Tìm kiếm:</label>
                            <input type="text" id="custom-search" class="form-control " value="${param.search}" placeholder="Search..." name="search"/>
                        </div>
                        <div class="form-group col-md">
                            <label for="submit"> </label>
                            <input type="submit" value="Search" class="btn btn-primary " style="display: block"/>
                        </div>
                    </form>
                    <div class="responsive-table">
                        <table id="datatables-example" class="table table-striped table-bordered" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Blog Id</th>
                                    <th>Hình ảnh</th>
                                    <th>Chủ Đề</th>
                                    <th>Content</th>
                                    <th>Ngày Tạo</th>
                                    <th>Tạo Bởi</th>
                                    <th>Trạng Thái</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="blog" items="${blogs}">
                                    <tr>
                                        <td>${blog.blog_id}</td>
                                        <td><img width="100" height="100" src="${pageContext.request.contextPath}/img/${blog.image[0].img_url}" alt="${blog.image[0].img_name}"/></td>
                                        <td>${blog.title}</td>
                                        <td class="line-clamp">${blog.shortContent}</td>
                                        <td>${blog.date}</td>
                                        <td>${blog.employee.name_emp}</td>
                                        <td style="color:${blog.status?"green":'red'};">${blog.status ?'tồn tại':'đã ẩn'} </td>
                                        <td>
                                            <a href="market/blog?blogId=${blog.blog_id}" class="btn btn-primary btn-sm text-bold">
                                                <b>View</b>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <div class="container">
                            <div class="pagination-container dataTables_paginate paging_simple_numbers" id="datatables-example_paginate">
                                <ul class="pagination">
                                    <c:choose >
                                        <c:when test="${currentPage > 1}">
                                            <li class="paginate_button previous" id="datatables-example_previous">
                                                <a href="?page=${currentPage - 1}" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="paginate_button previous disabled" id="datatables-example_previous">
                                                <a href="#" aria-controls="datatables-example" data-dt-idx="0" tabindex="0">Previous</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <c:choose>
                                            <c:when test="${i == currentPage}">
                                                <li class="paginate_button active">
                                                    <a href="#" aria-controls="datatables-example" data-dt-idx="${i}" tabindex="0">${i}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="paginate_button ">
                                                    <a href="?page=${i}" aria-controls="datatables-example" data-dt-idx="${i}" tabindex="0">${i}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:choose >
                                        <c:when test="${currentPage < totalPages}">
                                            <li class="paginate_button next" id="datatables-example_previous">
                                                <a href="?page=${currentPage + 1}" aria-controls="datatables-example" data-dt-idx="${currentPage + 1}" tabindex="0">Next</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>

                                            <li class="paginate_button next disabled" id="datatables-example_next">
                                                <a href="#" aria-controls="datatables-example" data-dt-idx="3" tabindex="0">Next</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:catch>
                ${e}

            </div>        
        </div>        
    </div>
    <!-- start script --> 

    <script async="">
    </script>
    <!-- end script --> 

</t:dashboard>