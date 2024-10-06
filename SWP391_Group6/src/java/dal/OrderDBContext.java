/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author admin
 */
public class OrderDBContext extends DBContext {

    public ArrayList<Order> getListOrderByEmployeeIdProductId(int pid, int eid) {
        String sql = "SELECT c.*,p.* ,o.*\n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "WHERE e.emp_id = ? and p.product_id=?";
        ArrayList<Order> list=new ArrayList<>();
        try{
              PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
           
         
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Order o=new Order();
                o.setOrder_id(rs.getInt("order_id"));
                Float f=rs.getFloat("total");
                  o.setTotal_price(Math.round(f));
//                  o.setStatus(status);
                o.setCreate_at(rs.getDate("created_at"));
                OrderDetailDBContext odb=new OrderDetailDBContext();
                ArrayList<OrderDetail> odlist=odb.getListOrderDetailbyEidPid(eid, pid, rs.getInt("order_id"));
                o.setOrderDetails(odlist);
            list.add(o);
                
            
            }
            return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args){
        OrderDBContext od=new OrderDBContext();
        ArrayList<Order> l=od.getListOrderByEmployeeIdProductId(1, 2);
        System.out.println(l.size());
        for(Order x:l){
            System.out.println(x.getCreate_at());
        }
        System.out.println(od.getListOrderByEmployeeIdProductId(1, 2).size());
    }
}
