/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Employee;
import model.Feature;
import model.Role;

/**
 *
 * @author admin
 */
public class employeeDBContext extends DBContext {

    public Employee getEmployeeByIdForBlog(int id) {
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
