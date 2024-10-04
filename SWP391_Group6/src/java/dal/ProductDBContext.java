/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Product;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Capacity;
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
            String sql = "SELECT p.product_id, p.name, p.price, g.name AS gname, p.stock, p.status, d.name AS dname, d.discount_amount,\n"
                    + "       (SELECT TOP 1 i.img_url\n"
                    + "        FROM Product_Image pi\n"
                    + "        JOIN Image i ON pi.img_id = i.img_id\n"
                    + "        WHERE pi.product_id = p.product_id\n"
                    + "        ORDER BY i.img_id ASC) AS img_url\n"
                    + "FROM Product p\n"
                    + "JOIN Product_Gender pg ON p.product_id = pg.product_id\n"
                    + "JOIN Gender g ON pg.gender_id = g.gender_id\n"
                    + "LEFT JOIN Discount d ON p.discount_id = d.discount_id\n"
                    + "WHERE g.name = 'Male';";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getInt("price"));

                ArrayList<Gender> genders = new ArrayList<>();
//                Gender g = new Gender();
//                g.setGender_id(rs.getInt("gender_id"));
//                g.setName(rs.getString("gname"));
//                genders.add(g);
//
//                p.setGender(genders);

                ArrayList<Image> images = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));
                images.add(i);
                p.setImg(images);
                p.setStock(rs.getInt("stock"));

                products.add(p);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    public static void main(String[] args) {
        ProductDBContext db = new ProductDBContext();
        ArrayList<Product> p = db.getProductByGender();
        System.out.println(p.size());
    }
    
    
    public int getTotalProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Product> getAllSearchByTittle(String search, int pageNumber, int pageSize) {
        String sql = "SELECT * \n"
                + "FROM Product \n"
                + "WHERE name LIKE '%' + ? + '%' \n"
                + "ORDER BY product_id \n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        List<Product> list = new ArrayList<>();

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setString(1, search);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getInt(3));
                p.setDate(rs.getDate(4));

                list.add(p);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalProductBySearch(String search) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product WHERE title LIKE '%' + ? + '%' ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public Product getByProductId(int id) {
        String sql = "SELECT * FROM Product where product_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Product p = new Product();
            if (rs.next()) {
                p.setProduct_id(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getInt(3));
                p.setDate(rs.getDate(4));
                p.setStock(rs.getInt(5));
                DiscountDBContext dDb = new DiscountDBContext();
                Discount d = dDb.getDiscountById(rs.getInt(6));
                p.setDiscount(d);
                boolean status = true;
                if (rs.getInt(8) != 1) {
                    status = false;
                }
                p.setStatus(status);
                BrandDBContext bDb = new BrandDBContext();
                Brand b = bDb.getBrandFindById(rs.getInt(7));
                p.setBrand(b);
                CapacityDBContext cDb = new CapacityDBContext();
                ArrayList<Capacity> cList = cDb.getCapacityByProductId(id);
                p.setCapacity(cList);
            }
            return p;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalBrandId(int bid, int pid) {
        String sql = "SELECT COUNT(*) FROM Product where brand_id=? and product_id !=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            st.setInt(1, bid);
            st.setInt(2, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return -1;
    }

    public List<Product> getListProductByBrandId(int bid, int pid, int pageNumber, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product where brand_id=? and product_id !=? Order By product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, bid);
            st.setInt(2, pid);
            int offset = (pageNumber - 1) * pageSize;

            st.setInt(3, offset);
            st.setInt(4, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BrandDBContext br = new BrandDBContext();
                CapacityDBContext cap = new CapacityDBContext();
                GenderDBContext gen = new GenderDBContext();
                ImageDBContext image = new ImageDBContext();
                Product p = new Product();
                Brand b = br.getBrandFindById(rs.getInt(1));
                Capacity c = cap.getCapacityFindById(rs.getInt(1));
                Gender g = gen.getGenderFindById(rs.getInt(1));
                Image ig = image.getImageById(rs.getInt(1));
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getDate("date"));
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                list.add(p);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int brandIdbyproductId(int id) {
        String sql = "Select brand_id from Product where product_id=?";
        int bid = -1;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                bid = rs.getInt(1);
            }
            return bid;
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

}
