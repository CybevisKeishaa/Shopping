package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer_User;

public abstract class BaseRequiredCustomerAuthenticationController extends HttpServlet {

    private static final String LOGIN_PAGE = "/login";

    private boolean isCustomerAuthenticated(HttpServletRequest request) {
        Customer_User customer = (Customer_User) request.getSession().getAttribute("customer");
        return customer != null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isCustomerAuthenticated(request)) {
            Customer_User customer = (Customer_User) request.getSession().getAttribute("customer");
            doGet(request, response, customer);
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isCustomerAuthenticated(request)) {
            Customer_User customer = (Customer_User) request.getSession().getAttribute("customer");
            doPost(request, response, customer);
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    @Override
    public String getServletInfo() {
        return "Base servlet for customer authentication";
    }

}
