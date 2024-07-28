USE [master]
GO
/****** Object:  Database [ams]    Script Date: 7/28/2024 11:56:59 AM ******/
CREATE DATABASE [ams]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ams', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ams.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ams_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ams_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ams] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ams].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ams] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ams] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ams] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ams] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ams] SET ARITHABORT OFF 
GO
ALTER DATABASE [ams] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ams] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ams] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ams] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ams] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ams] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ams] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ams] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ams] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ams] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ams] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ams] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ams] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ams] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ams] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ams] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ams] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ams] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ams] SET  MULTI_USER 
GO
ALTER DATABASE [ams] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ams] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ams] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ams] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ams] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ams] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ams] SET QUERY_STORE = ON
GO
ALTER DATABASE [ams] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ams]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
/****** Object:  Table [dbo].[Aparment]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aparment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[type_id] [int] NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[commune] [nvarchar](100) NULL,
	[price] [decimal](18, 0) NULL,
	[area] [decimal](18, 0) NULL,
	[number_of_bedroom] [int] NULL,
	[status_apartment] [int] NULL,
	[landlord_id] [int] NULL,
	[tenant_id] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_image]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_image](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[Apartment_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_Posts]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_Posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[post_status] [int] NULL,
	[post_start] [date] NULL,
	[post_end] [date] NULL,
	[apartment_id] [int] NULL,
	[payment_id] [int] NULL,
	[landlord_id] [int] NULL,
	[first_image] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[district] [nvarchar](max) NULL,
	[commune] [nvarchar](max) NULL,
	[area] [decimal](18, 0) NULL,
	[number_of_bedroom] [int] NULL,
	[apartment_name] [nvarchar](max) NULL,
	[price] [decimal](18, 0) NULL,
	[apartment_type] [int] NULL,
	[total_image] [int] NULL,
	[paid_for_post] [decimal](18, 0) NULL,
	[week] [int] NULL,
	[time_post] [time](0) NULL,
 CONSTRAINT [PK_Apartment_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_room]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_room](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[apartment_id] [int] NOT NULL,
	[property_id] [int] NOT NULL,
 CONSTRAINT [PK_Apartment_room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_type]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Apartment_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
	[time] [datetime] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community_post]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community_post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tittle] [nchar](200) NULL,
	[context] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[time] [date] NULL,
	[first_image] [nvarchar](max) NULL,
	[num_of_view] [int] NULL,
	[num_of_like] [int] NULL,
	[num_of_comment] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Community_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tenant_id] [int] NULL,
	[landlord_id] [int] NULL,
	[apartment_id] [int] NULL,
	[status] [int] NULL,
	[phone] [nvarchar](10) NULL,
	[full_name] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[commune] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[cccd] [nvarchar](12) NULL,
	[current_living] [nvarchar](100) NULL,
	[tenant_avatar] [nvarchar](max) NULL,
	[cccd_civil_card_front] [nvarchar](max) NULL,
	[cccd_civil_card_back] [nvarchar](max) NULL,
	[dob] [date] NULL,
	[cccd_receive_date] [date] NULL,
	[office_name] [nvarchar](max) NULL,
	[sign_date] [date] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_post]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[Incident]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenant_id] [int] NOT NULL,
	[landlord_id] [int] NOT NULL,
	[context] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Incident] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[landlord]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[List_of_post_liked]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[List_of_post_liked](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_List_of_post_liked] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[From_user_id] [int] NULL,
	[To_user_id] [int] NULL,
	[message] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[status] [int] NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payement_method]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payement_method](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](18, 0) NULL,
	[week] [int] NULL,
 CONSTRAINT [PK_Payement_method] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[room_id] [int] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_maintain]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[Save_post]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Save_post](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[post_id] [int] NULL,
 CONSTRAINT [PK_Save_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[Tenant]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[image] [nvarchar](max) NULL,
	[money] [decimal](18, 0) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_image]    Script Date: 7/28/2024 11:56:59 AM ******/
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
/****** Object:  Table [dbo].[Whislist]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Whislist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[Apartment_Post_id] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [user_name], [phone]) VALUES (1, N'thinh5k', N'0987654321')
GO
SET IDENTITY_INSERT [dbo].[Aparment] ON 

INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (47, N'nhà siêu đẹp', 5, N'Ngõ 445 Lạc Long Quân', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Xuân La', CAST(31000000 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), 3, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (51, N'Nhà của thịnh 2', 1, N'khu đô thị Nam An Khánh', N'Thành phố Hà Nội', N'Huyện Hoài Đức', N'Xã An Khánh', CAST(5600000 AS Decimal(18, 0)), CAST(74 AS Decimal(18, 0)), 2, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (52, N'nhà của thịnh 3', 4, N'Phố Tống Tất Thắng', N'Thành phố Hà Nội', N'Quận Hà Đông', N'Phường Phú La', CAST(70000000 AS Decimal(18, 0)), CAST(210 AS Decimal(18, 0)), 7, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (53, N'nhà của thịnh 3', 2, N'ngõ 234 Đường Hoàng Quốc Việt', N'Thành phố Hà Nội', N'Quận Bắc Từ Liêm', N'Phường Cổ Nhuế 1', CAST(15000000 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), 3, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (54, N'nhà của thịnh 4', 3, N'Trần Phú', N'Thành phố Hồ Chí Minh', N'Quận 5', N'Phường 08', CAST(10000000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 3, 2, 2, 13)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (55, N'nhà của Thịnh 5', 6, N'Nguyễn Đình Thi', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Thụy Khuê', CAST(19000000 AS Decimal(18, 0)), CAST(95 AS Decimal(18, 0)), 5, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (56, N'nhà của thịnh 6', 7, N'Tòa Nhà Xuân Thủy', N'Thành phố Hà Nội', N'Quận Cầu Giấy', N'Phường Dịch Vọng Hậu', CAST(15000000 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), 4, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (57, N'nhà của thịnh 7', 8, N'Đường Chu Văn An', N'Thành phố Đà Nẵng', N'Quận Hải Châu', N'Phường Bình Hiên', CAST(10000000 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), 5, 1, 2, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (67, N'căn hộ mới', 2, N'Ngõ 999 bất khối', N'Thành phố Hà Nội', N'Huyện Gia Lâm', N'Xã Đông Dư', CAST(15000000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)), 2, 1, 11, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (69, N'ấdfasdfasdf', 4, N' ', N'Thành phố Hà Nội', N'Quận Đống Đa', N'Phường Nam Đồng', CAST(8500000 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), 2, 1, 11, NULL)
INSERT [dbo].[Aparment] ([id], [name], [type_id], [address], [city], [district], [commune], [price], [area], [number_of_bedroom], [status_apartment], [landlord_id], [tenant_id]) VALUES (70, N'Nhà của Hưng 1', 2, N' ', N'Thành phố Hà Nội', N'Huyện Đông Anh', N'Xã Đại Mạch', CAST(3500000 AS Decimal(18, 0)), CAST(30 AS Decimal(18, 0)), 3, 2, 13, 2)
SET IDENTITY_INSERT [dbo].[Aparment] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_image] ON 

INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (180, N'51_2_0bd108b43ff64d6c88323cba942d4435.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (181, N'51_2_0cf577358e784c0cb30ad975879d5249.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (189, N'52_2_penthouse_poolside_bar.avif', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (190, N'52_2_1000_F_571275157_ryFN9jhATlWXhXplhHYHvwzLevycIxT3.jpg', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (191, N'52_2_beautiful-city-scenery-captured-from-kitchen-and-dining-on-3d-rendered-condominium-powerpoint-background_47ea4c877d__960_540.avif', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (192, N'52_2_Bespoke-Penthouse-02-1366x768.webp', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (193, N'52_2_845-United-Nations-Plaza-2.png', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (194, N'52_2_Mumbai-penthouse-Interiors-1-3.webp', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (195, N'52_2_step-inside-this-modern-masterpiece-3d-rendering-of-high-end-home-interiors-powerpoint-background_1cbddbfb15__960_540.avif', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (196, N'52_2_Trump-World-Tower-Penthouse_1.jpg', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (197, N'52_2_dark-interior-design-bedroom-660x400.jpg', 52)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (206, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-13.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (207, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-14.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (208, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-25 - Copy.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (209, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-43.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (210, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-49-1024x576.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (161, N'47_2_pen9.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (162, N'47_2_pen8.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (163, N'47_2_pen6.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (179, N'47_2_pen7.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (165, N'47_2_pen3.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (166, N'47_2_pen1.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (167, N'47_2_pen2.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (168, N'47_2_pen4.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (169, N'47_2_pen5.jpg', 47)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (211, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-40.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (212, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-27.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (213, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-25 - Copy.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (214, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-38.jpg', 54)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (215, N'55_2_20170306111842-5717_wm.jpg', 55)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (216, N'55_2_serenity-sky-villas-apartment.jpeg', 55)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (217, N'55_2_thiet-ke-can-ho-sky-vill-sunshine-crystal-river.jpg', 55)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (218, N'55_2_hinh-anh-nhung-dieu-can-biet-ve-can-ho-lofthouse-so-3_1635992083 (1)_1647490109_1647490109.jpg', 55)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (219, N'55_2_can-ho-loft-house-3.jpg', 55)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (220, N'55_2_21_IVXH.jpg', 55)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (221, N'56_2_3_YHDT.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (222, N'56_2_21_IVXH.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (223, N'56_2_can-ho-loft-house-1.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (224, N'56_2_can-ho-loft-house-2.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (225, N'56_2_can-ho-loft-house-3.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (226, N'56_2_hinh-anh-nhung-dieu-can-biet-ve-can-ho-lofthouse-so-1_1635991917 (1)_1647490073_1647490073.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (227, N'56_2_hinh-anh-nhung-dieu-can-biet-ve-can-ho-lofthouse-so-2_1635992044 (1)_1647490092_1647490092.jpg', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (269, N'56_2_blade-runner-gosling.gif', 56)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (229, N'57_2_can-ho-studio-duoc-toi-uu-phu-hop-cho-nguoi-gia-va-tre-nho.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (230, N'57_2_co-the-de-dang-di-chuyen-giua-cac-khong-gian-trong-can-ho-studio-vinhomes.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (231, N'57_2_cua-kinh-giup-tao-chieu-sau-cho-khong-gian-trong-can-ho-studio-vinhomes.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (232, N'57_2_khong-gian-can-ho-studio-vinhomes-rat-thoang-dang.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (233, N'57_2_khong-gian-thiet-ke-can-ho-studio.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (234, N'57_2_mau-can-ho-studio-vinhomes.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (235, N'57_2_thiet-ke-hien-dai-cua-can-ho-studio-la-diem-cong-cho-cac-ban-tre.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (236, N'57_2_tien-ich-dang-cap-danh-rieng-cho-cu-dan-so-huu-can-ho-studio-tai-vinhomes-.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (237, N'57_2_tttm-vincom-mega-mall-smart-city-du-kien-khai-truong-trong-nam-2021.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (242, N'57_2_Inferno_(CSGO).png', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (243, N'57_2_strange-cs2-inferno-in-my-game-files-v0-7y6viz7pugva1.webp', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (244, N'57_2_strange-cs2-inferno-in-my-game-files-v0-52oot2pcugva1.webp', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (245, N'57_2_z5mVS9sRIUz_lhefiZpuG.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (273, N'70_13_can-97-phong-khach-637600611477734204.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (274, N'70_13_can-97-phong-ngu-2-view-637600611479634545.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (258, N'67_11_strange-cs2-inferno-in-my-game-files-v0-7y6viz7pugva1.webp', 67)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (259, N'67_11_strange-cs2-inferno-in-my-game-files-v0-52oot2pcugva1.webp', 67)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (260, N'67_11_z5mVS9sRIUz_lhefiZpuG.jpg', 67)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (265, N'69_11_1(91).jpg', 69)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (275, N'70_13_cc-feliz-homes-1010toa-zb-1-638524926106338762.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (182, N'51_2_1af873d079834ab6ab980a343b1d384a.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (183, N'51_2_06a1159cf87b4345b033b2185a415a85.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (184, N'51_2_6b7d040e06c14c67937ae76dae938204.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (185, N'51_2_200607bc0d5a43af9bc7434f4384ac74.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (186, N'51_2_622467f127b7441c999a15d9c063c18e.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (187, N'51_2_d3142f9ba2794f338b1ad15a8ab2fa6a.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (188, N'51_2_52b1236456ba40ae898419376de7b307.jpg', 51)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (198, N'53_2_can-97-phong-khach-637600611477734204 (1).jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (199, N'53_2_can-97-phong-khach-637600611477734204.jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (200, N'53_2_can-97-phong-ngu-2-view-637600611479634545.jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (201, N'53_2_cc-feliz-homes-1010toa-zb-1-638524926106338762.jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (202, N'53_2_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-4-638129656455202971 (1).jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (203, N'53_2_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-8-638129656455634917.jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (204, N'53_2_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-9-638129656456071566.jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (205, N'53_2_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-17-638129656457347479.jpg', 53)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (246, N'57_2_Inferno_(CSGO).png', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (247, N'57_2_strange-cs2-inferno-in-my-game-files-v0-7y6viz7pugva1.webp', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (248, N'57_2_strange-cs2-inferno-in-my-game-files-v0-52oot2pcugva1.webp', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (249, N'57_2_z5mVS9sRIUz_lhefiZpuG.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (250, N'57_2_z5mVS9sRIUz_lhefiZpuG.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (251, N'57_2_z5mVS9sRIUz_lhefiZpuG.jpg', 57)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (262, N'67_11_hqdefault.jpg', 67)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (266, N'69_11_1(92).jpg', 69)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (267, N'69_11_2-3.jpg', 69)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (276, N'70_13_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-4-638129656455202971.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (277, N'70_13_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-8-638129656455634917.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (278, N'70_13_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-9-638129656456071566.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (279, N'70_13_thiet-ke-can-97m2-chung-cu-le-grand-jardin-sai-dong-anh-17-638129656457347479.jpg', 70)
INSERT [dbo].[Apartment_image] ([id], [image], [Apartment_id]) VALUES (268, N'69_11_3(53).jpg', 69)
SET IDENTITY_INSERT [dbo].[Apartment_image] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_Posts] ON 

INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (33, N' Căn hộ duplex sang trọng, 100m², 4 phòng ngủ, vị trí đắc địa ở Tây Hồ  Nội dung:', N'<p>Chào mừng bạn đến với không gian sống hiện đại và tiện nghi tại căn hộ duplex lý tưởng của chúng tôi, nằm trong khu vực đẳng cấp của Tây Hồ. Với diện tích rộng lớn 100m² và thiết kế tinh tế, căn hộ này sẽ mang đến cho bạn và gia đình một cuộc sống đẳng cấp và thoải mái.</p><p><strong>Đặc điểm căn hộ:</strong></p><ul><li><strong>Diện tích:</strong> 100m², đủ rộng cho một gia đình lớn hoặc nhóm bạn.</li><li><strong>Số phòng ngủ:</strong> 4 phòng ngủ, đảm bảo không gian riêng tư và thoải mái cho mỗi thành viên trong gia đình.</li><li><strong>Loại căn hộ:</strong> Duplex - với thiết kế tối giản và hiện đại, tạo cảm giác mở và rộng rãi.</li><li><strong>Vị trí:</strong> Đặt tại khu vực Tây Hồ, được biết đến với không khí trong lành và cảnh quan thiên nhiên tuyệt vời. Gần các tiện ích như trung tâm thương mại, nhà hàng, quán cà phê và các điểm dừng chân du lịch.</li></ul><p><strong>Tiện nghi và dịch vụ:</strong></p><ul><li><strong>Nội thất cao cấp:</strong> Căn hộ được trang bị đầy đủ nội thất hiện đại và sang trọng, đảm bảo sự thoải mái và tiện nghi cho cư dân.</li><li><strong>Hệ thống an ninh 24/7:</strong> Đảm bảo an toàn và bảo mật cho bạn và gia đình.</li><li><strong>Khu vực tiện ích:</strong> Bao gồm phòng gym, hồ bơi, khu vui chơi trẻ em và sân thể thao, giúp bạn thư giãn và giải trí sau những ngày làm việc căng thẳng.</li></ul><p><strong>Giá cho thuê:</strong> Vui lòng liên hệ để biết thông tin về giá thuê và các ưu đãi đặc biệt.</p><p><strong>Liên hệ:</strong> Để biết thêm thông tin chi tiết và đặt lịch xem căn hộ, vui lòng liên hệ:</p><ul><li>Địa chỉ: [Địa chỉ của căn hộ]</li><li>Điện thoại: [Số điện thoại]</li><li>Email: [Địa chỉ email]</li></ul><p>Hãy nhanh tay liên hệ ngay để không bỏ lỡ cơ hội sở hữu căn hộ duplex sang trọng và tiện nghi tại khu vực Tây Hồ lý tưởng này!<br><br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-11' AS Date), CAST(N'2024-06-24' AS Date), 47, 4, 2, N'47_2_pen9.jpg', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Xuân La', CAST(150 AS Decimal(18, 0)), 3, N'nhà siêu đẹp', CAST(31000000 AS Decimal(18, 0)), 5, 9, CAST(0 AS Decimal(18, 0)), 0, CAST(N'10:11:40' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (34, N'Căn Hộ Mini: Giải Pháp Nhà Ở Hiệu Quả Cho Đô Thị Hiện Đại', N'<p>Trong bối cảnh đô thị hóa nhanh chóng và nhu cầu nhà ở ngày càng gia tăng, việc cho thuê căn hộ mini trở thành một giải pháp lý tưởng cho những ai muốn tìm kiếm một nơi ở tiện nghi với chi phí hợp lý. Bài viết này sẽ khám phá những lợi ích của việc thuê căn hộ mini, các yếu tố cần cân nhắc, và một số lời khuyên hữu ích cho cả người thuê và người cho thuê.</p><h4>Lợi Ích Của Việc Thuê Căn Hộ Mini</h4><ol><li><strong>Chi Phí Hợp Lý</strong><ul><li>Căn hộ mini thường có mức giá thuê thấp hơn so với các căn hộ lớn hoặc nhà nguyên căn, phù hợp với nhiều đối tượng như sinh viên, người đi làm, hoặc các cặp vợ chồng trẻ.</li><li>Chi phí điện, nước và các dịch vụ khác cũng thường rẻ hơn do diện tích nhỏ.</li></ul></li><li><strong>Tiện Nghi Đầy Đủ</strong><ul><li>Mặc dù diện tích nhỏ, nhưng căn hộ mini được thiết kế tối ưu, đảm bảo đầy đủ các tiện nghi cần thiết như khu vực ngủ, bếp, phòng tắm và không gian sinh hoạt.</li><li>Nhiều căn hộ mini còn được trang bị nội thất thông minh, hiện đại, tiết kiệm không gian.</li></ul></li><li><strong>Vị Trí Thuận Lợi</strong><ul><li>Căn hộ mini thường được xây dựng ở các khu vực trung tâm hoặc gần trung tâm, giúp người thuê dễ dàng di chuyển và tiếp cận các tiện ích công cộng như trường học, bệnh viện, trung tâm mua sắm và khu vui chơi giải trí.</li></ul></li><li><strong>Linh Hoạt Và Tiện Lợi</strong><ul><li>Việc thuê căn hộ mini mang lại sự linh hoạt cho người thuê, đặc biệt là những người thường xuyên phải di chuyển hoặc không có nhu cầu ổn định lâu dài.</li><li>Thủ tục thuê thường đơn giản và nhanh chóng, giúp người thuê dễ dàng chuyển đến và bắt đầu cuộc sống mới.<br><br><br><br>&nbsp;</li></ul></li></ol>', 4, CAST(N'2024-06-13' AS Date), CAST(N'2024-07-04' AS Date), 51, 3, 2, N'51_2_0bd108b43ff64d6c88323cba942d4435.jpg', N'Thành phố Hà Nội', N'Huyện Hoài Đức', N'Xã An Khánh', CAST(74 AS Decimal(18, 0)), 2, N'Nhà của thịnh 2', CAST(5600000 AS Decimal(18, 0)), 1, 9, CAST(0 AS Decimal(18, 0)), 0, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (35, N'Cho Thuê Căn Hộ Penthouse Sang Trọng, 7 Phòng Ngủ, Diện Tích Hơn 200m²', N'<p>Bạn đang tìm kiếm một căn hộ penthouse đẳng cấp để thuê tại vị trí trung tâm thành phố, không gian rộng rãi và tiện nghi đầy đủ? Đừng bỏ lỡ cơ hội đặc biệt này với căn hộ penthouse tại chung cư sang trọng XYZ.</p><p><strong>Thông tin chi tiết:</strong></p><ul><li><strong>Diện tích:</strong> Hơn 200m², bao gồm không gian sống rộng lớn và các phòng ngủ thoải mái.</li><li><strong>Số lượng phòng ngủ:</strong> 7 phòng ngủ, mỗi phòng được thiết kế sang trọng và đầy đủ tiện nghi.</li><li><strong>Tiện ích nội khu:</strong> Các tiện ích cao cấp như hồ bơi, phòng gym, khu vui chơi trẻ em, sân tennis, và dịch vụ bảo vệ 24/7.</li><li><strong>Vị trí:</strong> Vị trí trung tâm, thuận tiện di chuyển đến các khu vực kinh doanh, mua sắm và giải trí.</li><li><strong>Nội thất:</strong> Căn hộ được trang bị đầy đủ nội thất cao cấp, từ đồ gia dụng đến đồ nội thất.</li></ul><p><strong>Tiện ích ngoại khu:</strong></p><ul><li>Gần các trường học quốc tế, bệnh viện, trung tâm mua sắm cao cấp.</li><li>Các nhà hàng, quán cà phê và các dịch vụ tiện ích khác trong bán kính ngắn.</li></ul><p><strong>Giá cho thuê:</strong> Hợp lý và thương lượng, phù hợp với gia đình hoặc nhóm người có nhu cầu sống tại không gian cao cấp và tiện nghi.</p><p><strong>Liên hệ:</strong> Để biết thêm thông tin chi tiết và sắp xếp thăm quan căn hộ, vui lòng liên hệ ngay với chúng tôi qua số điện thoại XYZ hoặc email XYZ. Chúng tôi luôn sẵn sàng hỗ trợ và tư vấn cho bạn đến khi bạn tìm được căn hộ ưng ý.</p><p>Hãy tận hưởng cuộc sống đẳng cấp cùng căn hộ penthouse này tại thành phố của bạn. Chúng tôi rất mong được đồng hành cùng bạn trong chuyến hành trình tìm kiếm một không gian sống hoàn hảo!<br><br><br><br>&nbsp;</p>', 3, CAST(N'2024-07-24' AS Date), CAST(N'2024-07-31' AS Date), 52, 1, 2, N'52_2_penthouse_poolside_bar.avif', N'Thành phố Hà Nội', N'Quận Hà Đông', N'Phường Phú La', CAST(210 AS Decimal(18, 0)), 7, N'nhà của thịnh 3', CAST(70000000 AS Decimal(18, 0)), 4, 9, CAST(1670000 AS Decimal(18, 0)), 1, CAST(N'00:43:33' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (36, N' Cho Thuê Căn Hộ Trung Cấp - Tiện Nghi Và Đẳng Cấp', N'<p><br>Chào bạn,</p><p>Bạn đang tìm kiếm một căn hộ trung cấp đẹp, tiện nghi và ấm cúng để thuê? Chúng tôi rất vui khi giới thiệu căn hộ của chúng tôi tại trung tâm thành phố, với nhiều tiện ích và không gian sống thoải mái.</p><p><strong>Thông tin căn hộ:</strong></p><ul><li><strong>Vị trí:</strong> Nằm ở trung tâm thành phố, gần các trường học, bệnh viện và siêu thị, thuận tiện cho việc đi lại và mua sắm.</li><li><strong>Diện tích:</strong> Căn hộ rộng rãi, bố trí hợp lý với diện tích ___ mét vuông (cụ thể về diện tích).</li><li><strong>Tiện nghi:</strong> Được trang bị đầy đủ nội thất hiện đại và các thiết bị điện tử như điều hòa, tivi, tủ lạnh, máy giặt… Các thiết bị đều mới và hoạt động tốt.</li><li><strong>An ninh:</strong> Hệ thống an ninh 24/7 đảm bảo an toàn tuyệt đối cho bạn và gia đình.</li><li><strong>Không gian xanh:</strong> Có khu vực cây xanh, sân chơi trẻ em và khu vực thư giãn cho cư dân.</li><li><strong>Dịch vụ đi kèm:</strong> Bao gồm dịch vụ giặt là, dọn phòng, và hỗ trợ kỹ thuật nếu cần thiết.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ trung cấp tại đây là ___ (đơn vị tiền tệ) mỗi tháng. Đây là mức giá cạnh tranh và phù hợp với chất lượng căn hộ và dịch vụ mà chúng tôi cung cấp.</p><p><strong>Liên hệ:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Chân thành cảm ơn sự quan tâm của bạn và hy vọng sớm được đón tiếp bạn tại căn hộ của chúng tôi!</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)<br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-13' AS Date), CAST(N'2024-07-11' AS Date), 53, 4, 2, N'53_2_can-97-phong-khach-637600611477734204 (1).jpg', N'Thành phố Hà Nội', N'Quận Bắc Từ Liêm', N'Phường Cổ Nhuế 1', CAST(90 AS Decimal(18, 0)), 3, N'nhà của thịnh 3', CAST(15000000 AS Decimal(18, 0)), 2, 8, CAST(0 AS Decimal(18, 0)), 0, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (37, N'Căn Hộ Cao Cấp Chuẩn Phong Cách Nhật Bản - Sự Lựa Chọn Hoàn Hảo', N'<p>Xin chào quý khách,</p><p>Bạn đang tìm kiếm một căn hộ cao cấp mang đậm phong cách Nhật Bản để thuê? Chúng tôi xin giới thiệu đến bạn căn hộ tại trung tâm thành phố, được thiết kế với sự tinh tế và tiện nghi đầy đủ, mang đến không gian sống sang trọng và tiện lợi.</p><p><strong>Thông tin căn hộ:</strong></p><ul><li><strong>Phong cách Nhật Bản:</strong> Thiết kế nội thất và không gian sống lấy cảm hứng từ nền văn hóa Nhật Bản, từ đồ gỗ tự nhiên đến sự tối giản trong bố trí không gian.</li><li><strong>Vị trí:</strong> Nằm tại khu vực trung tâm thành phố, gần các trường học, bệnh viện và trung tâm mua sắm, thuận tiện cho việc đi lại và sinh hoạt hàng ngày.</li><li><strong>Diện tích:</strong> Căn hộ rộng rãi, bố trí hợp lý với diện tích ___ mét vuông (cụ thể về diện tích).</li><li><strong>Tiện nghi:</strong> Được trang bị đầy đủ nội thất cao cấp và các thiết bị điện tử hiện đại như máy lạnh, tivi, tủ lạnh, lò vi sóng, máy giặt… Đảm bảo sự tiện nghi và thoải mái cho cư dân.</li><li><strong>An ninh:</strong> Hệ thống an ninh 24/7 với camera giám sát và bảo vệ chuyên nghiệp, đảm bảo an toàn tuyệt đối cho bạn và gia đình.</li><li><strong>Dịch vụ đi kèm:</strong> Bao gồm dịch vụ giặt là, dọn phòng, và hỗ trợ kỹ thuật nếu cần thiết.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ cao cấp tại đây là ___ (đơn vị tiền tệ) mỗi tháng. Đây là mức giá phù hợp với chất lượng và tiện ích mà căn hộ mang lại.</p><p><strong>Liên hệ:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Chân thành cảm ơn sự quan tâm của bạn và mong sớm được đón tiếp bạn tại căn hộ sang trọng của chúng tôi!</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)<br><br><br><br>&nbsp;</p>', 3, CAST(N'2024-07-13' AS Date), CAST(N'2024-08-24' AS Date), 54, 4, 2, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-13.jpg', N'Thành phố Hồ Chí Minh', N'Quận 5', N'Phường 08', CAST(70 AS Decimal(18, 0)), 3, N'nhà của thịnh 4', CAST(10000000 AS Decimal(18, 0)), 3, 9, CAST(5760000 AS Decimal(18, 0)), 6, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (38, N'SkyVilla Cao Cấp Tại Trung Tâm Thủ Đô Hà Nội - Lối Sống Sang Trọng Và Hiện Đại', N'<p><br>Xin chào quý khách,</p><p>Bạn đang tìm kiếm một căn hộ cao cấp SkyVilla tại trung tâm Thủ đô, nơi kết hợp hoàn hảo giữa không gian sống sang trọng và vị trí đắc địa? Chúng tôi rất vui được giới thiệu căn hộ độc đáo này, nơi sự tiện nghi và đẳng cấp gặp gỡ với không gian thiên nhiên và tầm nhìn tuyệt vời.</p><p><strong>Thông tin căn hộ:</strong></p><ul><li><strong>Vị trí lý tưởng:</strong> Nằm tại trung tâm của Thủ đô, gần các trường học, bệnh viện, khu vui chơi giải trí và các tiện ích công cộng khác, mang đến sự thuận tiện và lợi ích tối đa cho cư dân.</li><li><strong>Diện tích và thiết kế:</strong> Căn hộ SkyVilla được thiết kế rộng rãi, tối ưu hóa không gian để tận dụng ánh sáng tự nhiên và tầm nhìn bao quát thành phố. Thiết kế nội thất hiện đại và sang trọng, từ các thiết bị điện tử đến đồ nội thất, đều được chọn lựa kỹ lưỡng để đáp ứng nhu cầu sống cao cấp.</li><li><strong>Tiện nghi và dịch vụ:</strong> Các tiện ích cao cấp như hồ bơi, phòng gym, khu vui chơi trẻ em, sân chơi tennis và khu vườn xanh mát. Đảm bảo mọi nhu cầu giải trí và thư giãn của cư dân được đáp ứng tối đa.</li><li><strong>An ninh và dịch vụ:</strong> Hệ thống an ninh 24/7, bảo vệ chuyên nghiệp và các dịch vụ hỗ trợ như giặt là, dọn dẹp, và bảo trì định kỳ để đảm bảo cuộc sống hàng ngày của cư dân luôn êm đềm và an toàn.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ SkyVilla cao cấp là ___ (đơn vị tiền tệ) mỗi tháng. Đây là mức giá xứng đáng với chất lượng và tiện ích cao cấp mà căn hộ mang lại.</p><p><strong>Liên hệ:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Chân thành cảm ơn sự quan tâm của bạn và mong sớm được đón tiếp bạn tại SkyVilla sang trọng của chúng tôi!</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)</p><p>&nbsp;</p><p>&nbsp;</p><p><br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-22' AS Date), 55, 4, 2, N'55_2_20170306111842-5717_wm.jpg', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Thụy Khuê', CAST(95 AS Decimal(18, 0)), 5, N'nhà của Thịnh 5', CAST(19000000 AS Decimal(18, 0)), 6, 6, CAST(2000000 AS Decimal(18, 0)), 5, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (39, N'Khám Phá Căn Hộ LoftHouse - Nơi Sống Đẳng Cấp Và Đầy Sáng Tạo', N'<p>Chào bạn,</p><p>Bạn đang tìm kiếm một không gian sống độc đáo và đầy nghệ thuật? Căn hộ LoftHouse của chúng tôi chắc chắn sẽ là sự lựa chọn hoàn hảo cho bạn. Với thiết kế tinh tế kết hợp giữa sự hiện đại và sự sáng tạo, LoftHouse mang đến không gian sống thoải mái và đẳng cấp giữa lòng thành phố sôi động.</p><p><strong>Điểm nổi bật của căn hộ:</strong></p><ul><li><strong>Thiết kế độc đáo:</strong> LoftHouse được thiết kế theo phong cách loft với không gian mở rộng và ánh sáng tự nhiên chan hòa. Các chi tiết nội thất được lựa chọn kỹ lưỡng để tạo nên một không gian sống sang trọng và ấm cúng.</li><li><strong>Vị trí trung tâm:</strong> Nằm tại vị trí đắc địa của thành phố, gần các trường học, bệnh viện, khu vui chơi giải trí và các điểm thương mại lớn. Điều này mang đến sự thuận tiện và lợi ích tối đa cho cư dân.</li><li><strong>Tiện nghi hiện đại:</strong> Căn hộ được trang bị đầy đủ các thiết bị điện tử và nội thất cao cấp như hệ thống điều hòa không khí, tủ lạnh, máy giặt, lò vi sóng và tivi màn hình phẳng. Mọi thiết bị đều mới và hoạt động tốt.</li><li><strong>Không gian xanh:</strong> Khu vực xung quanh căn hộ có sân vườn rộng rãi và không gian xanh mát, là nơi lý tưởng để thư giãn sau những giờ làm việc căng thẳng.</li><li><strong>An ninh đảm bảo:</strong> Hệ thống an ninh 24/7 với camera giám sát và bảo vệ chuyên nghiệp, đảm bảo an toàn tuyệt đối cho bạn và gia đình.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ LoftHouse là ___ (đơn vị tiền tệ) mỗi tháng, phù hợp với chất lượng và tiện ích cao cấp mà căn hộ mang lại.</p><p><strong>Liên hệ ngay:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Hãy để căn hộ LoftHouse trở thành nơi lựa chọn lý tưởng cho cuộc sống của bạn, nơi bạn có thể thư giãn và cảm nhận sự sang trọng và đẳng cấp trong từng chi tiết.</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)<br><br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-13' AS Date), CAST(N'2024-07-11' AS Date), 56, 4, 2, N'56_2_3_YHDT.jpg', N'Thành phố Hà Nội', N'Quận Cầu Giấy', N'Phường Dịch Vọng Hậu', CAST(90 AS Decimal(18, 0)), 4, N'nhà của thịnh 6', CAST(15000000 AS Decimal(18, 0)), 7, 8, CAST(0 AS Decimal(18, 0)), 0, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (47, N'ASdxadasxxaz', N'<p><br>xZXZXZXZXZ<br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-24' AS Date), CAST(N'2024-07-01' AS Date), 57, 4, 2, N'57_2_can-ho-studio-duoc-toi-uu-phu-hop-cho-nguoi-gia-va-tre-nho.jpg', N'Thành phố Đà Nẵng', N'Quận Hải Châu', N'Phường Bình Hiên', CAST(150 AS Decimal(18, 0)), 5, N'nhà của thịnh 7', CAST(10000000 AS Decimal(18, 0)), 8, 19, CAST(1120000 AS Decimal(18, 0)), 1, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (83, N'abc', N'<p><br>a''slfcma;as<br><br><br>&nbsp;</p>', 3, CAST(N'2024-06-21' AS Date), CAST(N'2024-07-05' AS Date), 67, 3, 11, N'67_11_strange-cs2-inferno-in-my-game-files-v0-7y6viz7pugva1.webp', N'Thành phố Hà Nội', N'Huyện Gia Lâm', N'Xã Đông Dư', CAST(70 AS Decimal(18, 0)), 2, N'căn hộ mới', CAST(15000000 AS Decimal(18, 0)), 2, 4, CAST(40000 AS Decimal(18, 0)), 2, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (91, N' Căn hộ duplex sang trọng, 100m², 4 phòng ngủ, vị trí đắc địa ở Tây Hồ  Nội dung:', N'<p>Chào mừng bạn đến với không gian sống hiện đại và tiện nghi tại căn hộ duplex lý tưởng của chúng tôi, nằm trong khu vực đẳng cấp của Tây Hồ. Với diện tích rộng lớn 100m² và thiết kế tinh tế, căn hộ này sẽ mang đến cho bạn và gia đình một cuộc sống đẳng cấp và thoải mái.</p><p><strong>Đặc điểm căn hộ:</strong></p><ul><li><strong>Diện tích:</strong> 100m², đủ rộng cho một gia đình lớn hoặc nhóm bạn.</li><li><strong>Số phòng ngủ:</strong> 4 phòng ngủ, đảm bảo không gian riêng tư và thoải mái cho mỗi thành viên trong gia đình.</li><li><strong>Loại căn hộ:</strong> Duplex - với thiết kế tối giản và hiện đại, tạo cảm giác mở và rộng rãi.</li><li><strong>Vị trí:</strong> Đặt tại khu vực Tây Hồ, được biết đến với không khí trong lành và cảnh quan thiên nhiên tuyệt vời. Gần các tiện ích như trung tâm thương mại, nhà hàng, quán cà phê và các điểm dừng chân du lịch.</li></ul><p><strong>Tiện nghi và dịch vụ:</strong></p><ul><li><strong>Nội thất cao cấp:</strong> Căn hộ được trang bị đầy đủ nội thất hiện đại và sang trọng, đảm bảo sự thoải mái và tiện nghi cho cư dân.</li><li><strong>Hệ thống an ninh 24/7:</strong> Đảm bảo an toàn và bảo mật cho bạn và gia đình.</li><li><strong>Khu vực tiện ích:</strong> Bao gồm phòng gym, hồ bơi, khu vui chơi trẻ em và sân thể thao, giúp bạn thư giãn và giải trí sau những ngày làm việc căng thẳng.</li></ul><p><strong>Giá cho thuê:</strong> Vui lòng liên hệ để biết thông tin về giá thuê và các ưu đãi đặc biệt.</p><p><strong>Liên hệ:</strong> Để biết thêm thông tin chi tiết và đặt lịch xem căn hộ, vui lòng liên hệ:</p><ul><li>Địa chỉ: [Địa chỉ của căn hộ]</li><li>Điện thoại: [Số điện thoại]</li><li>Email: [Địa chỉ email]</li></ul><p>Hãy nhanh tay liên hệ ngay để không bỏ lỡ cơ hội sở hữu căn hộ duplex sang trọng và tiện nghi tại khu vực Tây Hồ lý tưởng này!<br><br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-11' AS Date), CAST(N'2024-07-16' AS Date), 47, 4, 2, N'47_2_pen9.jpg', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Xuân La', CAST(150 AS Decimal(18, 0)), 3, N'nhà siêu đẹp', CAST(31000000 AS Decimal(18, 0)), 5, 9, CAST(0 AS Decimal(18, 0)), 0, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (92, N'Căn Hộ Mini: Giải Pháp Nhà Ở Hiệu Quả Cho Đô Thị Hiện Đại', N'<p>Trong bối cảnh đô thị hóa nhanh chóng và nhu cầu nhà ở ngày càng gia tăng, việc cho thuê căn hộ mini trở thành một giải pháp lý tưởng cho những ai muốn tìm kiếm một nơi ở tiện nghi với chi phí hợp lý. Bài viết này sẽ khám phá những lợi ích của việc thuê căn hộ mini, các yếu tố cần cân nhắc, và một số lời khuyên hữu ích cho cả người thuê và người cho thuê.</p><h4>Lợi Ích Của Việc Thuê Căn Hộ Mini</h4><ol><li><strong>Chi Phí Hợp Lý</strong><ul><li>Căn hộ mini thường có mức giá thuê thấp hơn so với các căn hộ lớn hoặc nhà nguyên căn, phù hợp với nhiều đối tượng như sinh viên, người đi làm, hoặc các cặp vợ chồng trẻ.</li><li>Chi phí điện, nước và các dịch vụ khác cũng thường rẻ hơn do diện tích nhỏ.</li></ul></li><li><strong>Tiện Nghi Đầy Đủ</strong><ul><li>Mặc dù diện tích nhỏ, nhưng căn hộ mini được thiết kế tối ưu, đảm bảo đầy đủ các tiện nghi cần thiết như khu vực ngủ, bếp, phòng tắm và không gian sinh hoạt.</li><li>Nhiều căn hộ mini còn được trang bị nội thất thông minh, hiện đại, tiết kiệm không gian.</li></ul></li><li><strong>Vị Trí Thuận Lợi</strong><ul><li>Căn hộ mini thường được xây dựng ở các khu vực trung tâm hoặc gần trung tâm, giúp người thuê dễ dàng di chuyển và tiếp cận các tiện ích công cộng như trường học, bệnh viện, trung tâm mua sắm và khu vui chơi giải trí.</li></ul></li><li><strong>Linh Hoạt Và Tiện Lợi</strong><ul><li>Việc thuê căn hộ mini mang lại sự linh hoạt cho người thuê, đặc biệt là những người thường xuyên phải di chuyển hoặc không có nhu cầu ổn định lâu dài.</li><li>Thủ tục thuê thường đơn giản và nhanh chóng, giúp người thuê dễ dàng chuyển đến và bắt đầu cuộc sống mới.<br><br><br><br>&nbsp;</li></ul></li></ol>', 4, CAST(N'2024-06-13' AS Date), CAST(N'2024-07-04' AS Date), 51, 3, 2, N'51_2_0bd108b43ff64d6c88323cba942d4435.jpg', N'Thành phố Hà Nội', N'Huyện Hoài Đức', N'Xã An Khánh', CAST(74 AS Decimal(18, 0)), 2, N'Nhà của thịnh 2', CAST(5600000 AS Decimal(18, 0)), 1, 9, CAST(0 AS Decimal(18, 0)), 0, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (93, N'Cho Thuê Căn Hộ Penthouse Sang Trọng, 7 Phòng Ngủ, Diện Tích Hơn 200m²', N'<p>Bạn đang tìm kiếm một căn hộ penthouse đẳng cấp để thuê tại vị trí trung tâm thành phố, không gian rộng rãi và tiện nghi đầy đủ? Đừng bỏ lỡ cơ hội đặc biệt này với căn hộ penthouse tại chung cư sang trọng XYZ.</p><p><strong>Thông tin chi tiết:</strong></p><ul><li><strong>Diện tích:</strong> Hơn 200m², bao gồm không gian sống rộng lớn và các phòng ngủ thoải mái.</li><li><strong>Số lượng phòng ngủ:</strong> 7 phòng ngủ, mỗi phòng được thiết kế sang trọng và đầy đủ tiện nghi.</li><li><strong>Tiện ích nội khu:</strong> Các tiện ích cao cấp như hồ bơi, phòng gym, khu vui chơi trẻ em, sân tennis, và dịch vụ bảo vệ 24/7.</li><li><strong>Vị trí:</strong> Vị trí trung tâm, thuận tiện di chuyển đến các khu vực kinh doanh, mua sắm và giải trí.</li><li><strong>Nội thất:</strong> Căn hộ được trang bị đầy đủ nội thất cao cấp, từ đồ gia dụng đến đồ nội thất.</li></ul><p><strong>Tiện ích ngoại khu:</strong></p><ul><li>Gần các trường học quốc tế, bệnh viện, trung tâm mua sắm cao cấp.</li><li>Các nhà hàng, quán cà phê và các dịch vụ tiện ích khác trong bán kính ngắn.</li></ul><p><strong>Giá cho thuê:</strong> Hợp lý và thương lượng, phù hợp với gia đình hoặc nhóm người có nhu cầu sống tại không gian cao cấp và tiện nghi.</p><p><strong>Liên hệ:</strong> Để biết thêm thông tin chi tiết và sắp xếp thăm quan căn hộ, vui lòng liên hệ ngay với chúng tôi qua số điện thoại XYZ hoặc email XYZ. Chúng tôi luôn sẵn sàng hỗ trợ và tư vấn cho bạn đến khi bạn tìm được căn hộ ưng ý.</p><p>Hãy tận hưởng cuộc sống đẳng cấp cùng căn hộ penthouse này tại thành phố của bạn. Chúng tôi rất mong được đồng hành cùng bạn trong chuyến hành trình tìm kiếm một không gian sống hoàn hảo!<br><br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-15' AS Date), 52, 4, 2, N'52_2_penthouse_poolside_bar.avif', N'Thành phố Hà Nội', N'Quận Hà Đông', N'Phường Phú La', CAST(210 AS Decimal(18, 0)), 7, N'nhà của thịnh 3', CAST(70000000 AS Decimal(18, 0)), 4, 9, CAST(1600000 AS Decimal(18, 0)), 4, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (94, N' Cho Thuê Căn Hộ Trung Cấp - Tiện Nghi Và Đẳng Cấp', N'<p><br>Chào bạn,</p><p>Bạn đang tìm kiếm một căn hộ trung cấp đẹp, tiện nghi và ấm cúng để thuê? Chúng tôi rất vui khi giới thiệu căn hộ của chúng tôi tại trung tâm thành phố, với nhiều tiện ích và không gian sống thoải mái.</p><p><strong>Thông tin căn hộ:</strong></p><ul><li><strong>Vị trí:</strong> Nằm ở trung tâm thành phố, gần các trường học, bệnh viện và siêu thị, thuận tiện cho việc đi lại và mua sắm.</li><li><strong>Diện tích:</strong> Căn hộ rộng rãi, bố trí hợp lý với diện tích ___ mét vuông (cụ thể về diện tích).</li><li><strong>Tiện nghi:</strong> Được trang bị đầy đủ nội thất hiện đại và các thiết bị điện tử như điều hòa, tivi, tủ lạnh, máy giặt… Các thiết bị đều mới và hoạt động tốt.</li><li><strong>An ninh:</strong> Hệ thống an ninh 24/7 đảm bảo an toàn tuyệt đối cho bạn và gia đình.</li><li><strong>Không gian xanh:</strong> Có khu vực cây xanh, sân chơi trẻ em và khu vực thư giãn cho cư dân.</li><li><strong>Dịch vụ đi kèm:</strong> Bao gồm dịch vụ giặt là, dọn phòng, và hỗ trợ kỹ thuật nếu cần thiết.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ trung cấp tại đây là ___ (đơn vị tiền tệ) mỗi tháng. Đây là mức giá cạnh tranh và phù hợp với chất lượng căn hộ và dịch vụ mà chúng tôi cung cấp.</p><p><strong>Liên hệ:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Chân thành cảm ơn sự quan tâm của bạn và hy vọng sớm được đón tiếp bạn tại căn hộ của chúng tôi!</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)<br><br><br>&nbsp;</p>', 3, CAST(N'2024-07-23' AS Date), CAST(N'2024-08-13' AS Date), 53, 4, 2, N'53_2_can-97-phong-khach-637600611477734204 (1).jpg', N'Thành phố Hà Nội', N'Quận Bắc Từ Liêm', N'Phường Cổ Nhuế 1', CAST(90 AS Decimal(18, 0)), 3, N'nhà của thịnh 3', CAST(15000000 AS Decimal(18, 0)), 2, 8, CAST(1680000 AS Decimal(18, 0)), 3, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (95, N'Căn Hộ Cao Cấp Chuẩn Phong Cách Nhật Bản - Sự Lựa Chọn Hoàn Hảo', N'<p>Xin chào quý khách,</p><p>Bạn đang tìm kiếm một căn hộ cao cấp mang đậm phong cách Nhật Bản để thuê? Chúng tôi xin giới thiệu đến bạn căn hộ tại trung tâm thành phố, được thiết kế với sự tinh tế và tiện nghi đầy đủ, mang đến không gian sống sang trọng và tiện lợi.</p><p><strong>Thông tin căn hộ:</strong></p><ul><li><strong>Phong cách Nhật Bản:</strong> Thiết kế nội thất và không gian sống lấy cảm hứng từ nền văn hóa Nhật Bản, từ đồ gỗ tự nhiên đến sự tối giản trong bố trí không gian.</li><li><strong>Vị trí:</strong> Nằm tại khu vực trung tâm thành phố, gần các trường học, bệnh viện và trung tâm mua sắm, thuận tiện cho việc đi lại và sinh hoạt hàng ngày.</li><li><strong>Diện tích:</strong> Căn hộ rộng rãi, bố trí hợp lý với diện tích ___ mét vuông (cụ thể về diện tích).</li><li><strong>Tiện nghi:</strong> Được trang bị đầy đủ nội thất cao cấp và các thiết bị điện tử hiện đại như máy lạnh, tivi, tủ lạnh, lò vi sóng, máy giặt… Đảm bảo sự tiện nghi và thoải mái cho cư dân.</li><li><strong>An ninh:</strong> Hệ thống an ninh 24/7 với camera giám sát và bảo vệ chuyên nghiệp, đảm bảo an toàn tuyệt đối cho bạn và gia đình.</li><li><strong>Dịch vụ đi kèm:</strong> Bao gồm dịch vụ giặt là, dọn phòng, và hỗ trợ kỹ thuật nếu cần thiết.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ cao cấp tại đây là ___ (đơn vị tiền tệ) mỗi tháng. Đây là mức giá phù hợp với chất lượng và tiện ích mà căn hộ mang lại.</p><p><strong>Liên hệ:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Chân thành cảm ơn sự quan tâm của bạn và mong sớm được đón tiếp bạn tại căn hộ sang trọng của chúng tôi!</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)<br><br><br><br>&nbsp;</p>', 3, CAST(N'2024-07-28' AS Date), CAST(N'2024-08-04' AS Date), 54, 1, 2, N'54_2_thiet-ke-noi-that-can-ho-chung-cu-phong-cach-nhat-ban-dep-13.jpg', N'Thành phố Hồ Chí Minh', N'Quận 5', N'Phường 08', CAST(70 AS Decimal(18, 0)), 3, N'nhà của thịnh 4', CAST(10000000 AS Decimal(18, 0)), 3, 9, CAST(70000 AS Decimal(18, 0)), 1, CAST(N'09:27:58' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (96, N'SkyVilla Cao Cấp Tại Trung Tâm Thủ Đô Hà Nội - Lối Sống Sang Trọng Và Hiện Đại', N'<p><br>Xin chào quý khách,</p><p>Bạn đang tìm kiếm một căn hộ cao cấp SkyVilla tại trung tâm Thủ đô, nơi kết hợp hoàn hảo giữa không gian sống sang trọng và vị trí đắc địa? Chúng tôi rất vui được giới thiệu căn hộ độc đáo này, nơi sự tiện nghi và đẳng cấp gặp gỡ với không gian thiên nhiên và tầm nhìn tuyệt vời.</p><p><strong>Thông tin căn hộ:</strong></p><ul><li><strong>Vị trí lý tưởng:</strong> Nằm tại trung tâm của Thủ đô, gần các trường học, bệnh viện, khu vui chơi giải trí và các tiện ích công cộng khác, mang đến sự thuận tiện và lợi ích tối đa cho cư dân.</li><li><strong>Diện tích và thiết kế:</strong> Căn hộ SkyVilla được thiết kế rộng rãi, tối ưu hóa không gian để tận dụng ánh sáng tự nhiên và tầm nhìn bao quát thành phố. Thiết kế nội thất hiện đại và sang trọng, từ các thiết bị điện tử đến đồ nội thất, đều được chọn lựa kỹ lưỡng để đáp ứng nhu cầu sống cao cấp.</li><li><strong>Tiện nghi và dịch vụ:</strong> Các tiện ích cao cấp như hồ bơi, phòng gym, khu vui chơi trẻ em, sân chơi tennis và khu vườn xanh mát. Đảm bảo mọi nhu cầu giải trí và thư giãn của cư dân được đáp ứng tối đa.</li><li><strong>An ninh và dịch vụ:</strong> Hệ thống an ninh 24/7, bảo vệ chuyên nghiệp và các dịch vụ hỗ trợ như giặt là, dọn dẹp, và bảo trì định kỳ để đảm bảo cuộc sống hàng ngày của cư dân luôn êm đềm và an toàn.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ SkyVilla cao cấp là ___ (đơn vị tiền tệ) mỗi tháng. Đây là mức giá xứng đáng với chất lượng và tiện ích cao cấp mà căn hộ mang lại.</p><p><strong>Liên hệ:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Chân thành cảm ơn sự quan tâm của bạn và mong sớm được đón tiếp bạn tại SkyVilla sang trọng của chúng tôi!</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)</p><p>&nbsp;</p><p>&nbsp;</p><p><br><br><br>&nbsp;</p>', 4, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-22' AS Date), 55, 4, 2, N'55_2_20170306111842-5717_wm.jpg', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Thụy Khuê', CAST(95 AS Decimal(18, 0)), 5, N'nhà của Thịnh 5', CAST(19000000 AS Decimal(18, 0)), 6, 6, CAST(2000000 AS Decimal(18, 0)), 5, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (97, N'Khám Phá Căn Hộ LoftHouse - Nơi Sống Đẳng Cấp Và Đầy Sáng Tạo', N'<p>Chào bạn,</p><p>Bạn đang tìm kiếm một không gian sống độc đáo và đầy nghệ thuật? Căn hộ LoftHouse của chúng tôi chắc chắn sẽ là sự lựa chọn hoàn hảo cho bạn. Với thiết kế tinh tế kết hợp giữa sự hiện đại và sự sáng tạo, LoftHouse mang đến không gian sống thoải mái và đẳng cấp giữa lòng thành phố sôi động.</p><p><strong>Điểm nổi bật của căn hộ:</strong></p><ul><li><strong>Thiết kế độc đáo:</strong> LoftHouse được thiết kế theo phong cách loft với không gian mở rộng và ánh sáng tự nhiên chan hòa. Các chi tiết nội thất được lựa chọn kỹ lưỡng để tạo nên một không gian sống sang trọng và ấm cúng.</li><li><strong>Vị trí trung tâm:</strong> Nằm tại vị trí đắc địa của thành phố, gần các trường học, bệnh viện, khu vui chơi giải trí và các điểm thương mại lớn. Điều này mang đến sự thuận tiện và lợi ích tối đa cho cư dân.</li><li><strong>Tiện nghi hiện đại:</strong> Căn hộ được trang bị đầy đủ các thiết bị điện tử và nội thất cao cấp như hệ thống điều hòa không khí, tủ lạnh, máy giặt, lò vi sóng và tivi màn hình phẳng. Mọi thiết bị đều mới và hoạt động tốt.</li><li><strong>Không gian xanh:</strong> Khu vực xung quanh căn hộ có sân vườn rộng rãi và không gian xanh mát, là nơi lý tưởng để thư giãn sau những giờ làm việc căng thẳng.</li><li><strong>An ninh đảm bảo:</strong> Hệ thống an ninh 24/7 với camera giám sát và bảo vệ chuyên nghiệp, đảm bảo an toàn tuyệt đối cho bạn và gia đình.</li></ul><p><strong>Giá thuê hợp lý:</strong> Giá thuê căn hộ LoftHouse là ___ (đơn vị tiền tệ) mỗi tháng, phù hợp với chất lượng và tiện ích cao cấp mà căn hộ mang lại.</p><p><strong>Liên hệ ngay:</strong></p><p>Nếu bạn quan tâm và muốn biết thêm thông tin chi tiết hoặc đặt lịch xem căn hộ, vui lòng liên hệ với chúng tôi qua số điện thoại ___ hoặc email ___ để được hỗ trợ nhanh chóng.</p><p>Hãy để căn hộ LoftHouse trở thành nơi lựa chọn lý tưởng cho cuộc sống của bạn, nơi bạn có thể thư giãn và cảm nhận sự sang trọng và đẳng cấp trong từng chi tiết.</p><p>Trân trọng,</p><p>(Tên của bạn)</p><p>(Tên công ty/bộ phận cho thuê căn hộ)<br><br><br><br>&nbsp;</p>', 3, CAST(N'2024-07-16' AS Date), CAST(N'2024-08-13' AS Date), 56, 2, 2, N'56_2_3_YHDT.jpg', N'Thành phố Hà Nội', N'Quận Cầu Giấy', N'Phường Dịch Vọng Hậu', CAST(90 AS Decimal(18, 0)), 4, N'nhà của thịnh 6', CAST(15000000 AS Decimal(18, 0)), 7, 8, CAST(620000 AS Decimal(18, 0)), 4, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (102, N'abc', N'<p><br>a''slfcma;as<br><br><br>&nbsp;</p>', 3, CAST(N'2024-06-26' AS Date), CAST(N'2024-07-03' AS Date), 67, 3, 11, N'67_11_strange-cs2-inferno-in-my-game-files-v0-7y6viz7pugva1.webp', N'Thành phố Hà Nội', N'Huyện Gia Lâm', N'Xã Đông Dư', CAST(70 AS Decimal(18, 0)), 2, N'căn hộ mới', CAST(15000000 AS Decimal(18, 0)), 2, 4, CAST(140000 AS Decimal(18, 0)), 1, CAST(N'10:11:30' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (107, N'Cho Thuê Căn Hộ 3 Phòng Ngủ, 30m², Gần Khu Công Nghiệp Bắc Thăng Long, Đông Anh, Xã Đại Mạch', N'<p><br>Chào mọi người,</p><p>Hiện tại, tôi đang có một căn hộ 3 phòng ngủ cần cho thuê với diện tích 30m². Căn hộ nằm ở vị trí rất thuận tiện, gần khu công nghiệp Bắc Thăng Long, thuộc xã Đại Mạch, Đông Anh. Dưới đây là thông tin chi tiết:</p><h3><strong>Thông tin căn hộ:</strong></h3><ul><li><strong>Diện tích:</strong> 30m²</li><li><strong>Số phòng ngủ:</strong> 3 phòng</li><li><strong>Vị trí:</strong> Xã Đại Mạch, Đông Anh, gần khu công nghiệp Bắc Thăng Long</li><li><strong>Tiện ích xung quanh:</strong> Gần chợ, trường học, bệnh viện, các tiện ích công cộng và khu vui chơi giải trí</li><li><strong>An ninh:</strong> Khu vực an ninh tốt, dân trí cao</li></ul><h3><strong>Ưu điểm nổi bật:</strong></h3><ul><li><strong>Vị trí thuận lợi:</strong> Chỉ mất vài phút di chuyển đến khu công nghiệp Bắc Thăng Long, thuận tiện cho những ai làm việc tại khu vực này.</li><li><strong>Tiện nghi đầy đủ:</strong> Căn hộ được trang bị đầy đủ các tiện nghi cơ bản, mang lại sự thoải mái cho người thuê.</li><li><strong>Giá cả hợp lý:</strong> Giá thuê cạnh tranh so với mặt bằng chung trong khu vực.</li></ul><h3><strong>Giá thuê:</strong></h3><ul><li>Vui lòng liên hệ trực tiếp để biết thêm chi tiết về giá thuê và các điều kiện thuê.</li></ul><h3><strong>Liên hệ:</strong></h3><ul><li><strong>Số điện thoại:</strong> [Số điện thoại của bạn]</li><li><strong>Email:</strong> [Email của bạn]</li><li><strong>Địa chỉ:</strong> [Địa chỉ căn hộ]<br><br><br>&nbsp;</li></ul>', 3, CAST(N'2024-07-24' AS Date), CAST(N'2024-08-14' AS Date), 70, 3, 13, N'70_13_can-97-phong-khach-637600611477734204.jpg', N'Thành phố Hà Nội', N'Huyện Đông Anh', N'Xã Đại Mạch', CAST(30 AS Decimal(18, 0)), 3, N'Nhà của Hưng 1', CAST(3500000 AS Decimal(18, 0)), 2, 7, CAST(840000 AS Decimal(18, 0)), 3, CAST(N'00:57:35' AS Time))
INSERT [dbo].[Apartment_Posts] ([id], [title], [description], [post_status], [post_start], [post_end], [apartment_id], [payment_id], [landlord_id], [first_image], [city], [district], [commune], [area], [number_of_bedroom], [apartment_name], [price], [apartment_type], [total_image], [paid_for_post], [week], [time_post]) VALUES (108, N'ádsadasd', N'<p>qưewqewqasdasd<br><br><br>&nbsp;</p>', 3, CAST(N'2024-07-27' AS Date), CAST(N'2024-08-03' AS Date), 70, 2, 13, N'70_13_can-97-phong-khach-637600611477734204.jpg', N'Thành phố Hà Nội', N'Huyện Đông Anh', N'Xã Đại Mạch', CAST(30 AS Decimal(18, 0)), 3, N'Nhà của Hưng 1', CAST(3500000 AS Decimal(18, 0)), 2, 7, CAST(140000 AS Decimal(18, 0)), 1, CAST(N'15:58:38' AS Time))
SET IDENTITY_INSERT [dbo].[Apartment_Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_room] ON 

INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (544, 47, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (545, 47, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (546, 47, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (547, 47, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (548, 47, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (549, 47, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (550, 47, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (551, 47, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (552, 47, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (553, 47, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (554, 47, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (555, 47, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (556, 47, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (557, 47, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (558, 51, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (559, 51, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (560, 51, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (561, 51, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (562, 51, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (563, 51, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (564, 51, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (565, 51, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (566, 51, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (567, 51, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (568, 51, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (569, 52, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (570, 52, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (571, 52, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (572, 52, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (573, 52, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (574, 52, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (575, 52, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (576, 52, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (577, 52, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (578, 52, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (579, 52, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (580, 52, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (581, 52, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (582, 52, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (583, 53, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (584, 53, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (585, 53, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (586, 53, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (587, 53, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (588, 53, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (589, 53, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (590, 53, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (591, 53, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (592, 53, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (593, 53, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (594, 53, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (595, 53, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (596, 53, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (609, 55, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (610, 55, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (611, 55, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (612, 55, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (613, 55, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (614, 55, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (615, 55, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (616, 55, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (617, 55, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (618, 55, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (619, 55, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (620, 55, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (621, 55, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (622, 55, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (635, 57, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (636, 57, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (637, 57, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (638, 57, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (639, 57, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (640, 57, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (641, 57, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (642, 57, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (643, 57, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (644, 57, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (645, 57, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (646, 57, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (647, 57, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (648, 57, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (658, 57, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (659, 57, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (660, 57, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (661, 57, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (662, 57, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (663, 57, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (664, 57, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (665, 57, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (666, 57, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (667, 57, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (668, 57, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (669, 57, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (670, 57, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (671, 57, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (672, 57, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (673, 57, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (674, 57, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (675, 57, 8)
GO
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (676, 57, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (677, 57, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (678, 57, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (679, 57, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (680, 57, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (709, 67, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (710, 67, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (711, 67, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (712, 67, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (713, 67, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (714, 67, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (715, 67, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (716, 67, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (717, 67, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (718, 67, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (719, 67, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (720, 67, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (721, 67, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (722, 67, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (725, 69, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (726, 69, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (727, 69, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (728, 69, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (729, 69, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (730, 69, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (731, 56, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (732, 56, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (733, 56, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (734, 56, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (735, 56, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (736, 56, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (737, 56, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (738, 56, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (739, 56, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (740, 56, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (741, 56, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (742, 56, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (754, 54, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (755, 54, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (756, 54, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (757, 54, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (758, 54, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (759, 54, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (760, 54, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (761, 54, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (762, 54, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (763, 54, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (764, 54, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (765, 54, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (766, 54, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (767, 54, 14)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (795, 70, 1)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (796, 70, 2)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (797, 70, 3)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (798, 70, 4)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (799, 70, 5)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (800, 70, 6)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (801, 70, 7)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (802, 70, 8)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (803, 70, 9)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (804, 70, 10)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (805, 70, 11)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (806, 70, 12)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (807, 70, 13)
INSERT [dbo].[Apartment_room] ([id], [apartment_id], [property_id]) VALUES (808, 70, 14)
SET IDENTITY_INSERT [dbo].[Apartment_room] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_type] ON 

INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (1, N'Căn hộ mini')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (2, N'Căn hộ trung cấp')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (3, N'Căn hộ cao cấp')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (4, N'Căn hộ penthouse')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (5, N'Căn hộ duplex')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (6, N'Căn hộ skyvilla')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (7, N'Căn hộ loft-house')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (8, N'Căn hộ studio')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (9, N'Căn hộ condotel')
INSERT [dbo].[Apartment_type] ([id], [name]) VALUES (10, N'Căn hộ officetel')
SET IDENTITY_INSERT [dbo].[Apartment_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (2, N'đẹp đấy', 11, 37, CAST(N'2024-07-11T02:25:45.080' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (3, N'cảm ơn vì đã thích bài đăng của tôi', 9, 37, CAST(N'2024-07-11T02:34:27.760' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (5, N'bức cuối cùng chụp ở đâu vậy', 11, 37, CAST(N'2024-07-11T10:08:35.500' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (6, N'nó đẹp thật sự', 2, 37, CAST(N'2024-07-11T10:11:49.650' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (7, N'asfasdf', 2, 38, CAST(N'2024-07-11T10:54:12.543' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (8, N'nice bạn ơi', 2, 38, CAST(N'2024-07-11T10:56:43.303' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (9, N'đẹp quá ', 2, 36, CAST(N'2024-07-11T10:58:15.213' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (10, N'nice', 2, 36, CAST(N'2024-07-11T10:59:15.693' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (11, N'nice', 2, 35, CAST(N'2024-07-11T10:59:51.610' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (460, N'nice', 13, 36, CAST(N'2024-07-11T17:10:58.067' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (462, N'tác giả cho iem xin cái địa chỉ', 13, 37, CAST(N'2024-07-11T17:22:02.700' AS DateTime), 0)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (463, N'nice', 2, 37, CAST(N'2024-07-11T17:53:32.377' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (464, N'asfasdf', 2, 38, CAST(N'2024-07-11T18:07:48.800' AS DateTime), 0)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (468, N'thank you', 13, 35, CAST(N'2024-07-12T12:30:44.047' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (469, N'nice', 13, 38, CAST(N'2024-07-12T13:25:27.590' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (470, N'hi', 13, 35, CAST(N'2024-07-12T22:14:24.380' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (471, N'nice bạn ơi', 13, 35, CAST(N'2024-07-12T22:26:50.790' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (472, N'đẹp quá', 13, 39, CAST(N'2024-07-13T16:08:33.130' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (473, N'cảm ơn bạn nhé', 2, 39, CAST(N'2024-07-13T16:39:51.947' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (474, N'rất hay bạn ơi', 2, 40, CAST(N'2024-07-14T21:51:37.220' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (475, N'phim này hay nè', 2, 49, CAST(N'2024-07-16T14:58:17.270' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (476, N'đúng vậy, đây là bộ phim rất hay', 13, 49, CAST(N'2024-07-16T14:59:01.773' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (477, N'nice', 2, 40, CAST(N'2024-07-16T16:28:34.503' AS DateTime), 1)
INSERT [dbo].[Comment] ([id], [message], [user_id], [post_id], [time], [status]) VALUES (478, N'đẹp quá', 2, 49, CAST(N'2024-07-17T22:52:01.553' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Community_post] ON 

INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (35, N'news                                                                                                                                                                                                    ', N'<p>&nbsp;</p><p>Requirements tracing, also known as requirements traceability, is both feasible and often necessary in software development. Here’s an overview of its feasibility and necessity:</p><h3>Feasibility</h3><ul><li><strong>Tools and Techniques</strong>: There are many tools available for requirements tracing, such as JIRA, IBM Rational DOORS, and Microsoft Azure DevOps. These tools provide functionalities to create, link, and manage requirements throughout the project lifecycle.</li><li><strong>Processes</strong>: Implementing requirements tracing involves establishing processes for capturing requirements, linking them to design, implementation, testing, and deployment artifacts, and maintaining these links throughout the project.</li><li><strong>Documentation Standards</strong>: Adopting documentation standards and practices that support traceability is feasible and can be integrated into the development workflow.</li></ul><h3>Necessity</h3><ul><li><strong>Ensuring Coverage</strong>: Tracing requirements helps ensure that all requirements are addressed in the design, implementation, and testing phases. This reduces the risk of missing critical functionality.</li><li><strong>Impact Analysis</strong>: When changes occur, traceability helps assess the impact on other parts of the system. This is crucial for managing scope and understanding the consequences of changes.</li><li><strong>Verification and Validation</strong>: Traceability supports verification (building the system right) and validation (building the right system). It ensures that the final product meets the initial requirements.</li><li><strong>Compliance and Standards</strong>: Many industries, such as aerospace, healthcare, and finance, have stringent regulatory requirements. Traceability is often mandatory to demonstrate compliance with these standards.</li><li><strong>Quality Management</strong>: Maintaining traceability can improve the overall quality of the project by providing clear documentation of requirements and their implementation.</li></ul><h3>Summary</h3><p>Requirements tracing is feasible due to the availability of tools and established processes, and it is often necessary to ensure comprehensive coverage, effective impact analysis, proper verification and validation, compliance with standards, and overall project quality.</p>', 13, CAST(N'2024-07-10' AS Date), N'post_image/anime-streets-wallpaper.jpg', 23, 2, 4, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (36, N'dfddf                                                                                                                                                                                                   ', N'<p>ssssssssssssssssssssss</p>', 13, CAST(N'2024-07-10' AS Date), N'post_image/hinh-nen-den-dep-nhat-1.jpeg', 43, 3, 3, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (37, N'BÁN ĐẤT NỀN PHÂN LÔ KHU ĐÔ THỊ XANH - CƠ HỘI ĐẦU TƯ SINH LỜI CAO!                                                                                                                                       ', N'<p><strong>🌟 Đất nền khu đô thị xanh - Lựa chọn hoàn hảo cho cuộc sống đẳng cấp! 🌟</strong></p><p><strong>📍 Vị trí đắc địa:</strong></p><ul><li>Nằm tại khu vực trung tâm phát triển, gần các tiện ích như trường học, bệnh viện, trung tâm thương mại.</li><li>Kết nối giao thông thuận tiện, gần trục đường chính, dễ dàng di chuyển đến các khu vực lân cận.</li></ul><p><strong>🏡 Tiện ích vượt trội:</strong></p><ul><li>Hạ tầng hoàn chỉnh: Đường trải nhựa rộng rãi, hệ thống điện nước đầy đủ.</li><li>Khuôn viên cây xanh, công viên, khu vui chơi trẻ em, khu thể thao, hồ bơi.</li><li>An ninh đảm bảo với hệ thống camera giám sát 24/7 và bảo vệ chuyên nghiệp.</li></ul><p><strong>📐 Diện tích đa dạng:</strong></p><ul><li>Đa dạng các lô đất với nhiều diện tích từ 100m2 đến 300m2, phù hợp với nhu cầu của từng khách hàng.</li><li>Pháp lý rõ ràng, sổ đỏ từng lô, sang tên ngay khi hoàn tất giao dịch.</li></ul><p><strong>💰 Giá bán hấp dẫn:</strong></p><ul><li>Giá từ X triệu/m2, có nhiều chương trình khuyến mãi và ưu đãi đặc biệt cho khách hàng đặt cọc sớm.</li><li>Hỗ trợ vay vốn ngân hàng với lãi suất ưu đãi, thủ tục nhanh gọn.</li></ul><p><strong>🔔 Cơ hội đầu tư sinh lời cao:</strong></p><ul><li>Khu vực đang trong quá trình phát triển mạnh mẽ, tiềm năng tăng giá trong tương lai.</li><li>Đầu tư đất nền là lựa chọn an toàn và bền vững, đảm bảo sinh lời lâu dài.</li></ul><p><strong>📞 Liên hệ ngay:</strong></p><ul><li>Để biết thêm thông tin chi tiết và đặt lịch xem đất, vui lòng liên hệ:<ul><li>Hotline: 0123 456 789</li><li>Email: info@khudothixanh.vn</li><li>Website: <a href="http://www.khudothixanh.vn">www.khudothixanh.vn</a></li></ul></li></ul><p><strong>✨ Đất nền khu đô thị xanh - Nơi an cư lạc nghiệp, đầu tư sinh lời! ✨</strong></p><p>Hy vọng bài viết trên giúp ích cho bạn trong việc phân lô bán nền. Nếu bạn cần thêm bất kỳ thông tin nào khác hoặc cần chỉnh sửa, hãy cho tôi biết!</p>', 9, CAST(N'2024-07-10' AS Date), N'post_image/Screenshot 2023-03-10 202036.png', 38, 5, 7, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (38, N'ákldasdjasdlasjdlasdasd                                                                                                                                                                                 ', N'<p>ádasdsadasdasdasdadasdasdsadasd</p>', 11, CAST(N'2024-07-11' AS Date), N'post_image/anh1.jpg', 42, 3, 4, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (39, N'Kiến Trúc Nhật Bản: Sự Hòa Quyện Giữa Thiên Nhiên và Văn Hóa                                                                                                                                            ', N'<p>Nhật Bản, đất nước của những ngôi đền cổ kính, vườn tược tĩnh lặng và những ngôi nhà gỗ truyền thống, đã phát triển một phong cách kiến trúc độc đáo và phong phú qua nhiều thế kỷ. Kiến trúc Nhật Bản không chỉ phản ánh sự khéo léo trong kỹ thuật xây dựng mà còn thể hiện sâu sắc sự hòa quyện giữa thiên nhiên và văn hóa.</p><h4>1. <strong>Nguyên Tắc Thiết Kế</strong></h4><p>Kiến trúc Nhật Bản thường tuân theo nguyên tắc thiết kế wabi-sabi, tập trung vào vẻ đẹp của sự đơn giản và sự không hoàn hảo. Những ngôi nhà truyền thống thường được xây dựng bằng gỗ và giấy, với cấu trúc nhẹ nhàng và tinh tế, tạo cảm giác gần gũi và thoải mái.</p><h4>2. <strong>Nhà Truyền Thống Nhật Bản - Machiya và Minka</strong></h4><p><strong>Machiya</strong> là kiểu nhà phố phổ biến trong các đô thị cổ như Kyoto. Những ngôi nhà này thường hẹp về chiều ngang nhưng sâu về chiều dài, với mặt tiền bằng gỗ và mái ngói đặc trưng. Bên trong, không gian được phân chia bằng các vách ngăn shoji (cửa trượt bằng giấy) và tatami (chiếu cói), tạo ra sự linh hoạt trong việc sử dụng không gian.</p><p><strong>Minka</strong>, hay còn gọi là nhà nông thôn, thể hiện sự mộc mạc và gần gũi với thiên nhiên. Minka thường có mái tranh dày, tường bằng đất và gỗ, giúp điều hòa nhiệt độ và tạo cảm giác ấm cúng.</p><h4>3. <strong>Đền và Chùa Nhật Bản</strong></h4><p>Những ngôi đền và chùa Nhật Bản như Kinkaku-ji (Chùa Vàng) hay Todai-ji ở Nara không chỉ là nơi tôn nghiêm mà còn là biểu tượng của nghệ thuật kiến trúc tinh xảo. Được xây dựng bằng gỗ và đá, các ngôi đền thường có các cột trụ lớn, mái cong vút và những chi tiết chạm khắc tinh xảo.</p><p>Các khu vườn trong đền và chùa cũng là một phần không thể thiếu, với những hồ nước trong xanh, cây cối xanh tươi và đá sỏi được sắp xếp tỉ mỉ, tạo nên khung cảnh yên bình và thanh tịnh.</p><h4>4. <strong>Kiến Trúc Hiện Đại Nhật Bản</strong></h4><p>Bên cạnh những công trình truyền thống, kiến trúc hiện đại Nhật Bản cũng có những bước phát triển ấn tượng. Các kiến trúc sư như Tadao Ando và Kengo Kuma đã mang đến những công trình đầy sáng tạo, kết hợp giữa vật liệu truyền thống và công nghệ hiện đại. Các công trình như Bảo tàng Nghệ thuật Chichu hay Nhà thờ Ánh sáng là những ví dụ điển hình về sự kết hợp giữa kiến trúc và thiên nhiên, tạo nên không gian sống động và đầy cảm hứng.</p>', 2, CAST(N'2024-07-13' AS Date), N'post_image/caption.jpg', 6, 3, 2, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (40, N'Tựa Đề: Như một giấc mơ chiều thu                                                                                                                                                                       ', N'<p>Trong đêm tối lặng thinh, ta tìm nhau Trái tim anh khẽ đau khi nhớ về em Biết rằng yêu là khổ, nhưng vẫn thương Dẫu ngàn kiếp sau ta vẫn mong được gần</p><p>(Chorus) Mãi mãi là mơ, tình đôi ta chẳng thể Còn mãi trong tim, dù xa cách muôn trùng Anh sẽ luôn nhớ, tình yêu mình bất diệt Như áng mây bay, lặng lẽ trôi qua đời</p><p>(Verse 2) Em nơi xa ấy có hay chăng lòng anh Mỗi đêm anh mơ thấy đôi ta kề bên Dù thời gian có xoá đi bao kỷ niệm Nhưng tình yêu này vẫn sáng mãi không phai</p><p>(Chorus) Mãi mãi là mơ, tình đôi ta chẳng thể Còn mãi trong tim, dù xa cách muôn trùng Anh sẽ luôn nhớ, tình yêu mình bất diệt Như áng mây bay, lặng lẽ trôi qua đời</p><p>(Bridge) Dù rằng không thể bên nhau trọn kiếp Nhưng từng giây phút anh vẫn luôn ghi nhớ Ta sẽ sống với những giấc mơ ngọt ngào Yêu em mãi mãi, trong tim này mãi mãi</p><p>(Chorus) Mãi mãi là mơ, tình đôi ta chẳng thể Còn mãi trong tim, dù xa cách muôn trùng Anh sẽ luôn nhớ, tình yêu mình bất diệt Như áng mây bay, lặng lẽ trôi qua đời</p><p>(Outro) Mãi mãi là mơ, ta chẳng thể bên nhau Nhưng trong tim anh, em sẽ mãi là ánh sao Yêu em mãi mãi, dù cuộc đời đổi thay Tình yêu đôi ta, mãi mãi là giấc mơ...</p>', 2, CAST(N'2024-07-13' AS Date), N'post_image/181115161449-11-japanese-ryokans-nishimuraya.webp', 20, 4, 2, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (49, N'best movie                                                                                                                                                                                              ', N'<p>blade runner 2049</p>', 13, CAST(N'2024-07-16' AS Date), N'post_image/blade-runner-gosling.gif', 28, 4, 3, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (50, N'asdasd                                                                                                                                                                                                  ', N'<p>asdasdasdasdasd</p>', 13, CAST(N'2024-07-22' AS Date), N'post_image/5a65fee2dd0fc8bec268a90cd10e34d114f2b7ac_full.jpg', 1, 2, 0, 1)
INSERT [dbo].[Community_post] ([id], [tittle], [context], [user_id], [time], [first_image], [num_of_view], [num_of_like], [num_of_comment], [status]) VALUES (51, N'sadsad                                                                                                                                                                                                  ', N'<p>asdsada</p>', 2, CAST(N'2024-07-28' AS Date), N'post_image/Screenshot 2023-03-10 202036.png', 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Community_post] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([id], [tenant_id], [landlord_id], [apartment_id], [status], [phone], [full_name], [email], [city], [district], [commune], [address], [note], [cccd], [current_living], [tenant_avatar], [cccd_civil_card_front], [cccd_civil_card_back], [dob], [cccd_receive_date], [office_name], [sign_date]) VALUES (2, 11, 2, 53, 1, N'0345882332', N'nguyen hoang hung', N'vuminh05022003@gmail.com', N'Tỉnh Bạc Liêu', NULL, N'Xã Ninh Quới A', N'Hà Nội', N'dasdadas', N'012345678987', N'Đông Anh', N'contract/Screenshot 2024-07-21 210301.png', N'contract/Screenshot 2024-07-22 091035.png', N'contract/Screenshot 2024-07-22 165527.png', CAST(N'2000-07-25' AS Date), CAST(N'2024-07-17' AS Date), N'ádasdasd', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Contract] ([id], [tenant_id], [landlord_id], [apartment_id], [status], [phone], [full_name], [email], [city], [district], [commune], [address], [note], [cccd], [current_living], [tenant_avatar], [cccd_civil_card_front], [cccd_civil_card_back], [dob], [cccd_receive_date], [office_name], [sign_date]) VALUES (3, 13, 2, 54, 2, N'111111111', N'Nguyễn Minh Quân', N'vuminh05022003@gmail.com', N'Tỉnh Bình Dương', N'Thành phố Thủ Dầu Một', N'Phường Hiệp An', N'Gần khu vực 51', N'thích nuôi khủng long', N'093402384243', N'Hòa Lạc', N'contract/Screenshot 2024-07-21 210301.png', N'contract/Screenshot 2024-07-12 142007.png', N'contract/Screenshot 2024-07-22 232041.png', CAST(N'2003-06-01' AS Date), CAST(N'2024-07-17' AS Date), N'Trại cai nghiện Bình Dương', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[Contract] ([id], [tenant_id], [landlord_id], [apartment_id], [status], [phone], [full_name], [email], [city], [district], [commune], [address], [note], [cccd], [current_living], [tenant_avatar], [cccd_civil_card_front], [cccd_civil_card_back], [dob], [cccd_receive_date], [office_name], [sign_date]) VALUES (4, 2, 13, 70, 2, N'0345882332', N'nguyen trong thinh', N'player7377@gmail.com', N'Tỉnh Cà Mau', N'Huyện Năm Căn', N'Xã Hiệp Tùng', N'cây xăng 39', N'', N'093402384242', N'Đông Anh', N'contract/Screenshot 2023-03-11 213147.png', N'contract/Screenshot 2024-07-20 231816.png', N'contract/Screenshot 2024-07-20 231745.png', CAST(N'2000-07-17' AS Date), CAST(N'2024-07-02' AS Date), N'Thành phố hà nội', CAST(N'2024-07-27' AS Date))
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[Image_post] ON 

INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (22, N'post_image/48697_cityscape_japan_cityscape_at_night.jpg', 35)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (23, N'post_image/196530854_2701637046800476_7481934314632612286_n.jpg', 35)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (24, N'post_image/anime-streets-wallpaper.jpg', 35)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (25, N'post_image/dominique-van-velsen-pit-city-16.jpg', 36)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (26, N'post_image/dominique-van-velsen-pit-city-web.jpg', 36)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (27, N'post_image/e310cb5e0a9a203d3a9936f0b617ffa8.jpg', 36)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (28, N'post_image/ghost-of-tsushima-danh-gia-game.jpg', 36)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (29, N'post_image/High_resolution_wallpaper_background_ID_77700192374.jpg', 36)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (30, N'post_image/hinh-nen-den-dep-nhat-1.jpeg', 36)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (31, N'post_image/e310cb5e0a9a203d3a9936f0b617ffa8.jpg', 37)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (32, N'post_image/pexels-belle-co-402028.jpg', 37)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (33, N'post_image/pexels-evgeny-tchebotarev-2187605.jpg', 37)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (34, N'post_image/Screenshot 2023-03-10 202036.png', 37)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (35, N'post_image/48697_cityscape_japan_cityscape_at_night.jpg', 38)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (36, N'post_image/196530854_2701637046800476_7481934314632612286_n.jpg', 38)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (37, N'post_image/anh1.jpg', 38)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (38, N'post_image/181115160846-06-japanese-ryokans-kayotei.webp', 39)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (39, N'post_image/181115161449-11-japanese-ryokans-nishimuraya.webp', 39)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (40, N'post_image/caption (1).jpg', 39)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (41, N'post_image/caption.jpg', 39)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (80, N'post_image/065561c6-87b4-4fff-8966-50a0ec94d2d7_text.gif', 49)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (81, N'post_image/blade-runner-gosling.gif', 49)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (82, N'post_image/iFpzjLj.gif', 49)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (83, N'post_image/5a65fee2dd0fc8bec268a90cd10e34d114f2b7ac_full.jpg', 50)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (84, N'post_image/Screenshot 2024-07-18 142007.png', 51)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (85, N'post_image/Screenshot 2023-03-10 202036.png', 51)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (86, N'post_image/3984be5b9f4b622ff04a078f90350b80.jpg', 40)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (87, N'post_image/181115160846-06-japanese-ryokans-kayotei.webp', 40)
INSERT [dbo].[Image_post] ([id], [image], [post_id]) VALUES (88, N'post_image/181115161449-11-japanese-ryokans-nishimuraya.webp', 40)
SET IDENTITY_INSERT [dbo].[Image_post] OFF
GO
SET IDENTITY_INSERT [dbo].[Incident] ON 

INSERT [dbo].[Incident] ([id], [tenant_id], [landlord_id], [context], [image], [status], [date]) VALUES (7, 1, 1, N'fjhfuewgguew', N'Ảnh chụp màn hình 2024-05-30 161035.png', 1, CAST(N'2024-06-03' AS Date))
INSERT [dbo].[Incident] ([id], [tenant_id], [landlord_id], [context], [image], [status], [date]) VALUES (8, 2, 2, N'fdnbfjhwdf', N'Ảnh chụp màn hình 2024-06-02 081114.png', 1, CAST(N'2024-06-03' AS Date))
INSERT [dbo].[Incident] ([id], [tenant_id], [landlord_id], [context], [image], [status], [date]) VALUES (9, 1, 1, N'xmnjbfds', N'Ảnh chụp màn hình 2024-06-02 081114.png', 1, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[Incident] ([id], [tenant_id], [landlord_id], [context], [image], [status], [date]) VALUES (10, 1, 1, N'minhghfbjdgdg', N'Ảnh chụp màn hình 2024-05-30 161035.png', 1, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[Incident] ([id], [tenant_id], [landlord_id], [context], [image], [status], [date]) VALUES (11, 1, 1, N'jdfhdfusuf', N'Ảnh chụp màn hình 2024-06-02 081114.png', 1, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[Incident] ([id], [tenant_id], [landlord_id], [context], [image], [status], [date]) VALUES (12, 1, 1, N'mfksdmfidnsifndsinfids', N'Ảnh chụp màn hình 2024-06-02 081114.png', 1, CAST(N'2024-06-05' AS Date))
SET IDENTITY_INSERT [dbo].[Incident] OFF
GO
INSERT [dbo].[landlord] ([id], [address], [civil_id], [phone]) VALUES (2, N'Hà Đông', N'01100023412', N'0123456789')
GO
SET IDENTITY_INSERT [dbo].[List_of_post_liked] ON 

INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (79, 36, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (83, 37, 9)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (85, 36, 1)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (86, 37, 1)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (87, 37, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (89, 36, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (90, 37, 11)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (93, 38, 11)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (94, 37, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (95, 38, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (97, 35, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (98, 39, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (110, 49, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (111, 49, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (112, 40, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (113, 49, 1)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (114, 40, 1)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (115, 39, 1)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (116, 49, 11)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (117, 40, 11)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (118, 39, 11)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (120, 50, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (121, 40, 13)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (122, 50, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (123, 38, 2)
INSERT [dbo].[List_of_post_liked] ([id], [post_id], [user_id]) VALUES (124, 35, 2)
SET IDENTITY_INSERT [dbo].[List_of_post_liked] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (52, 11, 2, N'<table border="1"><thead><tr><th>Tên căn hộ được yêu cầu</th><th>Thông tin căn hộ</th><th>Link bài đăng</th></tr></thead><tbody><tr><td>nhà của thịnh 4</td><td><a href="http://localhost:9999/SWP391_Apartment_rental_management_system/ViewApartmentDetail?apartment_id=54">Thông tin căn hộ</a></td><td><a href="http://localhost:9999/SWP391_Apartment_rental_management_system/ApartmentDetail?Apartment_id=54&apartment_post_id=37">link bài đăng</a></td></tr></tbody></table><br>Người gửi yêu cầu : Nguyen Trong Thinh<br><form action="ResponseMessage" method="post"><input hidden name="userTo"  type="text" value="13">  <textarea id="editor" required="" name="description" class="form-control" placeholder="Nhập phản hồi của bạn   " id="floatingTextarea2"  cols="300" rows="10">
                              
                    </textarea>

                    <script>
<input hidden name="apartment"  type="text" value="53">                        ClassicEditor
                                .create(document.querySelector(''#editor''))
                                .catch(error => {
                                    console.error(error);
                                });
                    </script><br>Đã phản hồi</form>', N'Yêu hợp đồng từ khách hàng', 2, CAST(N'2024-07-27T03:20:33.793' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (53, 2, 11, N'<br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang <a href="#">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là<br> đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br><br> Hợp đồng đã được gửi đến chủ nhà và chờ họ phản hồi lại', N'Yêu cầu của bạn đã được chấp nhận', 2, CAST(N'2024-07-27T03:20:51.107' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (54, 13, 2, N'<table border="1"><thead><tr><th>Tên căn hộ được yêu cầu</th><th>Thông tin căn hộ</th><th>Link bài đăng</th></tr></thead><tbody><tr><td>nhà của thịnh 4</td><td><a href="http://localhost:9999/SWP391_Apartment_rental_management_system/ViewApartmentDetail?apartment_id=54">Thông tin căn hộ</a></td><td><a href="http://localhost:9999/SWP391_Apartment_rental_management_system/ApartmentDetail?Apartment_id=54&apartment_post_id=37">link bài đăng</a></td></tr></tbody></table><br>Người gửi yêu cầu : Nguyen Trong Thinh<br><form action="ResponseMessage" method="post"><input hidden name="userTo"  type="text" value="13">  <textarea id="editor" required="" name="description" class="form-control" placeholder="Nhập phản hồi của bạn   " id="floatingTextarea2"  cols="300" rows="10">
                              
                    </textarea>

                    <script>
<input hidden name="apartment"  type="text" value="54">                        ClassicEditor
                                .create(document.querySelector(''#editor''))
                                .catch(error => {
                                    console.error(error);
                                });
                    </script><br>Đã phản hồi</form>', N'Yêu hợp đồng từ khách hàng', 2, CAST(N'2024-07-27T03:28:56.130' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (55, 2, 13, N'<br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang <a href="#">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là<br> đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br><br> Hợp đồng đã được gửi đến chủ nhà và chờ họ phản hồi lại', N'Yêu cầu của bạn đã được chấp nhận', 2, CAST(N'2024-07-27T03:29:24.900' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (56, 2, 13, N'   <div style="font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px;">
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333333;">Thông báo cảm ơn</h1>
            <p>Chào Nguyễn Hoàng Hưng,</p>
            <p>Chúng tôi xin chân thành cảm ơn bạn đã hoàn thành hợp đồng thuê nhà. Sự tin tưởng và ủng hộ của bạn là nguồn động viên lớn đối với chúng tôi.</p>
            <p>Chúng tôi hy vọng rằng bạn đã có một trải nghiệm sống tuyệt vời tại căn nhà của chúng tôi. Nếu bạn có bất kỳ phản hồi hoặc góp ý nào, vui lòng chia sẻ để chúng tôi có thể cải thiện dịch vụ tốt hơn nữa.</p>
            <p>Rất mong sẽ được tiếp tục phục vụ bạn trong tương lai.</p>
            <p>Trân trọng,</p>
            <p>Nguyen Trong Thinh</p>
        </div>
    </div>
', N'Phản hồi của chủ nhà về hợp đồng', 2, CAST(N'2024-07-27T14:34:33.347' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (57, 2, 13, N'   <div style="font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px;">
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333333;">Thông báo cảm ơn</h1>
            <p>Chào Nguyễn Hoàng Hưng,</p>
            <p>Chúng tôi xin chân thành cảm ơn bạn đã hoàn thành hợp đồng thuê nhà. Sự tin tưởng và ủng hộ của bạn là nguồn động viên lớn đối với chúng tôi.</p>
            <p>Chúng tôi hy vọng rằng bạn đã có một trải nghiệm sống tuyệt vời tại căn nhà của chúng tôi. Nếu bạn có bất kỳ phản hồi hoặc góp ý nào, vui lòng chia sẻ để chúng tôi có thể cải thiện dịch vụ tốt hơn nữa.</p>
            <p>Rất mong sẽ được tiếp tục phục vụ bạn trong tương lai.</p>
            <p>Trân trọng,</p>
            <p>Nguyen Trong Thinh</p>
        </div>
    </div>
', N'Phản hồi của chủ nhà về hợp đồng', 2, CAST(N'2024-07-27T14:37:28.923' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (58, 2, 13, N'   <div style="font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px;">
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333333;">Thông báo cảm ơn</h1>
            <p>Chào Nguyễn Hoàng Hưng,</p>
            <p>Chúng tôi xin chân thành cảm ơn bạn đã hoàn thành hợp đồng thuê nhà. Sự tin tưởng và ủng hộ của bạn là nguồn động viên lớn đối với chúng tôi.</p>
            <p>Chúng tôi hy vọng rằng bạn đã có một trải nghiệm sống tuyệt vời tại căn nhà của chúng tôi. Nếu bạn có bất kỳ phản hồi hoặc góp ý nào, vui lòng chia sẻ để chúng tôi có thể cải thiện dịch vụ tốt hơn nữa.</p>
            <p>Rất mong sẽ được tiếp tục phục vụ bạn trong tương lai.</p>
            <p>Trân trọng,</p>
            <p>Nguyen Trong Thinh</p>
        </div>
    </div>
', N'Phản hồi của chủ nhà về hợp đồng', 2, CAST(N'2024-07-27T14:41:02.040' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (59, 2, 13, N'   <div style="font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px;">
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333333;">Thông báo cảm ơn</h1>
            <p>Chào Nguyễn Hoàng Hưng,</p>
            <p>Chúng tôi xin chân thành cảm ơn bạn đã hoàn thành hợp đồng thuê nhà. Sự tin tưởng và ủng hộ của bạn là nguồn động viên lớn đối với chúng tôi.</p>
            <p>Chúng tôi hy vọng rằng bạn đã có một trải nghiệm sống tuyệt vời tại căn nhà của chúng tôi. Nếu bạn có bất kỳ phản hồi hoặc góp ý nào, vui lòng chia sẻ để chúng tôi có thể cải thiện dịch vụ tốt hơn nữa.</p>
            <p>Rất mong sẽ được tiếp tục phục vụ bạn trong tương lai.</p>
            <p>Trân trọng,</p>
            <p>Nguyen Trong Thinh</p>
        </div>
    </div>
', N'Phản hồi của chủ nhà về hợp đồng', 2, CAST(N'2024-07-27T14:56:01.510' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (60, 2, 13, N'<table border="1"><thead><tr><th>Tên căn hộ được yêu cầu</th><th>Thông tin căn hộ</th><th>Link bài đăng</th></tr></thead><tbody><tr><td>nhà của thịnh 4</td><td><a href="http://localhost:9999/SWP391_Apartment_rental_management_system/ViewApartmentDetail?apartment_id=54">Thông tin căn hộ</a></td><td><a href="http://localhost:9999/SWP391_Apartment_rental_management_system/ApartmentDetail?Apartment_id=54&apartment_post_id=37">link bài đăng</a></td></tr></tbody></table><br>Người gửi yêu cầu : Nguyễn Hoàng Hưng<br><form action="ResponseMessage" method="post"><input hidden name="userTo"  type="text" value="13">  <textarea id="editor" required="" name="description" class="form-control" placeholder="Nhập phản hồi của bạn   " id="floatingTextarea2"  cols="300" rows="10">
                              
                    </textarea>

                    <script>
<input hidden name="apartment"  type="text" value="70">                        ClassicEditor
                                .create(document.querySelector(''#editor''))
                                .catch(error => {
                                    console.error(error);
                                });
                    </script><br>Đã phản hồi</form>', N'Yêu hợp đồng từ khách hàng', 2, CAST(N'2024-07-27T23:02:24.653' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (61, 13, 2, N'   ok bạn ơi sang lấy nhà                           
                    <br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang <a href="AddContract?apartment=70&landlord_id=13&notification=61">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là<br> đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br>', N'Yêu cầu của bạn đã được chấp nhận', 2, CAST(N'2024-07-27T23:03:54.577' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (62, 13, 2, N'<br>Bây giờ bạn có thể nhấn vào đường link dẫn đến trang <a href="#">hợp đồng</a> này .<br>Sau khi bạn đã điền đầy đủ thông tin cần thiết,hãy nhấn vào nút gửi đơn để chúng tôi có thể xác<br>thực thông tin trên hợp đồng là chính xác thì bạn đã hoàn thành hợp đồng.Việc còn lại của bạn là<br> đến gặp chủ nhà và bắt đầu cuộc sống mới tại một nơi ở mới.<br> Chúc bạn có một ngày tốt lành.<br><br><br> Hợp đồng đã được gửi đến chủ nhà và chờ họ phản hồi lại', N'Yêu cầu của bạn đã được chấp nhận', 2, CAST(N'2024-07-27T23:03:57.950' AS DateTime))
INSERT [dbo].[Notification] ([id], [From_user_id], [To_user_id], [message], [title], [status], [time]) VALUES (63, 13, 2, N'   <div style="font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px;">
        <div style="max-width: 600px; margin: 0 auto; background-color: #ffffff; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
            <h1 style="color: #333333;">Thông báo cảm ơn</h1>
            <p>Chào Nguyen Trong Thinh,</p>
            <p>Chúng tôi xin chân thành cảm ơn bạn đã hoàn thành hợp đồng thuê nhà. Sự tin tưởng và ủng hộ của bạn là nguồn động viên lớn đối với chúng tôi.</p>
            <p>Chúng tôi hy vọng rằng bạn đã có một trải nghiệm sống tuyệt vời tại căn nhà của chúng tôi. Nếu bạn có bất kỳ phản hồi hoặc góp ý nào, vui lòng chia sẻ để chúng tôi có thể cải thiện dịch vụ tốt hơn nữa.</p>
            <p>Rất mong sẽ được tiếp tục phục vụ bạn trong tương lai.</p>
            <p>Trân trọng,</p>
            <p>Nguyễn Hoàng Hưng</p>
        </div>
    </div>
', N'Phản hồi của chủ nhà về hợp đồng', 2, CAST(N'2024-07-27T23:07:57.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Payement_method] ON 

INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (1, N'Basic', N'Là loại tin đăng có tiêu đề màu đen', CAST(70000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (2, N'Silver', N'Là loại tin đăng có tiêu đề màu xanh', CAST(140000 AS Decimal(18, 0)), 3)
INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (3, N'Gold', N'Là loại tin đăng có tiêu đề màu vàng', CAST(280000 AS Decimal(18, 0)), 4)
INSERT [dbo].[Payement_method] ([id], [name], [description], [price], [week]) VALUES (4, N'Diamond', N'Là loại tin đăng có tiêu đề màu đỏ', CAST(560000 AS Decimal(18, 0)), 5)
SET IDENTITY_INSERT [dbo].[Payement_method] OFF
GO
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (1, N'Kệ TV', 1, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/TVShelf.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (2, N'Tủ trang trí', 1, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/DecorativeCabinet.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (3, N'Bàn ghế phòng khách', 1, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/LivingRoomFurniture.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (4, N'Giường ngủ', 2, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/Bed.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (5, N'Bàn phấn', 2, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/MakeupTable.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (6, N'Tủ quần áo', 2, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/Wardrobe.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (7, N'Tủ bếp', 4, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/KitchenCabinets.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (8, N'Bàn ăn', 4, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/DiningTable.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (9, N'Máy hút mùi', 4, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/Hood.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (10, N'BÌnh nóng lạnh', 3, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/StorageWaterHeater.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (11, N'Bồn tắm', 3, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/Bathtub.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (12, N'Vòi hoa sen', 3, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/Shower.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (13, N'Bồn rửa mặt', 3, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/Washstand.png')
INSERT [dbo].[Property] ([id], [name], [room_id], [image]) VALUES (14, N'Bồn cầu', 3, N'https://static.homedy.com/themes/default/images/icons/Project/Property/PNG/ToiletBowl.png')
SET IDENTITY_INSERT [dbo].[Property] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (2, N'Landlord')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (3, N'Tenant')
INSERT [dbo].[Role] ([id], [role_name]) VALUES (4, N'Guess')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([id], [name]) VALUES (1, N'Livingroom')
INSERT [dbo].[Room] ([id], [name]) VALUES (2, N'Bedroom')
INSERT [dbo].[Room] ([id], [name]) VALUES (3, N'Bathroom')
INSERT [dbo].[Room] ([id], [name]) VALUES (4, N'Kitchen')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
INSERT [dbo].[Tenant] ([id], [civil_id], [phone]) VALUES (6, N'012830123802183', N'0192837465')
INSERT [dbo].[Tenant] ([id], [civil_id], [phone]) VALUES (7, N'873284238463246', N'0987612345')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (1, N'thinhnnthe172159@gmail.com', N'123', 1, 0, N'Nguyễn Trọng', N'Thịnh', CAST(N'1990-02-02' AS Date), N'userImage/5a65fee2dd0fc8bec268a90cd10e34d114f2b7ac_full.jpg', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (2, N'player7377@gmail.com', N'123', 2, 0, N'Nguyen Trong', N'Thinh', CAST(N'1992-02-04' AS Date), N'userImage/danh dep.jpg', CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (6, N'LeHUy1991@gmail.com', N'123', 3, 0, N'Lê Đức', N'Huy', CAST(N'1991-04-19' AS Date), NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (7, N'vn784928@gmail.com', N'123', 3, 0, N'Nguyễn Trọng', N'Vũ', CAST(N'2000-02-03' AS Date), NULL, CAST(5900000 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (9, N'LeHUy1991@gmail.com', N'Huyhuyhuy1', 2, 0, N'Lê Đức', N'Huy', CAST(N'1991-04-19' AS Date), N'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/82885488_481004442831863_4147039134743003136_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=53a332&_nc_eui2=AeEg4P2VmIUvmGfQMhVpexWO9hmKgEztgSn2GYqATO2BKc4WUnq2jUyWR5dKIdyGA5Zcjkk0DnDFsB2jlYaNkFBN&_nc_ohc=HHgWTsl6M0UQ7kNvgFhgcMk&_nc_ht=scontent.fhan2-4.fna&oh=00_AYBGbYMLi6RQEBjVBMBaRrVOVcnuGCTVqFuDkJeStwA8KA&oe=66A48DFC', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (11, N'vuminh05022003@gmail.com', N'050203', 4, 0, N'Vu Dinh', N'Minh', CAST(N'2001-01-28' AS Date), N'data:image/jpeg;base64,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', CAST(35460000 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (12, N'player7377@gmail.com', NULL, 4, 0, N'Steffinguyen', N'', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocL2NH9oyBUi23yRoMpajSfnA7zFzG1x7blDvLf-bFu-0YFctnqT=s96-c', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[User] ([id], [email], [password], [role_id], [status], [first_name], [last_name], [dob], [image], [money]) VALUES (13, N'nguyenhung080803@gmail.com', N'Hungnguyen123', 4, 0, N'Nguyễn Hoàng', N'Hưng', CAST(N'2003-08-08' AS Date), N'https://www.giantbomb.com/a/uploads/scale_small/8/80630/1664480-left_4_dead_2_conceptart_buxvq.png', CAST(21920000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_Apartment_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[Apartment_type] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_Apartment_type]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_User]
GO
ALTER TABLE [dbo].[Aparment]  WITH CHECK ADD  CONSTRAINT [FK_Aparment_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Aparment] CHECK CONSTRAINT [FK_Aparment_User1]
GO
ALTER TABLE [dbo].[Apartment_image]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_image_Aparment] FOREIGN KEY([Apartment_id])
REFERENCES [dbo].[Aparment] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Apartment_image] CHECK CONSTRAINT [FK_Apartment_image_Aparment]
GO
ALTER TABLE [dbo].[Apartment_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Posts_Aparment] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Apartment_Posts] CHECK CONSTRAINT [FK_Apartment_Posts_Aparment]
GO
ALTER TABLE [dbo].[Apartment_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Posts_Payement_method] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payement_method] ([id])
GO
ALTER TABLE [dbo].[Apartment_Posts] CHECK CONSTRAINT [FK_Apartment_Posts_Payement_method]
GO
ALTER TABLE [dbo].[Apartment_Posts]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Posts_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Apartment_Posts] CHECK CONSTRAINT [FK_Apartment_Posts_User]
GO
ALTER TABLE [dbo].[Apartment_room]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_room_Aparment] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[Aparment] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Apartment_room] CHECK CONSTRAINT [FK_Apartment_room_Aparment]
GO
ALTER TABLE [dbo].[Apartment_room]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_room_Property] FOREIGN KEY([property_id])
REFERENCES [dbo].[Property] ([id])
GO
ALTER TABLE [dbo].[Apartment_room] CHECK CONSTRAINT [FK_Apartment_room_Property]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Community_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Community_post] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Community_post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Community_post]  WITH CHECK ADD  CONSTRAINT [FK_Community_post_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Community_post] CHECK CONSTRAINT [FK_Community_post_User]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Aparment] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[Aparment] ([id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Aparment]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User] FOREIGN KEY([landlord_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User1] FOREIGN KEY([tenant_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_User1]
GO
ALTER TABLE [dbo].[Image_post]  WITH CHECK ADD  CONSTRAINT [FK_Image_post_Community_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Community_post] ([id])
GO
ALTER TABLE [dbo].[Image_post] CHECK CONSTRAINT [FK_Image_post_Community_post]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_User] FOREIGN KEY([landlord_id])
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
ALTER TABLE [dbo].[List_of_post_liked]  WITH CHECK ADD  CONSTRAINT [FK_List_of_post_liked_Community_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Community_post] ([id])
GO
ALTER TABLE [dbo].[List_of_post_liked] CHECK CONSTRAINT [FK_List_of_post_liked_Community_post]
GO
ALTER TABLE [dbo].[List_of_post_liked]  WITH CHECK ADD  CONSTRAINT [FK_List_of_post_liked_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[List_of_post_liked] CHECK CONSTRAINT [FK_List_of_post_liked_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User] FOREIGN KEY([From_user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User1] FOREIGN KEY([To_user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_User1]
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
ALTER TABLE [dbo].[Save_post]  WITH CHECK ADD  CONSTRAINT [FK_Save_post_Community_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Community_post] ([id])
GO
ALTER TABLE [dbo].[Save_post] CHECK CONSTRAINT [FK_Save_post_Community_post]
GO
ALTER TABLE [dbo].[Save_post]  WITH CHECK ADD  CONSTRAINT [FK_Save_post_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Save_post] CHECK CONSTRAINT [FK_Save_post_User]
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
ALTER TABLE [dbo].[Whislist]  WITH CHECK ADD  CONSTRAINT [FK_Whislist_Apartment_Posts] FOREIGN KEY([Apartment_Post_id])
REFERENCES [dbo].[Apartment_Posts] ([id])
GO
ALTER TABLE [dbo].[Whislist] CHECK CONSTRAINT [FK_Whislist_Apartment_Posts]
GO
ALTER TABLE [dbo].[Whislist]  WITH CHECK ADD  CONSTRAINT [FK_Whislist_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Whislist] CHECK CONSTRAINT [FK_Whislist_User]
GO
/****** Object:  StoredProcedure [dbo].[list_apartment_post_pagging]    Script Date: 7/28/2024 11:56:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  

 create proc [dbo].[list_apartment_post_pagging]
 @PageIndex INT,
 @pageSize int
 as
 begin
 declare @startIndex int =(@pageIndex-1)*@pageSize
	SELECT * FROM [ams].[dbo].[Apartment_Posts]
	
	order by [post_start] desc
	offset @startIndex rows 
	fetch next @pageSize rows only

 end
GO
USE [master]
GO
ALTER DATABASE [ams] SET  READ_WRITE 
GO
