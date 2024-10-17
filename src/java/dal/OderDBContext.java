/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DINH SON
 */
public class OderDBContext extends DBContext<Order>{
    public List<Order> getOrderStatistics(String startDate, String endDate) {
    String sql = "SELECT " +
            "COUNT(CASE WHEN o.status_id = 4 THEN 1 END) AS success_orders, " +  // Completed
            "COUNT(CASE WHEN o.status_id = 5 THEN 1 END) AS cancelled_orders, " +  // Cancelled
            "COUNT(CASE WHEN o.status_id = 1 THEN 1 END) AS pending_orders " +  // Pending
            "FROM [order] o " +
            "JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id " +
            "WHERE o.created_at BETWEEN ? AND ?";

    List<Order> ordersList = new ArrayList<>();

    try {
        PreparedStatement st = connect.prepareStatement(sql);
        st.setString(1, startDate);
        st.setString(2, endDate);
        ResultSet rs = st.executeQuery();
        
        if (rs.next()) {
            Order orderStats = new Order();
            orderStats.setSuccessOrders(rs.getInt("success_orders"));
            orderStats.setCancelledOrders(rs.getInt("cancelled_orders"));
            orderStats.setPendingOrders(rs.getInt("pending_orders"));
            ordersList.add(orderStats);
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return ordersList;
}
 public List<Order> getOrderRevenueStatistics(String startDate, String endDate) {
    String sql = "SELECT " +
            "SUM(od.price_at_order * od.quantity) AS total_revenue " +
            "FROM dbo.OrderDetail od " +
            "JOIN dbo.Product p ON od.product_id = p.product_id " +
            "JOIN [order] o ON od.order_id = o.order_id " +  // Kết nối với bảng order để lọc theo ngày
            "WHERE o.created_at BETWEEN ? AND ?";

    List<Order> ordersList = new ArrayList<>();

    try {
        PreparedStatement st = connect.prepareStatement(sql);
        st.setString(1, startDate);
        st.setString(2, endDate);
        ResultSet rs = st.executeQuery();
        
        if (rs.next()) {
            Order orderStats = new Order();
            orderStats.setTotalRevenue(rs.getDouble("total_revenue"));  
            ordersList.add(orderStats);
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return ordersList;
}



    
}
