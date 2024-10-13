USE [backup]
GO
/****** Object:  Table [db_owner].[Status_Order]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [db_owner].[Status_Order](
	[status_id] [int] NOT NULL,
	[status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Status_Order] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[a_phone] [varchar](11) NOT NULL,
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
/****** Object:  Table [dbo].[Blog]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[shortContent] [nvarchar](255) NULL,
	[content] [nvarchar](max) NOT NULL,
	[date] [date] NOT NULL,
	[emp_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog_IMG]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capacity]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[cus_id] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cus_id] [int] IDENTITY(1,1) NOT NULL,
	[name_cus] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[c_phone] [varchar](11) NOT NULL,
	[status] [bit] NOT NULL,
	[avartar] [nvarchar](max) NULL,
	[role_id] [int] NOT NULL,
	[gender] [bit] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[birth_date] [date] NOT NULL,
	[verification_code] [varchar](255) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[discount_amount] [int] NOT NULL,
	[start] [datetime] NOT NULL,
	[end] [datetime] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[name_emp] [nvarchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[phone] [varchar](11) NOT NULL,
	[status] [bit] NOT NULL,
	[avartar] [nvarchar](max) NULL,
	[role_id] [int] NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Product]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Fearture]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fearture](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [varchar](50) NOT NULL,
	[f_url] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Fearture] PRIMARY KEY CLUSTERED 
(
	[f_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[fb_id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[rating] [int] NOT NULL,
	[product_id] [int] NULL,
	[cus_id] [int] NULL,
	[phone] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[fb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[img_url] [nvarchar](255) NOT NULL,
	[feedback_id] [int] NULL,
	[slider_id] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[cart_id] [int] NOT NULL,
	[quanity] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[total] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[status_id] [int] NOT NULL,
	[cus_id] [int] NOT NULL,
	[payment_method] [nvarchar](255) NOT NULL,
	[shipping_method] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[price_at_order] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[branch] [nvarchar](50) NOT NULL,
	[capacity] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordResetToken]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordResetToken](
	[cus_id] [int] NOT NULL,
	[token] [varchar](255) NOT NULL,
	[expiration_time] [datetime] NOT NULL,
 CONSTRAINT [PK_PasswordResetToken] PRIMARY KEY CLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Product_Capacity]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Product_Gender]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Product_Image]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Role_Customer]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Role_Employee]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Role_Fearture]    Script Date: 10/13/2024 2:22:59 PM ******/
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
/****** Object:  Table [dbo].[Slider]    Script Date: 10/13/2024 2:22:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[slide_id] [int] IDENTITY(1,1) NOT NULL,
	[tiltle] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[emp_id] [int] NOT NULL,
	[create_date] [date] NULL,
	[img_id] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [db_owner].[Status_Order] ([status_id], [status]) VALUES (1, N'Pending   ')
GO
INSERT [db_owner].[Status_Order] ([status_id], [status]) VALUES (2, N'Confirmed ')
GO
INSERT [db_owner].[Status_Order] ([status_id], [status]) VALUES (3, N'Shipping  ')
GO
INSERT [db_owner].[Status_Order] ([status_id], [status]) VALUES (4, N'Completed ')
GO
INSERT [db_owner].[Status_Order] ([status_id], [status]) VALUES (5, N'Cancelled ')
GO
SET IDENTITY_INSERT [dbo].[Address] ON 
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (13, N'0123456788', N'Ho Chi Minh City', N'District 5', N'Ward 1', N'Elm Street', N'190', 1)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (14, N'0123456789', N'Hà Nam', N'Đồng Văn', N'13', N'Chợ Lương', N'Cạnh Thế Giới Sữa', 2)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (15, N'987654321', N'Phú Xuyên', N'Cổ Nhuế', N'14', NULL, N'Cạnh bờ đê', 3)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (34, N'0987654321', N'Hà Nội', N'Tây Hồ', N'Từ Hoa', N'Ngõ 26', N'', 20)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (37, N'0987654321', N'Hà Nội', N'Đống Đa', N'Hai Bà Trưng', N'Ngách 92', N'', 20)
GO
INSERT [dbo].[Address] ([a_id], [a_phone], [city], [district], [ward], [street], [detail], [cus_id]) VALUES (38, N'0981234567', N'Hà Nội', N'Hòa Lạc', N'Thạch Thất', N'Thôn 3', N'', 8)
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id], [status]) VALUES (11, N'1 hãng nước hoa mới của Pháp', N'1 doanh nghiệp nhỏ lấy tên gần giống như thương hiệu Channel', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2020-12-20' AS Date), 1, 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id], [status]) VALUES (12, N'Nhóm sinh viên tự chế nước hoa', N'Tuổi trẻ tài cao, nhóm sinh viên xuất sắc tạo ra 1 loại nước hoa ', N'bbbbbbbbbbbbbbbbbbbbbbbbbbbbb', CAST(N'2020-11-20' AS Date), 1, 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id], [status]) VALUES (13, N'Nghệ Thuật Phối Hợp Nước Hoa', N'Khám phá cách phối hợp nước hoa để tạo nên mùi hương độc đáo.', N'Phối hợp nước hoa là một kỹ thuật kết hợp nhiều mùi hương khác nhau để tạo ra một mùi hương đặc trưng riêng của bạn. Trong bài viết này, chúng ta sẽ khám phá các nguyên tắc cơ bản của việc phối hợp nước hoa, cách chọn các mùi hương phù hợp, và mẹo để mùi hương lưu giữ lâu hơn.', CAST(N'2024-09-16' AS Date), 1, 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id], [status]) VALUES (14, N'Cách Chọn Nước Hoa Phù Hợp Với Từng Mùa', N'Mỗi mùa đều có mùi hương phù hợp riêng. Hãy cùng tìm hiểu cách chọn nước hoa phù hợp cho mỗi mùa trong năm.', N'Chọn nước hoa theo mùa là một cách tuyệt vời để tối ưu hóa mùi hương của bạn và tận dụng cảm giác của từng mùa. Mùa xuân với những mùi hương hoa nhẹ nhàng, mùa hè với hương trái cây tươi mát, mùa thu với hương gỗ ấm áp, và mùa đông với mùi hương đậm và cay. Bài viết này sẽ hướng dẫn bạn cách lựa chọn nước hoa cho từng mùa trong năm.', CAST(N'2024-09-16' AS Date), 1, 1)
GO
INSERT [dbo].[Blog] ([blog_id], [title], [shortContent], [content], [date], [emp_id], [status]) VALUES (15, N'10 Mẹo Giúp Nước Hoa Lưu Hương Lâu Hơn', N'Bạn muốn nước hoa của mình lưu hương suốt cả ngày? Dưới đây là 10 mẹo giúp bạn đạt được điều đó.', N'Nước hoa là một phần quan trọng trong phong cách cá nhân, nhưng không phải lúc nào mùi hương cũng lưu giữ được lâu. Bài viết này cung cấp 10 mẹo hữu ích để bạn có thể giữ mùi hương lâu hơn, từ việc chọn đúng loại nước hoa, cách bảo quản, đến cách xịt nước hoa đúng cách.', CAST(N'2024-09-16' AS Date), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (11, 1)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (12, 2)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (13, 3)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (14, 4)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (14, 6)
GO
INSERT [dbo].[Blog_IMG] ([blog_id], [img_id]) VALUES (15, 5)
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 
GO
INSERT [dbo].[Brand] ([brand_id], [name]) VALUES (1, N'Chanel')
GO
INSERT [dbo].[Brand] ([brand_id], [name]) VALUES (2, N'Dior')
GO
INSERT [dbo].[Brand] ([brand_id], [name]) VALUES (3, N'Gucci')
GO
SET IDENTITY_INSERT [dbo].[Brand] OFF
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
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (7, 1)
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (8, 2)
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (9, 3)
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (11, 8)
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (18, 20)
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (23, 27)
GO
INSERT [dbo].[Cart] ([cart_id], [cus_id]) VALUES (26, 30)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (1, N'Long ', N'thang123', N'shamt2004@gmail.com', N'0123456780', 0, N'avatar1.jpg', 2, 1, N'123qad', CAST(N'2012-12-11' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (2, N'Nguyễn Văn A', N'123456', N'nguyenvana@example.com', N'0123456789', 1, N'avatar2.png', 4, 0, N'aaaaaaadas', CAST(N'2020-12-22' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (3, N'Trần Thị B', N'123456', N'tranthib@example.com', N'0987654321', 1, N'avatar3.png', 4, 0, N'qwe', CAST(N'1992-12-21' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (8, N'Thang', N'thang123', N'dellcosteen147@gmail.com', N'0981234567', 1, N'img/users/C.jpg', 4, 1, N'thang', CAST(N'2003-07-14' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (20, N'My Exam', N'asd123', N'exam123@gmail.com', N'0133622321', 1, N'img/users/C.jpg', 4, 1, N'exam', CAST(N'2002-02-02' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (27, N'Trần Nguyễn Phi Long', N'asdasd', N'munhoang00@gmail.com', N'0354995145', 1, NULL, 4, 0, N'khuong', CAST(N'2024-10-18' AS Date), N'e05a3ab8-f44d-4917-9885-7df996f62af8')
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (30, N'Anh Chu', N'123456', N'admin@gmail.com', N'0979979979', 1, NULL, 1, 0, N'admin', CAST(N'2002-09-05' AS Date), NULL)
GO
INSERT [dbo].[Customer] ([cus_id], [name_cus], [password], [email], [c_phone], [status], [avartar], [role_id], [gender], [username], [birth_date], [verification_code]) VALUES (31, N'Anh Sale', N'123456', N'saler@gmail.com', N'0979979899', 1, NULL, 3, 0, N'saler', CAST(N'2002-09-05' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (1, N'Giảm giá mùa hè', 10, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (2, N'Giảm giá cuối năm', 20, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (3, N'Giảm giá mùa xuân', 15, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (4, N'Giảm giá tháng 11', 25, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (5, N'Khuyến mãi ngày lễ', 30, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (6, N'Giảm giá đặc biệt Black Friday', 40, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Discount] ([discount_id], [name], [discount_amount], [start], [end]) VALUES (7, N'Ưu đãi khách hàng VIP', 50, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-12-27T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([emp_id], [name_emp], [password], [phone], [status], [avartar], [role_id], [email]) VALUES (1, N'accccc', N'123456', N'354995144', 1, N'long_emp_jpg', 1, N'a@gmail.com')
GO
INSERT [dbo].[Employee] ([emp_id], [name_emp], [password], [phone], [status], [avartar], [role_id], [email]) VALUES (2, N'pham@gmail.com', N'aaa123', N'123123123', 1, N'avatar_c.jpg', 2, N'b@gmail.com')
GO
INSERT [dbo].[Employee] ([emp_id], [name_emp], [password], [phone], [status], [avartar], [role_id], [email]) VALUES (3, N'Hoàng Thị D', N'123456', N'321321321', 1, N'avatar_d.jpg', 2, N'example3@example.com')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Employee_Product] ([emp_id], [product_id]) VALUES (2, 1)
GO
INSERT [dbo].[Employee_Product] ([emp_id], [product_id]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([fb_id], [date], [content], [rating], [product_id], [cus_id], [phone]) VALUES (1, CAST(N'2024-10-06T00:00:00.000' AS DateTime), N'Feedback 1', 5, 4, 1, N'0123456788')
GO
INSERT [dbo].[Feedback] ([fb_id], [date], [content], [rating], [product_id], [cus_id], [phone]) VALUES (3, CAST(N'2024-10-06T00:00:00.000' AS DateTime), N'Thơm', 5, 1, 1, N'0123456780')
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[Gender] ([gender_id], [name]) VALUES (1, N'Nam')
GO
INSERT [dbo].[Gender] ([gender_id], [name]) VALUES (2, N'Nữ')
GO
INSERT [dbo].[Gender] ([gender_id], [name]) VALUES (3, N'Unisex')
GO
SET IDENTITY_INSERT [dbo].[Image] ON 
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (1, N'blog1_pic1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (2, N'blog1_pic2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (3, N'blog2_pic2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (4, N'blog2_pic1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (5, N'blog3_pic1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (6, N'blog3_pic2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (7, N'slider1.jpg', NULL, 1)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (8, N'slider2.jpg', NULL, 2)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (9, N'slider3.jpg', NULL, 3)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (10, N'product1.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (11, N'product2.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (12, N'product3.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (13, N'product4.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (14, N'product5.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (15, N'product6.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (16, N'product7.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (17, N'product8.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (18, N'product9.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (19, N'product10.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (20, N'product11.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (21, N'product12.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (22, N'product13.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (23, N'product14.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (24, N'product15.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (25, N'product16.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (26, N'product17.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (27, N'product18.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (28, N'product19.jpg', NULL, NULL)
GO
INSERT [dbo].[Image] ([img_id], [img_url], [feedback_id], [slider_id]) VALUES (29, N'product20.jpg', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (9, 2, 8, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (10, 4, 8, 3)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (11, 5, 9, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (12, 6, 9, 2)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (13, 7, 11, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (14, 8, 11, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (15, 9, 18, 2)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (16, 10, 18, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (17, 11, 23, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (18, 12, 23, 3)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (20, 8, 7, 2)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (22, 7, 8, 2)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (26, 19, 7, 1)
GO
INSERT [dbo].[Item] ([item_id], [product_id], [cart_id], [quanity]) VALUES (27, 18, 7, 1)
GO
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (17, 1500000, CAST(N'2024-10-01T16:48:43.550' AS DateTime), 4, 1, N'Credit Card', N'Express')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (18, 2500000, CAST(N'2024-10-01T16:48:43.550' AS DateTime), 2, 2, N'Paypal', N'Standard')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (19, 3000000, CAST(N'2024-10-01T16:48:43.550' AS DateTime), 3, 3, N'Cash', N'Express')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (20, 1200000, CAST(N'2024-10-01T16:48:43.550' AS DateTime), 4, 1, N'Credit Card', N'Standard')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (21, 1800000, CAST(N'2024-10-01T16:48:43.550' AS DateTime), 5, 2, N'Bank Transfer', N'Express')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (22, 1250000, CAST(N'2024-09-20T14:30:00.000' AS DateTime), 1, 1, N'Credit Card', N'Standard Shipping')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (23, 4500000, CAST(N'2024-10-01T19:05:55.540' AS DateTime), 4, 1, N'Credit Card', N'Standard')
GO
INSERT [dbo].[Order] ([order_id], [total], [created_at], [status_id], [cus_id], [payment_method], [shipping_method]) VALUES (24, 4500000, CAST(N'2024-10-06T12:00:00.000' AS DateTime), 1, 1, N'Credit Card', N'Express Shipping')
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (2, 1, 2400000, 1, N'Nam', N'Dior', 100, 17)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (3, 2, 1500000, 2, N'Nữ', N'Chanel', 50, 18)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (4, 3, 1800000, 1, N'Nam', N'Gucci', 60, 19)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (5, 4, 2000000, 2, N'Nữ', N'Yves Saint Laurent', 100, 20)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (6, 5, 1800000, 1, N'Unisex', N'Gucci', 125, 21)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (7, 6, 2800000, 1, N'Unisex', N'Gucci', 100, 22)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (8, 1, 2400000, 1, N'Nam', N'Dior', 100, 23)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (9, 2, 2100000, 1, N'Nữ', N'Chanel', 50, 23)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (10, 1, 2400000, 1, N'Nam', N'Dior', 100, 24)
GO
INSERT [dbo].[OrderDetail] ([detail_id], [product_id], [price_at_order], [quantity], [gender], [branch], [capacity], [order_id]) VALUES (11, 2, 1500000, 2, N'Nữ', N'Chanel', 50, 24)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
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
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (1, 1)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (1, 2)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (1, 3)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (1, 4)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (2, 1)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (2, 3)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (2, 4)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (3, 1)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (3, 3)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (3, 4)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (4, 1)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (4, 4)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (5, 4)
GO
INSERT [dbo].[Product_Capacity] ([cap_id], [product_id]) VALUES (6, 4)
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
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 15)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (1, 17)
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
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 18)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (2, 20)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 6)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 7)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 8)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 14)
GO
INSERT [dbo].[Product_Gender] ([gender_id], [product_id]) VALUES (3, 16)
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
SET IDENTITY_INSERT [dbo].[Slider] ON 
GO
INSERT [dbo].[Slider] ([slide_id], [tiltle], [description], [emp_id], [create_date], [img_id], [status]) VALUES (1, N'Dior Savage', N'Hương nước hoa nam tính phù hợp cho học sinh sinh viên', 1, CAST(N'2022-12-12' AS Date), 7, 1)
GO
INSERT [dbo].[Slider] ([slide_id], [tiltle], [description], [emp_id], [create_date], [img_id], [status]) VALUES (2, N'Channel', N'Nước hoa dành cho những cô nàng quyến rũ', 1, CAST(N'2021-12-12' AS Date), 8, 1)
GO
INSERT [dbo].[Slider] ([slide_id], [tiltle], [description], [emp_id], [create_date], [img_id], [status]) VALUES (3, N'La nuit de lhoome', N'Nước hoa nữ tính dành cho nam', 1, CAST(N'2020-12-12' AS Date), 9, 1)
GO
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
/****** Object:  Index [UQ_Cart_Customer]    Script Date: 10/13/2024 2:22:59 PM ******/
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [UQ_Cart_Customer] UNIQUE NONCLUSTERED 
(
	[cus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_email]    Script Date: 10/13/2024 2:22:59 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_username]    Script Date: 10/13/2024 2:22:59 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Feedback_Customer_Product]    Script Date: 10/13/2024 2:22:59 PM ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [UQ_Feedback_Customer_Product] UNIQUE NONCLUSTERED 
(
	[cus_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Slider_Image]    Script Date: 10/13/2024 2:22:59 PM ******/
ALTER TABLE [dbo].[Slider] ADD  CONSTRAINT [UQ_Slider_Image] UNIQUE NONCLUSTERED 
(
	[img_id] ASC
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
ON UPDATE CASCADE
ON DELETE CASCADE
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status_Order] FOREIGN KEY([status_id])
REFERENCES [db_owner].[Status_Order] ([status_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order1] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order1]
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
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Image] FOREIGN KEY([img_id])
REFERENCES [dbo].[Image] ([img_id])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Image]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [CK_Check_Rating] CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [CK_Check_Rating]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dat dieu kien cho rating tu 1 den 5 sao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'CONSTRAINT',@level2name=N'CK_Check_Rating'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'quantity of products' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'stock'
GO
