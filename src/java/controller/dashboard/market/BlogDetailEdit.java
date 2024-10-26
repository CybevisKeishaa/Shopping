/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.market;

import controller.auth.AuthenticationServlet;
import dal.BlogDBContext;
import helper.AuthenticationHelper;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import model.Blog;
import model.Customer_User;
import model.Employee;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "BlogDetailMKTEdit", urlPatterns = {"/market/blog/edit", "/market/blog/create"})
public class BlogDetailEdit extends AuthenticationServlet {

    private static final String EDIT_TITLE = "{title}";
    private static final String CREATE_TITLE = "Create Blog";
    private static final String WEB_URL = "/view/ad/mkt/blogEdit.jsp";
    private static final String REDIRECT_URL = "/market/blog?blogId="; // Redirect to blog list after save
    private static final String REDIRECT_EDIT_URL = "/market/blog/edit?blogId="; // Redirect to blog list after save

    private Blog processGetEdit(HttpServletRequest request, HttpServletResponse response, Integer blogId, Customer_User user) throws IOException, ServletException {
        if (blogId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Blog ID");
            return null;
        }

        // Retrieve the blog details using BlogDBContext
        BlogDBContext bdb = new BlogDBContext();
        Blog b = bdb.getContentByBlogId(blogId);
        boolean isAdmin = AuthenticationHelper.isAdmin(user);
        boolean isMarketter = AuthenticationHelper.isMarketer(user);
        boolean isOwner = ((Employee) user).getEmp_id() == b.getEmployee().getEmp_id();
        // Allow admin and owner of this blog to edit blog
        if (!isAdmin && (isMarketter && !isOwner)) {
            response.sendRedirect(request.getContextPath() + REDIRECT_URL + blogId);
            return null;
        }
        // Set blog attributes for rendering
        request.setAttribute("blog", b);
        request.setAttribute("title", b.getTitle());
        request.getRequestDispatcher(WEB_URL).forward(request, response);
        return b;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        boolean isEdit = request.getRequestURI().endsWith("edit");
        Blog b = null;
        request.setAttribute("isEdit", isEdit);
        if (isEdit) {
            // Edit mode, retrieve blogId and blog details
            Integer blogId = RequestHelper.getIntParameterWithDefault("blogId", null, request);
            b = processGetEdit(request, response, blogId, user);
            if (b != null) {
                request.setAttribute("title", EDIT_TITLE.replace("{title}", b.getTitle()));
            }
        } else {
            // Create mode, initialize a new empty blog object
            request.setAttribute("blog", new Blog());
            request.setAttribute("title", CREATE_TITLE);
            request.getRequestDispatcher(WEB_URL).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        boolean isEdit = request.getRequestURI().endsWith("edit");
        request.setAttribute("isEdit", isEdit);

        if (isEdit) {
            // Edit existing blog
            Integer blogId = RequestHelper.getIntParameterWithDefault("blogId", null, request);
            processEdit(request, response, blogId, user);
        } else {
            // Create a new blog
            processCreate(request, response, user);
        }
    }

    private void processCreate(HttpServletRequest request, HttpServletResponse response, Customer_User user) throws IOException, ServletException {
        // Retrieve all blog data from the request
        String title = request.getParameter("title");
        String shortContent = request.getParameter("shortContent");
        String content = request.getParameter("content");
        Part image = request.getPart("image");
        Integer empId = RequestHelper.getIntParameterWithDefault("empId", null, request);
        boolean isEmployee = AuthenticationHelper.isEmployee(user);
        // Validate required fields
        if (title == null || content == null || empId == null) {
            request.setAttribute("errorMessage", "Title, content, and employee ID are required.");
            request.setAttribute("blog", new Blog(title, shortContent, content, true));
            request.getRequestDispatcher(WEB_URL).forward(request, response);
            return;
        }

        // Create a new blog instance and set its properties
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setShortContent(shortContent);
        blog.setContent(content);
        // Save the new blog to the database
        BlogDBContext bdb = new BlogDBContext(this);
        boolean isCreated = bdb.createBlog(blog, empId, image);

        // Redirect or show error based on the result
        if (isCreated) {
            response.sendRedirect(request.getContextPath() + REDIRECT_URL + blog.getBlog_id());  // Redirect to blog list or success page
        } else {
            request.setAttribute("errorMessage", "Failed to create the blog.");
            request.setAttribute("blog", blog);
            request.getRequestDispatcher(WEB_URL).forward(request, response);
        }
    }

    private void processEdit(HttpServletRequest request, HttpServletResponse response, Integer blogId, Customer_User user) throws IOException, ServletException {
        if (blogId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Blog ID");
            return;
        }

        // Retrieve updated blog data from the request
        String title = request.getParameter("title");
        String shortContent = request.getParameter("shortContent");
        String content = request.getParameter("content");
        Integer empId = RequestHelper.getIntParameterWithDefault("empId", null, request);
        Part image = request.getPart("image");

        // Validate required fields
        if (title == null || content == null || empId == null) {
            request.setAttribute("error", "Title, content, and employee ID are required.");
            Blog blog = new Blog(title, shortContent, content, false);
            request.setAttribute("blog", blog);
            request.getRequestDispatcher(WEB_URL).forward(request, response);
            return;
        }

        // Fetch existing blog from DB
        BlogDBContext bdb = new BlogDBContext(this);
        Blog blog = bdb.getContentByBlogId(blogId);

        if (blog == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Blog not found");
            return;
        }

        // Update blog properties
        blog.setTitle(title);
        blog.setShortContent(shortContent);
        blog.setContent(content);

        // Save the updated blog to the database
        boolean isUpdated = bdb.updateBlog(blog, empId, image);

        // Redirect or show error based on the result
        if (isUpdated) {
            
            response.sendRedirect(request.getContextPath() + REDIRECT_URL + blogId);  // Redirect to blog list or success page
        } else {
            request.setAttribute("error", "Failed to update the blog.");
            request.setAttribute("blog", blog);
            request.setAttribute("title", blog.getTitle());

            request.getRequestDispatcher(WEB_URL).forward(request, response);
        }
    }

}
