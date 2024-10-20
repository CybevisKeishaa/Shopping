/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dal.BlogDBContext;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;

/**
 *
 * @author DINH SON
 */
@WebServlet(urlPatterns = "/blogDetail")
public class BlogDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BlogDBContext blog = new BlogDBContext();
        List<Blog> l = blog.getBlogTop3Date();
        String a_raw = request.getParameter("id");
        int a = Integer.parseInt(a_raw);
        Blog c = blog.getContentByBlogId(a);
        request.setAttribute("data", c);
        request.setAttribute("l", l);
        request.getRequestDispatcher("view/blog/blogDetail.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
