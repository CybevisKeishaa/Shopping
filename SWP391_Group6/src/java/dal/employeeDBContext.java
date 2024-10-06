/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Capacity;
import model.Employee;
import model.Gender;
import model.Image;
import model.Product;
=======
import model.Employee_User;
>>>>>>> main

/**
 *
 * @author admin
 */
public class employeeDBContext extends DBContext {
<<<<<<< HEAD
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
    public int totalListProductByEmployeeId(int id){
        String sql= "SELECT COUNT(*) \n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "WHERE e.emp_id = ? \n";
                int bid = -1;

        try{
             PreparedStatement st = connect.prepareStatement(sql);
=======

    public Employee_User getEmployeeByIdForBlog(int id) {
        String sql = "SELECT * FROM Employee where emp_id=?";
        

        try {
            PreparedStatement st = connect.prepareStatement(sql);
>>>>>>> main
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
<<<<<<< HEAD
                bid = rs.getInt(1);
            }
            return bid;
        }catch(Exception e){
            
        }
        return -1;
    }
    public Employee getEmployeeByIdForBlog(int id) {
        
        String sql = "SELECT * FROM Employee where emp_id=?"; //câu lệnh lấy ra employee theo ID
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            // lấy ra id và tên employee
            if (rs.next()) {
                Employee e = new Employee();
=======
                Employee_User e = new Employee_User();
>>>>>>> main
                e.setEmp_id(id);
                e.setName_emp(rs.getString(2));
                 return e;

            }
           

        } catch (Exception e) {

        }
        return null;
    }

    public static void main(String[] args) {
        employeeDBContext eDb = new employeeDBContext();
<<<<<<< HEAD
        Employee e = eDb.getEmployeeByIdForBlog(1);
=======
        Employee_User e = eDb.getEmployeeByIdForBlog(1);
>>>>>>> main
        System.out.println(e.getName_emp());
    }
}
