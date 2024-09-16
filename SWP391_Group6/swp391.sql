USE [SWP391]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[a_id] [int] NOT NULL,
	[a_phone] [int] NOT NULL,
	[country] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[district] [nvarchar](255) NULL,
	[ward] [nvarchar](255) NULL,
	[street] [nvarchar](255) NOT NULL,
	[detail] [nvarchar](255) NULL,
	[cus_id] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[shortContent] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[date] [date] NOT NULL,
	[emp_id] [int] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_IMG]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog_IMG](
	[blog_id] [int] NOT NULL,
	[img_id] [int] NOT NULL,
 CONSTRAINT [PK_Blog_IMG] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC,
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capacity]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capacity](
	[cap_id] [int] NOT NULL,
	[cap_value] [int] NOT NULL,
 CONSTRAINT [PK_Capacity] PRIMARY KEY CLUSTERED 
(
	[cap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] NOT NULL,
	[cus_id] [int] NOT NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Customer_Cart] UNIQUE NONCLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cus_id] [int] NOT NULL,
	[name_cus] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[c_phone] [int] NOT NULL,
	[display_name] [nvarchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[cart_id] [int] NOT NULL,
	[avartar] [nvarchar](max) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[c_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discount_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[discount_amount] [decimal](18, 0) NOT NULL,
	[start] [datetime] NOT NULL,
	[end] [datetime] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [int] NOT NULL,
	[name_emp] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [int] NOT NULL,
	[display_name] [varchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[avartar] [nvarchar](max) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Product]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Product](
	[emp_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Employee_Product] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fearture]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fearture](
	[f_id] [int] NOT NULL,
	[f_name] [nvarchar](50) NOT NULL,
	[f_url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Fearture] PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[fb_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[rating] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[cus_id] [int] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[fb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Feedback_Customer_Product] UNIQUE NONCLUSTERED 
(
	[cus_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[gender_id] [int] NOT NULL,
	[name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[gender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[img_id] [int] NOT NULL,
	[img_url] [nvarchar](255) NOT NULL,
	[product_id] [int] NULL,
	[feedback_id] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[cart_id] [int] NOT NULL,
	[price_at_cart] [decimal](18, 3) NOT NULL,
	[branch] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[capacity] [decimal](7, 0) NOT NULL,
	[status] [bit] NOT NULL,
	[quanity] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
	[nameCustomer] [nvarchar](255) NOT NULL,
	[total] [float] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[cus_id] [int] NOT NULL,
	[payment_method] [nvarchar](255) NOT NULL,
	[shipping_method] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price_at_order] [decimal](18, 3) NOT NULL,
	[quantity] [int] NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[branch] [nvarchar](50) NOT NULL,
	[capacity] [decimal](7, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[price] [decimal](18, 3) NOT NULL,
	[date] [date] NOT NULL,
	[stock] [int] NOT NULL,
	[discount_id] [int] NULL,
	[branch_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Capacity]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Capacity](
	[cap_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Capacity] PRIMARY KEY CLUSTERED 
(
	[cap_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Gender]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Gender](
	[gender_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Gender] PRIMARY KEY CLUSTERED 
(
	[gender_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Customer]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Customer](
	[role_id] [int] NOT NULL,
	[cus_id] [int] NOT NULL,
 CONSTRAINT [PK_Role_Customer] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Employee]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Employee](
	[role_id] [int] NOT NULL,
	[emp_id] [int] NOT NULL,
 CONSTRAINT [PK_Role_Employee] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Fearture]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Fearture](
	[role_id] [int] NOT NULL,
	[f_id] [int] NOT NULL,
 CONSTRAINT [PK_Role_Fearture] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[slide_id] [int] NOT NULL,
	[tiltle] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[emp_id] [int] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider_IMG]    Script Date: 16/09/2024 00:42:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider_IMG](
	[slide_id] [int] NOT NULL,
	[img_id] [int] NOT NULL,
 CONSTRAINT [PK_Slider_IMG] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC,
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Customer]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Employee]
GO
ALTER TABLE [dbo].[Blog_IMG]  WITH CHECK ADD  CONSTRAINT [FK_Blog_IMG_Blog] FOREIGN KEY([blog_id])
REFERENCES [dbo].[Blog] ([blog_id])
GO
ALTER TABLE [dbo].[Blog_IMG] CHECK CONSTRAINT [FK_Blog_IMG_Blog]
GO
ALTER TABLE [dbo].[Blog_IMG]  WITH CHECK ADD  CONSTRAINT [FK_Blog_IMG_Image] FOREIGN KEY([img_id])
REFERENCES [dbo].[Image] ([img_id])
GO
ALTER TABLE [dbo].[Blog_IMG] CHECK CONSTRAINT [FK_Blog_IMG_Image]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Employee_Product]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Product_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Employee_Product] CHECK CONSTRAINT [FK_Employee_Product_Employee]
GO
ALTER TABLE [dbo].[Employee_Product]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Product_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Employee_Product] CHECK CONSTRAINT [FK_Employee_Product_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Feedback] FOREIGN KEY([feedback_id])
REFERENCES [dbo].[Feedback] ([fb_id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Feedback]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Cart]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([detail_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Brand] ([brand_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Branch]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([discount_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Discount]
GO
ALTER TABLE [dbo].[Product_Capacity]  WITH CHECK ADD  CONSTRAINT [FK_Product_Capacity_Capacity] FOREIGN KEY([cap_id])
REFERENCES [dbo].[Capacity] ([cap_id])
GO
ALTER TABLE [dbo].[Product_Capacity] CHECK CONSTRAINT [FK_Product_Capacity_Capacity]
GO
ALTER TABLE [dbo].[Product_Capacity]  WITH CHECK ADD  CONSTRAINT [FK_Product_Capacity_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Capacity] CHECK CONSTRAINT [FK_Product_Capacity_Product]
GO
ALTER TABLE [dbo].[Product_Gender]  WITH CHECK ADD  CONSTRAINT [FK_Product_Gender_Gender] FOREIGN KEY([gender_id])
REFERENCES [dbo].[Gender] ([gender_id])
GO
ALTER TABLE [dbo].[Product_Gender] CHECK CONSTRAINT [FK_Product_Gender_Gender]
GO
ALTER TABLE [dbo].[Product_Gender]  WITH CHECK ADD  CONSTRAINT [FK_Product_Gender_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Gender] CHECK CONSTRAINT [FK_Product_Gender_Product]
GO
ALTER TABLE [dbo].[Role_Customer]  WITH CHECK ADD  CONSTRAINT [FK_Role_Customer_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[Role_Customer] CHECK CONSTRAINT [FK_Role_Customer_Customer]
GO
ALTER TABLE [dbo].[Role_Customer]  WITH CHECK ADD  CONSTRAINT [FK_Role_Customer_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Customer] CHECK CONSTRAINT [FK_Role_Customer_Role]
GO
ALTER TABLE [dbo].[Role_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Role_Employee_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Role_Employee] CHECK CONSTRAINT [FK_Role_Employee_Employee]
GO
ALTER TABLE [dbo].[Role_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Role_Employee_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Employee] CHECK CONSTRAINT [FK_Role_Employee_Role]
GO
ALTER TABLE [dbo].[Role_Fearture]  WITH CHECK ADD  CONSTRAINT [FK_Role_Fearture_Fearture] FOREIGN KEY([f_id])
REFERENCES [dbo].[Fearture] ([f_id])
GO
ALTER TABLE [dbo].[Role_Fearture] CHECK CONSTRAINT [FK_Role_Fearture_Fearture]
GO
ALTER TABLE [dbo].[Role_Fearture]  WITH CHECK ADD  CONSTRAINT [FK_Role_Fearture_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Fearture] CHECK CONSTRAINT [FK_Role_Fearture_Role]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[Employee] ([emp_id])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Employee]
GO
ALTER TABLE [dbo].[Slider_IMG]  WITH CHECK ADD  CONSTRAINT [FK_Slider_IMG_Image] FOREIGN KEY([img_id])
REFERENCES [dbo].[Image] ([img_id])
GO
ALTER TABLE [dbo].[Slider_IMG] CHECK CONSTRAINT [FK_Slider_IMG_Image]
GO
ALTER TABLE [dbo].[Slider_IMG]  WITH CHECK ADD  CONSTRAINT [FK_Slider_IMG_Slider] FOREIGN KEY([slide_id])
REFERENCES [dbo].[Slider] ([slide_id])
GO
ALTER TABLE [dbo].[Slider_IMG] CHECK CONSTRAINT [FK_Slider_IMG_Slider]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [CK_Check_Rating] CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [CK_Check_Rating]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dat dieu kien cho rating tu 1 den 5 sao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'CONSTRAINT',@level2name=N'CK_Check_Rating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'quantity of products' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'stock'
GO
