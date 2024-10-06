/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Customer_User;
import model.Employee;

/**
 *
 * @author admin
 */
public class viewOrderList extends HttpServlet {

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
            out.println("<title>Servlet viewOrderList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewOrderList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        if (date!=null) {
            java.sql.Date sqlDate = java.sql.Date.valueOf(date);
            list=cdb.getAllListByProductidEmployeeIdDate(sqlDate, e.getEmp_id(), Integer.parseInt(product_id), pageNumber, PAGE_SIZE);
            totalProducts=cdb.getTotalCusByProductEmployeeid(sqlDate, e.getEmp_id(), Integer.parseInt(product_id));
        }else if(name!=null){
            list=cdb.getAllListByProductidEmployeeIdName(name, e.getEmp_id(), Integer.parseInt(product_id), pageNumber, PAGE_SIZE);
            totalProducts=cdb.getTotalCusByProductEmployeeidName(name, e.getEmp_id(), Integer.parseInt(product_id));
        }else if(total!=null){
            
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
