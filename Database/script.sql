USE [master]
GO
/****** Object:  Database [EduOnline]    Script Date: 2/8/2022 9:08:30 PM ******/
CREATE DATABASE [EduOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EduOnline', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EduOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EduOnline_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EduOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EduOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EduOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EduOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EduOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EduOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EduOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EduOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [EduOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EduOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EduOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EduOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EduOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EduOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EduOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EduOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EduOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EduOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EduOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EduOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EduOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EduOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EduOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EduOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EduOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EduOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EduOnline] SET  MULTI_USER 
GO
ALTER DATABASE [EduOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EduOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EduOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EduOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EduOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EduOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EduOnline] SET QUERY_STORE = OFF
GO
USE [EduOnline]
GO
/****** Object:  Table [dbo].[AppRole]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppRole](
	[id] [bigint] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[fullname] [varchar](100) NULL,
	[address] [varchar](200) NULL,
	[email] [varchar](100) NOT NULL,
	[avatar_image] [text] NULL,
	[phone] [varchar](12) NULL,
	[enabled] [bit] NULL,
	[role_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[description] [text] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[subcatalog_id] [bigint] NULL,
	[title] [varchar](255) NULL,
	[short_description] [text] NULL,
	[description] [text] NULL,
	[requirement] [text] NULL,
	[who_this_course_is_for] [text] NULL,
	[what_you_will_learn] [text] NULL,
	[activate] [bit] NULL,
	[price] [decimal](18, 0) NULL,
	[video_duration] [varchar](50) NULL,
	[language] [varchar](10) NULL,
	[url_video_description] [varchar](255) NULL,
	[image_video_description] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[customer_id] [bigint] NULL,
	[score] [varchar](10) NULL,
	[comment] [text] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lesson_id] [bigint] NULL,
	[title] [varchar](255) NULL,
	[sort] [int] NULL,
	[video_url] [varchar](255) NULL,
	[video_duration] [varchar](50) NULL,
	[preview] [bit] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_ContentLesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[title] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[order_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(100,1) NOT NULL,
	[order_number] [char](12) NULL,
	[customer_id] [bigint] NULL,
	[payment_id] [bigint] NULL,
	[total_amount] [decimal](18, 0) NULL,
	[status_order] [bit] NULL,
	[date_order] [date] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [bigint] NOT NULL,
	[user_id] [bigint] NULL,
	[amount] [decimal](18, 0) NULL,
	[fee] [decimal](18, 0) NULL,
	[total_amount] [decimal](18, 0) NULL,
	[date_payment] [date] NULL,
	[card_number] [varchar](9) NULL,
	[name_holder] [varchar](250) NULL,
	[expiration_date] [date] NULL,
	[cvv] [varchar](3) NULL,
	[status] [bit] NULL,
	[created_date] [date] NULL,
	[updated_date] [date] NULL,
	[deleted_date] [date] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCatalog]    Script Date: 2/8/2022 9:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCatalog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[catalog_id] [bigint] NULL,
	[name] [varchar](255) NULL,
	[description] [text] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_SubCatalog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AppRole] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[AppRole] ([id], [name]) VALUES (2, N'ROLE_USER')
GO
SET IDENTITY_INSERT [dbo].[AppUser] ON 

INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (1, N'admin', N'$2a$10$1gbB.l.MWG/vl4z2nHojIOEP0HSVf3AbAxSESrs48c9zqYbgazJj2', NULL, NULL, N'admin@gmail.com', NULL, NULL, 1, 1, NULL, CAST(N'2021-12-28T18:27:46.737' AS DateTime), NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (2, N'user', N'$2a$10$U/azznwkJb8w/7n5LjBUd.0SaUL/FQEHdN1n3VhtOK36kGOAjhuI2', NULL, NULL, N'user@gmail.com', NULL, NULL, 1, 2, NULL, NULL, NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (6, N'user1', N'$2a$10$2av9ql9cfx0tru2k7lS43.bJryGN7APP1naCZTYV58dhI2zDlLEBi', N'Lam', N'thai binh', N'user1@gmail.com', NULL, N'012453245', 1, 2, CAST(N'2022-01-19T00:05:28.117' AS DateTime), NULL, CAST(N'2022-01-21T23:27:07.407' AS DateTime))
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (7, N'user2', N'$2a$10$wQxmDIJ6dkJU.NqzmNu8kOh.unlHx.prig53U8nUjQiaVH/s59NvG', N'Lam', NULL, N'user2@gmail.com', NULL, NULL, 1, 1, CAST(N'2022-01-19T00:20:05.103' AS DateTime), NULL, NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (8, N'user3', N'$2a$10$l/zYhJaY68.JXUcLl6hy8ebQOrpOuSvyimAiky95j8z21R.3/m6Tu', N'Lam', N'thai binh', N'user3@gmail.com', NULL, N'012453245', 1, 2, CAST(N'2022-01-19T00:26:29.327' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[AppUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (1, N'Dev', N'hello', NULL, NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (2, N'Hel', NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (3, N'Mal', NULL, NULL, NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (4, N'javacore', NULL, CAST(N'2022-01-21T21:01:28.160' AS DateTime), CAST(N'2022-01-21T21:16:30.710' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (1, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', NULL, NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (2, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', NULL, NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (3, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', NULL, NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (4, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', NULL, NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (5, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10002, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', CAST(N'2022-02-08T20:30:47.697' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10003, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', CAST(N'2022-02-08T20:31:57.423' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10005, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', CAST(N'2022-02-08T20:44:38.570' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10006, 1, N'test1', N'test1', N'test1', N'test1', N'test1', N'test1', 0, CAST(100 AS Decimal(18, 0)), N'test1', N'ENG', N'test1', N'test1', CAST(N'2022-02-08T20:58:45.190' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Lecture] ON 

INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (1, 2, N'test1', 1, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:44:38.583' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (2, 2, N'test2', 2, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:44:38.600' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (3, 3, N'test1', 1, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:44:38.613' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (4, 3, N'test2', 2, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:44:38.617' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (5, 4, N'test1', 1, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:58:45.233' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (6, 4, N'test2', 2, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:58:45.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (7, 5, N'test1', 1, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:58:45.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (8, 5, N'test2', 2, N'https://www.youtube.com/', N'150', 0, CAST(N'2022-02-08T20:58:45.263' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lecture] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (2, 10005, N'test1', CAST(N'2022-02-08T20:44:38.580' AS DateTime), NULL, NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (3, 10005, N'test2', CAST(N'2022-02-08T20:44:38.610' AS DateTime), NULL, NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (4, 10006, N'test1', CAST(N'2022-02-08T20:58:45.217' AS DateTime), NULL, NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (5, 10006, N'test2', CAST(N'2022-02-08T20:58:45.260' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCatalog] ON 

INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (1, 1, N'Eng', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (2, 1, N'C#', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (3, 1, N'Java', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (4, 2, N'Kello', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (5, 2, N'Hemm', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (6, 2, N'Okfh', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (7, 3, N'hehi', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (8, 4, N'java', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (9, 4, N'spring', NULL, CAST(N'2022-01-21T22:09:02.037' AS DateTime), CAST(N'2022-01-21T22:11:36.780' AS DateTime), NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (10, 3, N'spring boot', NULL, CAST(N'2022-01-21T22:11:26.727' AS DateTime), CAST(N'2022-02-07T19:49:23.207' AS DateTime), NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (11, 4, N'spring boot', NULL, CAST(N'2022-01-21T22:13:21.740' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCatalog] OFF
GO
ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD  CONSTRAINT [FK_AppUser_AppRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[AppRole] ([id])
GO
ALTER TABLE [dbo].[AppUser] CHECK CONSTRAINT [FK_AppUser_AppRole]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_SubCatalog] FOREIGN KEY([subcatalog_id])
REFERENCES [dbo].[SubCatalog] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_SubCatalog]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_AppUser] FOREIGN KEY([customer_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_AppUser]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Course]
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_ContentLesson_Lesson] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[Lesson] ([id])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK_ContentLesson_Lesson]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Course]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AppUser] FOREIGN KEY([customer_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AppUser]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payment] FOREIGN KEY([payment_id])
REFERENCES [dbo].[Payment] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_AppUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_AppUser]
GO
ALTER TABLE [dbo].[SubCatalog]  WITH CHECK ADD  CONSTRAINT [FK_SubCatalog_Catalog] FOREIGN KEY([catalog_id])
REFERENCES [dbo].[Catalog] ([id])
GO
ALTER TABLE [dbo].[SubCatalog] CHECK CONSTRAINT [FK_SubCatalog_Catalog]
GO
USE [master]
GO
ALTER DATABASE [EduOnline] SET  READ_WRITE 
GO
