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
import helper.RequestHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        List<Gender> l = ged.getAll();
        Product p = pdb.getByProductId(Integer.parseInt(product_id));

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
            String[] cids = request.getParameterValues("cid");
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = now.format(formatter);
            ProductDBContext pdb = new ProductDBContext(this);
            String imgId = request.getParameter("img_id");
            Part filePart = request.getPart("file");
            Product p = pdb.getByProductId(Integer.parseInt(pid));
            //Capacity
            CapacityDBContext cdb = new CapacityDBContext();
            ArrayList<Capacity> cList = new ArrayList<>();
            if (cids != null) {
                for (String cid : cids) {
                    final int capId = Integer.parseInt(cid);
                    Integer unitPrice = RequestHelper.getIntParameterWithDefault("price" + cid, null, request);
                    if (unitPrice == null) {
                        request.setAttribute("errorMessage", "Please add price and stock");
                        break;
                    }
                    Capacity c = cdb.getCapPidCid(Integer.parseInt(pid), capId);
                    c.setUnit_price(unitPrice);
                    cList.add(c);
                }
            }
            System.out.println(cList);
            if (p != null) {
                boolean result = pdb.updateProduct(pid, cList, Integer.parseInt(imgId), name, price, stock, formattedDate, dis, gender, brand, status, filePart, p.getImg().get(0).getImg_url());
                if (result) {
                    response.sendRedirect("employeeProductList");
                    return;
                } else {
                    response.sendRedirect("employeeUpdateProduct?product_id=" + pid);
                }
            }

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
