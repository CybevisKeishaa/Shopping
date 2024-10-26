<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<t:dashboard>
    <style>
        .form-group textarea{
            min-height: 50px;
        }
        .form-group textarea[name='content']{
            min-height: 150px;
        }
        #image-container img {
            max-width: 100%;
            height: auto;
            margin: 0 auto;
            display: flex;
            border-radius: 5px;
            box-shadow: 0 0 8px 0 #00000066 ;
        }

        /* Media query for larger screens */
        @media (min-width: 768px) {
            #image-container img {
                max-width: 50%; /* Set to 50% of container width on larger screens */
            }
        }

        /* Media query for small screens */
        @media (max-width: 480px) {
            #image-container img {
                max-width: 80%; /* Set to 80% of container width on smaller screens */
            }
        }
    </style>
    <div class="col-lg-10 col-lg-offset-1">
        <div class="panel">
            <div class="panel-heading">
                <h3>${isEdit? "Chỉnh sửa Bài Viết" :"Tạo Bài Viết"}</h3>
            </div>
            <div class="panel-body">
                <form id="edit-form"  action="${pageContext.request.contextPath}${isEdit? '/market/blog/edit':'/market/blog/create'}"
                      method="post"  class=""
                      enctype="multipart/form-data">
                    <c:if test="${errorMessage != null}">
                        <div class="text-danger">${errorMessage}</div>
                    </c:if>
                    <c:if test="${isEdit == true}">
                        <input value="${param.blogId}" name="blogId" type="hidden">
                    </c:if>
                    <input value="${customer.emp_id}" name="empId" type="hidden">

                    <div class="form-group">
                        <label for="title" class="form-label" required >Title</label>
                        <input type="text" class="form-control" name="title" required 
                               value="${blog.title}">
                    </div>
                    <div id="image-container" class="form-group">
                        <img class="image border w-50" src="https://placehold.co/1600x900?text=temp_image" alt="#"/>
                        <br>
                        <label for="image" class="form-label" >Image</label>
                        <input type="file" class="form-control"
                               required
                               name="image" required 
                               value="${blog.title}">
                    </div>
                    <div class="form-group">
                        <label for="shortContent" class="form-label" required >Content</label>
                        <textarea class="form-control" 
                                  required
                                  name="shortContent" value="${blog.shortContent}">${blog.shortContent}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="content" class="form-label" required >Second Content</label>
                        <textarea class="form-control" 
                                  required
                                  name="content" value="${blog.content}">${blog.content}</textarea>
                    </div>
                    <button class="btn btn-primary">
                        ${isEdit ? "Cập Nhật": "Tạo"}
                    </button>
                </form>
            </div>
        </div>
    </div>
    <script>
        let image = document.querySelector("#image-container img");
        let imageInput = document.querySelector("#image-container input");
        let isEdit = ${isEdit};
        if (isEdit) {
            let imageSrc = '${blog.image[0] != null? blog.image[0].img_url:""}';
            if (imageSrc) {
                image.src = '${pageContext.request.contextPath}/img/' + imageSrc;
                image.alt = '${blog.image[0].img_name}';
                imageInput.removeAttribute('required');
            }
        }
        imageInput.addEventListener("change", (e) => {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (event) {
                    image.src = event.target.result;
                    image.style.display = "block"; // Make image visible
                };
                reader.readAsDataURL(file); // Convert image file to base64 string
            }
        });
    </script>
</t:dashboard>