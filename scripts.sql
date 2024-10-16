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
					OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY

					select * from Customer
					
select * from [Order]
Select COUNT(created_at) as count,CAST(created_at as date) as date from [Order] o
WHERE CAST(created_at as date) >= DATEADD(DAY, -7, GETDATE()) 
group by CAST(created_at as date) 