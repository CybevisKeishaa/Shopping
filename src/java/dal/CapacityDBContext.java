/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Capacity;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KEISHA
 */
public class CapacityDBContext extends DBContext<Capacity>{
    
    public Capacity getCapacityFindById(int cid) {
        String sql = "Select * from Capacity WHERE cap_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity(rs.getInt(1), rs.getInt(2));
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public List<Capacity> getAll() {
        List<Capacity> list = new ArrayList<>();
        String sql = "Select * from Capacity";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity(rs.getInt(1), rs.getInt(2));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public ArrayList<Capacity> getCapacityByProductId(int id) {
        ArrayList<Capacity> list=new ArrayList<>();
        String sql = "Select c.cap_id,c.cap_value From Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Capacity c on c.cap_id=pc.cap_id where p.product_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Capacity c = new Capacity();
                c.setCapacity_id(rs.getInt(1));
                c.setValue(rs.getInt(2));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args){
        CapacityDBContext cd=new CapacityDBContext();
        List<Capacity> list=cd.getAll();
        for(Capacity x:list){
                System.out.println(x.getValue());
        }
    }


}
