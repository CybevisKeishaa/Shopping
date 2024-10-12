/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Gender;

/**
 *
 * @author DINH SON
 */
public class GenderDBContext extends DBContext {
    public Gender getGenderFindById(int gid) {
        String sql = "Select * from Gender WHERE gender_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
            PreparedStatement st = connection.prepareStatement(sql);
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
