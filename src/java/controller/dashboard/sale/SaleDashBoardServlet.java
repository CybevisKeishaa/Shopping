/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.OrderDBContext;
import helper.AuthenticationHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Customer_User;
import model.Order;

/**
 *
 * @author KEISHA
 */
@WebServlet(name = "SaleDashBoardServlet", urlPatterns = {"/sale"})
public class SaleDashBoardServlet extends AuthenticationServlet {

    private static final String MAIN_PAGE = "/view/ad/order/sale.jsp";
    private static final String WEB_TITLE = "Sale Dashboard";

    private static final int PAGE_SIZE = 10;//Default = 10

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("role", user.getRole().getRole_name());
        request.setAttribute("title", WEB_TITLE);

        OrderDBContext odb = new OrderDBContext();
        List<Order> orders = null;
        int page = getPageIndex(request);
        if (AuthenticationHelper.isSaler(user)) {
            orders = odb.myOrders(user.getCus_id(), page, PAGE_SIZE);
        }
        if (AuthenticationHelper.isAdmin(user)) {
            orders = odb.getAllOrder(page, PAGE_SIZE);
        }
        List<Integer> orderCountByWeek = odb.getOrderCountByWeek();
        request.setAttribute("orders", orders);
        request.setAttribute("orderCount", orderCountByWeek);
        request.getRequestDispatcher(MAIN_PAGE).forward(request, response);
    }

    private int getPageIndex(HttpServletRequest request) {
        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ex) {
            //do nothing
        }
        return page;
    }
}
