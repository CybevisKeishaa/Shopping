
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import model.*;
import model.Brand;
import model.Capacity;
import model.Discount;
import model.Gender;
import model.Image;
import model.Product;

/**
 * @author DINH SON
 */
public class ProductListDBContext extends DBContext {

    public List<Product> getAll(int pageNumber, int pageSize) {
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        String sql = "SELECT p.product_id, p.name, p.price, p.date, p.stock, p.stock, p.discount_id, p.brand_id, p.status, i.img_id, i.img_url FROM Product p \n"
                + "JOIN Product_Image pi ON p.product_id = pi.product_id\n"
                + "JOIN Image i ON pi.img_id = i.img_id\n"
                + "ORDER BY p.product_id\n"
                + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                Brand b = br.getBrandFindById(rs.getInt(1));
                Capacity c = cap.getCapacityFindById(rs.getInt(1));
                Gender g = gen.getGenderFindById(rs.getInt(1));
                ArrayList<Image> imgs = new ArrayList<>();
                Image ig = new Image();
                ig.setImg_id(rs.getInt("img_id"));
                ig.setImg_url(rs.getString("img_url"));
                imgs.add(ig);
                p.setImg(imgs);

                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getDate("date"));
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public List<Product> getAllByCapIdGeid(int cacpid, int geid, int pageNumber, int pageSize) {
        String sql = "select p.* from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Product_Gender pg on p.product_id=pg.product_id   where pc.cap_id=? and pg.gender_id=? Order By p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, cacpid);
            st.setInt(2, geid);
            st.setInt(3, offset);
            st.setInt(4, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllByBrandIdGeid(int brandId, int geid, int pageNumber, int pageSize) {
        String sql = "SELECT p.* from Product p inner join Product_Gender pg on p.product_id=pg.product_id where p.product_id=? and pg.gender_id=? Order By p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, brandId);
            st.setInt(2, geid);
            st.setInt(3, offset);
            st.setInt(4, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllByBrandIdCapacityid(int brandId, int cacpid, int pageNumber, int pageSize) {
        String sql = "select p.* from Product p inner join Product_Capacity pc on p.product_id=pc.product_id   where brand_id=? and pc.cap_id=? Order By p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, brandId);
            st.setInt(2, cacpid);
            st.setInt(3, offset);
            st.setInt(4, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllByBrandIdCapIdGenderId(int brandId, int cacpid, int genid, int pageNumber, int pageSize) {
        String sql = "select p.* from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Product_Gender pg on p.product_id=pg.product_id   where brand_id=? and pc.cap_id=? and pg.gender_id=? Order By p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, brandId);
            st.setInt(2, cacpid);
            st.setInt(3, genid);
            st.setInt(4, offset);
            st.setInt(5, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllByBrandId(int brandId, int pageNumber, int pageSize) {
        String sql = "select * from Product where brand_id=? Order By product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, brandId);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllByGeid(int geid, int pageNumber, int pageSize) {
        String sql = "SELECT p.* from Product p inner join Product_Gender pg on p.product_id=pg.product_id where pg.gender_id=? Order By p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, geid);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getAllByCapid(int capid, int pageNumber, int pageSize) {
        String sql = "SELECT P.* FROM Product p inner join Product_Capacity pc on p.product_id=pc.product_id where pc.cap_id=? Order By p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, capid);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
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
                p.setPrice(rs.getInt("price"));

                p.setBrand(b);

                pList.add(p);
            }
            return pList;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalBrandidgeid(int brandid, int geid) {
        String sql = "SELECT COUNT(*) from Product p inner join Product_Gender pg on p.product_id=pg.product_id where p.product_id=? and pg.gender_id=?";
        int count = 0;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, brandid);
            st.setInt(2, geid);
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

    public int getTotalByCapidGeId(int capid, int geid) {
        String sql = "select COUNT(*) from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Product_Gender pg on p.product_id=pg.product_id   where  pc.cap_id=? and pg.gender_id=?";
        int count = 0;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, capid);
            st.setInt(2, geid);
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

    public int getTotalProductByBrandIdCapIdGenId(int brandId, int capid, int geid) {
        String sql = "select COUNT(*) from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Product_Gender pg on p.product_id=pg.product_id   where brand_id=? and pc.cap_id=? and pg.gender_id=?";
        int count = 0;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, brandId);
            st.setInt(2, capid);
            st.setInt(3, geid);
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

    public int getTotalProductByCapid(int capid) {
        String sql = "select COUNT(*) from Product p inner join Product_Capacity pc on p.product_id=pc.product_id  where pc.cap_id=?";
        int count = 0;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, capid);
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

    public int getTotalProductByBrandIdCapId(int brandId, int capid) {
        String sql = "select COUNT(*) from Product p inner join Product_Capacity pc on p.product_id=pc.product_id   where brand_id=? and pc.cap_id=?";
        int count = 0;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, brandId);
            st.setInt(2, capid);
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

    public int getTotapProductByGeid(int geid) {
        String sql = "SELECT COUNT(*) from Product p inner join Product_Gender pg on p.product_id=pg.product_id where pg.gender_id=? ";
        int count = 0;

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, geid);
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

    public int getTotalProductByBrandId(int brandId) {

        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product  where brand_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, brandId);
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

    public static void main(String[] args) {
        ProductListDBContext p = new ProductListDBContext();
        System.out.println(p.getListProduct(null, null, args, null, 1, 2).size());
    }

    public List<Product> getListProduct(
            String[] bids,
            String[] cids,
            String[] gids,
            String[] pids,
            int pageNumber,
            int pageSize
    ) {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT DISTINCT p.*, p.brand_id AS brand_id, pg.gender_id AS gender_id, pi.img_id AS img_id FROM Product p "
                + "LEFT OUTER JOIN Product_Capacity pc ON pc.product_id = p.product_id "
                + "LEFT OUTER JOIN Product_Gender pg ON pg.product_id = p.product_id "
                + "LEFT OUTER JOIN Product_Image pi ON pi.product_id = p.product_id 						"
                + "WHERE 1=1 and p.status=1 ");
        if (bids != null && bids.length > 0) {
            String bidList = String.join(",", bids);
            sql.append("AND p.brand_id IN (" + bidList + ") ");
        }
        if (cids != null && cids.length > 0) {
            String cidList = String.join(",", cids);
            sql.append("AND pc.cap_id IN (" + cidList + ") ");
        }
        if (gids != null && gids.length > 0) {
            String gidList = String.join(",", gids);
            sql.append("AND pg.gender_id IN (" + gidList + ") ");
        }
        if (pids != null && pids.length > 0) {
            List<PriceRange> prices = PriceRange.values.stream().filter(p -> Arrays.asList(pids).contains(String.valueOf(p.getId()))).toList();
            sql.append("AND (0=1 ");
            for (PriceRange price : prices) {
                sql.append("OR p.price BETWEEN " + price.getMin() + " AND " + price.getMax() + " ");
            }
            sql.append(") ");
        }
        sql.append("ORDER BY p.product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        try {
            System.out.println(sql);
            PreparedStatement st = connect.prepareStatement(sql.toString());
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BrandDBContext br = new BrandDBContext();
                CapacityDBContext cap = new CapacityDBContext();
                GenderDBContext gen = new GenderDBContext();
                ImageDBContext image = new ImageDBContext();

                Product p = new Product();
                Brand b = br.getBrandFindById(rs.getInt("brand_id"));
                Gender g = gen.getGenderFindById(rs.getInt("gender_id"));
                ArrayList<Image> i = image.getByProductId(rs.getInt(1));
                p.setImg(i);
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getDate("date"));
                p.setPrice(rs.getInt("price"));
                DiscountDBContext d = new DiscountDBContext();
                p.setDiscount(d.getDiscountById(rs.getInt("discount_id")));
                p.setBrand(b);
                if (g != null) {
                    p.setGender(new ArrayList<>(List.of(g)));
                }

                list.add(p);
            }
            System.out.println(list);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int countTotalProduct(
            String[] bids,
            String[] cids,
            String[] gids,
            String[] pids
    ) {
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(DISTINCT p.product_id) AS total FROM Product p "
                + "LEFT OUTER JOIN Product_Capacity pc ON pc.product_id = p.product_id "
                + "LEFT OUTER JOIN Product_Gender pg ON pg.product_id = p.product_id "
                + "WHERE 1=1 ");
        if (bids != null && bids.length > 0) {
            String bidList = String.join(",", bids);
            sql.append("AND p.brand_id IN (" + bidList + ") ");
        }
        if (cids != null && cids.length > 0) {
            String cidList = String.join(",", cids);
            sql.append("AND pc.cap_id IN (" + cidList + ") ");
        }
        if (gids != null && gids.length > 0) {
            String gidList = String.join(",", gids);
            sql.append("AND pg.gender_id IN (" + gidList + ") ");
        }
        if (pids != null && pids.length > 0) {
            List<PriceRange> prices = PriceRange.values.stream().filter(p -> Arrays.asList(pids).contains(String.valueOf(p.getId()))).toList();
            sql.append("AND (0=1 ");
            for (PriceRange price : prices) {
                sql.append("OR p.price BETWEEN " + price.getMin() + " AND " + price.getMax() + " ");
            }
            sql.append(") ");
        }
        try {
            System.out.println(sql);
            PreparedStatement st = connect.prepareStatement(sql.toString());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getHotProducts() {
        String sql
                = "SELECT TOP 3 p.*, pi.img_id FROM Product p LEFT OUTER JOIN Product_Image pi ON p.product_id = pi.product_id LEFT OUTER JOIN Discount d ON p.discount_id = d.discount_id  "
                + "WHERE d.start <= ? AND ? <= d.[end] and p.status=1  ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setDate(1, Date.valueOf(LocalDate.now()));
            st.setDate(2, Date.valueOf(LocalDate.now()));
            ResultSet rs = st.executeQuery();

            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                ImageDBContext image = new ImageDBContext();
                DiscountDBContext discountDB = new DiscountDBContext();

                Product p = new Product();
                ArrayList<Image> i = image.getByProductId(rs.getInt(1));
                p.setImg(i);
                Discount d = discountDB.getDiscountById(rs.getInt("discount_id"));
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getDate("date"));
                p.setPrice(rs.getInt("price"));
                p.setDiscountedPrice(p.getPrice());
                p.setDiscount(d);

                java.util.Date date = new java.util.Date();

                if (d != null && d.getStart() != null && d.getEnd() != null) {
                    if (d.getStart().compareTo(date) <= 0 && d.getEnd().compareTo(date) >= 0) {
                        System.out.println((1.0 - (d.getAmount() / 100.0)));
                        p.setDiscountedPrice((int) Math.round((1.0 - (d.getAmount() / 100.0)) * p.getPrice()));
                    }
                }

                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> getAllListByEidPid(int eid, int pid, int odid) {
        String sql = "SELECT *\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id = ? and p.product_id=? and od.detail_id=?";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setInt(3, odid);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getNewProducts() {
        String sql
                = "SELECT p.*, pi.img_id FROM Product p LEFT OUTER JOIN Product_Image pi ON p.product_id = pi.product_id "
                + "ORDER BY p.product_id DESC "
                + "OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                ImageDBContext image = new ImageDBContext();
                DiscountDBContext discountDB = new DiscountDBContext();

                Product p = new Product();
                Image ig = image.getImageById(rs.getInt("img_id"));
                Discount d = discountDB.getDiscountById(rs.getInt("discount_id"));
                System.out.println(d.getStart() + " " + d.getEnd());
                p.setProduct_id(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setDate(rs.getDate("date"));
                p.setPrice(rs.getInt("price"));
                p.setDiscount(d);
                p.setDiscountedPrice(p.getPrice());

                java.util.Date date = new java.util.Date();
                if (d.getStart() != null && d.getEnd() != null) {
                    if (d.getStart().compareTo(date) <= 0 && d.getEnd().compareTo(date) >= 0) {
                        System.out.println((1.0 - (d.getAmount() / 100.0)));
                        p.setDiscountedPrice((int) Math.round((1.0 - (d.getAmount() / 100.0)) * p.getPrice()));
                    }
                }

                if (ig != null) {
                    p.setImg(new ArrayList<>(List.of(ig)));
                }

                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
