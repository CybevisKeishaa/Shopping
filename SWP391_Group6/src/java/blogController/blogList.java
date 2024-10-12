/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package blogController;

import dal.blogDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;

/**
 *
 * @author admin
 */
public class blogList extends HttpServlet {

   private static final int PAGE_SIZE = 6;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet blogList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet blogList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageStr = request.getParameter("page"); // Lấy số trang từ request (nếu có).

        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1; // Nếu có số trang thì dùng, nếu không thì mặc định là trang 1.

        blogDBContext blogDB = new blogDBContext(); // Tạo đối tượng để kết nối và thao tác với cơ sở dữ liệu Blog.

        List<Blog> list = blogDB.getAll(pageNumber, PAGE_SIZE); // Lấy danh sách blog theo trang và số lượng blog trên mỗi trang.

        int totalProducts = blogDB.getTotalBlogs(); // Lấy tổng số blog từ cơ sở dữ liệu.

        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE); // Tính tổng số trang cần dùng để hiển thị.

        request.setAttribute("currentPage", pageNumber); // Gửi thông tin trang hiện tại đến giao diện.

        request.setAttribute("totalPages", totalPages); // Gửi tổng số trang đến giao diện.

        request.setAttribute("data", list); // Gửi danh sách blog đến giao diện.

        request.getRequestDispatcher("view/blog/blogList.jsp").forward(request, response); // Chuyển đến trang blogList.jsp để hiển thị danh sách blog.

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
