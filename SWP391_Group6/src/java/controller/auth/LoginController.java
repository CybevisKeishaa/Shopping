package controller.auth;

import dal.CustomerDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer_User;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String errorMessage = (String) session.getAttribute("errorMessage");
        session.removeAttribute("errorMessage");  
        request.setAttribute("errorMessage", errorMessage); 
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        CustomerDBContext db = new CustomerDBContext();
        Customer_User customer = db.getCustomerAccountByEmail(email, password);

        
        
        
        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("homepage");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Invalid email or password");
            response.sendRedirect("login");
        }
    }

    @Override
    public String getServletInfo() {
        return "CustomerLoginController: Handles customer login functionality.";
    }
}
