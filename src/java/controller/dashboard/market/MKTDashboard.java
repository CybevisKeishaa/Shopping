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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import model.Blog;
import model.Employee;

/**
 *
 * @author Admin
 */
@WebServlet(name = "MKTDashboard", urlPatterns = {"/market"})
public class MKTDashboard extends AuthenticationServlet {

    private static final String WEB_TITLE = "Marketing Dashboard";
    private static final String WEB_URL = "/view/ad/mkt/market.jsp";
    private static final int PAGE_SIZE = 3;// Default 8;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("title", WEB_TITLE);
        boolean isAdmin = AuthenticationHelper.isAdmin(user);
        Integer empId = user.getEmp_id();
        if (isAdmin) {
            empId = RequestHelper.getIntParameterWithDefault("empId", null, request);
        } 
        // Get all filter parameters from the request using RequestHelper
        String title = RequestHelper.getStringParameterWithDefault("search", null, request);
        String status = RequestHelper.getStringParameterWithDefault("status", "true", request);

        // Parse the startDate and endDate from the request (optional, null if not provided)
        Date startDate = RequestHelper.getDateParameterWithDefault("startDate", null, request);
        Date endDate = RequestHelper.getDateParameterWithDefault("endDate", null, request);

        // Page number and page size for pagination (default values if not provided)
        int page = RequestHelper.getIntParameterWithDefault("page", 1, request);

        // Initialize BlogDBContext
        BlogDBContext bdb = new BlogDBContext();

        // Fetch the filtered blog list with pagination
        List<Blog> blogs = bdb.getAll(title, startDate, endDate, empId, status, page, PAGE_SIZE);
        int count = bdb.getAllTotalCount(title, startDate, endDate, empId, status);
        // Set the blog list as an attribute in the request
        request.setAttribute("blogs", blogs);
        request.setAttribute("totalCount", count);
        request.setAttribute("totalPages", (int) Math.ceil((double) count / PAGE_SIZE));
        request.setAttribute("currentPage", page);
        // Forward the request to the appropriate JSP page (WEB_URL)
        request.getRequestDispatcher(WEB_URL).forward(request, response);
    }

}
