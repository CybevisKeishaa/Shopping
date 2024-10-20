/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import controller.auth.AuthenticationServlet;
import controller.auth.BaseRequiredCustomerAuthenticationController;
import helper.AuthenticationHelper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer_User;

/**
 *
 */
@WebServlet(name = "DashboardServlet", urlPatterns = {"/dashboard"})
public class DashboardServlet extends AuthenticationServlet {

    private static final String MAIN_PAGE = "/view/dashboard/html/index.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,Customer_User user)
            throws ServletException, IOException {
        if (AuthenticationHelper.isAdmin(user)) {
            request.getRequestDispatcher(MAIN_PAGE).forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        }
    }

}
