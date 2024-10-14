USE [demo]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[a_id] [int] NOT NULL,
	[a_phone] [int] NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[district] [nvarchar](255) NOT NULL,
	[ward] [nvarchar](255) NOT NULL,
	[street] [nvarchar](255) NULL,
	[detail] [nvarchar](255) NULL,
	[cus_id] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Blog_IMG]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Capacity]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 25/09/2024 23:49:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cus_id] [int] NOT NULL,
	[name_cus] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[c_phone] [varchar](11) NOT NULL,
	[display_name] [nvarchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[cart_id] [int] NULL,
	[avartar] [varchar](max) NULL,
	[role_id] [int] NOT NULL,
	[gender] [bit] NOT NULL,
	[username] [varchar](255) NULL,
	[birth_date] [date] NOT NULL,
	[verification_code] [varchar](255) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [int] NOT NULL,
	[name_emp] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [int] NOT NULL,
	[display_name] [nvarchar](255) NOT NULL,
	[status] [bit] NOT NULL,
	[avartar] [varchar](max) NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Product]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Fearture]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fearture](
	[f_id] [int] NOT NULL,
	[f_name] [varchar](50) NOT NULL,
	[f_url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Fearture] PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 25/09/2024 23:49:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[img_id] [int] NOT NULL,
	[img_url] [varchar](255) NOT NULL,
	[product_id] [int] NULL,
	[feedback_id] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[cart_id] [int] NOT NULL,
	[price_at_cart] [decimal](18, 3) NOT NULL,
	[brand] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[capacity] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[quanity] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[PasswordResetToken]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResetToken](
	[cus_id] [int] NOT NULL,
	[token] [varchar](max) NOT NULL,
	[expiration_time] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [int] NOT NULL,
	[date] [date] NOT NULL,
	[stock] [int] NOT NULL,
	[discount_id] [int] NULL,
	[brand_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Capacity]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Product_Gender]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Product_Image]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Image](
	[product_id] [int] NOT NULL,
	[img_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_Image] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Role_Customer]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Role_Employee]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Role_Fearture]    Script Date: 25/09/2024 23:49:28 ******/
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
/****** Object:  Table [dbo].[Slider]    Script Date: 25/09/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[slide_id] [int] NOT NULL,
	[tiltle] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[emp_id] [int] NOT NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider_IMG]    Script Date: 25/09/2024 23:49:28 ******/
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
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (1, 123456788, N'Hà Nội', N'Ba Đình', N'12', NULL, N'Ngõ 12', 1)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (2, 123456789, N'Hà Nam', N'Đồng Văn ', N'13', N'Chợ Lương', N'Cạnh Thế Giới Sữa', 2)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (3, 987654321, N'Phú Xuyên', N'Cổ Nhuế', N'14', NULL, N'Cạnh bờ đê', 3)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id]) VALUES (1, N'1 hãng nước hoa mới của Pháp', N'1 doanh nghiệp nhỏ lấy tên gần giống như thương hiệu Channel', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2020-12-20' AS Date), 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id]) VALUES (2, N'Nhóm sinh viên tự chế nước hoa', N'Tuổi trẻ tài cao, nhóm sinh viên xuất sắc tạo ra 1 loại nước hoa ', N'bbbbbbbbbbbbbbbbbbbbbbbbbbbbb', CAST(N'2020-11-20' AS Date), 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id]) VALUES (3, N'Nghệ Thuật Phối Hợp Nước Hoa', N'Khám phá cách phối hợp nướcc hoa để tạo nên mùi hương độc đáo.', N'Phối hợp nước hoa là một kỹ thuật kết hợp nhiều mùi hương khác nhau để tạo ra một mùi hương đặc trưng riêng của bạn. Trong bài viết này, chúng ta sẽ khám phá các nguyên tắc cơ bản của việc phối hợp nước hoa, cách chọn các mùi hương phù hợp, và mẹo để mùi hương lưu giữ lâu hơn.', CAST(N'2024-09-16' AS Date), 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id]) VALUES (4, N'Cách Chọn Nước Hoa Phù Hợp Với Từng Mùa', N'Mỗi mùa đều có mùi hương phù hợp riêng. Hãy cùng tìm hiểu cách chọnn nướcc hoa phù hợp cho mỗi mùa trong năm.', N'Chọn nước hoa theo mùa là một cách tuyệt vời để tối ưu hóa mùi hương của bạn và tận dụng cảm giác của từng mùa. Mùa xuân với những mùi hương hoa nhẹ nhàng, mùa hè với hương trái cây tươi mát, mùa thu với hương gỗ ấm áp, và mùa đông với mùi hương đậm và cay. Bài viết này sẽ hướng dẫn bạn cách lựa chọn nước hoa cho từng mùa trong năm.', CAST(N'2024-09-16' AS Date), 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id]) VALUES (5, N'10 Mẹo Giúp Nước Hoa Lưu Hương Lâu Hơn', N'Bạn muốn nước hoa của mình lưu hương suốt cả ngày? Dưới đây là 10 mẹo giúp bạn đạt được điều đó.', N'Nước hoa là một phần quan trọng trong phong cách cá nhân, nhưng không phải lúc nào mùi hương cũng lưu giữ được lâu. Bài viết này cung cấp 10 mẹo hữu ích để bạn có thể giữ mùi hương lâu hơn, từ việc chọn đúng loại nước hoa, cách bảo quản, đến cách xịt nước hoa đúng cách.', CAST(N'2024-09-16' AS Date), 1)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (1, 1)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (1, 2)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (2, 3)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (2, 4)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (3, 5)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (3, 6)
GO
INSERT [dbo].[Brand] ([brand_id], [name]) VALUES (1, N'Chanel')
GO
INSERT [dbo].[Brand] ([brand_id], [name]) VALUES (2, N'Dior')
GO
INSERT [dbo].[Brand] ([brand_id], [name]) VALUES (3, N'Gucci')
GO
INSERT [dbo].[Capacity] ([cap_id], [cap_value]) VALUES (1, 10)
GO
INSERT [dbo].[Capacity] ([cap_id], [cap_value]) VALUES (2, 20)
GO
INSERT [dbo].[Capacity] ([cap_id], [cap_value]) VALUES (3, 60)
GO
INSERT [dbo].[Capacity] ([cap_id], [cap_value]) VALUES (4, 100)
GO
INSERT [dbo].[Capacity] ([cap_id], [cap_value]) VALUES (5, 125)
GO
INSERT [dbo].[Capacity] ([cap_id], [cap_value]) VALUES (6, 200)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [display_name], [status], [cart_id], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (1, N'Long Đẹp Trai', N'aaa123', N'shamt2004@gmail.com', N'123456788', N'Keishaaaaa', 1, 4, N'avatar1.jpg', 4, 1, N'123qad', CAST(N'2012-12-11' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [display_name], [status], [cart_id], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (2, N'Nguyễn Văn A', N'123456', N'nguyenvana@example.com', N'123456789', N'Nguyễn A', 1, 2, N'avatar2.png', 4, 1, N'aaaaaaadas', CAST(N'2020-12-22' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [display_name], [status], [cart_id], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (3, N'Trần Thị B', N'123456', N'tranthib@example.com', N'987654321', N'Trần B', 1, 3, N'avatar3.png', 4, 1, N'qwe', CAST(N'1992-12-21' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [display_name], [status], [cart_id], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (4, N'dfgfdf', N'asd12', N'dellcosteen147@gmail.com', N'0132456789', N'gffdg', 1, NULL, NULL, 4, 0, N'sdfgd', CAST(N'2024-09-12' AS Date), N'e8ba0860-cfe1-4d63-aa39-28ec0c74ec96')
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (1, N'Giảm giá mùa hè', CAST(10 AS Decimal(18, 0)), CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (2, N'Giảm giá cuối năm', CAST(20 AS Decimal(18, 0)), CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (3, N'Giảm giá mùa xuân', CAST(15 AS Decimal(18, 0)), CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-03-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (4, N'Giảm giá tháng 11', CAST(25 AS Decimal(18, 0)), CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (5, N'Khuyến mãi ngày lễ', CAST(30 AS Decimal(18, 0)), CAST(N'2024-12-20T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (6, N'Giảm giá đặc biệt Black Friday', CAST(40 AS Decimal(18, 0)), CAST(N'2024-11-29T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (7, N'Ưu đãi khách hàng VIP', CAST(50 AS Decimal(18, 0)), CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([emp_id], [name_emp], [password], [phone], [display_name], [status], [avartar], [role_id]) VALUES (1, N'Tran Nguyen Phi Long', N'123456', 354995144, N'Cybevis Keisha', 1, N'long_emp_jpg', 1)
GO
INSERT [dbo].[Employee] ([emp_id], [name_emp], [password], [phone], [display_name], [status], [avartar], [role_id]) VALUES (2, N'Phạm Văn C', N'123456', 123123123, N'Phạm C', 1, N'avatar_c.jpg', 2)
GO
INSERT [dbo].[Employee] ([emp_id], [name_emp], [password], [phone], [display_name], [status], [avartar], [role_id]) VALUES (3, N'Hoàng Thị D', N'123456', 321321321, N'Hoàng D', 1, N'avatar_d.jpg', 2)
GO
INSERT [dbo].[Feedback] ([fb_id], [date], [content], [rating], [product_id], [cus_id]) VALUES (1, CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'Sản phẩm này rất tốt, mùi hương lâu và dễ chịu.', 5, 1, 2)
GO
INSERT [dbo].[Feedback] ([fb_id], [date], [content], [rating], [product_id], [cus_id]) VALUES (2, CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'Nước hoa thơm nhưng không giữ mùi lâu như mong đợi.', 3, 2, 3)
GO
INSERT [dbo].[Feedback] ([fb_id], [date], [content], [rating], [product_id], [cus_id]) VALUES (3, CAST(N'2024-09-16T00:00:00.000' AS DateTime), N'Giá cả hợp lý và chất lượng ổn.', 4, 3, 2)
GO
INSERT [dbo].[Gender] ([gender_id], [name]) VALUES (1, N'Male')
GO
INSERT [dbo].[Gender] ([gender_id], [name]) VALUES (2, N'Female')
GO
INSERT [dbo].[Gender] ([gender_id], [name]) VALUES (3, N'Unisex')
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (1, N'blog1_pic1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (2, N'blog1_pic2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (3, N'blog2_pic2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (4, N'blog2_pic1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (5, N'blog3_pic1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (6, N'blog3_pic2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (7, N'slider1.jpg', 1, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (8, N'slider2.jpg', 2, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (9, N'slider3.jpg', 3, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (10, N'product1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (11, N'product2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (12, N'product3.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (13, N'product4.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (14, N'product5.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (15, N'product6.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (16, N'product7.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (17, N'product8.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (18, N'product9.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (19, N'product10.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (20, N'product11.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (21, N'product12.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (22, N'product13.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (23, N'product14.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (24, N'product15.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (25, N'product16.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (26, N'product17.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (27, N'product18.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (28, N'product19.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [product_id], [feedback_id]) VALUES (29, N'product20.jpg', NULL, NULL)
GO
INSERT [dbo].[PasswordResetToken] ([cus_id], [token], [expiration_time]) VALUES (4, N'1c2d2fc6-4167-4a4c-ae57-4dc70252e5dd', CAST(N'2024-09-25T22:09:12.833' AS DateTime))
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (1, N'Dior Sauvage', 2400000, CAST(N'2023-01-15' AS Date), 100, NULL, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (2, N'Channel', 1500000, CAST(N'2023-02-20' AS Date), 50, NULL, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (3, N'La nuit de lhoome', 1800000, CAST(N'2023-03-05' AS Date), 75, NULL, 3, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (4, N'Yves Saint Laurent Black Opium', 2000000, CAST(N'2023-04-15' AS Date), 50, NULL, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (5, N'Giorgio Armani Acqua Di Gio', 1800000, CAST(N'2023-05-10' AS Date), 60, NULL, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (6, N'Paco Rabanne Invictus', 1700000, CAST(N'2023-06-01' AS Date), 80, NULL, 3, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (7, N'Tom Ford Tobacco Vanille', 2500000, CAST(N'2023-07-15' AS Date), 30, NULL, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (8, N'Calvin Klein CK One', 1200000, CAST(N'2023-08-10' AS Date), 100, 3, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (9, N'Gucci Bloom', 2200000, CAST(N'2023-09-05' AS Date), 50, 4, 3, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (10, N'Creed Aventus', 3500000, CAST(N'2023-10-01' AS Date), 40, 5, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (11, N'Hugo Boss Bottled', 1500000, CAST(N'2023-10-05' AS Date), 60, NULL, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (12, N'Tommy Hilfiger Tommy Girl', 1300000, CAST(N'2023-09-20' AS Date), 80, NULL, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (13, N'Burberry Her', 1700000, CAST(N'2023-08-25' AS Date), 55, 6, 3, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (14, N'Jo Malone English Pear & Freesia', 2100000, CAST(N'2023-11-15' AS Date), 45, 5, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (15, N'Prada Luna Rossa Carbon', 1950000, CAST(N'2023-07-30' AS Date), 70, NULL, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (16, N'Calvin Klein Euphoria', 1600000, CAST(N'2023-06-10' AS Date), 85, 4, 3, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (17, N'Montblanc Explorer', 1850000, CAST(N'2023-05-20' AS Date), 40, NULL, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (18, N'Yves Saint Laurent Libre', 2300000, CAST(N'2023-04-05' AS Date), 65, 2, 2, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (19, N'Versace Eros', 2500000, CAST(N'2023-03-18' AS Date), 90, 3, 1, 1)
GO
INSERT [dbo].[Product] ([product_id], [name], [price], [date], [stock], [discount_id], [brand_id], [status]) VALUES (20, N'Dolce & Gabbana Light Blue', 1450000, CAST(N'2023-01-25' AS Date), 100, NULL, 3, 1)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 1)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 3)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 5)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 10)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 11)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 19)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 2)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 4)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 9)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 12)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 13)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 16)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 18)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 6)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 7)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 8)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 14)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 15)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 17)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 20)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (1, 7)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (1, 10)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (2, 8)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (2, 11)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (3, 9)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (3, 12)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (4, 13)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (5, 14)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (6, 15)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (7, 16)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (8, 17)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (9, 18)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (10, 19)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (11, 20)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (12, 21)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (13, 22)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (14, 23)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (15, 24)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (16, 25)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (17, 26)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (18, 27)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (19, 28)
GO
INSERT [dbo].[Product_Image] ([product_id], [img_id]) VALUES (20, 29)
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Marketer')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Saler')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'Customer')
GO
INSERT [dbo].[Slider] ([slide_id], [tiltle], [description], [emp_id], [create_date]) VALUES (1, N'Dior Savage', N'Hương nước hoa nam tính phù hợp cho học sinh sinh viên', 1, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Slider] ([slide_id], [tiltle], [description], [emp_id], [create_date]) VALUES (2, N'Channel', N'Nước hoa dành cho những cô nàng quyến rũ', 1, CAST(N'2021-12-12' AS Date))
GO
INSERT [dbo].[Slider] ([slide_id], [tiltle], [description], [emp_id], [create_date]) VALUES (3, N'La nuit de lhoome', N'Nước hoa nữ tính dành cho nam', 1, CAST(N'2020-12-12' AS Date))
GO
INSERT [dbo].[Slider_IMG] ([slide_id], [img_id]) VALUES (1, 7)
GO
INSERT [dbo].[Slider_IMG] ([slide_id], [img_id]) VALUES (2, 8)
GO
INSERT [dbo].[Slider_IMG] ([slide_id], [img_id]) VALUES (3, 9)
GO
/****** Object:  Index [UQ_Customer_Cart]    Script Date: 25/09/2024 23:49:28 ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [UQ_Customer_Cart] UNIQUE NONCLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_email]    Script Date: 25/09/2024 23:49:28 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Phone]    Script Date: 25/09/2024 23:49:28 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ_Phone] UNIQUE NONCLUSTERED 
(
	[c_phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Feedback_Customer_Product]    Script Date: 25/09/2024 23:49:28 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [UQ_Feedback_Customer_Product] UNIQUE NONCLUSTERED 
(
	[cus_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[PasswordResetToken]  WITH CHECK ADD  CONSTRAINT [FK_PasswordResetToken_Customer] FOREIGN KEY([cus_id])
REFERENCES [dbo].[Customer] ([cus_id])
GO
ALTER TABLE [dbo].[PasswordResetToken] CHECK CONSTRAINT [FK_PasswordResetToken_Customer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Branch] FOREIGN KEY([brand_id])
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
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD  CONSTRAINT [FK_Product_Image_Image] FOREIGN KEY([img_id])
REFERENCES [dbo].[Image] ([img_id])
GO
ALTER TABLE [dbo].[Product_Image] CHECK CONSTRAINT [FK_Product_Image_Image]
GO
ALTER TABLE [dbo].[Product_Image]  WITH CHECK ADD  CONSTRAINT [FK_Product_Image_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_Image] CHECK CONSTRAINT [FK_Product_Image_Product]
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
