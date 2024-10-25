/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Image;

/**
 *
 * @author Anonymous
 */
public class ProductImageDBContext extends DBContext {

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
            connect.close();

        } catch (SQLException ex) {
            Logger.getLogger(ProductImageDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
        }
        return images;
    }
}
