/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AddressDBContext;
import dal.CustomerDBContext;
import dal.RoleDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Customer_User;
import model.Role;

/**
 *
 * @author DINH SON
 */
public class userDetails extends HttpServlet {

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
            out.println("<title>Servlet userDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userDetails at " + request.getContextPath() + "</h1>");
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
        CustomerDBContext c = new CustomerDBContext();
        String a_raw = request.getParameter("cus_id");
        int a = Integer.parseInt(a_raw);
        Customer_User cus = c.getDetailsByCusId(a);
        request.setAttribute("data", cus);
        RoleDBContext r=new RoleDBContext();
        List<Role> list=r.getAll();
        request.setAttribute("r", list);
        request.getRequestDispatcher("../view/ad/userDetails.jsp").forward(request, response);
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
        String cus_id = request.getParameter("cus_id");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        CustomerDBContext c = new CustomerDBContext();
        AddressDBContext ad = new AddressDBContext();
        // Retrieve the size of the address list from the form
        String sizeAddress = request.getParameter("sizeAddress");
        Map<String, String> map = new HashMap<>();
// Loop through each address based on the sizeAddress value
        for (int i = 1; i <= Integer.parseInt(sizeAddress); i++) {
            String a_id = request.getParameter("a_id" + i); // Retrieve the address ID
            String a = request.getParameter("a" + i);       // Retrieve the address string

            // Add to the map with the address ID as the key and the full address as the value
            map.put(a_id, a);
        }

// Now, iterate through the map and split the address string into its components
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String[] arr = entry.getValue().split(",");  // Split the address string by commas

            // Check if we have all parts (detail, street, ward, district, city)
            if (arr.length == 5) {
                String detail = arr[0].trim();
                String street = arr[1].trim();
                String ward = arr[2].trim();
                String district = arr[3].trim();
                String city = arr[4].trim();

                // Call the update method in your AddressDAO or equivalent
                ad.update(Integer.parseInt(entry.getKey()), detail, street, ward, district, city);
            } else {
                // Handle the case where the address is incomplete
                System.out.println("Address data is incomplete for ID: " + entry.getKey());
            }
        }

        String email = request.getParameter("email");
        String status = request.getParameter("status");
        String role=request.getParameter("role");
        c.updateUser(cus_id, status,role);

        response.sendRedirect("userdetails?cus_id=" + cus_id);
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
