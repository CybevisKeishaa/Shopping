/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Capacity;
import model.Customer_User;
import model.Image;
import model.Item;
import model.Product;
import model.Item;
import model.Cart;

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
            String sql = "SELECT c.cart_id, i.item_id, cu.cus_id, cu.name_cus AS customer_name, \n"
                    + "       p.product_id, p.name AS product_name, pc.unit_price AS product_price, \n"
                    + "       i.quanity AS quantity, (pc.unit_price * i.quanity) AS total_cost, \n"
                    + "       MIN(img.img_url) AS product_image, i.capacity_id, \n"
                    + "       cap.cap_value AS product_capacity, pc.stock\n"
                    + "FROM Cart c\n"
                    + "JOIN Customer cu ON c.cus_id = cu.cus_id\n"
                    + "JOIN Item i ON c.cart_id = i.cart_id\n"
                    + "JOIN Product p ON i.product_id = p.product_id\n"
                    + "LEFT JOIN Product_Image pi ON p.product_id = pi.product_id\n"
                    + "LEFT JOIN Image img ON pi.img_id = img.img_id\n"
                    + "LEFT JOIN Capacity cap ON i.capacity_id = cap.cap_id\n"
                    + "LEFT JOIN Product_Capacity pc ON pc.product_id = p.product_id AND pc.cap_id = i.capacity_id\n"
                    + "WHERE cu.cus_id = ? AND img.img_url LIKE 'product%'\n"
                    + "GROUP BY c.cart_id, i.item_id, cu.cus_id, cu.name_cus, \n"
                    + "         p.product_id, p.name, pc.unit_price, i.quanity, \n"
                    + "         i.capacity_id, cap.cap_value, pc.stock;";

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
                c.setUnit_price(rs.getInt("product_price"));
                c.setStock(rs.getInt("stock"));
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

    public int getStockByItemIDAndCapacity(int itemId, int capacityId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int stock = 0;
        try {
            String sql = "SELECT pc.stock "
                    + "FROM Product_Capacity pc "
                    + "JOIN Item i ON i.product_id = pc.product_id AND i.capacity_id = pc.cap_id "
                    + "WHERE i.item_id = ? AND i.capacity_id = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, itemId);
            stm.setInt(2, capacityId);

            rs = stm.executeQuery();

            if (rs.next()) {
                stock = rs.getInt("stock");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return stock;
    }

    public int getStockByProductIDAndCapacity(int productId, int capacityId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int stock = 0;

        try {
            // Câu truy vấn SQL để lấy số lượng tồn kho
            String sql = "SELECT stock FROM Product_Capacity WHERE product_id = ? AND cap_id = ?";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, productId);
            stm.setInt(2, capacityId);
            rs = stm.executeQuery();

            if (rs.next()) {
                stock = rs.getInt("stock");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return stock;
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
            String checkSql = "SELECT quanity FROM Item WHERE product_id = ? AND cart_id = ?";
            stm = connect.prepareStatement(checkSql);
            stm.setInt(1, productID);
            stm.setInt(2, cartID);
            rs = stm.executeQuery();

            if (rs.next()) {
                // Nếu sản phẩm đã có trong giỏ hàng, tăng số lượng lên 1
                int currentQuantity = rs.getInt("quanity");

                // Kiểm tra số lượng tồn kho
                String stockCheckSql = "SELECT stock FROM Product WHERE product_id = ?";
                stm = connect.prepareStatement(stockCheckSql);
                stm.setInt(1, productID);
                ResultSet stockResult = stm.executeQuery();

                if (stockResult.next()) {
                    int stock = stockResult.getInt("stock");
                    if (currentQuantity < stock) {
                        // Nếu số lượng sản phẩm trong giỏ ít hơn tồn kho, cập nhật số lượng
                        String updateSql = "UPDATE Item SET quanity = quanity + 1 WHERE product_id = ? AND cart_id = ?";
                        stm = connect.prepareStatement(updateSql);
                        stm.setInt(1, productID);
                        stm.setInt(2, cartID);
                        stm.executeUpdate();
                    } else {
                        // Xử lý khi số lượng trong giỏ hàng vượt quá số lượng tồn kho
                        System.out.println("Không thể thêm sản phẩm. Số lượng vượt quá tồn kho.");
                    }
                }

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

                // Kiểm tra tồn kho trước khi thêm vào giỏ hàng
                String stockCheckSql = "SELECT stock FROM Product WHERE product_id = ?";
                stm = connect.prepareStatement(stockCheckSql);
                stm.setInt(1, productID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    int stock = rs.getInt("stock");
                    if (stock > 0) {
                        // Thêm sản phẩm mới vào giỏ hàng
                        String insertSql = "INSERT INTO Item (product_id, cart_id, quanity, capacity_id) VALUES (?, ?, 1, ?)";
                        stm = connect.prepareStatement(insertSql);
                        stm.setInt(1, productID);
                        stm.setInt(2, cartID);
                        stm.setInt(3, capacityID);
                        stm.executeUpdate();
                    } else {
                        // Xử lý khi sản phẩm hết hàng
                        System.out.println("Sản phẩm đã hết hàng, không thể thêm vào giỏ hàng.");
                    }
                }
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

    public void addToCartWithDetails(int productID, int cartID, int quantity, int capacityID) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int stock = 0;
        try {

            String stockCheckSql = "SELECT stock FROM Product WHERE product_id = ?";
            stm = connect.prepareStatement(stockCheckSql);
            stm.setInt(1, productID);
            rs = stm.executeQuery();

            if (rs.next()) {
                stock = rs.getInt("stock");
                if (quantity > stock) {
                    System.out.println("Không thể thêm sản phẩm. Số lượng yêu cầu vượt quá tồn kho.");
                    return;
                }
            }

            String checkSql = "SELECT quanity FROM Item WHERE product_id = ? AND cart_id = ? AND capacity_id = ?";
            stm = connect.prepareStatement(checkSql);
            stm.setInt(1, productID);
            stm.setInt(2, cartID);
            stm.setInt(3, capacityID);
            rs = stm.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quanity");
                if (currentQuantity + quantity <= stock) {
                    String updateSql = "UPDATE Item SET quanity = quanity + ? WHERE product_id = ? AND cart_id = ? AND capacity_id = ?";
                    stm = connect.prepareStatement(updateSql);
                    stm.setInt(1, quantity);
                    stm.setInt(2, productID);
                    stm.setInt(3, cartID);
                    stm.setInt(4, capacityID);
                    stm.executeUpdate();
                } else {
                    System.out.println("Không thể thêm sản phẩm. Số lượng yêu cầu vượt quá tồn kho.");
                }
            } else {
                String insertSql = "INSERT INTO Item (product_id, cart_id, quanity, capacity_id) VALUES (?, ?, ?, ?)";
                stm = connect.prepareStatement(insertSql);
                stm.setInt(1, productID);
                stm.setInt(2, cartID);
                stm.setInt(3, quantity);
                stm.setInt(4, capacityID);
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
        CartDBContext cartDb = new CartDBContext();
        Cart c = cartDb.getCartByCustomer(1);
        System.out.println(c.getCart_id());

            int productID = 1; // ID của sản phẩm muốn thêm
            int cartID = 7;    // ID của giỏ hàng muốn thêm
            int quantity = 3;  // Số lượng muốn thêm
            int capacityID = 1; // Dung tích hoặc ID của phiên bản sản phẩm

            // Gọi hàm addToCartWithDetails để thêm sản phẩm vào giỏ hàng
            cartDb.addToCartWithDetails(productID, cartID, quantity, capacityID);

            
    }

}
