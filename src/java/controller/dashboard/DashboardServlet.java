/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.dashboard;

import controller.auth.AuthenticationServlet;
import helper.AuthenticationHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Customer_User;

/**
 *
 * 
 */
@WebServlet(name = "DashboardServlet", urlPatterns = {"/dashboard"})
public class DashboardServlet extends AuthenticationServlet {

    private static final String MAIN_PAGE = "/admin/homepage";
    private static final String SALER_PAGE = "/sale";
    private static final String MARKETER_PAGE = "/market";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {

        if (AuthenticationHelper.isAdmin(user)) {
            response.sendRedirect(request.getContextPath() + MAIN_PAGE);
        } else if (AuthenticationHelper.isSaler(user)) {
            response.sendRedirect(request.getContextPath() + SALER_PAGE);
        } else if (AuthenticationHelper.isMarketer(user)) {
            response.sendRedirect(request.getContextPath() + MARKETER_PAGE);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
        }
        
    }

}
