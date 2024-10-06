package controller.order;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import JavaMail.EmailService;
import JavaMail.IJavaMail;
import controller.auth.BaseRequiredCustomerAuthenticationController;
import dal.OrderDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer_User;

/**
 *
 * @author KEISHA
 */
public class ChangeOrderStatusServlet extends BaseRequiredCustomerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Customer_User user)
            throws ServletException, IOException {
        int orderID = Integer.parseInt(request.getParameter("order_id"));
        OrderDBContext db = new OrderDBContext();
        db.updateOrderStatus(orderID, 4);
        String email = user.getEmail();

        String contextPath = request.getContextPath(); // Lấy context path của ứng dụng
        String verificationLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + contextPath + "/account/feedback";
        IJavaMail mailService = new EmailService();
        boolean emailSent = mailService.send(email, "Thank you", "Cảm ơn quý khách đã sử dụng sản phẩm của chúng tôi, hãy để lại đánh giá để chúng tôi có thể nâng cao trải nghiệm dịch vụ của bạn cho những lần tiếp theo", verificationLink);

        if (emailSent) {            
            request.getRequestDispatcher("../../view/notice/ThanksForBuy.jsp").forward(request, response);
        } else {           
            request.getRequestDispatcher("../../view/notice/ThanksForBuy.jsp").forward(request, response);
        }
    }
    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
