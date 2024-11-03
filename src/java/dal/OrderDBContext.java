/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.combiner.OrderCombiner;
import dal.sql.OrderSql;
import jakarta.mail.MessagingException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Address;
import model.Capacity;
import model.Customer_User;
import model.Gender;
import model.Image;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Status_Order;
import model.dtos.Order_StatusTotalDTO;

/**
 *
 * @author admin
 */
public class OrderDBContext extends DBContext<Order> {

    // ========================== Get Many Orders Section =======================
    public List<Order> getAllOrder(String search, Date startDate, Date endDate, Integer employeeId, String sort, boolean desc, int pageNumber, int pageSize) {
        ArrayList<Order> orders = new ArrayList<>();
        // Phân trang với OFFSET và FETCH
        String sql = OrderSql.GET_ALL;
        String whereSQL = "";
        String orderBySQL = "";
        try {
            PreparedStatement stm;
            int offset = (pageNumber - 1) * pageSize;
            if (startDate != null && endDate != null) {
                whereSQL = " AND o.created_at BETWEEN ? AND ?";
            } else if (startDate != null) {
                whereSQL = " AND o.created_at >= ?";
            } else if (endDate != null) {
                whereSQL = " AND o.created_at <= ?";
            }
            if (!search.isEmpty()) {
                whereSQL += " AND (c.name_cus LIKE ? OR o.order_id LIKE ?)";
            }
            // lấy tất cả nếu employeeId == null
            if (employeeId != null) {
                whereSQL += " AND o.employee_id = ?";
            } 
            // Sort
            switch (sort) {
                case "orderdate":
                    orderBySQL = "ORDER BY o.created_at ";
                    break;
                case "customername":
                    orderBySQL = "ORDER BY c.name_cus ";
                    break;
                case "totalcost":
                    orderBySQL = "ORDER BY o.total ";
                    break;
                case "status":
                    orderBySQL = "ORDER BY so.status ";
                    break;
                default:
                    orderBySQL = "ORDER BY o.created_at ";
            }
            if (desc) {
                orderBySQL += " DESC";
            }
            sql = sql.replace("{where}", whereSQL).replace("{orderBy}", orderBySQL);
            stm = connect.prepareStatement(sql);
            // Set parameters for PreparedStatement
            int paramIndex = 1;
            if (startDate != null) {
                stm.setDate(paramIndex++, new Date(startDate.getTime()));
            }
            if (endDate != null) {
                stm.setDate(paramIndex++, new Date(endDate.getTime()));
            }
            if (!search.isEmpty()) {
                stm.setString(paramIndex++, "%" + search + "%");
                stm.setString(paramIndex++, "%" + search + "%");
            }
            if (employeeId != null) {
                stm.setInt(paramIndex++, employeeId);
            }
            stm.setInt(paramIndex++, offset);    // Set OFFSET
            stm.setInt(paramIndex++, pageSize);  // Set FETCH NEXT
            // Execute the query
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = OrderCombiner.toTableRow(rs);
                orders.add(o);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return orders;
    }

//    public List<Order> getAllNoEmployeeOrder() {
//        ArrayList<Order> orders = new ArrayList<>();
//        // Phân trang với OFFSET và FETCH
//        String sql = OrderSql.GET_ALL;
//        String whereSQL = "AND o.employee_id is null";
//        String orderBySQL = "Order by o.order_id ASC";
//        try {
//            PreparedStatement stm;
//
//            sql = sql.replace("{where}", whereSQL).replace("{orderBy}", orderBySQL).replace("OFFSET ? ROWS FETCH NEXT ? ROWS ONLY", "");
//            stm = connect.prepareStatement(sql);
//            // Execute the query
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Order o = OrderCombiner.toTableRow(rs);
//                orders.add(o);
//            }
//            rs.close();
//            stm.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return orders;
//    }

    public int getEarliestOrderIDByCustomer(int cus_id) {
        int orderID = 0;
        String sql = "SELECT TOP 1 order_id FROM [Order] WHERE cus_id = ? ORDER BY created_at DESC";

        try (PreparedStatement stmt = connect.prepareStatement(sql)) {
            stmt.setInt(1, cus_id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    orderID = rs.getInt("order_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Thêm xử lý ngoại lệ phù hợp tại đây
        }

        return orderID;
    }

//    public ArrayList<Order> myOrders(int customerID, int pageNumber, int pageSize) {
//        ArrayList<Order> orders = new ArrayList<>();
//        // Phân trang với OFFSET và FETCH
//        String sql = """
//                    SELECT o.order_id, 
//                           o.created_at AS orderedDate, 
//                           o.total AS totalCost, 
//                           so.status, 
//                           MIN(p.name) AS firstProductName, 
//                           COUNT(od.product_id) AS productCount
//                    FROM [dbo].[Order] o
//                    JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id
//                    JOIN [dbo].[Product] p ON od.product_id = p.product_id
//                    JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id
//                    WHERE o.cus_id = ?
//                    GROUP BY o.order_id, o.created_at, o.total, so.status
//                    ORDER BY o.created_at DESC
//                    OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
//                    """;
    public int getTotalOrderCount(String search, Date startDate, Date endDate, Integer employeeId) {
        int count = 0;
        String sql = OrderSql.GET_ALL_COUNT;
        String whereSQL = "";
        try {
            PreparedStatement stm;
            if (startDate != null && endDate != null) {
                whereSQL = "AND o.created_at BETWEEN ? AND ?";
            } else if (startDate != null) {
                whereSQL = "AND o.created_at >= ?";
            } else if (endDate != null) {
                whereSQL = "AND o.created_at <= ?";
            }
            if (!search.isEmpty()) {
                whereSQL += " AND (c.name_cus LIKE ? OR o.order_id LIKE ?)";
            }
            if (employeeId != null) {
                whereSQL += " AND o.employee_id = ?";
            } 
            sql = sql.replace("{where}", whereSQL);
            stm = connect.prepareStatement(sql);
            int paramIndex = 1;
            if (startDate != null) {
                stm.setDate(paramIndex++, new Date(startDate.getTime()));
            }
            if (endDate != null) {
                stm.setDate(paramIndex++, new Date(endDate.getTime()));
            }
            if (!search.isEmpty()) {
                stm.setString(paramIndex++, "%" + search + "%");
                stm.setString(paramIndex++, "%" + search + "%");
            }
            if (employeeId != null) {
                stm.setInt(paramIndex++, employeeId);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int getTotalOrderByCustomer(int cus_id) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM [Order] o\n"
                + "join Customer c on c.cus_id = o.cus_id\n"
                + "WHERE c.cus_id= ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, cus_id);

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

    public int getTotalOrderWithFilter(int customerID, Date startDate, Date endDate) {
        int totalOrder = 0;
        String sql = "SELECT COUNT(*) AS totalOrder FROM [dbo].[Order] o WHERE o.cus_id = ?";

        // Thêm điều kiện lọc theo ngày nếu có
        if (startDate != null && endDate != null) {
            sql += " AND o.created_at BETWEEN ? AND ?";
        }

        try {
            PreparedStatement stm = connect.prepareStatement(sql);
            stm.setInt(1, customerID);
            int paramIndex = 2;

            // Nếu có điều kiện lọc theo ngày, đặt giá trị cho các tham số
            if (startDate != null && endDate != null) {
                stm.setDate(paramIndex++, new java.sql.Date(startDate.getTime()));
                stm.setDate(paramIndex++, new java.sql.Date(endDate.getTime()));
            }

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalOrder = rs.getInt("totalOrder");
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalOrder;
    }

    public ArrayList<Order> getOrdersWithPaginationAndFilter(int customerID, int pageNumber, int pageSize,
            Date startDate, Date endDate, String sortColumn, String sortOrder) {
        ArrayList<Order> orders = new ArrayList<>();
        String sql = "SELECT \n"
                + "    o.order_id, \n"
                + "    o.created_at AS orderedDate, \n"
                + "    o.total AS totalCost, \n"
                + "    so.status, \n"
                + "    MIN(p.name) AS firstProductName, \n"
                + "    COUNT(od.product_id) AS productCount\n"
                + "FROM [dbo].[Order] o\n"
                + "JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id\n"
                + "JOIN [dbo].[Product] p ON od.product_id = p.product_id\n"
                + "JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id\n"
                + "WHERE o.cus_id = ?";

        if (startDate != null && endDate != null) {
            sql += " AND o.created_at BETWEEN ? AND ? ";
        }

        sql += "GROUP BY o.order_id, o.created_at, o.total, so.status "
                + "ORDER BY " + sortColumn + " " + sortOrder + " " // Thứ tự sắp xếp
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement stm = connect.prepareStatement(sql);

            // Kiểm tra việc thiết lập tham số
            System.out.println("Query: " + sql);

            stm.setInt(1, customerID);
            int paramIndex = 2;

            if (startDate != null && endDate != null) {
                stm.setDate(paramIndex++, new java.sql.Date(startDate.getTime()));
                stm.setDate(paramIndex++, new java.sql.Date(endDate.getTime()));
            }

            int offset = (pageNumber - 1) * pageSize;
            stm.setInt(paramIndex++, offset);
            stm.setInt(paramIndex++, pageSize);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt("order_id"));
                o.setCreate_at(rs.getTimestamp("orderedDate"));
                o.setTotal_price(rs.getInt("totalCost"));
                Status_Order so = new Status_Order();
                so.setStatus_name(rs.getString("status"));

                o.setStatus(so);
                o.setFirstProductName(rs.getString("firstProductName"));
                o.setNumberOfOtherProducts(rs.getInt("productCount"));

                // Kiểm tra dữ liệu trả về
                System.out.println("Order: " + o.getOrder_id() + ", " + o.getFirstProductName());

                orders.add(o);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public Order getOrderByOrderID(int orderID) {
        Order o = new Order();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT o.order_id, o.total, o.created_at, o.shipping_method, o.paid_status, "
                    + "       so.status_id,so.status, \n"
                    + "       c.cus_id ,c.name_cus, c.gender, c.email, c.c_phone, \n"
                    + "       a.city, a.district, a.ward, a.street\n"
                    + "FROM [Order] o\n"
                    + "LEFT JOIN Customer c ON c.cus_id = o.cus_id\n"
                    + "LEFT JOIN [db_owner].[Status_Order] so ON so.status_id = o.status_id\n"
                    + "LEFT JOIN Address a ON a.cus_id = c.cus_id\n"
                    + "WHERE o.order_id = ? ";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderID);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                o = OrderCombiner.toElement(rs, o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    public Order getOrderByOrderID(int orderID, int cus_id) {
        Order o = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT o.order_id, o.note, o.total, o.created_at, o.shipping_method, o.status_id, so.status, \n"
                    + "       c.name_cus, c.gender, c.email, c.c_phone, \n"
                    + "       a.city, a.district, a.ward, a.street\n"
                    + "FROM [Order] o\n"
                    + "LEFT JOIN Customer c ON c.cus_id = o.cus_id\n"
                    + "LEFT JOIN [db_owner].[Status_Order] so ON so.status_id = o.status_id\n"
                    + "LEFT JOIN Address a ON a.a_id = o.addressID\n" // Liên kết qua addressID
                    + "WHERE o.order_id = ? AND c.cus_id = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.setInt(2, cus_id);
            rs = stm.executeQuery();

            if (rs.next()) {
                o = new Order();
                o.setOrder_id(rs.getInt("order_id"));
                o.setCreate_at(rs.getTimestamp("created_at"));
                o.setTotal_price(rs.getInt("total"));
                o.setShipping_method(rs.getString("shipping_method"));
                ;

                // Lấy thông tin trạng thái
                Status_Order so = new Status_Order();
                so.setStatus_id(rs.getInt("status_id"));
                so.setStatus_name(rs.getString("status"));
                o.setStatus(so);

                // Lấy thông tin khách hàng
                Customer_User c = new Customer_User();
                c.setName_cus(rs.getString("name_cus"));
                c.setGender(rs.getBoolean("gender"));
                c.setEmail(rs.getString("email"));
                c.setC_phone(rs.getString("c_phone"));
                o.setNote(rs.getString("note"));

                Address address = new Address();
                address.setCity(rs.getString("city"));
                address.setDistrict(rs.getString("district"));
                address.setWard(rs.getString("ward"));
                address.setStreet(rs.getString("street"));
                address.setA_phone(rs.getString("c_phone"));

                o.setAddress(address);
                o.setCustomer(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đóng các tài nguyên
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return o;
    }

    public ArrayList<Order> getListOrderByEmployeeIdProductId(int pid, int eid) {
        String sql = "SELECT c.*,p.* ,o.*\n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "WHERE e.emp_id = ? and p.product_id=?";
        ArrayList<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrder_id(rs.getInt("order_id"));
                Float f = rs.getFloat("total");
                o.setTotal_price(Math.round(f));
//                  o.setStatus(status);
                o.setCreate_at(rs.getTimestamp("created_at"));
                OrderDetailDBContext odb = new OrderDetailDBContext();
                ArrayList<OrderDetail> odlist = odb.getListOrderDetailbyEidPid(eid, pid, rs.getInt("order_id"));
                o.setOrderDetails(odlist);
                list.add(o);

            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Product> getProductsByOrderAndCustomer(int orderId, int customerId) {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = """
                            SELECT p.product_id, p.name AS product_name, g.name AS gender_name, od.quantity, od.price_at_order,
                                   (od.quantity * od.price_at_order) AS total_cost, MIN(img.img_url) AS product_image
                            FROM [OrderDetail] od
                            LEFT JOIN [Product] p ON od.product_id = p.product_id
                            LEFT JOIN Product_Gender pg ON pg.product_id = p.product_id
                            LEFT JOIN Gender g ON g.gender_id = pg.gender_id
                            LEFT JOIN [Order] o ON o.order_id = od.order_id
                            LEFT JOIN Product_Image pi ON pi.product_id = p.product_id
                            LEFT JOIN Image img ON img.img_id = pi.img_id
                            WHERE od.order_id = ? AND o.cus_id = ?
                            GROUP BY p.product_id, p.name, g.name, od.quantity, od.price_at_order;
                         """;

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.setInt(2, customerId);

            rs = stm.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                // Lấy thông tin sản phẩm
                product.setProduct_id(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));

                // Lấy giới tính sản phẩm
                ArrayList<Gender> genders = new ArrayList<>();
                Gender g = new Gender();
                g.setName(rs.getString("gender_name"));
                genders.add(g);
                product.setGender(genders);

                // Lấy hình ảnh sản phẩm
                ArrayList<Image> imgs = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("product_image"));
                imgs.add(i);
                product.setImg(imgs);

                // Lấy các thông tin khác
                product.setStock(rs.getInt("quantity"));
                product.setPrice(rs.getInt("price_at_order"));

                // Thêm sản phẩm vào danh sách
                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (connect != null) {

                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public ArrayList<Product> getNewProductsByOrderAndCustomer(int orderId, int customerId) {
        ArrayList<Product> products = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT p.product_id, p.name AS product_name, g.name AS gender_name, od.quantity, od.price_at_order, \n"
                    + "       (od.quantity * od.price_at_order) AS total_cost, MIN(img.img_url) AS product_image, \n"
                    + "       cap.cap_value, cap.cap_id\n"
                    + "FROM [OrderDetail] od\n"
                    + "LEFT JOIN [Product] p ON od.product_id = p.product_id\n"
                    + "LEFT JOIN Product_Gender pg ON pg.product_id = p.product_id\n"
                    + "LEFT JOIN Gender g ON g.gender_id = pg.gender_id\n"
                    + "LEFT JOIN [Order] o ON o.order_id = od.order_id\n"
                    + "LEFT JOIN Product_Capacity pc ON pc.product_id = p.product_id AND pc.cap_id = od.capacity_id\n"
                    + "LEFT JOIN Capacity cap ON cap.cap_id = pc.cap_id\n"
                    + "LEFT JOIN Product_Image pi ON pi.product_id = p.product_id\n"
                    + "LEFT JOIN Image img ON img.img_id = pi.img_id\n"
                    + "WHERE od.order_id = ? AND o.cus_id = ?\n"
                    + "GROUP BY p.product_id, p.name, g.name, od.quantity, od.price_at_order, cap.cap_value, cap.cap_id";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderId);
            stm.setInt(2, customerId);

            rs = stm.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setProduct_id(rs.getInt("product_id"));
                product.setName(rs.getString("product_name"));

                ArrayList<Image> imgs = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("product_image"));
                imgs.add(i);
                product.setImg(imgs);

                ArrayList<Capacity> capacity = new ArrayList<>();
                Capacity c = new Capacity();
                c.setCapacity_id(rs.getInt("cap_id"));
                c.setUnit_price(rs.getInt("price_at_order"));
                c.setValue(rs.getInt("cap_value"));
                capacity.add(c);

                product.setStock(rs.getInt("quantity"));
                product.setCapacity(capacity);

                products.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public List<Order_StatusTotalDTO> getStatusTotal() {
        PreparedStatement stm = null;
        ArrayList<Order_StatusTotalDTO> list = new ArrayList<>();
        String sql = OrderSql.TOTAL_PRICE_ORDER_SQL;
        try {
            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                var statusTotal = new Order_StatusTotalDTO();
                statusTotal.setStatus(rs.getString("status").trim());
                statusTotal.setTotal(rs.getDouble("total"));
                list.add(statusTotal);
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Integer> getOrderCountByWeek() {
        PreparedStatement stm = null;
        ArrayList<Integer> list = new ArrayList<>();
        String sql = """
            SELECT COUNT(order_id) AS count, CAST(created_at AS DATE) AS date 
            FROM [Order] 
            WHERE CAST(created_at AS DATE) >= DATEADD(DAY, -7, GETDATE()) 
            GROUP BY CAST(created_at AS DATE) 
            ORDER BY date;
        """;
        try {

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            // Initialize the list with zero counts for each day of the week.
            for (int i = 0; i < 7; i++) {
                list.add(0);  // Default values (in case some dates have no orders)
            }

            while (rs.next()) {
                int count = rs.getInt("count");
                Date date = rs.getDate("date");

                // Calculate the index (0 = today, 1 = yesterday, etc.)
                int index = (int) ChronoUnit.DAYS.between(date.toLocalDate(), LocalDate.now());

                if (index >= 0 && index < 7) {
                    list.set(index, count);
                }
            }
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    //=============== Data Change ===============
    public void updateStockAfterOrder(int productId, int capacityId, int quantity) {
        PreparedStatement stm = null;
        
        try {
            // Câu truy vấn SQL để giảm số lượng tồn kho
            String sql = "UPDATE Product_Capacity SET stock = stock - ? WHERE product_id = ? AND cap_id = ?";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, quantity);
            stm.setInt(2, productId);
            stm.setInt(3, capacityId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    
    public boolean updateOrderEmployeeID(int orderId, int empId) {
        Order o = getOrderByOrderID(orderId);
        if (o.getEmployee() == null) {
            PreparedStatement stm = null;
            try {
                // Câu truy vấn SQL để giảm số lượng tồn kho
                String sql = "UPDATE [Order] SET employee_id = ? where order_id = ?";
                stm = connect.prepareStatement(sql);
                stm.setInt(1, empId);
                stm.setInt(2, orderId);
                return stm.executeUpdate() > 0;
            } catch (SQLException ex) {
                Logger.getLogger("Update order employeeId " + orderId + "-" + empId).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    if (stm != null) {
                        stm.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return false;
    }
    
    public void updateOrderStatus(int orderID, int statusID, boolean isUser) throws MessagingException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            connect.setAutoCommit(false);

            // Validate order existence
            Order o = getOrderByOrderID(orderID);
            if (o == null) {
                throw new MessagingException("Order not found.");
            }
            Status_Order status = o.getStatus();
            int customerId = o.getCustomer().getCus_id();
            OrderDetailDBContext oddb = new OrderDetailDBContext();
            List<OrderDetail> orderDetailList = oddb.getDetailsByOrderID(orderID);

            // Check if the order is paid
            if (statusID != Status_Order.CANCELLED && !o.isPaidStatus()) {
                throw new MessagingException("Khách hàng chưa trả tiền cho sản phầm.");
            }

            // Check if status Order is invalid for change 
            if (!status.canTransition(o.getStatus().getStatus_id(), statusID, isUser)) {
                throw new MessagingException("Invalid Status Update.");
            }
            // update status
            String sql = """
                     UPDATE dbo.[Order] SET status_id = ?
                     OUTPUT inserted.status_id,inserted.total
                     WHERE order_id = ?;
                     """;

            stm = connect.prepareStatement(sql);
            stm.setInt(1, statusID);
            stm.setInt(2, orderID);

            rs = stm.executeQuery();
            if (rs.next() && statusID == Status_Order.CANCELLED) {
                // Restock to Wallet
                if (o.isPaidStatus()) {// đã trả tiền thì mới hoàn tiền
                    int total = rs.getInt("total");
                    sql = """
                        UPDATE w
                        SET w.total = w.total + ?
                        FROM Wallet w 
                        JOIN Customer c ON c.wallet_id = w.wallet_id
                        WHERE c.cus_id = ?;
                    """;
                    stm.close(); // Close previous statement
                    stm = connect.prepareStatement(sql);
                    stm.setInt(1, total);
                    stm.setInt(2, customerId);
                    stm.executeUpdate();
                }
                // Restock products
                for (OrderDetail od : orderDetailList) {
                    sql = """
                        UPDATE p
                        SET p.stock = p.stock + ?
                        FROM Product p
                        WHERE p.product_id = ?;
                      """;
                    int quantity = od.getQuantity(); // Corrected from getPrice_at_order()
                    stm.close(); // Close previous statement
                    stm = connect.prepareStatement(sql);
                    stm.setInt(1, quantity);
                    stm.setInt(2, od.getProduct().getProduct_id());
                    stm.executeUpdate();
                }
            }

            // Commit transaction
            connect.commit();
        } catch (SQLException ex) {
            if (connect != null) {
                try {
                    connect.rollback();
                    System.out.println("Transaction rolled back due to error.");
                } catch (SQLException e) {
                    Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                connect.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updatePaidStatus(int orderID) throws MessagingException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {

            // Validate order existence
            Order o = getOrderByOrderID(orderID);
            if (o == null) {
                throw new MessagingException("Order not found.");
            }
            Status_Order status = o.getStatus();
            int customerId = o.getCustomer().getCus_id();
            OrderDetailDBContext oddb = new OrderDetailDBContext();

            // Check if the order is paid
            if (o.isPaidStatus()) {
                throw new MessagingException("Khách hàng Đã trả tiền cho sản phầm.");
            }
            if (o.getStatus().getStatus_id() == Status_Order.CANCELLED) {
                throw new MessagingException("Đơn hàng đã bị huỷ.");
            }

            String sql = """
                     UPDATE dbo.[Order] SET paid_status = 1
                     OUTPUT inserted.*
                     WHERE order_id = ?;
                     """;

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderID);

            rs = stm.executeQuery();
            // Commit transaction
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateOrderPaidStatus(int orderId) {
        String sql = "UPDATE [Order] SET paid_status = ? WHERE order_id = ?";
        try (PreparedStatement stm = connect.prepareStatement(sql)) {
            stm.setBoolean(1, true);
            stm.setInt(2, orderId);
            stm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int insertOrder(int total, int statusID, int cusID, int paymentMethodID, String note, int addressID, int employeeID) {
        PreparedStatement stm = null;
        ResultSet generatedKeys = null;
        int orderId = -1;
        try {
            // Sử dụng GETDATE() để tự động lấy thời gian hiện tại từ SQL Server
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([total]\n"
                    + "           ,[created_at]\n"
                    + "           ,[status_id]\n"
                    + "           ,[cus_id]\n"
                    + "           ,[payment_method_id]\n"
                    + "           ,[note]\n"
                    + "           ,[addressID]\n"
                    + "           ,[paid_status]\n"
                    + "           ,[employee_id])\n"
                    + "     VALUES\n"
                    + "           (?, GETDATE(), ?, ?, ?, ?, ?, 0, ?)";

            stm = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, total);
            stm.setInt(2, statusID);
            stm.setInt(3, cusID);
            stm.setInt(4, paymentMethodID);
            stm.setString(5, note);
            stm.setInt(6, addressID);
            stm.setInt(7, employeeID);

            int affectedRows = stm.executeUpdate();

            if (affectedRows > 0) {
                generatedKeys = stm.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) {
                try {
                    generatedKeys.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orderId;  // Trả về orderId
    }

    public void updateToComplete(int orderID, int statusID) {

        PreparedStatement stm = null;
        try {
            String sql = "UPDATE dbo.[Order] SET status_id = ? WHERE order_id = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, statusID);
            stm.setInt(2, orderID);
            stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void updateToCancel(int orderID, int statusID) {

        PreparedStatement stm = null;
        try {
            String sql = "UPDATE dbo.[Order] SET status_id = ? WHERE order_id = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, statusID);
            stm.setInt(2, orderID);
            stm.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insertOrderDetail(int orderId, ArrayList<OrderDetail> orderDetails) {
        PreparedStatement stm = null;

        try {
            String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([order_id],\n"
                    + "            [product_id],\n"
                    + "            [quantity],\n"
                    + "            [price_at_order],\n"
                    + "            [capacity_id])\n"
                    + "     VALUES (?,?,?,?,?)";
            stm = connect.prepareStatement(sql);

            for (OrderDetail detail : orderDetails) {
                stm.setInt(1, orderId);
                stm.setInt(2, detail.getProducts().get(0).getProduct_id());  // Lấy ID của sản phẩm từ danh sách sản phẩm
                stm.setInt(3, detail.getQuantity());
                stm.setInt(4, detail.getPrice_at_order());
                stm.setInt(5, detail.getCapacity().getCapacity_id());

                // Sử dụng executeUpdate để in ra số hàng bị ảnh hưởng
                stm.executeUpdate();

            }

        } catch (SQLException e) {
            // In ra lỗi SQL chi tiết
            System.err.println("SQL Error while inserting OrderDetail: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
