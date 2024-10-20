/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.CustomerDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Customer_User;
import model.Employee;

/**
 *
 * @author admin
 */
public class ViewOrderList extends HttpServlet {

    private static final int PAGE_SIZE = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String date = request.getParameter("date");
        String name = request.getParameter("name");
        String total = request.getParameter("total");
        String product_id = request.getParameter("product_id");
        Object object = request.getSession().getAttribute("employee");
        String pageStr = request.getParameter("page");
        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
        Employee e = null;
        CustomerDBContext cdb = new CustomerDBContext();

        int totalProducts = -1;
        List<Customer_User> list = new ArrayList<>();
        if (object != null) {
            e = (Employee) object;
        }
        if (date != null) {
            java.sql.Date sqlDate = java.sql.Date.valueOf(date);
            list = cdb.getAllListByProductidEmployeeIdDate(sqlDate, e.getEmp_id(), Integer.parseInt(product_id), pageNumber, PAGE_SIZE);
            totalProducts = cdb.getTotalCusByProductEmployeeid(sqlDate, e.getEmp_id(), Integer.parseInt(product_id));
        } else if (name != null) {
            list = cdb.getAllListByProductidEmployeeIdName(name, e.getEmp_id(), Integer.parseInt(product_id), pageNumber, PAGE_SIZE);
            totalProducts = cdb.getTotalCusByProductEmployeeidName(name, e.getEmp_id(), Integer.parseInt(product_id));
        } else if (total != null) {

        } else {
            list = cdb.getAllListByProductidEmployeeId(e.getEmp_id(), Integer.parseInt(product_id), pageNumber, PAGE_SIZE);
            totalProducts = cdb.getTotalCusByProductEmployeeid(e.getEmp_id(), Integer.parseInt(product_id));
        }
        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("data", list);
        request.getRequestDispatcher("view/employee/viewListOrder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
