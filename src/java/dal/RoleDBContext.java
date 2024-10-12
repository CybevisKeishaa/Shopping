/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

/**
 *
 * @author DINH SON
 */
public class RoleDBContext extends DBContext<Role> {

    public List<Role> getAll() {
                PreparedStatement stm = null;

        String sql = "SELECT TOP (1000) [role_id]\n"
                + "      ,[role_name]\n"
                + "  FROM [swp-son].[dbo].[Role]";
        try{
            List<Role> list=new ArrayList<>();
                        stm = connect.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
                        while(rs.next()){
                            Role r=new Role();
                            r.setRole_id(rs.getInt(1));
                            r.setRole_name(rs.getString(2));
                            list.add(r);
                        }
                        return list;

        }catch(Exception e){
            System.out.println(e);
        }
        return null;
    }

    public Role getroleNameByRoleId(int role_id) {
        PreparedStatement stm = null;
        try {
            String sql = "select * from Role where role_id = ?";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, role_id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Role r = new Role();
                r.setRole_id(rs.getInt(1));
                r.setRole_name(rs.getString(2));
                return r;
            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args){
        RoleDBContext ed=new RoleDBContext();
        System.out.println(ed.getAll().size());
    }
}
