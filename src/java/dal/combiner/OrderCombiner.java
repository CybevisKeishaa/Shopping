/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.combiner;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Address;
import model.Customer_User;
import model.Order;
import model.Status_Order;

/**
 *
 * @author Anonymous
 */
public class OrderCombiner {

    public static Order toTableRow(ResultSet rs) throws SQLException {
        Order o = new Order();

        o.setOrder_id(rs.getInt("order_id"));
        o.setCreate_at(rs.getTimestamp("orderedDate"));
        o.setTotal_price(rs.getInt("totalCost"));

        Status_Order so = new Status_Order();
        so.setStatus_name(rs.getString("status"));

        o.setStatus(so);

        o.setFirstProductName(rs.getString("firstProductName"));
        o.setNumberOfOtherProducts(rs.getInt("productCount"));
        return o;
    }

    public static Order toElement(ResultSet rs) throws SQLException {
        Order o = new Order();
        
        o.setOrder_id(rs.getInt("order_id"));
        o.setCreate_at(rs.getTimestamp("created_at"));
        o.setTotal_price(rs.getInt("total"));
        // Lấy thông tin trạng thái order
        Status_Order so = new Status_Order();
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
        return o;
    }
}
