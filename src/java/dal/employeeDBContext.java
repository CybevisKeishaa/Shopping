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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Role;

/**
 *
 * @author admin
 */
public class EmployeeDBContext extends DBContext {

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
                e.setPhone(rs.getString(4));
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
                e.setPhone(rs.getString(4));
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
                e.setPhone(rs.getString(4));
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
                e.setPhone(rs.getString(4));
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
                e.setPhone(rs.getString(4));

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

    public int getFreeEmployee() {
        PreparedStatement stm = null;
        int empID = -1;
        try {
            String sql = "SELECT e.emp_id,  \n"
                    + "       e.name_emp,  \n"
                    + "       COUNT(o.order_id) AS number_of_orders\n"
                    + "FROM Employee e\n"
                    + "LEFT JOIN [Order] o ON e.emp_id = o.employee_id AND CAST(o.created_at AS DATE) = CAST(GETDATE() AS DATE)\n"
                    + "LEFT JOIN Role r ON e.role_id = r.role_id\n"
                    + "WHERE r.role_id = 3 \n"
                    + "GROUP BY e.emp_id, e.name_emp\n"
                    + "order by number_of_orders asc";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                empID = rs.getInt("emp_id");
            }

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close(); // Đảm bảo đóng tài nguyên sau khi sử dụng
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return empID;
    }

    public Employee getEmployeeAccountByEmail(String email, String password) {
        PreparedStatement stm = null;
        Employee employee = null; // Changed from int to Employee
        try {
            String sql = """
                            SELECT e.emp_id, e.name_emp, e.phone, e.status, e.avartar, e.email, r.*
                            FROM Employee e
                            JOIN Role r ON r.role_id = e.role_id
                            WHERE e.email = ? AND e.password = ?
                         """;

            stm = connect.prepareStatement(sql);
            // Bind the email and password parameters
            stm.setString(1, email);
            stm.setString(2, password);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                employee = new Employee();
                employee.setEmp_id(rs.getInt("emp_id"));
                employee.setName_emp(rs.getString("name_emp"));
                employee.setPhone(rs.getString("phone"));
                employee.setStatus(rs.getBoolean("status"));
                employee.setAvatar(rs.getString("avartar"));
                employee.setEmail(rs.getString("email"));

                // Assuming you have a Role class
                Role role = new Role();
                role.setRole_id(rs.getInt("role_id"));
                role.setRole_name(rs.getString("role_name"));
                employee.setRole(role);
            }

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close(); // Ensure resource is closed
                } catch (SQLException ex) {
                    Logger.getLogger(EmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return employee; // Return Employee object
    }

    public static void main(String[] args) {
        EmployeeDBContext e = new EmployeeDBContext();

        int f = e.getFreeEmployee();
        System.out.println(f);
    }

}
