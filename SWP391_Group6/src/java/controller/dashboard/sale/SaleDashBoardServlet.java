/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.OrderDBContext;
import helper.AuthenticationHelper;
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
 * @author KEISHA
 */
@WebServlet(name = "SaleDashBoardServlet", urlPatterns = {"/sale"})
public class SaleDashBoardServlet extends AuthenticationServlet {

    private static final String MAIN_PAGE = "/view/dashboard/html/sale.jsp";

    private static final int PAGE_SIZE = 10;//Default = 10

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDBContext odb = new OrderDBContext();
        List<Order> orders = null;
        int page = getPageIndex(request);
        if (AuthenticationHelper.isSaler(user)) {
            orders = odb.myOrders(user.getCus_id(), page, PAGE_SIZE);
        }
        if (AuthenticationHelper.isAdmin(user)) {
            orders = odb.getAllOrder(page, PAGE_SIZE);
        }
        request.setAttribute("orders", orders);
        request.getRequestDispatcher( MAIN_PAGE).forward(request, response);
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
