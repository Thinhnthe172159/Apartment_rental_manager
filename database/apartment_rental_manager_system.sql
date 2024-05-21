
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aparment]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aparment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[type_id] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[city_id] [int] NULL,
	[district_id] [int] NULL,
	[commune_id] [int] NULL,
	[price] [decimal](18, 0) NOT NULL,
	[area] [decimal](18, 0) NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[number_of_bedroom] [int] NULL,
	[payment_type_for_post_id] [int] NULL,
	[status_apartment] [int] NOT NULL,
	[post_start] [date] NOT NULL,
	[post_end] [date] NOT NULL,
	[landlord_id] [int] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_image]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[Apartment_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_room]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_room](
	[id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[aprartment_id] [int] NOT NULL,
 CONSTRAINT [PK_Apartment_room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commune]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commune](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[District_id] [int] NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_Commune] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community_post]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community_post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nchar](200) NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Community_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_post]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[post_id] [int] NOT NULL,
 CONSTRAINT [PK_Image_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident](
	[id] [int] NOT NULL,
	[tenant_id] [int] NOT NULL,
	[lardlord_id] [int] NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [nchar](10) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Incident] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landlord]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landlord](
	[id] [int] NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[civil_id] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_landlord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[room_id] [int] NOT NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_maintain]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_maintain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apartment_id] [int] NOT NULL,
	[tenant_id] [int] NOT NULL,
	[landlord_id] [int] NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[date_post] [date] NOT NULL,
 CONSTRAINT [PK_Report_maintain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[id] [int] NOT NULL,
	[user_name] [nchar](10) NULL,
	[staff_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[id] [int] NOT NULL,
	[civil_id] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role_id] [int] NOT NULL,
	[status] [int] NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[dob] [date] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_image]    Script Date: 5/19/2024 10:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_image](
	[user_id] [int] NOT NULL,
	[image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User_image] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [user_name], [phone]) VALUES (1, N'thinh5k', N'0987654321')
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name]) VALUES (1, N'Thành phố Hà Nội')
INSERT [dbo].[City] ([id], [name]) VALUES (2, N'Tỉnh Hà Giang')
INSERT [dbo].[City] ([id], [name]) VALUES (3, N'Tỉnh Cao Bằng')
INSERT [dbo].[City] ([id], [name]) VALUES (4, N'Tỉnh Bắc Kạn')
INSERT [dbo].[City] ([id], [name]) VALUES (5, N'Tỉnh Tuyên Quang')
INSERT [dbo].[City] ([id], [name]) VALUES (6, N'Tỉnh Lào Cai')
INSERT [dbo].[City] ([id], [name]) VALUES (7, N'Tỉnh Điện Biên')
INSERT [dbo].[City] ([id], [name]) VALUES (8, N'Tỉnh Lai Châu')
INSERT [dbo].[City] ([id], [name]) VALUES (9, N'Tỉnh Sơn La')
INSERT [dbo].[City] ([id], [name]) VALUES (10, N'Tỉnh Yên Bái')
INSERT [dbo].[City] ([id], [name]) VALUES (11, N'Tỉnh Hoà Bình')
INSERT [dbo].[City] ([id], [name]) VALUES (12, N'Tỉnh Thái Nguyên')
INSERT [dbo].[City] ([id], [name]) VALUES (13, N'Tỉnh Lạng Sơn')
INSERT [dbo].[City] ([id], [name]) VALUES (14, N'Tỉnh Quảng Ninh')
INSERT [dbo].[City] ([id], [name]) VALUES (15, N'Tỉnh Bắc Giang')
INSERT [dbo].[City] ([id], [name]) VALUES (16, N'Tỉnh Phú Thọ')
INSERT [dbo].[City] ([id], [name]) VALUES (17, N'Tỉnh Vĩnh Phúc')
INSERT [dbo].[City] ([id], [name]) VALUES (18, N'Tỉnh Bắc Ninh')
INSERT [dbo].[City] ([id], [name]) VALUES (19, N'Tỉnh Hải Dương')
INSERT [dbo].[City] ([id], [name]) VALUES (20, N'Thành phố Hải Phòng')
INSERT [dbo].[City] ([id], [name]) VALUES (21, N'Tỉnh Hưng Yên')
INSERT [dbo].[City] ([id], [name]) VALUES (22, N'Tỉnh Thái Bình')
INSERT [dbo].[City] ([id], [name]) VALUES (23, N'Tỉnh Hà Nam')
INSERT [dbo].[City] ([id], [name]) VALUES (24, N'Tỉnh Nam Định')
INSERT [dbo].[City] ([id], [name]) VALUES (25, N'Tỉnh Ninh Bình')
INSERT [dbo].[City] ([id], [name]) VALUES (26, N'Tỉnh Thanh Hóa')
INSERT [dbo].[City] ([id], [name]) VALUES (27, N'Tỉnh Nghệ An')
INSERT [dbo].[City] ([id], [name]) VALUES (28, N'Tỉnh Hà Tĩnh')
INSERT [dbo].[City] ([id], [name]) VALUES (29, N'Tỉnh Quảng Bình')
INSERT [dbo].[City] ([id], [name]) VALUES (30, N'Tỉnh Quảng Trị')
INSERT [dbo].[City] ([id], [name]) VALUES (31, N'Tỉnh Thừa Thiên Huế')
INSERT [dbo].[City] ([id], [name]) VALUES (32, N'Thành phố Đà Nẵng')
INSERT [dbo].[City] ([id], [name]) VALUES (33, N'Tỉnh Quảng Nam')
INSERT [dbo].[City] ([id], [name]) VALUES (34, N'Tỉnh Quảng Ngãi')
INSERT [dbo].[City] ([id], [name]) VALUES (35, N'Tỉnh Bình Định')
INSERT [dbo].[City] ([id], [name]) VALUES (36, N'Tỉnh Phú Yên')
INSERT [dbo].[City] ([id], [name]) VALUES (37, N'Tỉnh Khánh Hòa')
INSERT [dbo].[City] ([id], [name]) VALUES (38, N'Tỉnh Ninh Thuận')
INSERT [dbo].[City] ([id], [name]) VALUES (39, N'Tỉnh Bình Thuận')
INSERT [dbo].[City] ([id], [name]) VALUES (40, N'Tỉnh Kon Tum')
INSERT [dbo].[City] ([id], [name]) VALUES (41, N'Tỉnh Gia Lai')
INSERT [dbo].[City] ([id], [name]) VALUES (42, N'Tỉnh Đắk Lắk')
INSERT [dbo].[City] ([id], [name]) VALUES (43, N'Tỉnh Đắk Nông')
INSERT [dbo].[City] ([id], [name]) VALUES (44, N'Tỉnh Lâm Đồng')
INSERT [dbo].[City] ([id], [name]) VALUES (45, N'Tỉnh Bình Phước')
INSERT [dbo].[City] ([id], [name]) VALUES (46, N'Tỉnh Tây Ninh')
INSERT [dbo].[City] ([id], [name]) VALUES (47, N'Tỉnh Bình Dương')
INSERT [dbo].[City] ([id], [name]) VALUES (48, N'Tỉnh Đồng Nai')
INSERT [dbo].[City] ([id], [name]) VALUES (49, N'Tỉnh Bà Rịa - Vũng Tàu')
INSERT [dbo].[City] ([id], [name]) VALUES (50, N'Thành phố Hồ Chí Minh')
INSERT [dbo].[City] ([id], [name]) VALUES (51, N'Tỉnh Long An')
INSERT [dbo].[City] ([id], [name]) VALUES (52, N'Tỉnh Tiền Giang')
INSERT [dbo].[City] ([id], [name]) VALUES (53, N'Tỉnh Bến Tre')
INSERT [dbo].[City] ([id], [name]) VALUES (54, N'Tỉnh Trà Vinh')
INSERT [dbo].[City] ([id], [name]) VALUES (55, N'Tỉnh Vĩnh Long')
INSERT [dbo].[City] ([id], [name]) VALUES (56, N'Tỉnh Đồng Tháp')
INSERT [dbo].[City] ([id], [name]) VALUES (57, N'Tỉnh An Giang')
INSERT [dbo].[City] ([id], [name]) VALUES (58, N'Tỉnh Kiên Giang')
INSERT [dbo].[City] ([id], [name]) VALUES (59, N'Thành phố Cần Thơ')
INSERT [dbo].[City] ([id], [name]) VALUES (60, N'Tỉnh Hậu Giang')
INSERT [dbo].[City] ([id], [name]) VALUES (61, N'Tỉnh Sóc Trăng')
INSERT [dbo].[City] ([id], [name]) VALUES (62, N'Tỉnh Bạc Liêu')
INSERT [dbo].[City] ([id], [name]) VALUES (63, N'Tỉnh Cà Mau')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
INSERT [dbo].[landlord] ([id], [address], [civil_id], [phone]) VALUES (2, N'Hà Đông', N'01100023412', N'0123456789')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (2, N'Landlord')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (3, N'Tenant')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Tenant] ([id], [civil_id], [phone]) VALUES (6, N'012830123802183', N'0192837465')
INSERT [dbo].[Tenant] ([id], [civil_id], [phone]) VALUES (7, N'873284238463246', N'0987612345')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image]) VALUES (1, N'thinhnnthe172159@gmail.com', N'123', 1, 0, N'Nguyễn Trọng', N'Thịnh', CAST(N'1990-02-02' AS Date), NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image]) VALUES (2, N'thai1992@gmail.com', N'123', 2, 0, N'Lê Duy', N'Thái', CAST(N'1992-02-04' AS Date), NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image]) VALUES (6, N'LeHUy1991@gmail.com', N'123', 3, 0, N'Lê Đức', N'Huy', CAST(N'1991-04-19' AS Date), NULL)
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image]) VALUES (7, N'Haiquoc2000@gmail.com', N'123', 3, 0, N'Nguyễn Quốc', N'Hải', CAST(N'2000-02-03' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_City]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_Commune] FOREIGN KEY([commune_id])
REFERENCES [dbo].[Commune] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_Commune]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_District] FOREIGN KEY([district_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_District]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_User]
GO
ALTER TABLE [dbo].[Apartment_image]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_image_Aparment] FOREIGN KEY([Apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Apartment_image] CHECK CONSTRAINT [FK_Apartment_image_Aparment]
GO
ALTER TABLE [dbo].[Apartment_room]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_room_Aparment] FOREIGN KEY([aprartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Apartment_room] CHECK CONSTRAINT [FK_Apartment_room_Aparment]
GO
ALTER TABLE [dbo].[Apartment_room]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_room_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Apartment_room] CHECK CONSTRAINT [FK_Apartment_room_Room]
GO
ALTER TABLE [dbo].[Commune]  WITH CHECK ADD  CONSTRAINT [FK_Commune_District] FOREIGN KEY([District_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Commune] CHECK CONSTRAINT [FK_Commune_District]
GO
ALTER TABLE [dbo].[Community_post]  WITH CHECK ADD  CONSTRAINT [FK_Community_post_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Community_post] CHECK CONSTRAINT [FK_Community_post_User]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City]
GO
ALTER TABLE [dbo].[Image_post]  WITH CHECK ADD  CONSTRAINT [FK_Image_post_Community_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Community_post] ([id])
GO
ALTER TABLE [dbo].[Image_post] CHECK CONSTRAINT [FK_Image_post_Community_post]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_User] FOREIGN KEY([lardlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_User]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_User1]
GO
ALTER TABLE [dbo].[landlord]  WITH CHECK ADD  CONSTRAINT [FK_landlord_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[landlord] CHECK CONSTRAINT [FK_landlord_User]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Room] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Room]
GO
ALTER TABLE [dbo].[Report_maintain]  WITH CHECK ADD  CONSTRAINT [FK_Report_maintain_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Report_maintain] CHECK CONSTRAINT [FK_Report_maintain_User]
GO
ALTER TABLE [dbo].[Report_maintain]  WITH CHECK ADD  CONSTRAINT [FK_Report_maintain_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Report_maintain] CHECK CONSTRAINT [FK_Report_maintain_User1]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_User]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenant_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenant_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User_image]  WITH CHECK ADD  CONSTRAINT [FK_User_image_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_image] CHECK CONSTRAINT [FK_User_image_User]
GO
USE [master]
GO
ALTER DATABASE [ams] SET  READ_WRITE 
GO
