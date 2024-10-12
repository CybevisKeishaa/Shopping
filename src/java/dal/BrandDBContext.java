/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Brand;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KEISHA
 */
public class BrandDBContext extends DBContext<Brand>{
    public Brand getBrandFindById(int bid) {
        String sql = "Select * from Brand WHERE brand_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, bid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrand_id(rs.getInt(1));
                b.setName(rs.getString(2));
                return b;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }
    

    public List<Brand> getAll() {
        List<Brand> list = new ArrayList<>();
        String sql = "Select * from Brand";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand b = new Brand();
                b.setBrand_id(rs.getInt(1));
                b.setName(rs.getString(2));
                list.add(b);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }
    public static void main(String[] args){
        BrandDBContext  b=new BrandDBContext();
        List<Brand> l=b.getAll();
        System.out.println(l.size());
    }
}
