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
import model.Capacity;
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
            String sql = "SELECT c.cart_id, i.item_id, cu.cus_id, cu.name_cus AS customer_name, p.product_id, p.name AS product_name, p.price AS product_price, i.quanity AS quantity, (p.price * i.quanity) AS total_cost, MIN(img.img_url) AS product_image, i.capacity_id, cap.cap_value AS product_capacity \n"
                    + "FROM Cart c \n"
                    + "JOIN Customer cu ON c.cus_id = cu.cus_id \n"
                    + "JOIN Item i ON c.cart_id = i.cart_id \n"
                    + "JOIN Product p ON i.product_id = p.product_id \n"
                    + "LEFT JOIN Product_Image pi ON p.product_id = pi.product_id \n"
                    + "LEFT JOIN Image img ON pi.img_id = img.img_id \n"
                    + "LEFT JOIN Capacity cap ON i.capacity_id = cap.cap_id \n"
                    + "WHERE cu.cus_id = ?\n"
                    + "GROUP BY c.cart_id, i.item_id, cu.cus_id, cu.name_cus, p.product_id, p.name, p.price, i.quanity, i.capacity_id, cap.cap_value;";

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

                GenderDBContext genDB = new GenderDBContext();
                product.setGender(genDB.getGenderByProductID(product.getProduct_id()));
                BrandDBContext brandDB = new BrandDBContext();
                product.setBrand(brandDB.getBrandByProductId(product.getProduct_id()));
                CapacityDBContext capaDB = new CapacityDBContext();
                product.setCapacity(capaDB.getCapacityByProductId(product.getProduct_id()));

                ArrayList<Image> imgs = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("product_image"));
                imgs.add(i);
                product.setImg(imgs);
                Capacity c = new Capacity();
                c.setCapacity_id(rs.getInt("capacity_id"));
                c.setValue(rs.getInt("product_capacity"));
                item.setCapacity(c);

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

    public void minusAQuantity(int itemID) {
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

    public void plusAQuantity(int itemID) {
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

//    public void addToCart(int productID, int cartID) {
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            String checkSql = "SELECT 1 FROM Item WHERE product_id = ? AND cart_id = ?";
//            stm = connect.prepareStatement(checkSql);
//            stm.setInt(1, productID);
//            stm.setInt(2, cartID);
//            rs = stm.executeQuery();
//
//            if (rs.next()) {
//                String updateSql = "UPDATE Item SET quanity = quanity + 1 WHERE product_id = ? AND cart_id = ?";
//                stm = connect.prepareStatement(updateSql);
//                stm.setInt(1, productID);
//                stm.setInt(2, cartID);
//                stm.executeUpdate();
//            } else {
//                String insertSql = "INSERT INTO Item (product_id, cart_id, quanity) VALUES (?, ?, 1)";
//                stm = connect.prepareStatement(insertSql);
//                stm.setInt(1, productID);
//                stm.setInt(2, cartID);
//                stm.executeUpdate();
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (stm != null) {
//                    stm.close();
//                }
//            } catch (SQLException ex) {
//                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//    }
    public void addToCart(int productID, int cartID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            String checkSql = "SELECT 1 FROM Item WHERE product_id = ? AND cart_id = ?";
            stm = connect.prepareStatement(checkSql);
            stm.setInt(1, productID);
            stm.setInt(2, cartID);
            rs = stm.executeQuery();

            if (rs.next()) {
                // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng lên 1
                String updateSql = "UPDATE Item SET quanity = quanity + 1 WHERE product_id = ? AND cart_id = ?";
                stm = connect.prepareStatement(updateSql);
                stm.setInt(1, productID);
                stm.setInt(2, cartID);
                stm.executeUpdate();
            } else {
                

                // Lấy capacity_id mặc định từ bảng Product_Capacity
                String capacitySql = "SELECT MIN(cap_id) AS capacity_id FROM Product_Capacity WHERE product_id = ?";
                stm = connect.prepareStatement(capacitySql);
                stm.setInt(1, productID);
                rs = stm.executeQuery();
                int capacityID = 1;  // Giả sử giá trị mặc định là 1 nếu không có dung tích
                if (rs.next()) {
                    capacityID = rs.getInt("capacity_id");
                }

                // Thêm sản phẩm mới vào giỏ hàng với gender_id và capacity_id
                String insertSql = "INSERT INTO Item (product_id, cart_id, quanity, capacity_id) VALUES (?, ?, 1, ?)";
                stm = connect.prepareStatement(insertSql);
                stm.setInt(1, productID);
                stm.setInt(2, cartID);
                
                stm.setInt(3, capacityID);
                stm.executeUpdate();
            }
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
    }

    public void deleteAnItem(int itemID) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE FROM Item \n"
                    + "WHERE item_id = ?;";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, itemID);
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

    public void updateCartQuantity(int itemID, int newQuantity, int capacityID) {
        PreparedStatement stm = null;
        try {
            String sql = "UPDATE Item "
                    + "SET quanity = ?, capacity_id = ? "
                    + "WHERE item_id = ?";

            stm = connect.prepareStatement(sql);

            stm.setInt(1, newQuantity);
            stm.setInt(2, capacityID);
            stm.setInt(3, itemID);

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public static void main(String[] args) {
        // Khởi tạo đối tượng CartDBContext để gọi hàm addToCart
        CartDBContext cartDB = new CartDBContext();

        // Thử thêm một sản phẩm với productID = 2 vào giỏ hàng của user với cartID = 7
        int productID = 2;
        int cartID = 7;

        // Thực hiện gọi hàm addToCart
        cartDB.addToCart(productID, cartID);

        // In ra thông báo để kiểm tra
        System.out.println("Product ID " + productID + " has been added to Cart ID " + cartID);
    }

}
