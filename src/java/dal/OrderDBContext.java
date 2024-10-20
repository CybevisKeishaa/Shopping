/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.combiner.OrderCombiner;
import dal.sql.OrderSql;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Address;
import model.Customer_User;
import model.Gender;
import model.Image;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Status_Order;
import model.combiner.Order_StatusTotal;

/**
 *
 * @author admin
 */
public class OrderDBContext extends DBContext<Order> {

    // ========================== Get Many Orders Section =======================
    public List<Order> getAllOrder(String search, Date startDate, Date endDate, String sort, boolean desc, int pageNumber, int pageSize) {

        ArrayList<Order> orders = new ArrayList<>();
        // Phân trang với OFFSET và FETCH
        String sql = OrderSql.GET_ALL;// lấy tất cả nếu empID == null
        String whereSQL = "";
        String orderBySQL = "";
        try {
            PreparedStatement stm;
            int offset = (pageNumber - 1) * pageSize;
            boolean hasSearch = true;
            if (startDate != null && endDate != null) {
                whereSQL = "WHERE o.created_at BETWEEN '" + startDate.toString() + "' AND '" + endDate.toString() + "'";
            } else if (startDate != null) {
                whereSQL = "WHERE o.created_at >= '" + startDate.toString() + "'";
            } else if (endDate != null) {
                whereSQL = "WHERE o.created_at <= '" + endDate.toString() + "'";
            } else {
                hasSearch = false;
            }
            if (!search.isEmpty()) {
                if (hasSearch) {
                    whereSQL += " AND (c.name_cus LIKE '%" + search + "%' OR o.order_id LIKE '%" + search + "%')";
                } else {
                    whereSQL = "WHERE (c.name_cus LIKE '%" + search + "%' OR o.order_id LIKE '%" + search + "%')";
                }
            }
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
            stm.setInt(1, offset);    // Set OFFSET
            stm.setInt(2, pageSize);  // Set FETCH NEXT

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

    public int getTotalOrderCount(String search, Date startDate, Date endDate) {
        int count = 0;
        String sql = OrderSql.GET_ALL_COUNT;
        String whereSQL = "";
        try {
            PreparedStatement stm;
            boolean hasSearch = true;
            if (startDate != null && endDate != null) {
                whereSQL = "WHERE o.created_at BETWEEN '" + startDate.toString() + "' AND '" + endDate.toString() + "'";
            } else if (startDate != null) {
                whereSQL = "WHERE o.created_at >= '" + startDate.toString() + "'";
            } else if (endDate != null) {
                whereSQL = "WHERE o.created_at <= '" + endDate.toString() + "'";
            } else {
                hasSearch = false;
            }
            if (!search.isEmpty()) {
                if (hasSearch) {
                    whereSQL += " AND (c.name_cus LIKE '%" + search + "%' OR o.order_id LIKE '%" + search + "%')";
                } else {
                    whereSQL = "WHERE (c.name_cus LIKE '%" + search + "%' OR o.order_id LIKE '%" + search + "%')";
                }
            }

            sql = sql.replace("{where}", whereSQL);

            stm = connect.prepareStatement(sql);

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
            String sql = "SELECT o.order_id, o.total, o.created_at, o.shipping_method,"
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
        Order o = new Order();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT o.order_id, o.total, o.created_at, o.shipping_method, so.status, \n"
                    + "       c.name_cus, c.gender, c.email, c.c_phone, \n"
                    + "       a.city, a.district, a.ward, a.street\n"
                    + "FROM [Order] o\n"
                    + "LEFT JOIN Customer c ON c.cus_id = o.cus_id\n"
                    + "LEFT JOIN [db_owner].[Status_Order] so ON so.status_id = o.status_id\n"
                    + "LEFT JOIN Address a ON a.cus_id = c.cus_id\n"
                    + "WHERE o.order_id = ?  AND c.cus_id = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, orderID);
            stm.setInt(2, cus_id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                o.setOrder_id(rs.getInt("order_id"));
                o.setCreate_at(rs.getTimestamp("created_at"));
                o.setTotal_price(rs.getInt("total"));
                Status_Order so = new Status_Order();
                so.setStatus_id(rs.getInt("status_id"));
                so.setStatus_name(rs.getString("status"));

                o.setStatus(so);
                o.setShipping_method(rs.getString("shipping_method"));

                // Lấy thông tin khách hàng
                Customer_User c = new Customer_User();
                c.setName_cus(rs.getString("name_cus"));
                c.setGender(rs.getBoolean("gender"));
                c.setEmail(rs.getString("email"));
                c.setC_phone(rs.getString("c_phone"));

                // Lấy thông tin địa chỉ
                ArrayList<Address> addres = new ArrayList<>();
                Address address = new Address();
                address.setCity(rs.getString("city"));
                address.setDistrict(rs.getString("district"));
                address.setWard(rs.getString("ward"));
                address.setStreet(rs.getString("street"));
                addres.add(address);
                c.setAddress(addres);

                o.setCustomer(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
            String sql = "SELECT p.product_id, p.name AS product_name, g.name AS gender_name, od.quantity, od.price_at_order, \n"
                    + "       (od.quantity * od.price_at_order) AS total_cost, MIN(img.img_url) AS product_image\n"
                    + "FROM [OrderDetail] od\n"
                    + "LEFT JOIN [Product] p ON od.product_id = p.product_id\n"
                    + "LEFT JOIN Product_Gender pg ON pg.product_id = p.product_id\n"
                    + "LEFT JOIN Gender g ON g.gender_id = pg.gender_id\n"
                    + "LEFT JOIN [Order] o ON o.order_id = od.order_id\n"
                    + "LEFT JOIN Product_Image pi ON pi.product_id = p.product_id\n"
                    + "LEFT JOIN Image img ON img.img_id = pi.img_id\n"
                    + "WHERE od.order_id = ? AND o.cus_id = ? \n"
                    + "GROUP BY p.product_id, p.name, g.name, od.quantity, od.price_at_order";

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
                    connect.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return products;
    }

    public List<Order_StatusTotal> getStatusTotal() {
        PreparedStatement stm = null;
        ArrayList<Order_StatusTotal> list = new ArrayList<>();
        String sql = OrderSql.TOTAL_PRICE_ORDER_SQL;
        try {
            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                var statusTotal = new Order_StatusTotal();
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
    public void updateOrderStatus(int orderID, int statusID) {
        PreparedStatement stm = null;
        try {
            connect.setAutoCommit(false);
            String sql = "UPDATE dbo.[Order] SET status_id = ? WHERE order_id = ?;";

            stm = connect.prepareStatement(sql);

            stm.setInt(1, statusID);
            stm.setInt(2, orderID);

            stm.executeUpdate();

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

                if (connect != null) {
                    connect.setAutoCommit(true);
                    connect.close();
                }
                if (stm != null) {
                    stm.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void insertOrder(int total, Date create_at, int statusID, int cusID, int paymentMethodID, String note, int addressID) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([total]\n"
                    + "           ,[created_at]\n"
                    + "           ,[status_id]\n"
                    + "           ,[cus_id]\n"
                    + "           ,[payment_method_id]\n"
                    + "           ,[note]\n"
                    + "           ,[addressID])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, total);
            stm.setDate(2, new Date(create_at.getTime()));
            stm.setInt(3, statusID);
            stm.setInt(4, cusID);
            stm.setInt(5, paymentMethodID);
            stm.setString(6, note);
            stm.setInt(7, addressID);

            stm.executeUpdate();
        } catch (SQLException e) {
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

    public static void main(String[] args) {
        OrderDBContext db = new OrderDBContext();
        ArrayList<Product> products = db.getProductsByOrderAndCustomer(25, 1);
        System.out.println(products.size());
    }

}
