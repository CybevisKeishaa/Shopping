/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.CartDBContext;
import dal.OrderDBContext;
import dal.OrderDetailDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Customer_User;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class CartCompleteServlet extends BaseRequiredCustomerAuthenticationController {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        OrderDBContext orderDB = new OrderDBContext();
        Order o = orderDB.getOrderByOrderID(orderID, user.getCus_id());
        ArrayList<Product> p = orderDB.getNewProductsByOrderAndCustomer(orderID, user.getCus_id());
        
        request.setAttribute("order", o);
        request.setAttribute("product", p);
        
        request.getRequestDispatcher("../view/notice/cartComplete.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User user)
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
