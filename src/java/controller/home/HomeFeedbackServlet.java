/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.FeedbackDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;

/**
 *
 * @author KEISHA
 */
public class HomeFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("../view/home/feedbackForHome.jsp").forward(request, response);
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

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        // Lấy các tham số từ yêu cầu
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("mobile");
        String feedback = request.getParameter("feedback");
        String ratingParam = request.getParameter("starrr");

        // Kiểm tra giá trị đầu vào
        if (!isValidName(name)) {
            request.setAttribute("errorMessage", "Tên không được chứa ký tự đặc biệt.");
            request.getRequestDispatcher("../view/home/feedbackForHome.jsp").forward(request, response);
            return;
        }

        if (!isValidEmail(email)) {
            request.setAttribute("errorMessage", "Địa chỉ email không hợp lệ.");
            request.getRequestDispatcher("../view/home/feedbackForHome.jsp").forward(request, response);
            return;
        }

        if (!isValidPhone(phone)) {
            request.setAttribute("errorMessage", "Số điện thoại không hợp lệ.");
            request.getRequestDispatcher("../view/home/feedbackForHome.jsp").forward(request, response);
            return;
        }

        int rating = Integer.parseInt(ratingParam);

        
        FeedbackDBContext db = new FeedbackDBContext();
        db.insertFeedbackForHomepage(name, rating, sqlDate, feedback, phone, email);

        
        response.sendRedirect("../view/notice/ThanksForFeedback.jsp");
    }


    private boolean isValidName(String name) {
        String nameRegex = "^[a-zA-ZÀ-ỹ\\s]+$"; 
        return Pattern.matches(nameRegex, name);
    }


    private boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        return Pattern.matches(emailRegex, email);
    }


    private boolean isValidPhone(String phone) {
        String phoneRegex = "^\\d{9,15}$";
        return Pattern.matches(phoneRegex, phone);
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
