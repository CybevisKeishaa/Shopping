/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Capacity;
import model.ProductCapacity;

/**
 *
 * @author KEISHA
 */
public class CapacityDBContext extends DBContext<Capacity> {

    public void updatePricebycidpid(String price, String pid, String cid) {
        String sql = "       UPDATE [dbo].[Product_Capacity]\n"
                + "   SET \n"
                + "      [unit_price] = ?\n"
                + " WHERE cap_id=? and product_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(price));

            st.setInt(2, Integer.parseInt(cid));
            st.setInt(3, Integer.parseInt(pid));
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public Capacity getCapPidCid(int pid, int cid) {
        String sql = "Select pc.*,c.* from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Capacity c on c.cap_id=pc.cap_id where p.product_id=? and c.cap_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity(rs.getInt("cap_id"), rs.getInt("cap_value"));
                c.setUnit_price(rs.getInt("unit_price"));
                c.setStock(rs.getInt("stock"));
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

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

    public List<Capacity> getByListByPid(int pid) {
        List<Capacity> list = new ArrayList<>();

        String sql = "Select c.*,pc.* from Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Capacity c on c.cap_id=pc.cap_id where p.product_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity(rs.getInt("cap_id"), rs.getInt("cap_value"));
                c.setUnit_price(rs.getInt("unit_price"));
                c.setStock(rs.getInt("stock"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
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

    public ArrayList<Capacity> getProductCapacityByProductId(int id) {
        ArrayList<Capacity> list = new ArrayList<>();
        String sql = "Select c.cap_id,c.cap_value,pc.unit_price,pc.stock From Product p inner join Product_Capacity pc on p.product_id=pc.product_id inner join Capacity c on c.cap_id=pc.cap_id where p.product_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ProductCapacity pc = new ProductCapacity();
                pc.setCapacity_id(rs.getInt(1));
                pc.setValue(rs.getInt(2));
                pc.setUnit_price(rs.getInt(3));
                pc.setStock(rs.getInt(4));
                list.add(pc);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Capacity> getCapacityByProductId(int id) {
        ArrayList<Capacity> list = new ArrayList<>();
        String sql = "Select c.cap_id, c.cap_value, pc.stock, pc.unit_price From Product p \n"
                + "inner join Product_Capacity pc on p.product_id=pc.product_id \n"
                + "inner join Capacity c on c.cap_id=pc.cap_id where p.product_id= ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Capacity c = new Capacity();
                c.setCapacity_id(rs.getInt(1));
                c.setValue(rs.getInt(2));
                c.setUnit_price(rs.getInt("unit_price"));
                c.setStock(rs.getInt("stock"));
                list.add(c);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        CapacityDBContext cd = new CapacityDBContext();
        Capacity c = cd.getCapPidCid(1, 1);
        System.out.println(c.getStock());
    }

}
