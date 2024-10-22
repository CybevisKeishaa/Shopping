
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Address;
import model.Cart;
import model.Customer_User;
import model.Feature;
import model.Order;
import model.PasswordResetToken;
import model.Role;

/**
 *
 * @author KEISHA
 */
public class CustomerDBContext extends DBContext<Customer_User> {

    public void insertCustomer(Customer_User customer) throws SQLException {
        PreparedStatement stm_insert = null;
        PreparedStatement stm_query = null;
        try {
            // Tắt chế độ tự commit
            connect.setAutoCommit(false);

            // Câu lệnh SQL để lấy cus_id lớn nhất hiện tại
            String sql_get_max_cus_id = "SELECT MAX(cus_id) AS max_cus_id FROM [dbo].[Customer]";
            stm_query = connect.prepareStatement(sql_get_max_cus_id);
            ResultSet rs = stm_query.executeQuery();
            int new_cus_id = 1;

            // Nếu có giá trị cus_id lớn nhất, tăng lên 1 để tạo cus_id mới
            if (rs.next() && rs.getInt("max_cus_id") > 0) {
                new_cus_id = rs.getInt("max_cus_id") + 1;
            }
            customer.setCus_id(new_cus_id); // Đặt giá trị cus_id mới cho đối tượng customer

            // Câu lệnh SQL để chèn thông tin vào bảng Customer
            String sql_insert_cus = "INSERT INTO [dbo].[Customer]\n"
                    + "           ([cus_id]\n"
                    + "           ,[name_cus]\n"
                    + "           ,[password]\n"
                    + "           ,[email]\n"
                    + "           ,[c_phone]\n"
                    + "           ,[display_name]\n"
                    + "           ,[status]\n"
                    + "           ,[role_id]\n"
                    + "           ,[gender]\n"
                    + "           ,[username]\n"
                    + "           ,[birth_date]\n"
                    + "           ,[verification_code])\n"
                    + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Chuẩn bị câu lệnh SQL chèn
            stm_insert = connect.prepareStatement(sql_insert_cus);
            stm_insert.setInt(1, customer.getCus_id()); // cus_id
            stm_insert.setString(2, customer.getName_cus()); // name_cus
            stm_insert.setString(3, customer.getPassword()); // password
            stm_insert.setString(4, customer.getEmail()); // email
            stm_insert.setString(5, customer.getC_phone()); // c_phone
            stm_insert.setString(6, customer.getUsername()); // display_name
            stm_insert.setBoolean(7, false); // status (giả sử là active - true)
            stm_insert.setInt(8, customer.getRole().getRole_id()); // role_id
            stm_insert.setInt(9, customer.isGender() ? 1 : 0);
            stm_insert.setString(10, customer.getUsername());
            stm_insert.setDate(11, customer.getDob()); // dob (ngày sinh)
            stm_insert.setString(12, customer.getVerificationCode());

            // Thực thi câu lệnh chèn
            stm_insert.executeUpdate();

            // Commit các thay đổi
            connect.commit();
        } catch (SQLException ex) {
            // In ra lỗi chi tiết để dễ dàng debug
            // System.err.println("SQL Error: " + ex.getMessage());

            if (connect != null) {
                try {
                    connect.rollback();
                } catch (SQLException ex1) {
                    // System.err.println("Rollback Error: " + ex1.getMessage());
                }
            }

            // Ném lỗi ra để xử lý ở nơi gọi hàm
            throw ex;
        } finally {
            try {
                connect.setAutoCommit(true);
                if (stm_insert != null) {
                    stm_insert.close();
                }
                if (stm_query != null) {
                    stm_query.close();
                }
                if (connect != null) {
                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public boolean isPhoneExists(String phone) throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM [dbo].[Customer] WHERE c_phone = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connect.prepareStatement(sql);
            stm.setString(1, phone);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public boolean isUsernameExists(String username) throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM [dbo].[Customer] WHERE username = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connect.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public boolean isEmailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM [dbo].[Customer] WHERE email = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connect.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public boolean verifyCustomer(String verificationCode) throws SQLException {
        String sql = "UPDATE [dbo].[Customer] SET status = 1 WHERE verification_code = ?";
        PreparedStatement stm = null;
        try {
            stm = connect.prepareStatement(sql);
            stm.setString(1, verificationCode);
            int rowsUpdated = stm.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        } finally {
            if (stm != null) {
                stm.close();
            }
        }
    }

    // Lấy thông tin tài khoản khách hàng bằng email và mật khẩu
    public Customer_User getCustomerAccountByEmail(String email, String password) {
        String sql = "SELECT c.cus_id, c.c_phone, c.name_cus, c.email, c.status, c.avartar, r.role_id, f.f_url, ca.cart_id , r.* FROM Customer c \n"
                + "LEFT JOIN Role r on r.role_id = c.role_id\n"
                + "LEFT JOIN Role_Fearture rf on rf.role_id = r.role_id\n"
                + "LEFT JOIN Fearture f on f.f_id = rf.f_id\n"
                + "LEFT JOIN Cart ca on c.cus_id = ca.cus_id\n"
                + "WHERE email = ? and c.[password] = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, email);
            stm.setString(2, password);
            try (ResultSet rs = stm.executeQuery()) {
                Customer_User customer = null;
                Role r = null;
                ArrayList<Feature> features = new ArrayList<>();

                while (rs.next()) {
                    if (customer == null) {
                        customer = new Customer_User();
                        customer.setCus_id(rs.getInt("cus_id"));
                        customer.setName_cus(rs.getString("name_cus"));
                        customer.setEmail(rs.getString("email"));
                        customer.setStatus(rs.getBoolean("status"));
                        customer.setAvatar(rs.getString("avartar"));
                        customer.setC_phone(rs.getString("c_phone"));
                        Cart c = new Cart();
                        c.setCart_id(rs.getInt("cart_id"));
                        customer.setCart(c);

                        r = new Role();
                        r.setRole_id(rs.getInt("role_id"));
                        r.setRole_name(rs.getString("role_name"));
                        customer.setRole(r);
                    }

                    Feature f = new Feature();
                    f.setF_url(rs.getString("f_url"));
                    features.add(f);
                }

                if (r != null) {
                    r.setFeatures(features);
                }

                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, "L?i khi l?y th ng tin t i kho?n",
                    ex);
        }
        return null;
    }

    // Đổi mật khẩu khách hàng
    public boolean changePassword(int cus_id, String newPassword) {
        String sql = "UPDATE Customer SET password = ? WHERE cus_id = ?";
        boolean updated = false;

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, newPassword);
            stm.setInt(2, cus_id);
            int rowsAffected = stm.executeUpdate();
            updated = (rowsAffected > 0);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, "Lỗi khi thay đổi mật khẩu", ex);
        }
        return updated;
    }

