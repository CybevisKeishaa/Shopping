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
