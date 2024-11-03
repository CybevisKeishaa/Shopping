/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.AddressDBContext;
import dal.CartDBContext;
import dal.PaymentDBContext;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Address;
import model.Capacity;
import model.Customer_User;
import model.Item;
import model.Payment;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class addToCartServlet extends BaseRequiredCustomerAuthenticationController {

    private static final String CARTCHECKOUT = "/cart/checkout";
    private static final String HOMEPAGE = "../../homepage";
    private static final String PRODUCT_DETAIL_WITH_PRODUCT_ID = "/product/detail?product_id=";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        Integer cartID = RequestHelper.getIntParameterWithDefault("cartID", null, request);
        String action = request.getParameter("action");
        if (action != null && action.equals("buy-now")) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int capacity = Integer.parseInt(request.getParameter("capacityId"));
            int price = Integer.parseInt(request.getParameter("price"));

            Item item = new Item();
            item.setQuantity(quantity);

            Product p = new Product();
            p.setProduct_id(pid);
            item.setProduct(p);

            Capacity c = new Capacity();
            c.setCapacity_id(capacity);
            c.setUnit_price(price);
            item.setCapacity(c);

            doBuyNow(request, response, item, user);

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

    private void doBuyNow(HttpServletRequest request, HttpServletResponse response, Item item, Customer_User user) throws IOException, ServletException {

        int cusID = user.getCus_id();
        PaymentDBContext paymentDB = new PaymentDBContext();
        AddressDBContext aDB = new AddressDBContext();

        ArrayList<Address> addresses = aDB.getAddressByCusID(cusID);
        ArrayList<Payment> payments = paymentDB.allPaymentMethods();

        request.setAttribute("item", item);
        request.setAttribute("payments", payments);
        request.setAttribute("address", addresses);
        request.getRequestDispatcher(CARTCHECKOUT + ".jsp").forward(request, response);
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
