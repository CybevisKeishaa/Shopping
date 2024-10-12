/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author KEISHA
 */

public abstract class DBContext<T> {


    protected Connection connect;

    public DBContext() {
        try {

            String username = "Keishaa";
            String password = "123";

            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=SWP391;encrypt=true;trustservercertificate=true;";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private final DBConnProfile publicConn = new DBConnProfile("son", "Son@123@", "jdbc:sqlserver://103.252.92.181\\SQLEXPRESS:1433;databaseName=swp-son;encrypt=true;trustservercertificate=true;");

    protected class DBConnProfile {
        protected String username;
        protected String password;
        protected String url;
        
        protected DBConnProfile(String username, String password, String url) {
            this.username = username;
            this.password = password;
            this.url = url;
        }
    }
}
