/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.cart;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.CartDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer_User;

/**
 *
 * @author KEISHA
 */
public class deleteItem extends BaseRequiredCustomerAuthenticationController{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
    throws ServletException, IOException {
        String comm = request.getParameter("comm");
        int itemID = Integer.parseInt(request.getParameter("itemID"));
        CartDBContext db = new CartDBContext();
        if(comm.equalsIgnoreCase("del")){
            db.deleteAnItem(itemID);
            response.sendRedirect(request.getContextPath() + "/homepage");
        }else if(comm.equalsIgnoreCase("ck")){
            db.deleteAnItem(itemID);
            response.sendRedirect(request.getContextPath() + "/cart/list");
        }
               
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
    throws ServletException, IOException {
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
