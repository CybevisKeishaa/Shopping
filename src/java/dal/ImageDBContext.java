/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Image;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




public class ImageDBContext extends DBContext<Image>  {
public Image getImageById (int igid) throws SQLException {
        String sql = "select * from Image where img_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, igid);
            ResultSet rs = st.executeQuery();
             while (rs.next()) {
                Image ig = new Image(rs.getInt(1), rs.getString(2));
                return ig;
            }
            
            
        } catch(Exception e) {
            System.out.println(e);
            
        }
        return null;
        
    }
    public List<Image> getAll() {
            List<Image> list = new ArrayList<>();
            String sql="select * from Image";
             try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image ig = new Image(rs.getInt(1), rs.getString(2));
                list.add(ig);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
        }
}
