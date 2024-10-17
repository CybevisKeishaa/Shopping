package controller.home;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import dal.BlogDBContext;
import dal.CartDBContext;
import dal.ProductDBContext;
import dal.SliderDBContext;
import jakarta.mail.Session;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import model.Blog;
import model.Cart;
import model.Customer_User;
import model.Product;
import model.Slider;

/**
 *
 * @author KEISHA
 */
@WebServlet(urlPatterns = {"/homePage"})
public class HomePageServlet extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
            BlogDBContext blogdb = new BlogDBContext();
            SliderDBContext sliderdb = new SliderDBContext();
            ProductDBContext productdb = new ProductDBContext();

            ArrayList<Slider> sliders = sliderdb.getSliderForHomepage();
            ArrayList<Blog> blogs = blogdb.getBlogForHomepage();
            ArrayList<Product> products = productdb.getDiscountProductForHomepage();
            ArrayList<Product> newProducts = productdb.getNewestProductForHomepage();
            Customer_User user = (Customer_User) request.getSession().getAttribute("customer");
            if (user != null) {
                CartDBContext cartdb = new CartDBContext();
                Cart c = cartdb.getCartByCustomer(user.getCus_id());
                request.setAttribute("cart", c);
                
            }else{
                response.getWriter().print("Khong co nguoi dung");
            }

            request.setAttribute("newProducts", newProducts);
            request.setAttribute("products", products);
            request.setAttribute("blogs", blogs);
            request.setAttribute("sliders", sliders);
            request.getRequestDispatcher("/view/home/homepage.jsp").forward(request, response);
        }catch (Exception ex){
            java.util.logging.Logger.getLogger(HomePageServlet.class.getName(), ex.getMessage());
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold
}
