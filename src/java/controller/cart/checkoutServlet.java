/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.CartDBContext;
import dal.paymentDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Cart;
import model.Customer_User;
import model.Payment;

/**
 *
 * @author KEISHA
 */
public class checkoutServlet extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        
        
        int userID = user.getCus_id();
        paymentDBContext paymentDB = new paymentDBContext();
        CartDBContext db = new CartDBContext();
        ArrayList<Payment> payments = paymentDB.allPaymentMethods();
        Cart c = db.getCartByCustomer(userID);
        request.setAttribute("payments", payments);
        request.setAttribute("cart", c);

        request.getRequestDispatcher("/view/cart/checkoutr.jsp").forward(request, response);

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
        int paymentID =  Integer.parseInt(request.getParameter("paymentMethod"));
        int totalCost = Integer.parseInt(request.getParameter("totalCost"));
        int statusID = 1;
        int cusID = user.getCus_id();
        String note = request.getParameter("notes");
//        int addressID = request.getParameter("");
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
