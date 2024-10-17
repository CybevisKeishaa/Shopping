/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.ProductListDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Employee;
import model.Product;

/**
 *
 * @author admin
 */
public class ViewListProduct extends HttpServlet {



    private static final int PAGE_SIZE = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Object object = request.getSession().getAttribute("employee");
        String pageStr = request.getParameter("page");
        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;

        Employee e = null;
        if (object != null) {
            e = (Employee) object;
        }
        ProductListDBContext pd = new ProductListDBContext();
        List<Product> list = pd.getListProductByEmployeeId(e.getEmp_id(), pageNumber, PAGE_SIZE);
        int totalProducts = pd.totalListProductByEmployeeId(e.getEmp_id());
        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("data", list);
        request.getRequestDispatcher("view/employee/viewListProduct.jsp").forward(request, response);
    }


}
