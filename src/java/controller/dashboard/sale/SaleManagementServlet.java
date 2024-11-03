/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard.sale;

import controller.auth.AuthenticationServlet;
import dal.EmployeeDBContext;
import dal.OrderDBContext;
import static helper.AuthenticationHelper.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
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

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
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
        //filtering params
        List<Order> orders = odb.getAllNoEmployeeOrder();
        List<Employee> employees = edb.getAllByRole(SALER_ROLE);

        List<Integer> orderCounts = new ArrayList<Integer>();
        for (Employee employee : employees) {
            int count = odb.getTotalOrderCount("", null, null, employee.getEmp_id());
            orderCounts.add(count);
        }
        request.setAttribute("orders", orders);
        request.setAttribute("employees", employees);
        request.setAttribute("employeeOrders", orderCounts);
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
        String[] assigns = request.getParameterValues("order-to-employee");
        if (assigns != null) {
            for (String assign : assigns) {
                try {
                    int orderId = Integer.parseInt(assign.split("-")[0]);
                    int employeeId = Integer.parseInt(assign.split("-")[1]);
                    boolean result = odb.updateOrderEmployeeID(orderId, employeeId);
                    System.out.println(result + "-" + orderId + "-" + employeeId);
                } catch (Exception e) {
                    // do nothing
                    System.out.println("throwed:" + assign);
                }
            }
        }
        doGet(request, response, user);
    }
}
