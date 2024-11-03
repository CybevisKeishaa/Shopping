/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.market;

import controller.auth.AuthenticationServlet;
import dal.BlogDBContext;
import static helper.AuthenticationHelper.MARKETER_ROLE;
import static helper.AuthenticationHelper.isAllowedRole;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Blog;
import model.Employee;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BlogDetailMKT", urlPatterns = {"/market/blog"})
public class BlogDetailServlet extends AuthenticationServlet {

    private static final String WEB_TITLE = "{title}";
    private static final String WEB_URL = "/view/ad/mkt/blogDetail.jsp";
    private static final String WEB_DELETE_URL = "/market/blog";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        boolean isAllowRole = isAllowedRole(user, new String[]{MARKETER_ROLE});
        if (!isAllowRole) {
            response.sendError(response.SC_FORBIDDEN);
            return;
        }
        // Retrieve blogId from the request
        Integer blogId = RequestHelper.getIntParameterWithDefault("blogId", null, request);

        // Check if blogId is valid
        if (blogId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Blog ID");
            return;
        }

        // Initialize BlogDBContext to fetch blog details
        BlogDBContext bdb = new BlogDBContext();
        Blog b = bdb.getContentByBlogId(blogId);  // Retrieve blog by blogId

        // Check if the blog exists
        if (b == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "không tìm thấy Blog");
            return;
        }

        // Set attributes for rendering the blog
        final HttpSession session = request.getSession();
        request.setAttribute("blog", b);
        request.setAttribute("title", WEB_TITLE.replace("{title}", b.getTitle()));
        request.setAttribute("errorMessage", session.getAttribute("errorMessage"));
        session.removeAttribute("errorMessage");

        // Forward the request to the blog detail JSP page
        request.getRequestDispatcher(WEB_URL).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        boolean isAllowRole = isAllowedRole(user, new String[]{MARKETER_ROLE});
        if (!isAllowRole) {
            response.sendError(response.SC_FORBIDDEN);
            return;
        }
        // Retrieve blogId from the request
        Integer blogId = RequestHelper.getIntParameterWithDefault("blogId", null, request);

        // Check if blogId is valid
        if (blogId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Blog ID");
            return;
        }

        // Initialize BlogDBContext to manage the blog
        BlogDBContext bdb = new BlogDBContext();
        Blog b = bdb.getContentByBlogId(blogId);  // Retrieve blog by blogId

        // Check if the blog exists before attempting to update
        if (b == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "không tìm thấy Blog");
            return;
        }

        boolean isUpdated = bdb.updateBlogStatus(blogId, ((Employee) user).getEmp_id(), !b.getStatus());

        // If the deletion failed, forward back to the blog detail page with an error message
        if (!isUpdated) {
            request.getSession().setAttribute("errorMessage", "Không xoá được Blog");
        }
        response.sendRedirect(request.getContextPath() + WEB_DELETE_URL + "?blogId=" + b.getBlog_id());
    }

}
