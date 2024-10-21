/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.combiner.OrderDetailCombiner;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author KEISHA
 */
public class OrderDetailDBContext extends DBContext<OrderDetail> {

    public List<OrderDetail> getDetailsByOrderID(int orderID) {
        List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();

        String sql = """
                        SELECT od.detail_id,od.product_id,od.price_at_order,od.quantity,od.capacity_id,od.order_id
                        FROM [dbo].[OrderDetail] od
                        WHERE od.order_id = ?
                     """;
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                 orderDetailList.add(OrderDetailCombiner.toElement(rs));
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetailList;
    }

    public ArrayList<OrderDetail> getListOrderDetailbyEidPid(int eid, int pid, int oid) {
        String sql = "SELECT *\n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "WHERE e.emp_id = ? and p.product_id=? and o.order_id=?";
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setInt(3, oid);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                ProductListDBContext pDb = new ProductListDBContext();
                ArrayList<Product> pList = pDb.getAllListByEidPid(eid, pid, rs.getInt("detail_id"));
                od.setProducts(pList);
                list.add(od);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

}
