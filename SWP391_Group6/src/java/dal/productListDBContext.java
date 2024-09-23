/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Brand;
import model.Capacity;
import model.Discount;
import model.Gender;
import model.Image;
import model.Product;

/**
 *
 * @author DINH SON
 */
public class productListDBContext extends DBContext {

    public List<Product> getAll(int pageNumber, int pageSize) {
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        String sql = "SELECT * FROM Product Order By product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = br.getBrandFindById(rs.getInt(1));
                Capacity c = cap.getCapacityFindById(rs.getInt(1));
                Gender g = gen.getGenderFindById(rs.getInt(1));
                Image ig = image.getImageById(rs.getInt(1));
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getDate("date"));
                p.setPrice(rs.getBigDecimal("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public int getTotalProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

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
            PreparedStatement st = connection.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setString(1, search);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProduct_id(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getBigDecimal(3));
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
            PreparedStatement st = connection.prepareStatement(sql);
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
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Product p = new Product();
            if (rs.next()) {
                p.setProduct_id(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPrice(rs.getBigDecimal(3));
                p.setDate(rs.getDate(4));
                p.setStock(rs.getInt(5));
                discountDBContext dDb = new discountDBContext();
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
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, bid);
            st.setInt(2, pid);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
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
            PreparedStatement st = connection.prepareStatement(sql);
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
                p.setPrice(rs.getBigDecimal("price"));

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
            PreparedStatement st = connection.prepareStatement(sql);
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

    public static void main(String[] args) {
        productListDBContext pd = new productListDBContext();
        Product p = pd.getByProductId(1);
        for (Capacity x : p.getCapacity()) {
            System.out.println(x.getValue());
        }

    }

}
