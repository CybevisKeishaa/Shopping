package dal;

import com.microsoft.sqlserver.jdbc.StringUtils;
import dal.combiner.BlogCombiner;
import dal.sql.BlogSql;
import helper.ImageHelper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.Part;
import java.io.IOException;
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

    private ImageHelper imageHelper;

    public BlogDBContext() {
        super();
    }

    public BlogDBContext(HttpServlet servlet) {
        super();
        this.imageHelper = new ImageHelper(servlet);
    }

    public ArrayList<Blog> getBlogForHomepage() {
        PreparedStatement stm = null;
        ArrayList<Blog> blogs = new ArrayList<>();
        try {
            String sql = "SELECT TOP 3 b.blog_id, b.title, b.shortContent, b.content, b.date, e.name_emp, i.img_url \n"
                    + "FROM dbo.Blog b "
                    + "JOIN dbo.Employee e ON b.emp_id = e.emp_id \n"
                    + "LEFT JOIN dbo.Blog_IMG bi ON b.blog_id = bi.blog_id \n"
                    + "LEFT JOIN dbo.Image i ON bi.img_id = i.img_id \n"
                    + "WHERE bi.img_id = (SELECT TOP 1 img_id FROM dbo.Blog_IMG WHERE blog_id = b.blog_id ORDER BY img_id ASC) and b.status = 1";

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

        String sql = "SELECT TOP 3 * FROM Blog"
                + " where status = 1"
                + " ORDER BY date DESC";
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
        String sql = "SELECT * FROM Blog where status = 1 ORDER BY blog_id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
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
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public List<Blog> getAll(String search, Date startDate, Date endDate, Integer empId, String status, int pageNumber, int pageSize) {
        List<Blog> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(BlogSql.GET_ALL);
        StringBuilder whereSql = new StringBuilder("Where 1=1");
        // where
        if (search != null && !search.isEmpty()) {
            whereSql.append(" AND (b.title LIKE '%" + search + "%' Or e.name_emp LIKE '%" + search + "%'");
            try {
                Integer.parseInt(search);
                whereSql.append(" or b.blog_id = '" + search + "'");
            } catch (Exception e) {
                //do nothing
            }
            whereSql.append(") ");
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
        if (!StringUtils.isEmpty(status)) {
            if (status.equals("true")) {
                whereSql.append(" AND b.status = 1");
            } else if (status.equals("false")) {
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
            whereSql.append(" AND (b.title LIKE '%" + search + "%' Or e.name_emp LIKE '%" + search + "%'");
            try {
                Integer.parseInt(search);
                whereSql.append(" or b.blog_id = '" + search + "'");
            } catch (Exception e) {
                //do nothing
            }
            whereSql.append(") ");
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
        if (status.equals("true")) {
            whereSql.append(" AND b.status = 1");
        } else if (status.equals("false")) {
            whereSql.append(" AND b.status = 0");
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
                b.setShortContent(rs.getString(3));
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
                + "WHERE title LIKE ? \n"
                + " and status = 1"
                + "ORDER BY blog_id \n"
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        List<Blog> list = new ArrayList<>();

        try {
            if (search == null) {
                search = "";
            }
            PreparedStatement st = connect.prepareStatement(sql);
            int offset = (pageNumber - 1) * pageSize;
            st.setString(1, "%" + search + "%");
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
        String sql = "SELECT COUNT(*) FROM Blog WHERE title LIKE '%' + ? + '%' and status = 1 ";
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
        String sql = "SELECT COUNT(*) where status = 1 FROM Blog";
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
    public boolean createBlog(Blog blog, Integer empId, Part image) {
        if (imageHelper == null) try {
            throw new Exception("Missing imageHelper");
        } catch (Exception ex) {
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        String blogSql = "INSERT INTO Blog (title, shortContent, content, date, emp_id, status) "
                + "OUTPUT inserted.blog_id "
                + "VALUES (?, ?, ?, GETDATE(), ?, ?) ";
        String imageSql = """
                          INSERT INTO [dbo].[Image]
                                     ([img_url]
                                     ,[img_name])
                                OUTPUT inserted.img_id 
                               VALUES
                                     (?,?)
                          """;
        String blogImageSql = """
                              insert into Blog_IMG
                              (blog_id,img_id)
                              values (?,?)
                              """;
        try {
            connect.setAutoCommit(false);
            // Insert the blog and retrieve the blog ID
            PreparedStatement blogStmt = connect.prepareStatement(blogSql);
            blogStmt.setString(1, blog.getTitle());
            blogStmt.setString(2, blog.getShortContent());
            blogStmt.setString(3, blog.getContent());
            blogStmt.setInt(4, empId);
            blogStmt.setBoolean(5, false);

            ResultSet rs = blogStmt.executeQuery();
            if (!rs.next() || image.getSize() <= 0) {
                return false;
            }
            int blogId = rs.getInt("blog_id");
            rs.close();
            blogStmt.close();
            // Insert the image association into Blog_IMG table
            PreparedStatement imageStmt = connect.prepareStatement(imageSql);
            String imageName = String.format("BLOG%04d" + System.currentTimeMillis(), blogId);
            String imageUrl = imageName + imageHelper.getExtensionFromContentType(image.getContentType()); // .png , .jpg, .webp
            imageStmt.setString(1, imageUrl);
            imageStmt.setString(2, imageName);
            rs = imageStmt.executeQuery();
            imageHelper.processImageUpload(image, imageName);
            if (!rs.next()) {
                return false;
            }
            int imageId = rs.getInt("img_id");
            rs.close();
            imageStmt.close();
            //Insert relation for Blog and Image;
            PreparedStatement bImgStm = connect.prepareStatement(blogImageSql);
            bImgStm.setInt(1, blogId);
            bImgStm.setInt(2, imageId);
            final boolean result = bImgStm.executeUpdate() > 0;
            if (result) {
                blog.setBlog_id(blogId);
                connect.commit();
            }
            return result;
        } catch (SQLException | IOException | ServletException ex) {
            final Logger logger = Logger.getLogger(CustomerDBContext.class.getName());
            logger.log(Level.SEVERE, null, ex);
            try {
                connect.rollback();
            } catch (SQLException ex1) {
                logger.log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connect.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    // ===============================UPDATE=================================
    public boolean updateBlog(Blog blog, Integer empId, Part image) {
        String sql = "UPDATE Blog SET title = ?, shortContent = ?, content = ?, date = GETDATE(), emp_id = ? "
                + "WHERE blog_id = ?";
        String imageSql = """
                          update Image 
                          set img_url = ?, img_name = ?
                          where img_id = ?
                          """;
        try {
            connect.setAutoCommit(false);
            PreparedStatement st = connect.prepareStatement(sql);
            st.setString(1, blog.getTitle());
            st.setString(2, blog.getShortContent());
            st.setString(3, blog.getContent());
            st.setInt(4, empId);
            st.setInt(5, blog.getBlog_id());

            // Execute update and check if the blog was successfully updated
            boolean updated = st.executeUpdate() > 0;
            if (updated && image.getSize() > 0) {
                int blogId = blog.getBlog_id();
                PreparedStatement imageStmt = connect.prepareStatement(imageSql);
                String imageName = String.format("BLOG%04d" + System.currentTimeMillis(), blogId);
                String imageUrl = imageName + imageHelper.getExtensionFromContentType(image.getContentType());
                imageStmt.setString(1, imageUrl);
                imageStmt.setString(2, imageName);
                imageStmt.setInt(3, blog.getImage().get(0).getImg_id());
                updated = imageStmt.executeUpdate() > 0;
                if (updated) {
                    imageHelper.processImageUpload(image, imageName);
                    Image currentImage = blog.getImage().get(0);
                    if (currentImage != null) {
                        imageHelper.removeImage(currentImage.getImg_url());
                    }
                    connect.commit();
                }
                imageStmt.close();
            }
            st.close();
            return updated;
        } catch (SQLException | IOException | ServletException ex) {
            try {
                connect.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(BlogDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            boolean updated = st.executeUpdate() > 0;
            st.close();
            return updated;
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
