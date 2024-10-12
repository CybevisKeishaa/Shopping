package controller.password;

import dal.CustomerDBContext;
import model.PasswordResetToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;

public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        CustomerDBContext db = new CustomerDBContext();
        PasswordResetToken passwordResetToken = db.getToken(token);

        if (passwordResetToken == null || passwordResetToken.getExpirationTime().isBefore(LocalDateTime.now())) {
            if (passwordResetToken != null) {
                db.deleteToken(token);
            }
            request.getSession().setAttribute("errorMessage", "Liên kết đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.");
            response.sendRedirect("link_reset");
            return;
        }

        request.setAttribute("token", token);
        request.getRequestDispatcher("/view/customer/resetPassword.jsp").forward(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        CustomerDBContext db = new CustomerDBContext();
        PasswordResetToken passwordResetToken = db.getToken(token);

        if (passwordResetToken == null || passwordResetToken.getExpirationTime().isBefore(LocalDateTime.now())) {
            if (passwordResetToken != null) {
                db.deleteToken(token);
            }
            request.getSession().setAttribute("errorMessage", "Liên kết đặt lại mật khẩu không hợp lệ hoặc đã hết hạn.");
            response.sendRedirect("link_reset");
            return;
        }

        // Kiểm tra mật khẩu mới
        boolean isValidLength = newPassword.length() >= 5;
        boolean hasLetter = newPassword.matches(".*[a-zA-Z].*");
        boolean hasDigit = newPassword.matches(".*[0-9].*");
        boolean hasNoSpecialChar = !newPassword.matches(".*[^a-zA-Z0-9].*");

        if (!isValidLength) {
            request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải có ít nhất 5 ký tự.");
        } else if (!hasLetter) {
            request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải chứa ít nhất một chữ cái.");
        } else if (!hasDigit) {
            request.getSession().setAttribute("errorMessage", "Mật khẩu mới phải chứa ít nhất một số.");
        } else if (!hasNoSpecialChar) {
            request.getSession().setAttribute("errorMessage", "Mật khẩu mới không được chứa ký tự đặc biệt.");
        } else if (!newPassword.equals(confirmPassword)) {
            request.getSession().setAttribute("errorMessage", "Mật khẩu mới và mật khẩu xác nhận không khớp.");
        } else {
            db.changePassword(passwordResetToken.getCus_id(), newPassword);
            db.deleteToken(token);
            request.getSession().setAttribute("successMessage", "Mật khẩu đã được thay đổi thành công.");
            response.sendRedirect("login");
            return;
        }

        // Chuyển hướng lại về trang đặt lại mật khẩu nếu có lỗi
        response.sendRedirect(request.getRequestURI() + "?token=" + token); // Đảm bảo token vẫn còn trong URL
    }
}