    public void updateCustomer(Customer_User customer) {
        String sql = """
                UPDATE Customer
                SET name_cus = ?, gender = ?, c_phone = ?, avartar = ?
                WHERE cus_id = ?""";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, customer.getName_cus());
            stm.setInt(2, customer.isGender() ? 1 : 0);
            stm.setString(3, customer.getC_phone());
            stm.setString(4, customer.getAvatar());
            stm.setInt(5, customer.getCus_id());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE,
                    "Lỗi khi cập nhật thông tin khách hàng", ex);
        }
    }

    // Lấy thông tin khách hàng bằng ID
    public Customer_User getCustomerById(int cus_id) {
        String sql = "SELECT * FROM Customer WHERE cus_id = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, cus_id);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    Customer_User customer = new Customer_User();
                    customer.setCus_id(rs.getInt("cus_id"));
                    customer.setName_cus(rs.getString("name_cus"));
                    customer.setEmail(rs.getString("email"));
                    customer.setGender(rs.getBoolean("gender"));
                    customer.setPassword(rs.getString("password"));
                    customer.setC_phone(rs.getString("c_phone"));
                    customer.setStatus(rs.getBoolean("status"));
                    customer.setAvatar(rs.getString("avartar"));

                    // Thiết lập Role
                    Role role = new Role();
                    role.setRole_id(rs.getInt("role_id"));
                    customer.setRole(role);

                    // Thiết lập Cart
                    Cart cart = new Cart();
                    cart.setCart_id(rs.getInt("cart_id"));
                    customer.setCart(cart);

                    return customer;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE,
                    "Lỗi khi lấy thông tin khách hàng theo ID", ex);
        }
        return null;
    }

    // Lấy thông tin khách hàng bằng email
    public Customer_User getCustomerByEmail(String email) {
        String sql = "SELECT * FROM Customer WHERE email = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, email);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    Customer_User customer = new Customer_User();
                    customer.setCus_id(rs.getInt("cus_id"));
                    customer.setEmail(rs.getString("email"));
                    customer.setName_cus(rs.getString("name_cus"));

                    return customer;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE,
                    "Lỗi khi lấy thông tin khách hàng theo email", ex);
        }
        return null;
    }

    // Tạo token đặt lại mật khẩu
    public void createPasswordResetToken(int cus_id, String token, LocalDateTime expirationTime) {
        String sql = "INSERT INTO PasswordResetToken (cus_id, token, expiration_time) VALUES (?, ?, ?)";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setInt(1, cus_id);
            stm.setString(2, token);
            stm.setTimestamp(3, Timestamp.valueOf(expirationTime));
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, "Lỗi khi tạo token đặt lại mật khẩu",
                    ex);
        }
    }

    // Lấy token đặt lại mật khẩu
    public PasswordResetToken getToken(String token) {
        String sql = "SELECT * FROM PasswordResetToken WHERE token = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, token);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    PasswordResetToken passwordResetToken = new PasswordResetToken();
                    passwordResetToken.setCus_id(rs.getInt("cus_id"));
                    passwordResetToken.setToken(rs.getString("token"));
                    passwordResetToken.setExpirationTime(rs.getTimestamp("expiration_time").toLocalDateTime());

                    return passwordResetToken;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, "Lỗi khi lấy token", ex);
        }
        return null;
    }

    // Xóa token đặt lại mật khẩu
    public void deleteToken(String token) {
        String sql = "DELETE FROM PasswordResetToken WHERE token = ?";

        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setString(1, token);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, "Lỗi khi xóa token", ex);
        }
    }

    public List<Customer_User> getAll(int pageNumber, int pageSize) {
        List<Customer_User> list = new ArrayList<>();
        String sql = "SELECT * FROM Customer ORDER BY cus_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer_User b = new Customer_User();
                b.setCus_id(rs.getInt(1));
                b.setName_cus(rs.getString(2));
                b.setEmail(rs.getString(4));
                b.setC_phone(rs.getString(5));
                b.setGender(rs.getBoolean(9));
                b.setStatus(rs.getBoolean(6));
                int role_id = rs.getInt(8);

                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                b.setRole(r);
                AddressDBContext ar = new AddressDBContext();
                ArrayList<Address> a = new ArrayList<>();
                a = ar.getAddressByCustomerId(rs.getInt(1));
                b.setAddress(a);
                list.add(b);

            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getToltalCustomer() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Customer";
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

    public List<Customer_User> getAllByFullName(String search) {
        String sql = "select * from Customer where name_cus like '%' + ? + '%'";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer_User b = new Customer_User();
                b.setCus_id(rs.getInt(1));
                b.setName_cus(rs.getString(2));
                b.setEmail(rs.getString(4));
                b.setC_phone(rs.getString(5));
                b.setGender(rs.getBoolean(9));
                b.setStatus(rs.getBoolean(6));
                int role_id = rs.getInt(8);
                EmployeeDBContext eDB = new EmployeeDBContext();
                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                b.setRole(r);
                AddressDBContext ar = new AddressDBContext();
                ArrayList<Address> a = new ArrayList<>();
                a = ar.getAddressByCustomerId(rs.getInt(1));
                b.setAddress(a);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer_User> getAllByEmail(String search) {
        String sql = "select * from Customer where email like '%' + ? + '%'";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Customer_User b = new Customer_User();
                b.setCus_id(rs.getInt(1));
                b.setName_cus(rs.getString(2));
                b.setEmail(rs.getString(4));
                b.setC_phone(rs.getString(5));
                b.setGender(rs.getBoolean(9));
                b.setStatus(rs.getBoolean(6));
                int role_id = rs.getInt(8);
                EmployeeDBContext eDB = new EmployeeDBContext();
                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                b.setRole(r);
                AddressDBContext ar = new AddressDBContext();
                ArrayList<Address> a = new ArrayList<>();
                a = ar.getAddressByCustomerId(rs.getInt(1));
                b.setAddress(a);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer_User> getAllByMobile(String search) {
        String sql = "select * from Customer where c_phone like '%' + ? + '%'";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Customer_User b = new Customer_User();
                b.setCus_id(rs.getInt(1));
                b.setName_cus(rs.getString(2));
                b.setEmail(rs.getString(4));
                b.setC_phone(rs.getString(5));
                b.setGender(rs.getBoolean(9));
                b.setStatus(rs.getBoolean(6));
                int role_id = rs.getInt(8);
                EmployeeDBContext eDB = new EmployeeDBContext();
                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                b.setRole(r);
                AddressDBContext ar = new AddressDBContext();
                ArrayList<Address> a = new ArrayList<>();
                a = ar.getAddressByCustomerId(rs.getInt(1));
                b.setAddress(a);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer_User getDetailsByCusId(int cus_id) {
        String sql = "select * from Customer where cus_id = ?";
        Customer_User c = new Customer_User();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, cus_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                c.setCus_id(rs.getInt(1));
                c.setName_cus(rs.getString(2));
                c.setEmail(rs.getString(4));
                c.setC_phone(rs.getString(5));
                c.setGender(rs.getBoolean(9));
                c.setStatus(rs.getBoolean(6));
                c.setUsername(rs.getString(10));
                int role_id = rs.getInt(8);
                EmployeeDBContext eDB = new EmployeeDBContext();
                RoleDBContext rb = new RoleDBContext();
                Role r = rb.getroleNameByRoleId(role_id);
                c.setRole(r);
                AddressDBContext ar = new AddressDBContext();
                ArrayList<Address> a = new ArrayList<>();
                a = ar.getAddressByCustomerId(rs.getInt(1));
                c.setAddress(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return c;
    }

    public void updateUser(String cus_id, String status, String role) {
        String sql = "UPDATE [dbo].[Customer]\n"
                + "   SET\n"
                + "   \n"
                + "      [status] = ?\n"
                + "  \n"
                + "      ,[role_id] = ?\n"
                + "      \n"
                + " WHERE cus_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(2, Integer.parseInt(role));
            st.setBoolean(1, Boolean.parseBoolean(status));
            st.setInt(3, Integer.parseInt(cus_id));
            st.executeUpdate();
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        CustomerDBContext l = new CustomerDBContext();

        Customer_User c = l.getCustomerAccountByEmail("shamt2004@gmail.com", "thang123");
        System.out.println(c.getName_cus());
        // for (Customer_User x : c) {
        // System.out.println(x.size);
        // }
    }

    public List<Customer_User> getAllListByProductidEmployeeIdDate(Date date, int eid, int pid, int pageNumber,
            int pageSize) {
        String sql = "SELECT *\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id =? and p.product_id=? and o.created_at=?  ORDER BY c.cus_id\n"
                + "                OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setDate(3, date);
            st.setInt(4, offset);
            st.setInt(5, pageSize);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer_User c = new Customer_User();
                c.setCus_id(rs.getInt("cus_id"));
                c.setName_cus(rs.getString("name_cus"));
                ArrayList<Order> oList = new ArrayList<>();
                OrderDBContext odb = new OrderDBContext();
                oList = odb.getListOrderByEmployeeIdProductId(pid, eid);
                c.setOrders(oList);
                list.add(c);
            }

            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Customer_User> getAllListByProductidEmployeeId(int eid, int pid, int pageNumber, int pageSize) {
        String sql = "SELECT c.*,p.* ,o.*\n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "WHERE e.emp_id = ? and p.product_id=?\n"
                + "ORDER BY c.cus_id\n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setInt(3, offset);
            st.setInt(4, pageSize);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer_User c = new Customer_User();
                c.setCus_id(rs.getInt("cus_id"));
                c.setName_cus(rs.getString("name_cus"));
                ArrayList<Order> oList = new ArrayList<>();
                OrderDBContext odb = new OrderDBContext();
                oList = odb.getListOrderByEmployeeIdProductId(pid, eid);
                c.setOrders(oList);
                list.add(c);
            }

            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalCusByProductEmployeeid(Date date, int eid, int pid) {
        String sql = "SELECT COUNT(*)\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id =? and p.product_id=? and o.created_at=? ";
        int c = -1;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setDate(3, date);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c = rs.getInt(1);
            }
            return c;

        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    public int getTotalCusByProductEmployeeidName(String name, int eid, int pid) {
        String sql = "SELECT COUNT(*)\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id =? and p.product_id=? and c.name_cus like '%'+?+'%' ";
        int c = -1;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setString(3, name);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c = rs.getInt(1);
            }
            return c;

        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }

    //<editor-fold defaultstate="collapsed" desc="getTotalCusByProductEmployeeid">
    public int getTotalCusByProductEmployeeid(int eid, int pid) {
        String sql = "SELECT Count(*)\n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "WHERE e.emp_id = ? and p.product_id=?\n";
        int c = -1;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c = rs.getInt(1);
            }
            return c;
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }
    
    public List<Customer_User> getAllListByProductidEmployeeIdName(String name, int eid, int pid, int pageNumber,
            int pageSize) {
        String sql = "SELECT *\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id =? and p.product_id=? and c.name_cus like '%'+?+'%'   ORDER BY c.cus_id\n"
                + "                OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setString(3, name);
            st.setInt(4, offset);
            st.setInt(5, pageSize);
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer_User c = new Customer_User();
                c.setCus_id(rs.getInt("cus_id"));
                c.setName_cus(rs.getString("name_cus"));
                ArrayList<Order> oList = new ArrayList<>();
                OrderDBContext odb = new OrderDBContext();
                oList = odb.getListOrderByEmployeeIdProductId(pid, eid);
                c.setOrders(oList);
                list.add(c);
            }
            
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public int gettotalByProductidEmployeeIdtotal(float total, int eid, int pid) {
        String sql = "SELECT *\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id =? and p.product_id=? and o.total=? ";
        int c = -1;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setFloat(3, total);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c = rs.getInt(1);
            }
            return c;
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1;
    }
    
//</editor-fold>
    public List<Customer_User> getAllListByProductidEmployeeIdtotal(float total, int eid, int pid, int pageNumber,
            int pageSize) {
        String sql = "SELECT *\n"
                + "              FROM Employee e \n"
                + "              INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "              INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "                INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "             INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "               INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "               WHERE e.emp_id =? and p.product_id=? and o.total=?  ORDER BY c.cus_id\n"
                + "                OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Customer_User> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setFloat(3, total);
            st.setInt(4, offset);
            st.setInt(5, pageSize);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer_User c = new Customer_User();
                c.setCus_id(rs.getInt("cus_id"));
                c.setName_cus(rs.getString("name_cus"));
                ArrayList<Order> oList = new ArrayList<>();
                OrderDBContext odb = new OrderDBContext();
                oList = odb.getListOrderByEmployeeIdProductId(pid, eid);
                c.setOrders(oList);
                list.add(c);
            }

            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
