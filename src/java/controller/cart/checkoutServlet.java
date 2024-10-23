/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.AddressDBContext;
import dal.CartDBContext;
import dal.CustomerDBContext;
import dal.EmployeeDBContext;
import dal.OrderDBContext;
import dal.PaymentDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import model.Address;
import model.Cart;
import model.Customer_User;
import model.Payment;
import java.sql.*;
import model.Capacity;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class checkoutServlet extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {

        int userID = user.getCus_id();
        PaymentDBContext paymentDB = new PaymentDBContext();
        CartDBContext db = new CartDBContext();
        AddressDBContext aDB = new AddressDBContext();
        ArrayList<Address> addresses = aDB.getAddressByCusID(userID);

        ArrayList<Payment> payments = paymentDB.allPaymentMethods();
        Cart c = db.getCartByCustomer(userID);
        request.setAttribute("payments", payments);
        request.setAttribute("cart", c);
        request.setAttribute("address", addresses);
        request.getRequestDispatcher("/view/cart/checkout.jsp").forward(request, response);

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

        try {
            // Lấy các tham số từ form
            int paymentID = Integer.parseInt(request.getParameter("paymentMethod"));
            int totalCost = Integer.parseInt(request.getParameter("totalCost"));
            int statusID = 1;  // Mặc định là 'Pending'
            int cusID = user.getCus_id();
            String note = request.getParameter("notes");
            int addressID = Integer.parseInt(request.getParameter("selectedAddress"));

            // Lấy danh sách sản phẩm từ giỏ hàng và thông tin chi tiết đơn hàng
            String[] productIds = request.getParameterValues("productID");
            String[] quantities = request.getParameterValues("quantity");
            String[] unitPrices = request.getParameterValues("unit_price");
            String[] capacityIds = request.getParameterValues("capacity_id");

            if (productIds == null || quantities == null || unitPrices == null) {
                response.getWriter().println("Missing product details.");
                return;
            }

            if (productIds.length != quantities.length || productIds.length != unitPrices.length) {
                response.getWriter().println("Product details are mismatched.");
                    return;
                }

            EmployeeDBContext empDB = new EmployeeDBContext();
            int empID = empDB.getFreeEmployee();
            OrderDBContext orderDB = new OrderDBContext();
            int orderId = orderDB.insertOrder(totalCost, statusID, cusID, paymentID, note, addressID, empID);

            if (orderId > 0) {
                ArrayList<OrderDetail> orderDetails = new ArrayList<>();
                for (int i = 0; i < productIds.length; i++) {
                    OrderDetail detail = new OrderDetail();
                    detail.setQuantity(Integer.parseInt(quantities[i]));
                    detail.setPrice_at_order(Integer.parseInt(unitPrices[i]));

                    // Tạo đối tượng sản phẩm và đặt ID sản phẩm
                    ArrayList<Product> products = new ArrayList<>();
                    Product product = new Product();
                    product.setProduct_id(Integer.parseInt(productIds[i]));
                    products.add(product);  // Đảm bảo thêm sản phẩm vào danh sách
                    detail.setProducts(products);

                    Capacity capacity = new Capacity();
                    capacity.setCapacity_id(Integer.parseInt(capacityIds[i]));
                    detail.setCapacity(capacity);

                    Order order = new Order();
                    order.setOrder_id(orderId);
                    detail.setOrder(order);

                    // Thêm chi tiết đơn hàng vào danh sách
                    orderDetails.add(detail);
                }

                orderDB.insertOrderDetail(orderId, orderDetails);
                response.sendRedirect(request.getContextPath() + "/view/notice/ThanksForOrder.jsp");

            } else {
                response.getWriter().println("Failed to create order!");
            }

        } catch (Exception e) {
            // Xử lý các lỗi ngoại lệ khác
            response.getWriter().println("An error occurred while processing your request.");
            e.printStackTrace();
        }
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
