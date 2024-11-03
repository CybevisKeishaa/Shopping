/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.OrderDBContext;
import dal.OrderStatusDBContext;
import static helper.AuthenticationHelper.SALER_ROLE;
import static helper.AuthenticationHelper.isAllowedRole;
import helper.RequestHelper;
import jakarta.mail.MessagingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean isAllowRole = isAllowedRole(user, new String[]{SALER_ROLE});
        if (!isAllowRole) {
            response.sendError(response.SC_FORBIDDEN);
            return;
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Employee user) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String method = request.getParameter("method");
        try {
            if (method.equals("POST")) {// update paid status
                Integer id = RequestHelper.getIntParameterWithDefault("orderId", null, request);
                if (id == null) {
                    response.sendError(response.SC_BAD_REQUEST);
                    return;
                }
                OrderDBContext db = new OrderDBContext();
                db.updatePaidStatus(id);
            }
            if (method.equals("PUT")) { // update status
                Integer id = RequestHelper.getIntParameterWithDefault("orderId", null, request);
                Integer statusId = RequestHelper.getIntParameterWithDefault("statusId", null, request);
                if (id == null || statusId == null) {
                    response.sendError(response.SC_BAD_REQUEST);
                    return;
                }
                OrderDBContext db = new OrderDBContext();
                db.updateOrderStatus(id, statusId, false);
            }
        } catch (MessagingException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
        } finally {
            doGet(request, response);
        }
    }

}
