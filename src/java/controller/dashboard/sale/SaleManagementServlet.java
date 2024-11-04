/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.EmployeeDBContext;
import dal.OrderDBContext;
import static helper.AuthenticationHelper.*;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
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
    private static final int PAGE_SIZE = 10; // Default 10

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("title", WEB_TITLE);
        OrderDBContext odb = new OrderDBContext();
        EmployeeDBContext edb = new EmployeeDBContext();
        boolean isAllowRole = isAllowedRole(user, new String[]{SALER_MANAGER_ROLE});
        if (!isAllowRole) {
            response.sendRedirect(request.getContextPath() + "/login/employee");
            return;
        }
        // filtering params
        int page = RequestHelper.getIntParameterWithDefault("page", 1, request);
        Integer empId = RequestHelper.getIntParameterWithDefault("employeeId", null, request);
        Date startDate = RequestHelper.getDateParameterWithDefault("startdate", null, request);
        Date endDate = RequestHelper.getDateParameterWithDefault("enddate", null, request);
        String sort = RequestHelper.getStringParameterWithDefault("sort", "orderdate", request);
        String search = RequestHelper.getStringParameterWithDefault("search", "", request);
        boolean desc = RequestHelper.getCheckboxParameterWithDefault("desc", true, request);
        // get data
        List<Order> orders = odb.getAllOrder(search, startDate, endDate, empId, sort, desc, page, PAGE_SIZE);
        int count = odb.getTotalOrderCount(search, startDate, endDate, empId); 
        List<Employee> employees = edb.getAllByRole(SALER_ROLE);
        List<Integer> orderCounts = new ArrayList<Integer>();
        for (Employee employee : employees) {
            int countOrderByEmp = odb.getTotalOrderCount("", null, null, employee.getEmp_id());
            orderCounts.add(countOrderByEmp);
        }
        request.setAttribute("orders", orders);
        request.setAttribute("employees", employees);
        request.setAttribute("employeeOrders", orderCounts);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalCount", (int) count);
        request.setAttribute("totalPages", (int) Math.ceil((double) count / PAGE_SIZE));
        request.getRequestDispatcher(MAIN_PAGE).forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("title", WEB_TITLE);
        OrderDBContext odb = new OrderDBContext();
        EmployeeDBContext edb = new EmployeeDBContext();

        boolean isAllowRole = isAllowedRole(user, new String[]{SALER_MANAGER_ROLE});
        if (!isAllowRole) {
            response.sendError(response.SC_FORBIDDEN);
            return;
        }
        String[] changes = request.getParameterValues("change"); // orderId = 61,60
        if (changes != null) {
            for (String change : changes) {
                try {
                    int orderId = Integer.parseInt(change);
                    Integer employeeId = RequestHelper.getIntParameterWithDefault("order" + orderId, null, request);//order61
                    if (employeeId != null) {
                        odb.updateOrderEmployeeID(orderId, employeeId);
                    }
                } catch (Exception e) {
                }
            }
        }
        doGet(request, response, user);
    }
}
