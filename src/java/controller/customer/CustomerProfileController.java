package controller.customer;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.AddressDBContext;
import dal.CustomerDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Address;
import model.Customer_User;

import java.io.IOException;
import java.util.ArrayList;

public class CustomerProfileController extends BaseRequiredCustomerAuthenticationController {

    private final CustomerDBContext customerDbContext = new CustomerDBContext();
    private final AddressDBContext addressDbContext = new AddressDBContext();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        int cus_id = customer.getCus_id();
        // Lấy thông tin khách hàng từ database
        Customer_User dbCustomer = customerDbContext.getCustomerById(cus_id);
        request.setAttribute("customer", dbCustomer);

        // Lấy danh sách địa chỉ của khách hàng
        ArrayList<Address> addresses = addressDbContext.getAddressByCustomerId(cus_id);
        request.setAttribute("addresses", addresses);

        request.getRequestDispatcher("/view/customer/customerProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        // Cập nhật thông tin khách hàng
        String name = request.getParameter("name_cus");
        String c_phone = request.getParameter("c_phone");
        String avatar = request.getParameter("avatar");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));

        // Cập nhật thông tin khách hàng
        customer.setName_cus(name);
        customer.setC_phone(c_phone);
        customer.setAvatar(avatar);
        customer.setGender(gender);
        customerDbContext.updateCustomer(customer);

        // Cập nhật địa chỉ 
        String addressId = request.getParameter("a_id");
        Address address = new Address();
        address.setA_phone(request.getParameter("a_phone"));
        address.setA_id(Integer.parseInt(addressId));
        address.setCity(request.getParameter("city"));
        address.setDistrict(request.getParameter("district"));
        address.setWard(request.getParameter("ward"));
        address.setStreet(request.getParameter("street"));
        address.setDetail(request.getParameter("detail"));
        address.setA_phone(c_phone);

        addressDbContext.updateAddress(address); // Cập nhật địa chỉ

        // Thiết lập thông báo thành công
        request.getSession().setAttribute("successMessage", "Cập nhật thông tin thành công!");
        response.sendRedirect(request.getContextPath() + "/customer_profile");
    }
}
