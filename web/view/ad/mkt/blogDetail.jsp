<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:dashboard>

    <div class="col-lg-10 col-lg-offset-1 m-auto">
        <h1>Blog Detail</h1>
        <div class="panel">
            <div class="panel-heading bg-white border-none" style="padding:20px;">
                <div class="col-md-6 col-sm-6 col-sm-12 text-left">
                    <h2 class="text-lg"><b>${blog.title}</b></h2>
                </div>
                <div class="col-md-6 col-sm-6 col-sm-12">
                    <div class=" pull-right onoffswitch-primary " style="margin-top:10px;">
                        <a href="./blog/edit?blogId=${blog.blog_id}" 
                           class="btn btn-primary">Chỉnh Sửa</a>
                        <button type="submit" form="delete" 
                                class="btn ${blog.status? 'btn-danger':"btn-success"}">${blog.status? "Ẩn":"Hiện"}</button>
                        <form method="post"
                              action="${pageContext.request.contextPath}/market/blog" 
                              id="delete" 
                              onsubmit="return confirm('Bạn muốn ${blog.status? "Ẩn":"Hiện"} bài viết này?')" id="remove">
                            <input type="hidden" name="blogId" value="${blog.blog_id}">
                        </form>
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <div class=" col-md-6 col-md-offset-3">
                    <img class="blog-image img-rounded " width="100%" src="/SWP391_Group6/img/blog1_pic1.jpg" alt="#">
                </div>  
            </div>
            <div class="panel-body panel col-12">
                <h2 class="blog-title "><b>${blog.title}</b></h2>
                <hr>
                <div class="panel-body">
                    <div class="blog-meta">
                        <span class="author text-dark">
                            <a href="#"><i class="fa fa-user"></i>${' '}${blog.employee.name_emp}</a>${' '}
                            <a href="#"><i class="fa fa-calendar"></i>${' '}${blog.date}</a>
                        </span>
                    </div>
                    <div class="content">
                        <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</t:dashboard>