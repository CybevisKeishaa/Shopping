/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
<<<<<<< HEAD
import java.util.List;
import model.Blog;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Employee;

/**
 *
 * @author admin
 */
public class blogDBContext extends DBContext {
        // Lấy ra danh sách blog có phân trang
    public List<Blog> getAll(int pageNumber, int pageSize) {
        List<Blog> list = new ArrayList<>();  
        // Câu lệnh SQL để lấy dữ liệu từ bảng Blog, có phân trang bằng OFFSET và FETCH NEXT
        String sql = "SELECT * FROM Blog ORDER BY blog_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            // Tính chỉ số offset cho phân trang
            int offset = (pageNumber - 1) * pageSize;
            st.setInt(1, offset);  // Gán giá trị offset vào vị trí thứ nhất
            st.setInt(2, pageSize);  // Gán số lượng bản ghi cần lấy vào vị trí thứ hai
            ResultSet rs = st.executeQuery();  // Thực thi câu lệnh SQL và lấy kết quả
            //add blog vào list blog
            while (rs.next()) {
                Blog b = new Blog();  // Tạo đối tượng Blog mới
                b.setBlog_id(rs.getInt(1));  // Lấy blog_id từ cột 1
                b.setTitle(rs.getString(2));  // Lấy title từ cột 2
                b.setShortContent(rs.getString(3));  
                b.setContent(rs.getString(4)); 
                b.setDate(rs.getDate(5));  
                employeeDBContext eDB = new employeeDBContext();
                int id = rs.getInt(6);  // Lấy id nhân viên từ cột 6
                Employee e = eDB.getEmployeeByIdForBlog(id);  // Lấy thông tin nhân viên từ id
                b.setEmployee(e);  // Gán thông tin nhân viên cho blog
                list.add(b);  // Thêm blog vào danh sách
            }
            return list;  // Trả về danh sách các blog
        } catch (Exception e) {
            System.out.println(e);  // Bắt và in ra lỗi nếu có
        }
        return null;  // Trả về null nếu có lỗi
    }
=======
import model.Blog;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee_User;
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

                Image i = new Image();
                i.setImg_url(rs.getString("img_url"));

                b.setImage(i);

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
                employeeDBContext eDB = new employeeDBContext();
                int id = rs.getInt(6);
                Employee_User e = eDB.getEmployeeByIdForBlog(id);
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
                employeeDBContext eDB = new employeeDBContext();
                int id = rs.getInt(6);
                Employee_User e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

>>>>>>> main
    public Blog getContentByBlogId(int blogid) {
        String sql = "select * from Blog where blog_id = ?";
        Blog b = new Blog();
        try {
<<<<<<< HEAD
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogid);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
=======
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, blogid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
>>>>>>> main
                b.setBlog_id(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setDate(rs.getDate(5));
                employeeDBContext eDB = new employeeDBContext();
                int id = rs.getInt(6);
<<<<<<< HEAD
                Employee e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                b.setContent(rs.getString(4));
                
            } 
        } catch(Exception e) {
             System.out.println(e);
        }
        return b;
        
    }
    
     // Lấy danh sách blog dựa trên tìm kiếm theo tiêu đề (có phân trang)
    public List<Blog> getAllSearchByTittle(String search, int pageNumber, int pageSize) {
        String sql = "SELECT * \n"
                + "FROM Blog \n"
                + "WHERE title LIKE '%' + ? + '%' \n"  // Tìm kiếm tiêu đề có chứa từ khóa
                + "ORDER BY blog_id \n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";  // Phân trang bằng OFFSET và FETCH NEXT
        List<Blog> list = new ArrayList<>();  // Tạo danh sách Blog

        try {
            PreparedStatement st = connection.prepareStatement(sql);  // Chuẩn bị câu lệnh SQL
            int offset = (pageNumber - 1) * pageSize;  // Tính toán offset
            st.setString(1, search);  // Gán từ khóa tìm kiếm vào vị trí đầu tiên
            st.setInt(2, offset);  // Gán offset vào vị trí thứ hai
            st.setInt(3, pageSize);  // Gán pageSize vào vị trí thứ ba
            ResultSet rs = st.executeQuery();  // Thực thi câu lệnh và lấy kết quả

            // Duyệt qua các kết quả trả về
            while (rs.next()) {
                Blog b = new Blog();  // Tạo đối tượng Blog mới
                b.setBlog_id(rs.getInt(1));  // Gán blog_id từ cột 1
                b.setTitle(rs.getString(2));  
                b.setShortContent(rs.getString(3));  
                b.setContent(rs.getString(4));  
                b.setDate(rs.getDate(5));  
                employeeDBContext eDB = new employeeDBContext();  
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
    
    // Lấy tổng số lượng blog dựa trên từ khóa tìm kiếm
    public int getTotalBlogsBySearch(String search){
        int count = 0;  // Biến đếm tổng số blog
        String sql = "SELECT COUNT(*) FROM Blog WHERE title LIKE '%' + ? + '%' ";  // Câu lệnh SQL để đếm số blog theo từ khóa
        try {
            PreparedStatement st = connection.prepareStatement(sql); 
            st.setString(1, search); 
            ResultSet rs = st.executeQuery(); 
            if (rs.next()) {
                count = rs.getInt(1);  // Lấy số lượng blog
            }
            rs.close();  // Đóng ResultSet
            st.close();  // Đóng PreparedStatement
        } catch (Exception e) {
            e.printStackTrace();  // Bắt và in ra lỗi nếu có
        }
        return count;  // Trả về số lượng blog
    }


    // Lấy tổng số lượng blog
    public int getTotalBlogs() {
        int count = 0;  // Biến đếm tổng số blog
        String sql = "SELECT COUNT(*) FROM Blog";  // Câu lệnh SQL để đếm tổng số blog
        try {
            PreparedStatement st = connection.prepareStatement(sql);  
            ResultSet rs = st.executeQuery(); 
            if (rs.next()) {
                count = rs.getInt(1);  // Lấy tổng số blog
            }
            rs.close();  // Đóng ResultSet
            st.close();  // Đóng PreparedStatement
        } catch (Exception e) {
            e.printStackTrace();  // Bắt và in ra lỗi nếu có
        }
        return count;  // Trả về tổng số lượng blog
    }


    public static void main(String[] args) {
        blogDBContext l = new blogDBContext();
       
        Blog c = l.getContentByBlogId(1);
       
        System.out.println(c.getContent());

    }
=======
                Employee_User e = eDB.getEmployeeByIdForBlog(id);
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
                employeeDBContext eDB = new employeeDBContext();
                int id = rs.getInt(6);
                Employee_User e = eDB.getEmployeeByIdForBlog(id);
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


>>>>>>> main
}
