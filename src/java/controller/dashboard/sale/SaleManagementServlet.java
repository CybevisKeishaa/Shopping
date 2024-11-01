/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.OrderDBContext;
import static helper.AuthenticationHelper.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Employee;
import model.Order;

/**
 *
 *
 */
@WebServlet(name = "SaleManagementServlet", urlPatterns = {"/saleManagement"})
public class SaleManagementServlet extends AuthenticationServlet {

    private static final String MAIN_PAGE = "/view/ad/order/saleManagement.jsp";
    private static final String WEB_TITLE = "Sale Management";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("title", WEB_TITLE);
        OrderDBContext odb = new OrderDBContext();
        boolean isAllowRole = isAllowedRole(user, new String[]{SALER_MANAGER_ROLE});
        if (!isAllowRole) {
            response.sendError(response.SC_FORBIDDEN);
            return;
        }
        //filtering params
        List<Order> orders = odb.getAllNoEmployeeOrder();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher(MAIN_PAGE).forward(request, response);
    }

}
