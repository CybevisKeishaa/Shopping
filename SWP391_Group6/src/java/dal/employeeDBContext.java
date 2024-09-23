/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Employee;

/**
 *
 * @author admin
 */
public class employeeDBContext extends DBContext {
    //lấy ra employee theo ID
    public Employee getEmployeeByIdForBlog(int id) {
        
        String sql = "SELECT * FROM Employee where emp_id=?"; //câu lệnh lấy ra employee theo ID
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            // lấy ra id và tên employee
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

    public static void main(String[] args) {
        employeeDBContext eDb = new employeeDBContext();
        Employee e = eDb.getEmployeeByIdForBlog(1);
        System.out.println(e.getName_emp());
    }
}
