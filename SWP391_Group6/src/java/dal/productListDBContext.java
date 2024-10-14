
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

    public List<Product> getProductByEmployeeId(int id) {
        String sql = "SELECT p.* FROM Employee e inner join Employee_Product ep on e.emp_id=ep.emp_id inner join Product p on p.product_id=ep.product_id where e.emp_id=?";
        List<Product> list = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
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

                list.add(p);
            }
            return list;
        } catch (Exception E) {
            System.out.println(E);
        }
        return null;
    }

    public List<Product> getListProductByEmployeeId(int id, int pageNumber, int pageSize) {
        String sql = "SELECT p.* \n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "WHERE e.emp_id = ? \n"
                + "ORDER BY p.product_id \n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY;";
        List<Product> pList = new ArrayList<>();
        BrandDBContext br = new BrandDBContext();
        CapacityDBContext cap = new CapacityDBContext();
        GenderDBContext gen = new GenderDBContext();
        ImageDBContext image = new ImageDBContext();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, id);
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

    public int totalListProductByEmployeeId(int id) {
        String sql = "SELECT COUNT(*) \n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "WHERE e.emp_id = ? \n";
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

        }
        return -1;
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

    public static void main(String[] args) {
        productListDBContext pd = new productListDBContext();
        Product p = pd.getByProductId(1);
        for (Capacity x : p.getCapacity()) {
            System.out.println(x.getValue());
        }

    }

}
