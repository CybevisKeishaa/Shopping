/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.sql;

/**
 *
 * @author Anonymous
 */
public class BlogSql {

    public static final String GET_ALL = """
                                            SELECT b.* FROM Blog b  
                                            JOIN Employee e on e.emp_id = b.emp_id
                                            {where}  
                                            order by b.blog_id DESC
                                            OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
                                         """;
    public static final String GET_ALL_COUNT = """
                                                select count(b.blog_id) as count from 
                                                (
                                                SELECT b.* FROM Blog b  
                                                JOIN Employee e on e.emp_id = b.emp_id
                                                {where}
                                               ) as b
                                              """;
}
