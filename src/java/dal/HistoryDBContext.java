/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import model.*;

/**
 *
 * @author DINH SON
 */
public class HistoryDBContext extends DBContext<History> {
  
    public void addHistory(String pid, String stock, String name, String cid, String formattedDate) {
        try {
            connect.setAutoCommit(false);
            ProductDBContext pdb = new ProductDBContext();
            int price = pdb.getPidCid(pid, cid);
            int total = price * Integer.parseInt(stock);
            int stockNew = pdb.getStoPidCid(pid, cid) + Integer.parseInt(stock);
            String updateStock = "UPDATE [dbo].[Product_Capacity]\n"
                    + "   SET \n"
                    + "      [stock] = ?\n"
                    + " WHERE product_id=? and cap_id=?";
            PreparedStatement st = connect.prepareStatement(updateStock, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setInt(1, stockNew);
            st.setInt(2, Integer.parseInt(pid));
            st.setInt(3, Integer.parseInt(cid));
            st.executeUpdate();
            String insertHistory = "INSERT INTO [db_owner].[History]\n"
                    + "           ([Name]\n"
                    + "           ,[Date]\n"
                    + "           ,[Stock]\n"
                    + "           ,[TotalPrice])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st1 = connect.prepareStatement(insertHistory, PreparedStatement.RETURN_GENERATED_KEYS);
            st1.setString(1, name);
            st1.setDate(2, Date.valueOf(formattedDate));
            st1.setInt(3, Integer.parseInt(stock));
            st1.setInt(4, total);
            st1.executeUpdate();
            ResultSet generatedKeys = st1.getGeneratedKeys();
            int hid = -1;
            if (generatedKeys.next()) {
                hid = generatedKeys.getInt(1);
            }
            String insertHistoryProduct = "INSERT INTO [db_owner].[Product_History]\n"
                    + "           ([product_id]\n"
                    + "           ,[HistoryId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement st2 = connect.prepareStatement(insertHistoryProduct, PreparedStatement.RETURN_GENERATED_KEYS);
            st2.setInt(1, Integer.parseInt(pid));
            st2.setInt(2, hid);
            st2.executeUpdate();
            connect.commit();
            connect.setAutoCommit(true);

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public List<History> getAll(){
        String sql="Select * from History";
        List<History> list=new ArrayList<>();
        ProductDBContext pdb=new ProductDBContext();
        try{
                        PreparedStatement st = connect.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                History h=new History();
                h.setHistoryId(rs.getInt("HistoryId"));
                h.setName(rs.getString("name"));
                h.setDate(rs.getDate("Date"));
                h.setStock(rs.getInt("stock"));
                h.setTotalPrice(rs.getInt("TotalPrice"));
                ArrayList<Product> l=pdb.getByHid(rs.getInt("HistoryId"));
                h.setProducts(l);
                list.add(h);
            }
            return list;

        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args){
        HistoryDBContext hdb=new HistoryDBContext();
        System.out.println(hdb.getAll().get(0).getProducts().size());
    }
}
