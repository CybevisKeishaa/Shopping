/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customer;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.AddressDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Address;
import model.Customer_User;

/**
 *
 * @author KEISHA
 */
public class insertAddressServlet extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        request.getRequestDispatcher("../../view/customer/insertAddress.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String phone = request.getParameter("a_phone");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String street = request.getParameter("street");
        String detail = request.getParameter("detail");

        
        int cusID = user.getCus_id();

        // Tạo đối tượng Address với dữ liệu nhận được
        Address address = new Address();
        address.setA_phone(phone);
        address.setCity(city);
        address.setDistrict(district);
        address.setWard(ward);
        address.setStreet(street);
        address.setDetail(detail);

        // Chèn địa chỉ vào cơ sở dữ liệu
        AddressDBContext addressDB = new AddressDBContext();
        addressDB.insertAddressByCustomerID(address, cusID);

        // Chuyển hướng đến trang danh sách địa chỉ sau khi thêm thành công
        response.sendRedirect(request.getContextPath() + "/customer_profile");
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
