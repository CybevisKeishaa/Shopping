/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.combiner;

import dal.EmployeeDBContext;
import dal.ImageDBContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Blog;
import model.Employee;
import model.Image;

/**
 *
 * @author Anonymous
 */
public class BlogCombiner {

    public static Blog toElement(ResultSet rs) throws SQLException {
        Blog b = new Blog();
        b.setBlog_id(rs.getInt("blog_id"));
        b.setTitle(rs.getString("title"));
        b.setShortContent(rs.getString("shortContent"));
        b.setContent(rs.getString("content"));
        b.setDate(rs.getDate("date"));
        b.setStatus(rs.getBoolean("status"));

        // Fetch employee information
        EmployeeDBContext eDB = new EmployeeDBContext();
        Employee e = eDB.getEmployeeByIdForBlog(rs.getInt("emp_id"));
        b.setEmployee(e);

        // Fetch images for the blog
        ImageDBContext iDB = new ImageDBContext();
        ArrayList<Image> images = iDB.getAllImageByBlogId(b.getBlog_id());
        b.setImage(images);
        return b;
    }
}
