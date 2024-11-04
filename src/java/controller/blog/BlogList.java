/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dal.BlogDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Blog;

/**
 *
 * @author admin
 */
public class BlogList extends HttpServlet {

    private static final int PAGE_SIZE = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageStr = request.getParameter("page");
        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
        BlogDBContext blogDB = new BlogDBContext();
        List<Blog> list = blogDB.getAll(pageNumber, PAGE_SIZE);
        int totalProducts = blogDB.getAllTotalCount("", null, null, null, "true");
        int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("data", list);
        System.out.println(BlogList.class.getName());
        request.getRequestDispatcher("view/blog/blogList.jsp").forward(request, response);
    }

}
