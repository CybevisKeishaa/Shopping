/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.CartDBContext;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Customer_User;

/**
 *
 * @author KEISHA
 */
public class addToCartServlet extends HttpServlet {

    private static final String CARTCHECKOUT = "/cart/checkout";
    private static final String HOMEPAGE = "../../homepage";
    private static final String PRODUCT_DETAIL_WITH_PRODUCT_ID = "/product/detail?product_id=";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        Integer cartID = RequestHelper.getIntParameterWithDefault("cartID", null, request);
        String action = request.getParameter("action");
        if (action != null && action.equals("buy-now")) {
            doBuyNow(request, response);
            // nếu người dùng chưa đăng nhập thì không thêm vào cart
            if (cartID == null) {
                return;
            }
        }
        if (cartID == null) {
            request.getSession().setAttribute("errorMessage", "Hãy Đăng nhập trước khi thêm vào giỏ hàng");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        CartDBContext db = new CartDBContext();

        if (action == null) {
            db.addToCart(pid, cartID);
            response.sendRedirect(HOMEPAGE);
        } else if (action.equals("add-to-bag")) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int capacity = Integer.parseInt(request.getParameter("capacityId"));
            db.addToCartWithDetails(pid, cartID, quantity, capacity);
            response.sendRedirect(request.getContextPath() + PRODUCT_DETAIL_WITH_PRODUCT_ID + pid);
        }
    }

    private void doBuyNow(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher(CARTCHECKOUT).forward(request, response);
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
