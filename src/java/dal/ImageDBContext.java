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
import java.util.logging.*;
import model.Image;

public class ImageDBContext extends DBContext {

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

    public ArrayList<Image> getAllImageByProductId(int id) {
        ArrayList<Image> images = new ArrayList<>();
        String sql = """
                   SELECT i.* FROM Product_Image pi JOIN Image i ON i.img_id = pi.img_id WHERE pi.product_id = ?
                """;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image i = new Image(rs.getInt("img_id"), rs.getString("img_url"));
                images.add(i);
            }
            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(ImageDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return images;
    }

    public ArrayList<Image> getAllImageByBlogId(int id) {
        ArrayList<Image> images = new ArrayList<>();
        String sql = """
                   select i.img_id,i.img_url,i.img_name from Blog_IMG bi join Image i on i.img_id = bi.img_id
                   where blog_id = ?
                """;
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image i = new Image(rs.getInt("img_id"), rs.getString("img_url"));
                i.setImg_name(rs.getString("img_name"));
                images.add(i);
            }
            st.close();
            rs.close();

        } catch (SQLException ex) {
            Logger.getLogger(ImageDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return images;
    }
}
