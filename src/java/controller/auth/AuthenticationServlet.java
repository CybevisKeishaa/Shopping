package controller.auth;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer_User;

public abstract class AuthenticationServlet extends HttpServlet {

    private static final String LOGIN_PAGE = "/login";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer_User user = (Customer_User) request.getSession().getAttribute("customer");
        if (user != null) {
            request.setAttribute("role", user.getRole().getRole_name());
            doGet(request, response, user);
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer_User user = (Customer_User) request.getSession().getAttribute("customer");
        if (user != null) {
            request.setAttribute("role", user.getRole().getRole_name());
            doPost(request, response, user);
        } else {
            request.getSession().setAttribute("errorMessage", "You need to login first.");
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            response.sendRedirect(request.getContextPath() + LOGIN_PAGE);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        super.doGet(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        super.doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Base servlet for customer authentication";
    }

}
