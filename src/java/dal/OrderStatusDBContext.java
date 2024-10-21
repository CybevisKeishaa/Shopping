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
import model.Status_Order;

/**
 *
 * @author Anonymous
 */
public class OrderStatusDBContext extends DBContext {

    public OrderStatusDBContext() {
    }

    public List<Status_Order> getAllStatus() {
        List<Status_Order> result = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "select status_id,status from Status_Order";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(new Status_Order(rs.getInt(1), rs.getString(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderStatusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
