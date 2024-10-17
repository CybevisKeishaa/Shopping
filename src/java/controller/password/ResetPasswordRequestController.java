package controller.password;

import dal.CustomerDBContext;
import controller.email.EmailService;
import model.Customer_User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;


public class ResetPasswordRequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/customer/linkReset.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        CustomerDBContext db = new CustomerDBContext();

        Customer_User customer = db.getCustomerByEmail(email);

        if (customer == null) {
            request.getSession().setAttribute("errorMessage", "Email không tồn tại.");
            response.sendRedirect("link_reset"); 
            return;
        }

        String token = UUID.randomUUID().toString();
        LocalDateTime expirationTime = LocalDateTime.now().plusMinutes(5);

        db.createPasswordResetToken(customer.getCus_id(), token, expirationTime);

        String resetLink = request.getRequestURL().toString().replace(request.getServletPath(), "")
                + "/reset_password?token=" + token;
        EmailService emailService = new EmailService();
        emailService.send(email, "Đặt lại mật khẩu", resetLink);

        request.getSession().setAttribute("successMessage", "Liên kết đặt lại mật khẩu đã được gửi đến email của bạn.");
        response.sendRedirect("link_reset");
    }
}
