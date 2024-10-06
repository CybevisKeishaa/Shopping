/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author admin
 */
public class OrderDetailDBContext extends DBContext{
    public ArrayList<OrderDetail> getListOrderDetailbyEidPid(int eid,int pid,int oid){
         String sql = "SELECT *\n"
                + "FROM Employee e \n"
                + "INNER JOIN Employee_Product ep ON e.emp_id = ep.emp_id \n"
                + "INNER JOIN Product p ON p.product_id = ep.product_id \n"
                + "INNER JOIN OrderDetail od on od.product_id=p.product_id\n"
                + "INNER JOIN [Order] o on od.detail_id=o.order_id\n"
                + "INNER JOIN Customer c on c.cus_id=o.cus_id\n"
                + "WHERE e.emp_id = ? and p.product_id=? and o.order_id=?";
         ArrayList<OrderDetail> list=new ArrayList<>();
         try{
             PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, eid);
            st.setInt(2, pid);
            st.setInt(3, oid);
            
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                OrderDetail od=new OrderDetail();
                productListDBContext pDb=new productListDBContext();
                ArrayList<Product> pList=pDb.getAllListByEidPid(eid,pid,rs.getInt("detail_id"));
                od.setProducts(pList);
                list.add(od);
            }
            return list;
         }catch(Exception e){
             System.out.println(e);
         }
         return null;
    }
    public static void main(String[] args){
        OrderDetailDBContext od=new OrderDetailDBContext();
        System.out.println(od.getListOrderDetailbyEidPid(1, 2, 1).size());
    }
}
