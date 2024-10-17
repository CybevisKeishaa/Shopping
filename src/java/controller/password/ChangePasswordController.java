package controller.password;

import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.CustomerDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer_User;

public class ChangePasswordController extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/customer/changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User customer)
            throws ServletException, IOException {
        CustomerDBContext db = new CustomerDBContext();
        int cus_id = customer.getCus_id();

        Customer_User dbCustomer = db.getCustomerById(cus_id);

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu hiện tại từ cơ sở dữ liệu
        if (dbCustomer != null && dbCustomer.getPassword() != null && dbCustomer.getPassword().equals(currentPassword)) {

            // Kiểm tra nếu mật khẩu mới và xác nhận mật khẩu giống nhau
            if (newPassword != null && newPassword.equals(confirmPassword)) {

                // Kiểm tra các điều kiện của mật khẩu mới
                boolean hasLetter = newPassword.matches(".*[A-Za-z].*"); // Có ít nhất một chữ cái
                boolean hasDigit = newPassword.matches(".*\\d.*"); // Có ít nhất một số
                boolean isValidLength = newPassword.length() >= 5; // Tối thiểu 5 ký tự
                boolean hasNoSpecialChar = newPassword.matches("[A-Za-z\\d]+"); // Không có ký tự đặc biệt

                // Kiểm tra các điều kiện
                if (!isValidLength) {
                    request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải có ít nhất 5 ký tự.");
                } else if (!hasLetter) {
                    request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải chứa ít nhất một chữ cái.");
                } else if (!hasDigit) {
                    request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải chứa ít nhất một số.");
                } else if (!hasNoSpecialChar) {
                    request.getSession().setAttribute("errorMessage", "Mật khẩu mới không được chứa ký tự đặc biệt.");
                } else if (newPassword.equals(currentPassword)) {
                    request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải khác với mật khẩu cũ.");
                } else {
                    db.changePassword(cus_id, newPassword);
                    request.getSession().setAttribute("successMessage", "Mật khẩu đã được thay đổi thành công.");
                    response.sendRedirect(request.getContextPath() + "/change_password");
                    return;
                }
            } else {
                request.getSession().setAttribute("errorMessage", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
            }
        } else {
            request.getSession().setAttribute("errorMessage", "Mật khẩu hiện tại không đúng.");
        }

        response.sendRedirect(request.getContextPath() + "/change_password");
    }

}
