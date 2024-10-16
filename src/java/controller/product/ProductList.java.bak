/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;


import dal.BrandDBContext;
import dal.CapacityDBContext;
import dal.GenderDBContext;



import dal.ProductListDBContext;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

import model.*;

/**
 * @author DINH SON
 */
public class ProductList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet product_list</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product_list at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final int PAGE_SIZE = 6;


//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String brandid = request.getParameter("brandid");
//        String capacityid = request.getParameter("capacityid");
//        String genderid = request.getParameter("genderid");
//        productListDBContext pDb = new productListDBContext();
//        if (brandid != null && capacityid == null && genderid == null) {
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//
//            List<Product> list = pDb.getAllByBrandId(Integer.parseInt(brandid), pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotalProductByBrandId(Integer.parseInt(brandid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        } else if (brandid == null && capacityid != null && genderid == null) {
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list = pDb.getAllByCapid(Integer.parseInt(capacityid), pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotalProductByBrandId(Integer.parseInt(capacityid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        } else if (brandid == null && capacityid == null & genderid != null) {
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list = pDb.getAllByGeid(Integer.parseInt(genderid), pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotapProductByGeid(Integer.parseInt(genderid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        }else if(brandid == null && capacityid != null & genderid != null){
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list=pDb.getAllByCapIdGeid(Integer.parseInt(capacityid), Integer.parseInt(genderid), pageNumber, PAGE_SIZE);
//             int totalProducts = pDb.getTotalByCapidGeId(Integer.parseInt(capacityid),Integer.parseInt(genderid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        }else if(brandid != null && capacityid == null & genderid != null){
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list = pDb.getAllByBrandIdGeid(Integer.parseInt(brandid), Integer.parseInt(genderid), pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotalBrandidgeid(Integer.parseInt(brandid),Integer.parseInt(genderid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        } else if (brandid != null && capacityid != null & genderid == null) {
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list = pDb.getAllByBrandIdCapacityid(Integer.parseInt(brandid), Integer.parseInt(capacityid), pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotalProductByCapid(Integer.parseInt(capacityid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        } else if (brandid != null && capacityid != null & genderid != null) {
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list = pDb.getAllByBrandIdCapIdGenderId(Integer.parseInt(brandid), Integer.parseInt(capacityid), Integer.parseInt(genderid), pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotalProductByBrandIdCapIdGenId(Integer.parseInt(brandid), Integer.parseInt(capacityid), Integer.parseInt(genderid));
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//            request.setAttribute("data", list);
//        } else {
//            String pageStr = request.getParameter("page");
//            int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;
//            List<Product> list = pDb.getAll(pageNumber, PAGE_SIZE);
//            int totalProducts = pDb.getTotalProduct();
//            int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);
//
//            request.setAttribute("currentPage", pageNumber);
//            request.setAttribute("totalPages", totalPages);
//
//            request.setAttribute("data", list);
//        }
//        BrandDBContext bBd = new BrandDBContext();
//        List<Brand> brandList = bBd.getAll();
//        CapacityDBContext cBd = new CapacityDBContext();
//        List<Capacity> capacityList = cBd.getAll();
//        GenderDBContext gDb = new GenderDBContext();
//        List<Gender> genderList = gDb.getAll();
//        request.setAttribute("listCapacity", capacityList);
//        request.setAttribute("listBrand", brandList);
//        request.setAttribute("genderList", genderList);
//
//        request.getRequestDispatcher("view/viewProductList/productList.jsp").forward(request, response);
//    }

   


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] brandIds = req.getParameterValues("brandid");
        String[] capacityIds = req.getParameterValues("capacityid");
        String[] genderIds = req.getParameterValues("genderid");
        String[] priceIds = req.getParameterValues("priceid");

        ProductListDBContext pDb = new ProductListDBContext();

        String pageStr = req.getParameter("page");
        int pageNumber = (pageStr != null) ? Integer.parseInt(pageStr) : 1;

        List<Product> list = pDb.getListProduct(brandIds, capacityIds, genderIds, priceIds, pageNumber, PAGE_SIZE);

        int totalProducts = pDb.countTotalProduct(brandIds, capacityIds, genderIds, priceIds);
        int totalPages = (int) Math.ceil(totalProducts / (double) PAGE_SIZE);

        req.setAttribute("currentPage", pageNumber);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("data", list);

        BrandDBContext bBd = new BrandDBContext();
        List<Brand> brandList = bBd.getAll();
        CapacityDBContext cBd = new CapacityDBContext();
        List<Capacity> capacityList = cBd.getAll();
        GenderDBContext gDb = new GenderDBContext();
        List<Gender> genderList = gDb.getAll();
        req.setAttribute("listCapacity", capacityList);
        req.setAttribute("listBrand", brandList);
        req.setAttribute("genderList", genderList);
        req.setAttribute("priceRanges", PriceRange.values);
        req.setAttribute("newItems", pDb.getNewProducts());
        req.setAttribute("hotItems", pDb.getHotProducts());

        req.getRequestDispatcher("view/viewProductList/productList.jsp").forward(req, resp);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
