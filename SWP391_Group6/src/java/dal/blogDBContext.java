/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Blog;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import model.Image;

/**
 *
 * @author KEISHA
 */
public class BlogDBContext extends DBContext<Blog> {

    public ArrayList<Blog> getBlogForHomepage() {
        PreparedStatement stm = null;
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT TOP 3 b.blog_id, b.title, b.shortContent, b.content, b.date, e.name_emp, i.img_url \n"
                    + "FROM dbo.Blog b \n"
                    + "JOIN dbo.Employee e ON b.emp_id = e.emp_id \n"
                    + "LEFT JOIN dbo.Blog_IMG bi ON b.blog_id = bi.blog_id \n"
                    + "LEFT JOIN dbo.Image i ON bi.img_id = i.img_id \n"
                    + "WHERE bi.img_id = (SELECT TOP 1 img_id FROM dbo.Blog_IMG WHERE blog_id = b.blog_id ORDER BY img_id ASC);";

            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt("blog_id"));
                b.setTitle(rs.getString("title"));
                b.setShortContent(rs.getString("shortContent"));

                ArrayList<Image> imgs = new ArrayList<>();
                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));
                imgs.add(i);
                
                b.setImage(imgs);

                blogs.add(b);

            }

        } catch (SQLException ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return blogs;

    }

    public List<Blog> getBlogTop3Date() {
        List<Blog> list = new ArrayList<>();

        String sql = "SELECT TOP  3 * FROM Blog ORDER BY date DESC";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setShortContent(rs.getString(3));
                b.setContent(rs.getString(4));
                b.setDate(rs.getDate(5));
                EmployeeDBContext eDB = new EmployeeDBContext();
                int id = rs.getInt(6);
                Employee e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getAll(int pageNumber, int pageSize) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog ORDER BY blog_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);
            st.setInt(2, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setShortContent(rs.getString(3));
                b.setContent(rs.getString(4));
                b.setDate(rs.getDate(5));
                EmployeeDBContext eDB = new EmployeeDBContext();
                int id = rs.getInt(6);
                Employee e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public Blog getContentByBlogId(int blogid) {
        String sql = "select Top 1 * from Blog where blog_id = ?";
        Blog b = new Blog();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, blogid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                b.setBlog_id(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setDate(rs.getDate(5));
                EmployeeDBContext eDB = new EmployeeDBContext();
                int id = rs.getInt(6);
                Employee e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                b.setContent(rs.getString(4));

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return b;

    }

    public List<Blog> getAllSearchByTittle(String search, int pageNumber, int pageSize) {
        String sql = "SELECT * \n"
                + "FROM Blog \n"
                + "WHERE title LIKE '%' + ? + '%' \n"
                + "ORDER BY blog_id \n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        List<Blog> list = new ArrayList<>();

        try {
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setString(1, search);
            st.setInt(2, offset);
            st.setInt(3, pageSize);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlog_id(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setShortContent(rs.getString(3));
                b.setContent(rs.getString(4));
                b.setDate(rs.getDate(5));
                EmployeeDBContext eDB = new EmployeeDBContext();
                int id = rs.getInt(6);
                Employee e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalBlogsBySearch(String search) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Blog WHERE title LIKE '%' + ? + '%' ";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, search);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int getTotalBlogs() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Blog";
        try {
            PreparedStatement st = connect.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static void main(String[] args) {
        BlogDBContext l = new BlogDBContext();

        List<Blog> ldb = l.getBlogTop3Date();
        for (Blog x : ldb) {
            System.out.println(x.getBlog_id());
        }

    }

}
