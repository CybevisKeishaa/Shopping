/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.makerProduct;

import dal.CapacityDBContext;
import dal.HistoryDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import model.*;

/**
 *
 * @author DINH SON
 */
public class employeeImportGoods extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("product_id");
        ProductDBContext pdb = new ProductDBContext();
        CapacityDBContext cdb = new CapacityDBContext();
        List<Capacity> list = cdb.getByListByPid(Integer.parseInt(productId));
        request.setAttribute("clist", list);
        request.setAttribute("product_id", productId);
        request.getRequestDispatcher("view/maketer/employeeImportGoods.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_id = request.getParameter("product_id");
        String name = request.getParameter("name"); // nhập tên của hàng nhập vào
        String stock = request.getParameter("stock");
        String cid = request.getParameter("cid");
        HistoryDBContext hdb = new HistoryDBContext();
        LocalDateTime now = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = now.format(formatter);
        hdb.addHistory(product_id, stock, name, cid, formattedDate);
        response.sendRedirect("employeeProductList");
    }

    
}
