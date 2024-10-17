/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.OrderDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer_User;
import model.Order;

/**
 *
 * @author KEISHA
 */
public class MyOrdersSerlvet extends BaseRequiredCustomerAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final int PAGE_SIZE = 4;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        String pageStr = request.getParameter("page");
        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;

        int cusID = customer.getCus_id();
        // Lấy tham số lọc (startDate và endDate)
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        Date startDate = null;
        Date endDate = null;

        try {
            if (startDateStr != null && !startDateStr.isEmpty()) {
                startDate = Date.valueOf(startDateStr);
            }
            if (endDateStr != null && !endDateStr.isEmpty()) {
                endDate =  Date.valueOf(endDateStr);
            }
        } catch (Exception ex) {
            Logger.getLogger(MyOrdersSerlvet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Lấy tham số sắp xếp (sortColumn và sortOrder)
        String sortColumn = request.getParameter("sortColumn") != null ? request.getParameter("sortColumn") : "created_at";
        String sortOrder = request.getParameter("sortOrder") != null ? request.getParameter("sortOrder") : "DESC";

        OrderDBContext db = new OrderDBContext();
        int totalOrder = db.getTotalOrderWithFilter(cusID, startDate, endDate);
        ArrayList<Order> orders = db.getOrdersWithPaginationAndFilter(cusID, pageNumber, PAGE_SIZE, startDate, endDate, sortColumn, sortOrder);  // Lấy danh sách đơn hàng với phân trang, lọc, sắp xếp

        // Tính tổng số trang
        int totalPages = (int) Math.ceil(totalOrder / (double) PAGE_SIZE);

        // Thiết lập thuộc tính cho request để chuyển sang JSP
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("orders", orders);
        request.setAttribute("startDate", startDateStr);
        request.setAttribute("endDate", endDateStr);
        request.setAttribute("sortColumn", sortColumn);
        request.setAttribute("sortOrder", sortOrder);
        // Trả lại giá trị sortOrder

        // Điều hướng đến trang JSP
        request.getRequestDispatcher("../view/order/orderList.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
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
