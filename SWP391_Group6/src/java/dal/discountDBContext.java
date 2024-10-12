/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import dal.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Discount;

/**
 *
 * @author admin
 */
public class DiscountDBContext extends DBContext<Discount>{
    public Discount getDiscountById(int id){
        String sql="Select * from Discount where discount_id=?";
        try{
              PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Discount d=new Discount();
            if(rs.next()){
                d.setDiscount_id(id);
                d.setName(rs.getString(2));
                d.setAmount(rs.getInt(3));
                d.setStart(rs.getDate(4));
                d.setEnd(rs.getDate(5));
            }
            return d;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
}



