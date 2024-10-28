/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.OrderDBContext;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import model.Employee;
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
    public void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("title", WEB_TITLE);

        OrderDBContext odb = new OrderDBContext();
        //filtering params
        int page = RequestHelper.getIntParameterWithDefault("page", 1, request);
        Date startDate = RequestHelper.getDateParameterWithDefault("startdate", null, request);
        Date endDate = RequestHelper.getDateParameterWithDefault("enddate", null, request);
        String sort = RequestHelper.getStringParameterWithDefault("sort", "orderdate", request);
        String search = RequestHelper.getStringParameterWithDefault("search", "", request);
        boolean desc = RequestHelper.getCheckboxParameterWithDefault("desc", true, request);

        // employee id
        List<Order> orders = odb.getAllOrder(search, startDate, endDate, sort, desc, page, PAGE_SIZE);
        int count = odb.getTotalOrderCount(search, startDate, endDate); // pagination
        var statusTotals = odb.getStatusTotal();
        List<Integer> orderCountByWeek = odb.getOrderCountByWeek();
        request.setAttribute("orders", orders);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalCount", (int) count);
        request.setAttribute("totalPages", (int) Math.ceil((double) count / PAGE_SIZE));
        request.setAttribute("statusTotals", statusTotals);
        request.setAttribute("orderCount", orderCountByWeek);
        request.getRequestDispatcher(MAIN_PAGE).forward(request, response);
    }

}
