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
 * @author admin
 */

@WebServlet(name = "blogList", urlPatterns = {"/blogList"})
public class BlogList extends HttpServlet {

   private static final int PAGE_SIZE = 6;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageStr = request.getParameter("page"); // Lấy số trang từ request (nếu có).

        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1; // Nếu có số trang thì dùng, nếu không thì mặc định là trang 1.

        BlogDBContext blogDB = new BlogDBContext(); // Tạo đối tượng để kết nối và thao tác với cơ sở dữ liệu Blog.

        List<Blog> list = blogDB.getAll(pageNumber, PAGE_SIZE); // Lấy danh sách blog theo trang và số lượng blog trên mỗi trang.

        int totalProducts = blogDB.getTotalBlogs(); // Lấy tổng số blog từ cơ sở dữ liệu.

        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE); // Tính tổng số trang cần dùng để hiển thị.

        request.setAttribute("currentPage", pageNumber); // Gửi thông tin trang hiện tại đến giao diện.

        request.setAttribute("totalPages", totalPages); // Gửi tổng số trang đến giao diện.

        request.setAttribute("data", list); // Gửi danh sách blog đến giao diện.

        request.getRequestDispatcher("view/blog/blogList.jsp").forward(request, response); // Chuyển đến trang blogList.jsp để hiển thị danh sách blog.

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
