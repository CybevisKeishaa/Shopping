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

public class ImageDBContext extends DBContext<Image> {
    public ArrayList<Image> getByProductId(int pid){
        ArrayList<Image> list=new ArrayList<>();
        String sql="select * from Product p inner join Product_Image pia on p.product_id=pia.product_id inner join Image i on i.img_id=pia.img_id where p.product_id=?";
           try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image ig = new Image();
                ig.setImg_id(rs.getInt("img_id"));
                ig.setImg_url(rs.getString("img_url"));
                ig.setName(rs.getString("img_name"));
                list.add(ig);
               
            }
            return list;

        } catch (Exception e) {
            System.out.println(e);

        }
        return null;
        
    }
    public static void main(String[] args){
        ImageDBContext id=new ImageDBContext();
        System.out.println(id.getByProductId(32).size());
    }
    public Image getImageById(int igid) throws SQLException {
        String sql = "select * from Image where img_id=?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, igid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image ig = new Image(rs.getInt(1), rs.getString(2));
                return ig;
            }

        } catch (Exception e) {
            System.out.println(e);

        }
        return null;

    }

    public List<Image> getAll() {
        List<Image> list = new ArrayList<>();
        String sql = "select * from Image";
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
