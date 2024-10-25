/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import JavaMail.EmailService;
import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.AddressDBContext;
import dal.CartDBContext;
import dal.EmployeeDBContext;
import dal.OrderDBContext;
import dal.PaymentDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import model.Address;
import model.Cart;
import model.Customer_User;
import model.Payment;
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
            AddressDBContext aDB = new AddressDBContext();

            // Lấy danh sách sản phẩm từ giỏ hàng và thông tin chi tiết đơn hàng
            String[] productIds = request.getParameterValues("productID");
            String[] quantities = request.getParameterValues("quantity");
            String[] unitPrices = request.getParameterValues("unit_price");
            String[] capacityIds = request.getParameterValues("capacity_id");

            CartDBContext db = new CartDBContext();
            boolean stockError = false;
            StringBuilder stockErrorMessage = new StringBuilder();

            for (int i = 0; i < productIds.length; i++) {
                int productId = Integer.parseInt(productIds[i]);
                int requestedQuantity = Integer.parseInt(quantities[i]);
                int capacityId = Integer.parseInt(capacityIds[i]);

                int availableStock = db.getStockByProductIDAndCapacity(productId, capacityId);
                if (requestedQuantity > availableStock) {
                    stockError = true;
                    stockErrorMessage.append("Sản phẩm ID ").append(productId)
                            .append(" không đủ hàng. Số lượng tồn kho hiện tại là: ").append(availableStock).append(".\n");
                }
            }

            if (stockError) {
                request.setAttribute("errorMessage", stockErrorMessage.toString());
                doGet(request, response, user);
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
                    orderDB.updateStockAfterOrder(Integer.parseInt(productIds[i]), Integer.parseInt(capacityIds[i]), Integer.parseInt(quantities[i]));

                }

                orderDB.insertOrderDetail(orderId, orderDetails);

                Address address = aDB.getAddressByOrderID(orderId);
                ArrayList<Product> products = orderDB.getNewProductsByOrderAndCustomer(orderId, cusID);
                EmailService emailService = new EmailService();
                boolean isSent = emailService.sendOrderConfirmation(
                        user.getEmail(), orderId, user.getName_cus(), products, totalCost, address);
                if (isSent) {
                    System.out.println("Order confirmation email sent successfully!");
                } else {
                    System.out.println("Failed to send order confirmation email.");
                }

                response.sendRedirect("complete?orderID=" + orderId);

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
