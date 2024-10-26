/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.sql;

/**
 *
 * @author Anonymous
 */
public class OrderSql {

    public static final String GET_ALL = """
                    SELECT  o.order_id,
                            o.created_at AS orderedDate,
                            o.total AS totalCost,
                            so.status,
                            MIN(p.name) AS firstProductName,
                            COUNT(od.product_id) AS productCount,
                            c.name_cus,
                            o.paid_status
                      FROM [dbo].[Order] o
                      JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id
                      JOIN [dbo].[Product] p ON od.product_id = p.product_id
                      JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id
                      JOIN Customer c ON c.cus_id= o.cus_id
                      {where}
                      GROUP BY o.order_id, o.created_at, o.total, so.status, c.name_cus, o.paid_status
                      {orderBy}
                      OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
                     """;
    public static final String GET_ALL_COUNT = """
                     select count(o.order_id) as count from (SELECT o.order_id,
                             o.created_at AS orderedDate,
                             o.total AS totalCost,
                             so.status,
                             MIN(p.name) AS firstProductName,
                             COUNT(od.product_id) AS productCount,
                                                     c.name_cus
                      FROM [dbo].[Order] o
                      JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id
                      JOIN [dbo].[Product] p ON od.product_id = p.product_id
                      JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id
                      JOIN Customer c ON c.cus_id= o.cus_id
                      {where}
                      GROUP BY o.order_id, o.created_at, o.total, so.status, c.name_cus
                                          ) as o
                                                """;

    // SQL 1: Total of all orders
    public static final String TOTAL_PRICE_ORDER_SQL = """
                         SELECT 
                         	so.status,sum(o.total) as total
                         FROM [dbo].[Order] o
                         JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id
                         group by so.status
                     """;
}
