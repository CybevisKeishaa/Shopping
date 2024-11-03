/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import com.vnpay.common.Config;
import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.OrderDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import model.Customer_User;

/**
 *
 * @author KEISHA
 */
public class OnlinePaymentServlet extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        int cusID = user.getCus_id();
        OrderDBContext db = new OrderDBContext();
        int orderID = db.getEarliestOrderIDByCustomer(cusID);
        db.updateOrderPaidStatus(orderID);

        request.getRequestDispatcher("cart/complete?orderID=" + orderID).forward(request, response);
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
        doGet(request, response);
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
