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
    public static final String GET_ALL_COUNT = """
                    SELECT COUNT(*) as count FROM [ORDER]
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
    public static final String GET_ALL_WITH_EMPLOYEE_ID = """
                    SELECT o.order_id, 
                            o.created_at AS orderedDate, 
                            o.total AS totalCost, 
                            so.status,
                            MIN(p.name) AS firstProductName, 
                            COUNT(od.product_id) AS productCount FROM [ORDER] o 
                     join OrderDetail od on o.order_id = od.order_id
                     join Product p on p.product_id = od.product_id
                     join Status_Order so on so.status_id = o.status_id 
                     join PaymentMethod pm on pm.payment_method_id= o.payment_method_id
                     join Customer c on c.cus_id = o.cus_id
                     left join Address a on a.a_id = o.addressID
                     group by o.order_id,o.created_at,o.total,so.status
                     OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
                                               """;
    public static final String GET_ALL_COUNT_WITH_EMPLOYEE_ID = """
                      SELECT  COUNT(*) as count FROM [ORDER] o 
                       where o.order_id in 
                       (select od.order_id from OrderDetail od join Product p on p.product_id = od.product_id and p.emp_id = ? )
                                               """;
}
