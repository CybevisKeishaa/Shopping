/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
import model.Role;

/**
 *
 * @author admin
 */
public class employeeDBContext extends DBContext {
    public Employee getLoginEmployee(String username,String password){
        String sql="SELECT * FROM Employee where email=? and password=?";
         try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Employee e = new Employee();
                e.setEmp_id(rs.getInt(1));
                e.setName_emp(rs.getString(2));
                e.setPassword(rs.getString(3));

                 return e;

            }
           

        } catch (Exception e) {

        }
        return null;
    }
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

    public List<Employee> getAll(int pageNumber, int pageSize) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee ORDER BY emp_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setEmp_id(rs.getInt(1));
                e.setName_emp(rs.getString(2));
                e.setPhone(rs.getInt(4));
                e.setStatus(rs.getBoolean(5));
                e.setEmail(rs.getString(8));

                int role_id = rs.getInt(7);

                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                e.setRole(r);

                list.add(e);

            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Employee> getAllByFullName(String search) {
        String sql = "select * from Employee where name_emp like '%' + ? + '%'";
        List<Employee> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setEmp_id(rs.getInt(1));
                e.setName_emp(rs.getString(2));
                e.setPhone(rs.getInt(4));
                e.setStatus(rs.getBoolean(5));
                e.setEmail(rs.getString(8));

                int role_id = rs.getInt(7);

                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                e.setRole(r);

                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Employee> getAllByEmail(String search) {
        String sql = "select * from Employee where email like '%' + ? + '%'";
        List<Employee> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Employee e = new Employee();
                e.setEmp_id(rs.getInt(1));
                e.setName_emp(rs.getString(2));
                e.setPhone(rs.getInt(4));
                e.setStatus(rs.getBoolean(5));
                e.setEmail(rs.getString(8));

                int role_id = rs.getInt(7);

                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                e.setRole(r);

                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Employee> getAllByMobile(String search) {
        String sql = "select * from Employee where phone like '%' + ? + '%'";
        List<Employee> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Employee e = new Employee();
                e.setEmp_id(rs.getInt(1));
                e.setName_emp(rs.getString(2));
                e.setPhone(rs.getInt(4));
                e.setStatus(rs.getBoolean(5));
                e.setEmail(rs.getString(8));

                int role_id = rs.getInt(7);

                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                e.setRole(r);

                list.add(e);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Employee getDetailsByEmpIds(int emp_id) {
        String sql = "select * from Employee where emp_id = ?";
        Employee e = new Employee();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, emp_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                e.setEmp_id(rs.getInt(1));
                e.setName_emp(rs.getString(2));
                e.setEmail(rs.getString(8));
                e.setPhone(Integer.parseInt(rs.getString(4)));

                e.setStatus(rs.getBoolean(5));

                int role_id = rs.getInt(7);

                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                e.setRole(r);
                return e;

            }

        } catch (Exception a) {
            System.out.println(a);
        }
        return null;
    }
      public void updateEmployee(String emp_id, String name, String email, String phone, String status) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "   SET [name_emp] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[email] = ?\n"
                + " WHERE emp_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, name);
            st.setString(4, email);
            st.setString(2, phone);
            st.setBoolean(3, Boolean.parseBoolean(status));

            st.setInt(5, Integer.parseInt(emp_id));
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        EmployeeDBContext e = new EmployeeDBContext();

        System.out.println(e.getLoginEmployee("b@gmail.com", "aaa123").getEmp_id());
    }

}
