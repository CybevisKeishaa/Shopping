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
                    SELECT o.order_id, 
                           o.created_at AS orderedDate, 
                           o.total AS totalCost, 
                           so.status, 
                           MIN(p.name) AS firstProductName, 
                           COUNT(od.product_id) AS productCount
                    FROM [dbo].[Order] o
                    JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id
                    JOIN [dbo].[Product] p ON od.product_id = p.product_id
                    JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id
                    GROUP BY o.order_id, o.created_at, o.total, so.status
                    ORDER BY o.created_at DESC
                    OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
                    """;
    public static final String GET_ALL_WITH_CUSTOMER_ID = """
                    SELECT o.order_id, 
                           o.created_at AS orderedDate, 
                           o.total AS totalCost, 
                           so.status, 
                           MIN(p.name) AS firstProductName, 
                           COUNT(od.product_id) AS productCount
                    FROM [dbo].[Order] o
                    JOIN [dbo].[OrderDetail] od ON o.order_id = od.order_id
                    JOIN [dbo].[Product] p ON od.product_id = p.product_id
                    JOIN [db_owner].[Status_Order] so ON o.status_id = so.status_id
                    WHERE o.cus_id = ?
                    GROUP BY o.order_id, o.created_at, o.total, so.status
                    ORDER BY o.created_at DESC
                    OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
                    """;
}
