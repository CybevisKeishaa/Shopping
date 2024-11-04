/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.makerProduct;

import controller.auth.AuthenticationServlet;
import dal.ProductDBContext;
import helper.AuthenticationHelper;
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Employee;
import model.Product;

/**
 *
 * @author DINH SON
 */
public class employeeProductList extends AuthenticationServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Employee user)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        ProductDBContext pdb = new ProductDBContext();
        Integer empId;
        if (AuthenticationHelper.isAdmin(user)) {
            empId = RequestHelper.getIntParameterWithDefault("empId", null, request);
        } else {
            empId = user.getEmp_id();
        }
        List<Product> list = pdb.getAllByEid(empId, search);
        request.setAttribute("data", list);
        request.getRequestDispatcher("view/maketer/employeeProductList.jsp").forward(request, response);
    }

}
