package controller.auth;

import dal.CartDBContext;
import dal.CustomerDBContext;
import dal.EmployeeDBContext;
import helper.AuthenticationHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Cart;
import model.Customer_User;
import model.Employee;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String errorMessage = (String) session.getAttribute("errorMessage");

        session.removeAttribute("errorMessage");
        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("requestURI", request.getRequestURI());

        request.getRequestDispatcher("/view/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        boolean isEmployeeLogin = request.getRequestURI().contains("employee");
        // Customer Login
        if (isEmployeeLogin) {
            // Employee Login
            EmployeeDBContext db = new EmployeeDBContext();
            Employee employee = db.getEmployeeAccountByEmail(email, password);

            if (employee != null) {
                int empID = employee.getEmp_id();
                CartDBContext cartDB = new CartDBContext();
                Cart cart = cartDB.getCartByCustomer(empID);
                session.setAttribute("cart", cart);
                session.setAttribute("customer", employee);

                response.sendRedirect("../market");
            } else {
                session.setAttribute("errorMessage", "Invalid email or password");
                response.sendRedirect(request.getContextPath() + "/login/employee");
            }
        } else {
            CustomerDBContext db = new CustomerDBContext();
            Customer_User customer = db.getCustomerAccountByEmail(email, password);

            if (customer != null) {
                int customerID = customer.getCus_id();
                CartDBContext cartDB = new CartDBContext();
                Cart cart = cartDB.getCartByCustomer(customerID);
                session.setAttribute("cart", cart);
                session.setAttribute("customer", customer);

                if (AuthenticationHelper.isCustomer(customer)) {
                    response.sendRedirect("homepage");
                } else {
                    response.sendRedirect("dashboard");
                }
            } else {
                session.setAttribute("errorMessage", "Invalid email or password");
                response.sendRedirect(request.getContextPath() + "/login");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "CustomerLoginController: Handles customer login functionality.";
    }
}
