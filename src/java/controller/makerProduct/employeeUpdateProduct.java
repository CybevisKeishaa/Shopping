/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.makerProduct;

import dal.BrandDBContext;
import dal.CapacityDBContext;
import dal.DiscountDBContext;
import dal.GenderDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.*;

@MultipartConfig
/**
 *
 * @author DINH SON
 */
public class employeeUpdateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet employeeUpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet employeeUpdateProduct at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String product_id = request.getParameter("product_id");
        Object object = request.getSession().getAttribute("employee");
        Employee e = new Employee();
        if (object != null) {
            e = (Employee) object;
        }
        CapacityDBContext cdb = new CapacityDBContext();
        ProductDBContext pdb = new ProductDBContext();
        GenderDBContext ged = new GenderDBContext();
        String cid = request.getParameter("cid");
        Product p = null;
        Capacity c = null;
        if (cid != null) {
            c = cdb.getCapPidCid(Integer.parseInt(product_id), Integer.parseInt(cid));

        }
        List<Gender> l = ged.getAll();
        p = pdb.getByProductId(Integer.parseInt(product_id));

        List<Capacity> clist = cdb.getByListByPid(Integer.parseInt(product_id));
        DiscountDBContext db = new DiscountDBContext();
        List<Discount> dlist = db.getAll();
        BrandDBContext bd = new BrandDBContext();
        List<Brand> blist = bd.getAll();
        request.setAttribute("datab", blist);
        request.setAttribute("datad", dlist);
        request.setAttribute("p", p);
        request.setAttribute("pid", product_id);
        request.setAttribute("eid", e.getEmp_id());
        request.setAttribute("g", l);
        request.setAttribute("c", c);
        request.setAttribute("listc", clist);
        request.getRequestDispatcher("view/maketer/employeeUpdateProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String UPLOAD_DIR = "img";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String eid = request.getParameter("eid");
            String pid = request.getParameter("pid");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            String dis = request.getParameter("dis");
            String brand = request.getParameter("brand");
            String status = request.getParameter("status");
            String gender = request.getParameter("gender");
            String cid = request.getParameter("cid");
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = now.format(formatter);
            ProductDBContext pdb = new ProductDBContext(this);
            String imgId = request.getParameter("img_id");
            Part filePart = request.getPart("file");
            Product p = pdb.getByProductId(Integer.parseInt(pid));
            if (p != null) {
                pdb.updateProduct(pid, cid, Integer.parseInt(imgId), name, price, stock, formattedDate, dis, gender, brand, status, filePart,p.getImg().get(0).getImg_url());
            }

            response.sendRedirect("employeeProductList");
        } catch (Exception e) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
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
