/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer_User;
import model.Image;
import model.Item;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class CartDBContext extends DBContext<Cart> {

    public Cart getCartByCustomer(int cusID) {
        Cart cart = new Cart();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT TOP 3 c.cart_id, i.item_id, cu.cus_id, cu.name_cus AS customer_name, p.product_id, p.name AS product_name, p.price AS product_price, i.quanity AS quantity, (p.price * i.quanity) AS total_cost, MIN(img.img_url) AS product_image "
                    + "FROM Cart c "
                    + "JOIN Customer cu ON c.cus_id = cu.cus_id "
                    + "JOIN Item i ON c.cart_id = i.cart_id "
                    + "JOIN Product p ON i.product_id = p.product_id "
                    + "LEFT JOIN Product_Image pi ON p.product_id = pi.product_id "
                    + "LEFT JOIN Image img ON pi.img_id = img.img_id "
                    + "WHERE cu.cus_id = ? "
                    + "GROUP BY c.cart_id, i.item_id, cu.cus_id, cu.name_cus, p.product_id, p.name, p.price, i.quanity";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, cusID);

            rs = stm.executeQuery();

            ArrayList<Item> items = new ArrayList<>();
            while (rs.next()) {
                cart.setCart_id(rs.getInt("cart_id"));

                Customer_User customer = new Customer_User();
                customer.setCus_id(rs.getInt("cus_id"));
                customer.setName_cus(rs.getString("customer_name"));
                cart.setCustomer(customer);

                Item item = new Item();
                item.setItem_id(rs.getInt("item_id"));

                Product product = new Product();
                product.setProduct_id(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));
                product.setPrice(rs.getInt("product_price"));

                ArrayList<Image> imgs = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("product_image"));
                imgs.add(i);
                product.setImg(imgs);

                item.setProduct(product);
                item.setQuantity(rs.getInt("quantity"));

                items.add(item);
            }
            cart.setItems(items);
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return cart;
    }

    public void deleteAQuantity(int itemID) {
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE Item SET quanity = quanity - 1 WHERE item_id = ? AND quanity > 0";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, itemID);  // Binding parameter
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addAQuantity(int itemID) {
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE Item SET quanity = quanity + 1 WHERE item_id = ?";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, itemID);  // Binding parameter
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void addToCart(int productID, int cartID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String checkSql = "SELECT 1 FROM Item WHERE product_id = ? AND cart_id = ?";
            stm = connect.prepareStatement(checkSql);
            stm.setInt(1, productID);
            stm.setInt(2, cartID);
            rs = stm.executeQuery();

            if (rs.next()) {
                String updateSql = "UPDATE Item SET quanity = quanity + 1 WHERE product_id = ? AND cart_id = ?";
                stm = connect.prepareStatement(updateSql);
                stm.setInt(1, productID);
                stm.setInt(2, cartID);
                stm.executeUpdate();
            } else {
                String insertSql = "INSERT INTO Item (product_id, cart_id, quanity) VALUES (?, ?, 1)";
                stm = connect.prepareStatement(insertSql);
                stm.setInt(1, productID);
                stm.setInt(2, cartID);
                stm.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void main(String[] args) {
        CartDBContext c = new CartDBContext();
        c.addToCart(2, 7);

    }

}
