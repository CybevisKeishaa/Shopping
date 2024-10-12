/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Capacity;
import model.Gender;
import model.Image;
import model.Product;
import model.Employee_User;

/**
 *
 * @author admin
 */
public class employeeDBContext extends DBContext {
    //lấy ra employee theo ID
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
        String sql = "SELECT COUNT(*) " +
                     "FROM Employee e " +
                     "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id " +
                     "INNER JOIN Product p ON p.product_id = ep.product_id " +
                     "WHERE e.emp_id = ?";
        int bid = -1;
    
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);  // Set the employee id parameter
            ResultSet rs = st.executeQuery();  // Execute the query
    
            if (rs.next()) {  // Retrieve the count result
                bid = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return bid;
    }
    
    public Employee_User getEmployeeByIdForBlog(int id) {
        String sql = "SELECT * FROM Employee where emp_id=?";

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Employee e = new Employee();
                e.setEmp_id(id);
                e.setName_emp(rs.getString(2));
                return e;

            }

        } catch (Exception e) {

        }
        return null;
    }

    public Employee getEmployeeByEmailAndPassword(String email, String password) {
        Employee e = new Employee();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT e.emp_id, e.name_emp, e.email, e.status, e.avartar, r.role_id, f.f_url "
                    + "FROM Employee e "
                    + "LEFT JOIN Role_Employee re ON e.emp_id = re.emp_id "
                    + "LEFT JOIN Role r ON re.role_id = r.role_id "
                    + "LEFT JOIN Role_Fearture rf ON r.role_id = rf.role_id "
                    + "LEFT JOIN Fearture f ON rf.f_id = f.f_id "
                    + "WHERE e.email = ? AND e.[password] = ?";

            stm = connect.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();

            // Lấy thông tin nhân viên từ ResultSet
            Role role = null;
            ArrayList<Feature> features = new ArrayList<>();

            while (rs.next()) {
                if (e.getEmp_id() == 0) {  // Chỉ set các thông tin cơ bản một lần
                    e.setEmp_id(rs.getInt("emp_id"));
                    e.setName_emp(rs.getString("name_emp"));
                    e.setStatus(rs.getBoolean("status"));

                    role = new Role();
                    role.setRole_id(rs.getInt("role_id"));
                }

                Feature f = new Feature();
                f.setF_url(rs.getString("f_url"));
                features.add(f);
            }

            if (role != null) {
                role.setFeatures(features);
                e.setRole(role);
            }

        } catch (SQLException ex) {
            Logger.getLogger(employeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(employeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return e;
    }

    public static void main(String[] args) {
        employeeDBContext eDb = new employeeDBContext();
        Employee e = eDb.getEmployeeByEmailAndPassword("munhoang00@gmail.com", "123456");
        System.out.println(e.getRole());
    }
}
