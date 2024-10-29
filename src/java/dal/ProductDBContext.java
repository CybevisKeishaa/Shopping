/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.ImageHelper;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.Part;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.Capacity;
import model.Discount;
import model.Gender;
import model.Image;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class ProductDBContext extends DBContext<Product> {

    private ImageHelper imageHelper;

    public ProductDBContext(HttpServlet servlet) {
        this.imageHelper = new ImageHelper(servlet);
    }

    public ProductDBContext() {
    }

    public ArrayList<Product> getAllByEid(int eid, String s) {
        PreparedStatement stm = null;
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT TOP (1000) [product_id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[date]\n"
                + "      ,[stock]\n"
                + "      ,[discount_id]\n"
                + "      ,[brand_id]\n"
                + "      ,[status]\n"
                + "      ,[emp_id]\n"
                + "  FROM [swp-son].[dbo].[Product] where emp_id=?";
        if (s != null) {
            sql += " and name like '%'+?+'%'";
        }
        try {
            stm = connect.prepareStatement(sql);
            stm.setInt(1, eid);
            if (s != null) {
                stm.setString(2, s);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getInt(3));
                p.setDate(rs.getDate(4));
                p.setStock(rs.getInt(5));
                DiscountDBContext db = new DiscountDBContext();
                Discount d = db.getDiscountById(rs.getInt(6));
                p.setDiscount(d);
                BrandDBContext bd = new BrandDBContext();
                Brand b = bd.getBrandFindById(rs.getInt(7));
                p.setBrand(b);
                p.setStatus(rs.getBoolean(8));
                ArrayList<Capacity> c = cap.getCapacityByProductId(rs.getInt(1));
                p.setCapacity(c);
                ArrayList<Image> i = image.getByProductId(rs.getInt(1));
                ArrayList<Gender> ge = gen.getGenderFindByPid(rs.getInt(1));
                p.setGender(ge);
                p.setImg(i);
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteProduct(String id) {

        try {
            connect.setAutoCommit(false);

            String sql = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE product_id=?";
            PreparedStatement st = connect.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, Integer.parseInt(id));
            st.executeUpdate();
            String sql1 = "DELETE FROM [dbo].[Product_Image]\n"
                    + "      WHERE product_id=?";
            PreparedStatement st1 = connect.prepareStatement(sql1, PreparedStatement.RETURN_GENERATED_KEYS);
            st1.setInt(1, Integer.parseInt(id));
            st1.executeUpdate();
            connect.commit();
            connect.setAutoCommit(true);

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateProduct(String pid, String cid, int igid, String name, String price,
            String stock, String date, String dis, String gender, String brand, String status,
            Part image, String oldImageUrl) {
        try {
            connect.setAutoCommit(false);

            String updateProduct = "UPDATE [dbo].[Product]\n"
                    + "   SET [name] = ?\n"
                    + "      ,[price] = ?\n"
                    + "      ,[date] = ?\n"
                    + "      ,[stock] = ?\n"
                    + "      ,[discount_id] = ?\n"
                    + "      ,[brand_id] = ?\n"
                    + "      ,[status] = ?\n"
                    + " WHERE product_id=?";
            PreparedStatement updateProductstm = connect.prepareStatement(updateProduct, PreparedStatement.RETURN_GENERATED_KEYS);
            updateProductstm.setString(1, name);
            updateProductstm.setInt(2, Integer.parseInt(price));
            updateProductstm.setDate(3, Date.valueOf(date));
            updateProductstm.setInt(4, Integer.parseInt(stock));
            if (Integer.parseInt(dis) == -1) {
                updateProductstm.setNull(5, java.sql.Types.INTEGER);

            } else {

                updateProductstm.setInt(5, Integer.parseInt(dis));

            }
            updateProductstm.setInt(6, Integer.parseInt(brand));
            updateProductstm.setBoolean(7, Boolean.parseBoolean(status));
            updateProductstm.setInt(8, Integer.parseInt(pid));
            ResultSet rs = updateProductstm.executeQuery();
            rs.next();
            String upIgid = "UPDATE [dbo].[Image]\n"
                    + "   SET [img_url] = ?\n"
                    + "      ,[img_name] = ?\n"
                    + " WHERE img_id=?";

            if (image.getSize() > 10) {
                PreparedStatement upIgidst = connect.prepareStatement(upIgid, PreparedStatement.RETURN_GENERATED_KEYS);
                String imageName = String.format("PRODUCT%04d" + System.currentTimeMillis(), Integer.parseInt(pid));
                String imageUrl = imageName + imageHelper.getExtensionFromContentType(image.getContentType());
                upIgidst.setString(1, imageUrl);
                upIgidst.setString(2, imageName);
                upIgidst.setInt(3, igid);
                boolean imageUpdated = upIgidst.executeUpdate() > 0;
                if (imageUpdated) {
                    imageHelper.processImageUpload(image, imageName);
                    // check file có tồn tại hay k
                    imageHelper.removeImage(oldImageUrl);
                }
            }
            String updateGender = "UPDATE [dbo].[Product_Gender]\n"
                    + "   SET [gender_id] = ?\n"
                    + "   \n"
                    + " WHERE product_id=?";
            PreparedStatement updateGenderst = connect.prepareStatement(updateGender, PreparedStatement.RETURN_GENERATED_KEYS);
            updateGenderst.setInt(1, Integer.parseInt(gender));
            updateGenderst.setInt(2, Integer.parseInt(pid));
            updateGenderst.executeUpdate();
            String updateCap = "UPDATE [dbo].[Product_Capacity]\n"
                    + "   SET [unit_price] = ?\n"
                    + "    \n"
                    + " WHERE product_id=? and cap_id=?";
            PreparedStatement updateCapst = connect.prepareStatement(updateCap, PreparedStatement.RETURN_GENERATED_KEYS);
            updateCapst.setInt(2, Integer.parseInt(pid));
            updateCapst.setInt(1, Integer.parseInt(price));
            updateCapst.setInt(3, Integer.parseInt(cid));
            updateCapst.executeUpdate();
            connect.commit();

        } catch (Exception e) {
            try {
                connect.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        try {
            connect.setAutoCommit(true);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        ProductDBContext pd = new ProductDBContext();
//        pd.updateProduct("1", "1", 1, "", "2", "2", "", "", "", "", "", "", "");
//    }
    public void insertProduct(String eid, String name, String cap, String gid, String price, String stock, String date, String dis, String brand, Part image) {
        try {
            connect.setAutoCommit(false);

            String insertProduct = "INSERT INTO [dbo].[Product]\n"
                    + "           ([name]\n"
                    + "           ,[price]\n"
                    + "           ,[date]\n"
                    + "           ,[stock]\n"
                    + "           ,[discount_id]\n"
                    + "           ,[brand_id]\n"
                    + "           ,[status]  "
                    + ",[emp_id])\n"
                    + " output inserted.product_id"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1,?)";

            PreparedStatement insertProductst = connect.prepareStatement(insertProduct, PreparedStatement.RETURN_GENERATED_KEYS);
            insertProductst.setString(1, name);
            insertProductst.setInt(2, Integer.parseInt(price));
            insertProductst.setDate(3, Date.valueOf(date));
            insertProductst.setInt(4, Integer.parseInt(stock));
            insertProductst.setInt(5, Integer.parseInt(dis));
            insertProductst.setInt(6, Integer.parseInt(brand));
            insertProductst.setInt(7, Integer.parseInt(eid));

            ResultSet rs = insertProductst.executeQuery();
            rs.next();

            ResultSet generatedKeys = insertProductst.getGeneratedKeys();
            int productId = -1;
            if (generatedKeys.next()) {
                productId = generatedKeys.getInt(1);
            }
            if (image.getSize() < 0) {
                throw new Exception("Image is Required!");
            }
            // Chèn image vào bảng Image
            String insertImage = "INSERT INTO [dbo].[Image]\n"
                    + "           ([img_url]\n"
                    + "         ,[img_name])\n"
                    + " output inserted.img_id"
                    + "     VALUES\n"
                    + "           (?,?)";
            PreparedStatement insertImagest = connect.prepareStatement(insertImage, PreparedStatement.RETURN_GENERATED_KEYS);

            String imageName = String.format("PRODUCT%04d", productId);
            String imageUrl = imageName + imageHelper.getExtensionFromContentType(image.getContentType());
            insertImagest.setString(1, imageUrl);
            insertImagest.setString(2, imageName);
            rs = insertImagest.executeQuery();
            imageHelper.processImageUpload(image, imageName);

            ResultSet rs1 = insertImagest.getGeneratedKeys();
            int imageId = -1;
            if (rs1.next()) {
                imageId = rs1.getInt(1);
            }
            String insertImageProduct = "INSERT INTO [dbo].[Product_Image]\n"
                    + "           ([product_id]\n"
                    + "           ,[img_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement insertImageProductst = connect.prepareStatement(insertImageProduct, PreparedStatement.RETURN_GENERATED_KEYS);
            insertImageProductst.setInt(1, productId);
            insertImageProductst.setInt(2, imageId);
            insertImageProductst.executeUpdate();
            String insertProCa = "INSERT INTO [dbo].[Product_Capacity]\n"
                    + "           ([cap_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[unit_price]\n"
                    + "           ,[stock])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement insertProCast = connect.prepareStatement(insertProCa, PreparedStatement.RETURN_GENERATED_KEYS);
            insertProCast.setInt(1, Integer.parseInt(cap));
            insertProCast.setInt(2, productId);
            insertProCast.setInt(3, Integer.parseInt(price));
            insertProCast.setInt(4, Integer.parseInt(stock));
            insertProCast.executeUpdate();
            String insertGender = "INSERT INTO [dbo].[Product_Gender]\n"
                    + "           ([gender_id]\n"
                    + "           ,[product_id])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement insertGenst = connect.prepareStatement(insertGender, PreparedStatement.RETURN_GENERATED_KEYS);
            insertGenst.setInt(1, Integer.parseInt(gid));
            insertGenst.setInt(2, productId);
            insertGenst.executeUpdate();            
            connect.commit();

        } catch (Exception e) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, e);
            try {
                connect.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        try {
            connect.setAutoCommit(true);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Product> getDiscountProductForHomepage() {

        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT TOP 8 p.product_id, p.name, p.price, g.name AS gname, d.name AS dname, d.discount_amount, MIN(i.img_url) AS img_url\n"
                    + "FROM dbo.Product p\n"
                    + "JOIN dbo.Product_Gender pg ON p.product_id = pg.product_id\n"
                    + "JOIN dbo.Gender g ON pg.gender_id = g.gender_id\n"
                    + "LEFT JOIN dbo.Discount d ON d.discount_id = p.discount_id\n"
                    + "JOIN dbo.Product_Image pi ON pi.product_id = p.product_id\n"
                    + "JOIN dbo.Image i ON i.img_id = pi.img_id\n"
                    + "WHERE img_url like 'product%' and p.status = 1\n"
                    + "GROUP BY p.product_id, p.name, p.price, g.name, d.name, d.discount_amount\n"
                    + "ORDER BY d.discount_amount DESC;";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
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
            String sql = "SELECT TOP 2 p.product_id, p.name, p.price, p.date, g.name AS gname, d.name AS dname, d.discount_amount, MIN(i.img_url) AS img_url\n"
                    + "FROM dbo.Product p\n"
                    + "JOIN dbo.Product_Gender pg ON p.product_id = pg.product_id\n"
                    + "JOIN dbo.Gender g ON pg.gender_id = g.gender_id\n"
                    + "JOIN dbo.Discount d ON d.discount_id = p.discount_id\n"
                    + "JOIN dbo.Product_Image pi ON pi.product_id = p.product_id\n"
                    + "JOIN dbo.Image i ON i.img_id = pi.img_id\n"
                    + "WHERE img_url like 'product%' and p.status = 1\n"
                    + "GROUP BY p.product_id, p.name, p.price, p.date, g.name, d.name, d.discount_amount\n"
                    + "ORDER BY p.date DESC;";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt("product_id"));
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

    public int getStockByProductId(int productId) {
        PreparedStatement stm = null;
        int stock = 0;
        try {
            String sql = "SELECT stock FROM Product WHERE product_id = ?";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                stock = rs.getInt("stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
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
                    + "WHERE g.name = 'Male' and p.status = 1";

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

    public Product getByPidCid(int pid, int cid) {
        PreparedStatement stm = null;
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        String sql = "Select p.*,pc.* from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Capacity c on c.cap_id=pc.cap_id where p.product_id=? and c.cap_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, cid);
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
                ArrayList<Image> i = image.getByProductId(rs.getInt(1));
                p.setImg(i);
                ArrayList<Gender> ge = gen.getGenderFindByPid(rs.getInt(1));
                p.setGender(ge);
            }
            return p;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getByProductId(int id) {
        PreparedStatement stm = null;
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        ArrayList<Product> list = new ArrayList<>();
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
                ArrayList<Image> i = image.getByProductId(rs.getInt(1));
                p.setImg(i);
                p.setCapacity(cList);
                ArrayList<Gender> ge = gen.getGenderFindByPid(rs.getInt(1));
                p.setGender(ge);
            }
            st.close();
            rs.close();
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
                var pidb = new ProductImageDBContext();
                ArrayList<Image> img = pidb.getAllImageByProductId(p.getProduct_id());
                p.setImg(img);
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
