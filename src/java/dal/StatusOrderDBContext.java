/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Status_Order;

public class StatusOrderDBContext extends DBContext {

    // Fetch all status orders from the database
    public List<Status_Order> getAllStatusOrders() {
        List<Status_Order> statusOrderList = new ArrayList<>();

        String sql = "SELECT status_id, status FROM Status_Order";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Status_Order statusOrder = new Status_Order();
                statusOrder.setStatus_id(rs.getInt("status_id"));
                statusOrder.setStatus_name(rs.getString("status"));
                statusOrderList.add(statusOrder);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StatusOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusOrderList;
    }

    // Fetch a specific status order by its ID
    public Status_Order getStatusOrderById(int soid) {
        Status_Order statusOrder = null;

        String sql = "SELECT status_id, status FROM Status_Order WHERE status_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, soid);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                statusOrder = new Status_Order();
                statusOrder.setStatus_id(rs.getInt("status_id"));
                statusOrder.setStatus_name(rs.getString("status"));
            }

        } catch (SQLException ex) {
            Logger.getLogger(StatusOrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return statusOrder;
    }
}
