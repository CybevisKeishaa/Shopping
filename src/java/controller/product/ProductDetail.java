/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDetail extends HttpServlet {


    private static final int PAGE_SIZE = 2;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pageStr = request.getParameter("page");
        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
        String id = request.getParameter("product_id");
        ProductDBContext pDb = new ProductDBContext();
        Product p = pDb.getByProductId(Integer.parseInt(id));
        int bid = pDb.brandIdbyproductId(Integer.parseInt(id));
        List<Product> pList = pDb.getListProductByBrandId(bid, Integer.parseInt(id), pageNumber, PAGE_SIZE);
        int totalProducts = pDb.getTotalBrandId(bid, Integer.parseInt(id));
        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
        request.setAttribute("id", id);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("list", pList);
        request.setAttribute("data", p);
        request.getRequestDispatcher("/view/viewProductList/productDetail.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doGet(request, response);
    }

  
}
