/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import model.Image;
import java.util.ArrayList;
import model.Slider;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author KEISHA
 */

public class SliderDBContext extends DBContext<Slider> {

    
    
    public ArrayList<Slider> getSliderForHomepage() {

        PreparedStatement stm = null;
        ArrayList<Slider> sliders = new ArrayList<>();
        try {
            String sql = "SELECT TOP 2 s.slide_id, s.tiltle, s.[description], i.img_url, p.product_id, p.name \n"
                    + "FROM Slider s \n"
                    + "JOIN Slider_IMG si ON si.slide_id = s.slide_id \n"
                    + "JOIN Image i ON i.img_id = si.img_id \n"
                    + "LEFT JOIN Product_Image pi ON pi.img_id = i.img_id \n"
                    + "LEFT JOIN Product p ON p.product_id = pi.product_id;";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Slider s = new Slider();
                s.setSlider_id(rs.getInt("slide_id"));
                s.setTitle(rs.getString("tiltle"));
                s.setDescription(rs.getString("description"));
                
                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));
                
                s.setImage(i);
                sliders.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SliderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sliders;
    }


}
