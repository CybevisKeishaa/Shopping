package dal;

import dal.combiner.BlogCombiner;
import dal.sql.BlogSql;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
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
                ImageDBContext iDB = new ImageDBContext();
                ArrayList<Image> images = iDB.getAllImageByBlogId(b.getBlog_id());
                b.setImage(images);
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
                ImageDBContext iDB = new ImageDBContext();
                ArrayList<Image> images = iDB.getAllImageByBlogId(b.getBlog_id());
                b.setImage(images);
                list.add(b);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getAll(String search, Date startDate, Date endDate, Integer empId, String status, int pageNumber, int pageSize) {
        List<Blog> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(BlogSql.GET_ALL);
        StringBuilder whereSql = new StringBuilder("Where 1=1");
        // where
        if (search != null && !search.isEmpty()) {
            whereSql.append(" AND (b.title LIKE %" + search + "% OR b.blog_id = " + search + " Or e.name_emp LIKE %" + search + "%) ");
        }
        if (startDate != null && endDate != null) {
            whereSql.append(" AND b.date BETWEEN ? AND ?");
        } else if (startDate != null) {
            whereSql.append(" AND b.date >= ?");
        } else if (endDate != null) {
            whereSql.append(" AND b.date <= ?");
        }
        if (empId != null) {
            whereSql.append(" AND b.emp_id = ?");
        }
        if (status != null && !status.isEmpty()) {
            if (status.equals("true")) {
                whereSql.append(" AND b.status = 1");
            } else {
                whereSql.append(" AND b.status = 0");
            }
        }
        try {
            PreparedStatement st = connect.prepareStatement(sql.toString().replace("{where}", whereSql));
            int paramIndex = 1;
            if (startDate != null && endDate != null) {
                st.setDate(paramIndex++, startDate);
                st.setDate(paramIndex++, endDate);
            } else if (startDate != null) {
                st.setDate(paramIndex++, startDate);
            } else if (endDate != null) {
                st.setDate(paramIndex++, endDate);
            }
            if (empId != null) {
                st.setInt(paramIndex++, empId);
            }

            int offset = (pageNumber - 1) * pageSize;
            st.setInt(paramIndex++, offset);
            st.setInt(paramIndex++, pageSize);
            // get data
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = BlogCombiner.toElement(rs);
                list.add(b);
            }
            return list;
        } catch (SQLException e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return null;
    }

    public int getAllTotalCount(String search, Date startDate, Date endDate, Integer empId, String status) {
        var count = 0;
        StringBuilder sql = new StringBuilder(BlogSql.GET_ALL_COUNT);
        StringBuilder whereSql = new StringBuilder("Where 1=1");
        // where
        if (search != null && !search.isEmpty()) {
            whereSql.append(" AND (title LIKE %" + search + "% OR blog_id = " + search + " Or e.name_emp LIKE %" + search + "%) ");
        }
        if (startDate != null && endDate != null) {
            whereSql.append(" AND b.date BETWEEN ? AND ?");
        } else if (startDate != null) {
            whereSql.append(" AND b.date >= ?");
        } else if (endDate != null) {
            whereSql.append(" AND b.date <= ?");
        }
        if (empId != null) {
            whereSql.append(" AND b.emp_id = ?");
        }
        if (status != null && !status.isEmpty()) {
            if (status.equals("true")) {
                whereSql.append(" AND b.status = 1");
            } else {
                whereSql.append(" AND b.status = 0");
            }
        }
        try {
            PreparedStatement st = connect.prepareStatement(sql.toString().replace("{where}", whereSql));
            int paramIndex = 1;
            if (startDate != null && endDate != null) {
                st.setDate(paramIndex++, new Date(startDate.getTime()));
                st.setDate(paramIndex++, new Date(endDate.getTime()));
            } else if (startDate != null) {
                st.setDate(paramIndex++, new Date(startDate.getTime()));
            } else if (endDate != null) {
                st.setDate(paramIndex++, new Date(endDate.getTime()));
            }
            if (empId != null) {
                st.setInt(paramIndex++, empId);
            }
            // get data
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);

        }
        return count;
    }

    public Blog getContentByBlogId(int blogid) {
        String sql = "select * from Blog where blog_id = ?";
        Blog b = new Blog();
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setInt(1, blogid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                b.setBlog_id(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setDate(rs.getDate(5));
                b.setStatus(rs.getBoolean("status"));

                EmployeeDBContext eDB = new EmployeeDBContext();
                int id = rs.getInt(6);
                Employee e = eDB.getEmployeeByIdForBlog(id);
                b.setEmployee(e);
                b.setContent(rs.getString(4));
                ImageDBContext iDB = new ImageDBContext();
                ArrayList<Image> images = iDB.getAllImageByBlogId(b.getBlog_id());
                b.setImage(images);
            }
        } catch (Exception e) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);
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

    // ===============================CREATE=================================
    public boolean createBlog(Blog blog, Integer empId) {
        String sql = "INSERT INTO Blog (title, shortContent, content, date, emp_id, status) "
                + "VALUES (?, ?, ?, GETDATE(), ?, ?)";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, blog.getTitle());
            st.setString(2, blog.getShortContent());
            st.setString(3, blog.getContent());
            st.setInt(4, empId);
            st.setBoolean(5, true);

            // Execute update and check if the blog was successfully inserted
            int rowsAffected = st.executeUpdate();
            st.close();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error creating blog: " + e.getMessage());
        }
        return false;
    }

    // ===============================UPDATE=================================
    public boolean updateBlog(Blog blog, Integer empId) {
        String sql = "UPDATE Blog SET title = ?, shortContent = ?, content = ?, date = GETDATE(), emp_id = ? "
                + "WHERE blog_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, blog.getTitle());
            st.setString(2, blog.getShortContent());
            st.setString(3, blog.getContent());
            st.setInt(4, empId);
            st.setInt(5, blog.getBlog_id());

            // Execute update and check if the blog was successfully updated
            int rowsAffected = st.executeUpdate();
            st.close();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error updating blog: " + e.getMessage());
        }
        return false;
    }

    public boolean updateBlogStatus(Integer blogId, Integer empId, boolean status) {
        String sql = "UPDATE Blog SET status = ?, emp_id = ? WHERE blog_id = ?";
        try {
            PreparedStatement st = connect.prepareStatement(sql);
            st.setBoolean(1, status);
            st.setInt(2, empId);
            st.setInt(3, blogId);

            // Execute update and check if the blog status was successfully updated
            int rowsAffected = st.executeUpdate();
            st.close();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error updating blog status: " + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        BlogDBContext l = new BlogDBContext();

        List<Blog> ldb = l.getBlogTop3Date();
        for (Blog x : ldb) {
            System.out.println(x.getBlog_id());
        }

    }

}
