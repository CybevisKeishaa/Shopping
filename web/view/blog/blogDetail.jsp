<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:mainview>

    <section class="blog-single section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-12">
                    <div class="blog-single-main">
                        <div class="row">
                            <div class="col-12">
                                <div class="image">
                                    <c:set value="${requestScope.data.image[0]}" var="image"></c:set>
                                    <img class="blog-image" src="${pageContext.request.contextPath}/img/${image.img_url}"  alt="#">
                                </div>
                                <div class="blog-detail">
                                    <h2 class="blog-title">${requestScope.data.title}</h2>
                                    <div class="blog-meta">
                                        <span class="author"><a href="#"><i class="fa fa-user"></i>${requestScope.data.getEmployee().getName_emp()}</a><a href="#"><i class="fa fa-calendar"></i>${requestScope.data.getDate()}</a></span>
                                    </div>
                                    <div class="content">
                                        <p> ${requestScope.data.shortContent}</p>
                                        <p> ${requestScope.data.content}</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-12">
                    <div class="main-sidebar">
                        <div class="single-widget search">
                            <div class="search-bar">
                                <form action="blogSearch">
                                    <input name="search" placeholder="Search Blog Here....." type="search">
                                    <button class="btnn"><i class="ti-search"></i></button>

                                </form>
                            </div>
                        </div>


                        <div class="single-widget recent-post">
                            <h3 class="title">Blog List</h3>
                            <!-- Single Post -->
                            <c:forEach var="a" items="${requestScope.l}" begin="0" end="3">
                                <div class="single-post">
                                    <div class="image">
                                        <img src="${pageContext.request.contextPath}/img/${a.image[0].img_url}" alt="#">
                                    </div>
                                    <div class="content">
                                        <h5><a href="blogDetail?id=${a.blog_id}">${a.getTitle()}</a></h5>
                                        <ul class="comment">
                                            <li><i class="fa fa-calendar" aria-hidden="true"></i>${a.date}</li>
                                        </ul>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ End Blog Single -->

</t:mainview>