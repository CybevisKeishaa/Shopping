/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Payment;

/**
 *
 * @author KEISHA
 */
public class PaymentDBContext extends DBContext<Payment> {

    public ArrayList<Payment> allPaymentMethods() {

        PreparedStatement stm = null;
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            String sql = "Select payment_method_id, payment_name from PaymentMethod";
            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Payment p = new Payment();
                p.setPaymentID(rs.getInt("payment_method_id"));
                p.setPaymentName(rs.getString("payment_name"));
                payments.add(p);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }

}
