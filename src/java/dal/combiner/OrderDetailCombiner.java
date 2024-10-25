/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.combiner;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author Anonymous
 */
public class OrderDetailCombiner {

    public static OrderDetail toElement(ResultSet rs) throws SQLException {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setDetail_id(rs.getInt("detail_id"));
        orderDetail.setPrice_at_order(rs.getInt("price_at_order"));
        orderDetail.setQuantity(rs.getInt("quantity"));
        Product p  = new Product();
        p.setProduct_id(rs.getInt("product_id"));
        orderDetail.setProduct(p);
        return orderDetail;
    }

}
