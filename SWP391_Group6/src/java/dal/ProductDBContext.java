/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Product;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Discount;
import model.Gender;
import model.Image;

/**
 *
 * @author KEISHA
 */
public class ProductDBContext extends DBContext<Product> {

    public ArrayList<Product> getDiscountProductForHomepage() {

        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT p.product_id, p.name, p.price, g.name AS gname, d.name AS dname, d.discount_amount, i.img_url\n"
                    + "FROM dbo.Product p\n"
                    + "JOIN dbo.Product_Gender pg ON p.product_id = pg.product_id\n"
                    + "JOIN dbo.Gender g ON pg.gender_id = g.gender_id\n"
                    + "JOIN dbo.Discount d ON d.discount_id = p.discount_id\n"
                    + "JOIN dbo.Product_Image pi ON pi.product_id = p.product_id\n"
                    + "JOIN dbo.Image i ON i.img_id = pi.img_id\n"
                    + "ORDER BY d.discount_amount DESC;";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                p.setPrice(rs.getInt("price"));

                Discount d = new Discount();
                d.setAmount(rs.getInt("discount_amount"));
                d.setName(rs.getString("dname"));

                ArrayList<Gender> genders = new ArrayList<>();
                Gender g = new Gender();
                g.setName(rs.getString("gname"));
                genders.add(g);

                p.setDiscount(d);
                p.setGender(genders);

                ArrayList<Image> images = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));
                images.add(i);
                p.setImg(images);

                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public ArrayList<Product> getNewestProductForHomepage() {
        PreparedStatement stm = null;
        ArrayList<Product> products = new ArrayList<>();

        try {
            String sql = "SELECT TOP 2 p.product_id, p.name, p.price, p.date, g.name AS gname, d.name AS dname, d.discount_amount, i.img_url\n"
                    + "FROM dbo.Product p\n"
                    + "JOIN dbo.Product_Gender pg ON p.product_id = pg.product_id\n"
                    + "JOIN dbo.Gender g ON pg.gender_id = g.gender_id\n"
                    + "JOIN dbo.Discount d ON d.discount_id = p.discount_id\n"
                    + "JOIN dbo.Product_Image pi ON pi.product_id = p.product_id\n"
                    + "JOIN dbo.Image i ON i.img_id = pi.img_id\n"
                    + "ORDER BY p.date DESC;";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                p.setPrice(rs.getInt("price"));

                Discount d = new Discount();
                d.setAmount(rs.getInt("discount_amount"));
                d.setName(rs.getString("dname"));

                ArrayList<Gender> genders = new ArrayList<>();
                Gender g = new Gender();
                g.setName(rs.getString("gname"));
                genders.add(g);

                p.setDiscount(d);
                p.setGender(genders);

                ArrayList<Image> images = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));
                images.add(i);
                p.setImg(images);

                products.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    public ArrayList<Product> getProductByGender() {
        PreparedStatement stm = null;
        ArrayList<Product> products = new ArrayList<>();

        try {
            String sql = "SELECT p.product_id, p.name, p.price, p.stock, p.status, \n"
                    + "       (SELECT TOP 1 i.img_url \n"
                    + "        FROM Product_Image pi \n"
                    + "        JOIN Image i ON pi.img_id = i.img_id \n"
                    + "        WHERE pi.product_id = p.product_id \n"
                    + "        ORDER BY i.img_id ASC) AS img_url\n"
                    + "FROM Product p\n"
                    + "JOIN Product_Gender pg ON p.product_id = pg.product_id\n"
                    + "JOIN Gender g ON pg.gender_id = g.gender_id\n"
                    + "WHERE g.name = 'Male';";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getInt("price"));

                ArrayList<Gender> genders = new ArrayList<>();
                Gender g = new Gender();
                g.setGender_id(rs.getInt("gender_id"));
                g.setName(rs.getString("gname"));
                genders.add(g);

                p.setGender(genders);

                ArrayList<Image> images = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));
                images.add(i);
                p.setImg(images);

                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

}
