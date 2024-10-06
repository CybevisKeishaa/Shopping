/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import JavaMail.EmailService;
import JavaMail.IJavaMail;
import dal.CustomerDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer_User;
import model.Gender;
import model.Role;

/**
 *
 * @author KEISHA
 */
public class RegisterServlet extends HttpServlet {

    public boolean isValidString(String input) {
        // Chỉ cho phép chữ cái, số và khoảng trắng
        return input.matches("^[\\p{L}0-9\\s]+$");
    }

    public boolean isValidPassword(String password) {
        return password.length() >= 6;
    }

    public boolean isValidPhoneNumber(String phoneNumber) {
        // Kiểm tra xem số điện thoại chỉ chứa các ký tự số
        return phoneNumber.matches("\\d+");
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
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
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_password = request.getParameter("repassword");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String raw_date = request.getParameter("dob");
        Date dob = Date.valueOf(raw_date);
        String phone = request.getParameter("phone");
        String displayname = request.getParameter("displayname");
        String email = request.getParameter("email");

        // Kiểm tra mật khẩu và nhập lại mật khẩu có khớp không
        if (!password.equals(re_password)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
            return;
        }

        CustomerDBContext db = new CustomerDBContext();

        try {
            if (db.isEmailExists(email)) {
                request.setAttribute("errorMessage", "Email already exists!");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
                return;
            }

            // Kiểm tra xem username có bị trùng không
            if (db.isUsernameExists(username)) {
                request.setAttribute("errorMessage", "Username already exists!");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
                return;
            }

            if (db.isPhoneExists(phone)) {
                request.setAttribute("errorMessage", "Phone number already exists!");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
                return;
            }

            // Kiểm tra username và fullname không chứa ký tự đặc biệt
            if (!isValidString(fullname)) {
                request.setAttribute("errorMessage", "Fullname contains invalid characters!");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
                return;
            }

            // Kiểm tra độ dài mật khẩu
            if (!isValidPassword(password)) {
                request.setAttribute("errorMessage", "Password must be at least 6 characters long!");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số điện thoại
            if (!isValidPhoneNumber(phone)) {
                request.setAttribute("errorMessage", "Phone number must contain only digits!");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng Customer_User từ thông tin đăng ký
            Customer_User cus = new Customer_User();
            cus.setDisplay_name(displayname);
            cus.setName_cus(fullname);
            cus.setEmail(email);
            cus.setC_phone(Integer.parseInt(phone));  
            cus.setPassword(password);
            cus.setUsername(username);
            cus.setDob(dob);

            // Đặt giới tính
            Gender g = new Gender();
            g.setGender_id(gender);
            cus.setGender(g);

            // Đặt vai trò
            Role r = new Role();
            r.setRole_id(4);
            cus.setRole(r);

            String verificationCode = UUID.randomUUID().toString();
            cus.setVerificationCode(verificationCode);

            // Thêm người dùng vào database
            db.insertCustomer(cus);

            // Gửi email xác thực
            String verificationLink = "http://localhost:9999/SWP391_Group6/VerificationActive?code=" + verificationCode;
            IJavaMail mailService = new EmailService();
            boolean emailSent = mailService.send(email, "Account Verification", "Please verify your account.", verificationLink);

            if (emailSent) {
                request.setAttribute("errorMessage", "Register successfully! An email has been sent to your inbox.");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Registration successful but email sending failed.");
                request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Error during registration: " + ex.getMessage());
            request.getRequestDispatcher("../view/account/register.jsp").forward(request, response);
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
