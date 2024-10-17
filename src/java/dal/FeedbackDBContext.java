/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Feedback;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KEISHA
 */
public class FeedbackDBContext extends DBContext<Feedback> {

    public void insertFeedbackFromCustomer(int customerID, int productID, int rating, Date date, String content, String phone, String email) {
        PreparedStatement stm = null;
        try {
            // Tắt chế độ tự commit
            connect.setAutoCommit(false);

            // Câu lệnh SQL để chèn feedback vào cơ sở dữ liệu
            String sql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([date]\n"
                    + "           ,[content]\n"
                    + "           ,[rating]\n"
                    + "           ,[product_id]\n"
                    + "           ,[cus_id]\n"
                    + "           ,[phone]\n"
                    + "           ,[email])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?,?)";

            // Chuẩn bị câu lệnh SQL
            stm = connect.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setString(2, content);
            stm.setInt(3, rating);
            stm.setInt(4, productID);
            stm.setInt(5, customerID);
            stm.setString(6, phone);
            stm.setString(7, email);

            // Thực thi câu lệnh chèn
            stm.executeUpdate();

            // Commit các thay đổi
            connect.commit();

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);

            // Nếu có lỗi, rollback các thay đổi
            if (connect != null) {
                try {
                    connect.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex1);
                }
            }

        } finally {
            try {
                // Bật lại chế độ tự động commit
                connect.setAutoCommit(true);

                // Đóng PreparedStatement
                if (stm != null) {
                    stm.close();
                }

                // Đóng kết nối
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void insertFeedbackForHomepage(String guessName, int rating, Date date, String content, String phone, String email) {
        PreparedStatement stm = null;
        try {
            // Tắt chế độ tự commit
            connect.setAutoCommit(false);

            // Câu lệnh SQL để chèn feedback vào cơ sở dữ liệu
            String sql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([date]\n"
                    + "           ,[content]\n"
                    + "           ,[rating] \n"
                    + "           ,[phone]\n"
                    + "           ,[email]\n"
                    + "           ,[guess_name])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            // Chuẩn bị câu lệnh SQL
            stm = connect.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setString(2, content);
            stm.setInt(3, rating);
            stm.setString(4, phone);
            stm.setString(5, email);
            stm.setString(6, guessName);

            // Thực thi câu lệnh chèn
            stm.executeUpdate();

            // Commit các thay đổi
            connect.commit();

        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);

            // Nếu có lỗi, rollback các thay đổi
            if (connect != null) {
                try {
                    connect.rollback();
                } catch (SQLException ex1) {
                    Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex1);
                }
            }

        } finally {
            try {
                // Bật lại chế độ tự động commit
                connect.setAutoCommit(true);

                // Đóng PreparedStatement
                if (stm != null) {
                    stm.close();
                }

                // Đóng kết nối
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(FeedbackDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    

}
