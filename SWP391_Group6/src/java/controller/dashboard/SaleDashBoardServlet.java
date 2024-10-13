/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import dal.OrderDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Customer_User;
import model.Order;
import model.Role;

/**
 *
 * @author Thanh Binh
 */
@WebServlet(name = "SaleDashBoardServlet", urlPatterns = {"/sale"})
public class SaleDashBoardServlet extends HttpServlet {

    private static final String MAIN_PAGE = "/view/dashboard/html/sale.jsp";
    private static final String LOGIN_PAGE = "./login";

    private static final int PAGE_SIZE = 10;//Default = 10

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDBContext odb = new OrderDBContext();
        HttpSession session = request.getSession();
        Customer_User currentCustomer = (Customer_User) session.getAttribute("customer");
        // Account check
        if (currentCustomer == null) {
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        // Role check
        List<Order> orders = null;
        int page = getPageIndex(request);
        if (currentCustomer.getRole().getRole_name().equals(Role.SALER_ROLE)) {
            orders = odb.myOrders(currentCustomer.getCus_id(), page, PAGE_SIZE);
        }
        if (currentCustomer.getRole().getRole_name().equals(Role.ADMIN_ROLE)) {
            orders = odb.getAllOrder(page, PAGE_SIZE);
        }
        request.setAttribute("orders", orders);
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
