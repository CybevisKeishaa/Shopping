/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.OrderDetail;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KEISHA
 */
public class OrderDetailDBContext extends DBContext<OrderDetail> {

    public OrderDetail getDetailByOrderID(int orderID) {
        OrderDetail detail = new OrderDetail();
        PreparedStatement stm = null;

        String sql = "SELECT o.order_id, o.created_at AS orderedDate, o.total AS totalCost, so.status, p.name AS productName, o.shipping_method, od.quantity, od.price_at_order\n"
                + "FROM [dbo].[Order] o\n"
                + "JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id\n"
                + "JOIN [dbo].[Product] p ON od.product_id = p.product_id\n"
                + "JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id\n"
                + "WHERE o.order_id = ?;";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return detail;
    }
}
