/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.OrderDBContext;
import dal.OrderStatusDBContext;
import helper.RequestHelper;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer_User;
import model.Order;
import model.Product;
import model.Status_Order;

/**
 *
 * @author KEISHA
 */
@WebServlet(name = "SaleOrderDetailServlet", urlPatterns = {"/sale/orderDetail"})
public class OrderDetailServlet extends AuthenticationServlet {

    private static final String WEB_TITLE = "Order Detail";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Integer id = RequestHelper.getIntParameterWithDefault("orderId", null, request);
        if (id == null) {
            response.sendError(response.SC_BAD_REQUEST);
            return;
        }
        OrderDBContext db = new OrderDBContext();
        OrderStatusDBContext odb = new OrderStatusDBContext();

        Order o = db.getOrderByOrderID(id);
        ArrayList<Product> p = db.getProductsByOrderAndCustomer(id, o.getCustomer().getCus_id());
        List<Status_Order> status = odb.getAllStatus();
        request.setAttribute("products", p);
        request.setAttribute("title", WEB_TITLE + " " + id);
        request.setAttribute("order", o);
        request.setAttribute("statusList", status);
        request.getRequestDispatcher("/view/ad/order/orderDetail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User user) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String method = request.getParameter("method");
        if (method.equals("PUT")) {
            try {
                Integer id = RequestHelper.getIntParameterWithDefault("orderId", null, request);
                Integer statusId = RequestHelper.getIntParameterWithDefault("statusId", null, request);
                if (id == null || statusId == null) {
                    response.sendError(response.SC_BAD_REQUEST);
                    return;
                }
                OrderDBContext db = new OrderDBContext();
                db.updateOrderStatus(id, statusId);
            } catch (MessagingException ex) {

                Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);

            } finally {
                doGet(request, response);
            }
        }

    }

}
