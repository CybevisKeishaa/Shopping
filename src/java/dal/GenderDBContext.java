/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Gender;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KEISHA
 */
public class GenderDBContext extends DBContext<Gender>{
    public Gender getGenderFindById(int gid) {
        String sql = "Select * from Gender WHERE gender_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, gid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Gender g = new Gender(rs.getInt(1), rs.getString(2));
                return g;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
        
    }
    public static void main(String[] args){
        GenderDBContext gd=new GenderDBContext();
        System.out.println(gd.getAll().get(0).getGender_id());
    }
    
    public ArrayList<Gender> getGenderFindByPid(int pid){
                ArrayList<Gender> list = new ArrayList<>();

        String sql="SELECT g.* FROM Product p inner join Product_Gender pg on p.product_id=pg.product_id inner join Gender g on pg.gender_id=g.gender_id where p.product_id=?";
        try{
               PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
             while (rs.next()) {
                Gender g = new Gender(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
             return list;
        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }


     public List<Gender> getAll() {
        List<Gender> list = new ArrayList<>();
        String sql = "Select * from Gender";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Gender g = new Gender(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }
}
