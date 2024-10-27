/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.makerProduct;

import dal.BrandDBContext;
import dal.DiscountDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.*;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import model.Image;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.Date;

@MultipartConfig

/**
 *
 * @author DINH SON
 */
public class employeeAddProduct extends HttpServlet {

    private static final String UPLOAD_DIR = "img";

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
            out.println("<title>Servlet employeeAddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet employeeAddProduct at " + request.getContextPath() + "</h1>");
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
        Object object = request.getSession().getAttribute("employee");
        Employee e = new Employee();
        if (object != null) {
            e = (Employee) object;
        }
        DiscountDBContext db = new DiscountDBContext();
        List<Discount> dlist = db.getAll();
        BrandDBContext bd = new BrandDBContext();
        List<Brand> blist = bd.getAll();
        request.setAttribute("eid", e.getEmp_id());
        request.setAttribute("datab", blist);
        request.setAttribute("datad", dlist);
        request.getRequestDispatcher("view/maketer/employeeAddProduct.jsp").forward(request, response);

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
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        String eid = request.getParameter("eid");
        String name = request.getParameter("name");
        String stock = request.getParameter("stock");
        String dis = request.getParameter("dis");
        String brand = request.getParameter("brand");

        LocalDateTime now = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = now.format(formatter);
        ProductDBContext pdb = new ProductDBContext();
        String fileName = null;
        String filePath = null;
        for (Part part : request.getParts()) {
            fileName = extractFileName(part);
            if (fileName != null && !fileName.isEmpty()) {
                filePath = uploadFilePath + File.separator + fileName;
                part.write(filePath);
                pdb.insertProduct(eid, name, brand, stock, formattedDate, dis, brand, filePath,fileName);

            }
        }
        response.sendRedirect("employeeProductList");
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf('=') + 2, item.length() - 1);
            }
        }
        return null;
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
