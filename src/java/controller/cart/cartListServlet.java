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
import model.Cart;
import model.Customer_User;
import model.Item;

/**
 *
 * @author KEISHA
 */
public class cartListServlet extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        int userID = user.getCus_id();
        CartDBContext db = new CartDBContext();
        Cart c = db.getCartByCustomer(userID);
        request.setAttribute("cart", c);
        request.getRequestDispatcher("../view/cart/cart.jsp").forward(request, response);
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

        String[] itemIds = request.getParameterValues("itemId[]");
        String[] quantities = request.getParameterValues("quantity[]");
        String[] capacities = request.getParameterValues("capacity[]");
        String[] productNames = request.getParameterValues("productName[]");
        String[] productIDs = request.getParameterValues("productID[]");

        if (itemIds != null && quantities != null && itemIds.length == quantities.length) {
            CartDBContext db = new CartDBContext();
            boolean stockError = false;
            StringBuilder errorMessage = new StringBuilder();

            for (int i = 0; i < itemIds.length; i++) {
                String pName = productNames[i];
                int productID = Integer.parseInt(productIDs[i]);
                int itemId = Integer.parseInt(itemIds[i]);
                int requestedQuantity = Integer.parseInt(quantities[i]);
                int capacity = Integer.parseInt(capacities[i]);

                int availableStock = db.getStockByProductIDAndCapacity(productID, capacity);
                if (requestedQuantity > availableStock) {
                    stockError = true;
                    errorMessage.append("Sản phẩm ").append(pName)
                            .append(" với dung lượng ").append(capacity)
                            .append(" không đủ hàng. Số lượng tồn kho hiện tại là: ").append(availableStock).append(".\n");
                    continue;
                }

                db.updateCartQuantity(itemId, requestedQuantity, capacity);
            }

            if (stockError) {
                request.setAttribute("errorMessage", errorMessage.toString());
                doGet(request, response, user); 
                return;
            }
        }

        // Sau khi cập nhật, chuyển hướng lại trang giỏ hàng
        response.sendRedirect("list");
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
