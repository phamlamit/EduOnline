USE [master]
GO
/****** Object:  Database [EduOnline]    Script Date: 3/5/2022 2:21:15 PM ******/
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
ALTER DATABASE [EduOnline] SET  ENABLE_BROKER 
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
ALTER DATABASE [EduOnline] SET RECOVERY FULL 
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
/****** Object:  Table [dbo].[AppRole]    Script Date: 3/5/2022 2:21:15 PM ******/
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
/****** Object:  Table [dbo].[AppUser]    Script Date: 3/5/2022 2:21:15 PM ******/
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
/****** Object:  Table [dbo].[Catalog]    Script Date: 3/5/2022 2:21:15 PM ******/
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
/****** Object:  Table [dbo].[Conversation]    Script Date: 3/5/2022 2:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id_one] [bigint] NULL,
	[user_id_two] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 3/5/2022 2:21:16 PM ******/
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
	[update_date] [date] NULL,
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/5/2022 2:21:16 PM ******/
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
/****** Object:  Table [dbo].[Lecture]    Script Date: 3/5/2022 2:21:16 PM ******/
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
/****** Object:  Table [dbo].[Lesson]    Script Date: 3/5/2022 2:21:16 PM ******/
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
/****** Object:  Table [dbo].[Messages]    Script Date: 3/5/2022 2:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[conversation_id] [bigint] NULL,
	[message] [text] NULL,
	[responsed] [bit] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Messages_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/5/2022 2:21:16 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 3/5/2022 2:21:16 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 3/5/2022 2:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[order_id] [varchar](50) NULL,
	[amount] [decimal](18, 0) NULL,
	[date_payment] [date] NULL,
	[status] [bit] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 3/5/2022 2:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ratting] [float] NULL,
	[feedback] [varchar](255) NULL,
	[customer_id] [bigint] NULL,
	[course_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedCourse]    Script Date: 3/5/2022 2:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedCourse](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_SavedCourse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCatalog]    Script Date: 3/5/2022 2:21:16 PM ******/
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

INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (1, N'admin', N'$2a$10$PwBC/zQmFSFitjoLRftU..H6OAJ5N0pshnJRD33uapNRaesfhpZfW', N'Admin', N'HCM', N'admin@gmail.com', N'http://globalmatrixsolution.com/wp-content/uploads/2018/06/cutomer-icon-copy.png', N'12321', 1, 1, CAST(N'2021-12-28T18:27:46.737' AS DateTime), CAST(N'2022-03-03T11:24:05.110' AS DateTime), NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (2, N'user', N'$2a$10$U/azznwkJb8w/7n5LjBUd.0SaUL/FQEHdN1n3VhtOK36kGOAjhuI2', N'User', N'HCM', N'user@gmail.com', N'https://i.pinimg.com/originals/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg', N'0123456', 1, 2, CAST(N'2022-01-19T00:05:28.117' AS DateTime), NULL, NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (6, N'user1', N'$2a$10$2av9ql9cfx0tru2k7lS43.bJryGN7APP1naCZTYV58dhI2zDlLEBi', N'Lam', N'thai binh', N'user1@gmail.com', N'https://i.pinimg.com/originals/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg', N'012453245', 1, 2, CAST(N'2022-01-19T00:05:28.117' AS DateTime), NULL, CAST(N'2022-01-21T23:27:07.407' AS DateTime))
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (7, N'user2', N'$2a$10$wQxmDIJ6dkJU.NqzmNu8kOh.unlHx.prig53U8nUjQiaVH/s59NvG', N'Lam', N'HCM', N'user2@gmail.com', N'https://i.pinimg.com/originals/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg', N'0123456', 1, 2, CAST(N'2022-01-19T00:20:05.103' AS DateTime), NULL, NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (8, N'user3', N'$2a$10$l/zYhJaY68.JXUcLl6hy8ebQOrpOuSvyimAiky95j8z21R.3/m6Tu', N'Lam', N'HCM', N'user3@gmail.com', N'https://i.pinimg.com/originals/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg', N'012453245', 1, 2, CAST(N'2022-01-19T00:26:29.327' AS DateTime), NULL, NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (9, N'user4', N'$2a$10$Lx0qS92OclDWO88ItQVlXOW6RFInudwLU7sKYNn300yBIXDiF.4MK', N'Lam', N'HCM', N'user4@gmail.com', N'https://i.pinimg.com/originals/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg', N'0123456', 1, 2, CAST(N'2022-02-25T23:45:23.113' AS DateTime), CAST(N'2022-02-25T23:50:42.510' AS DateTime), NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (10, N'newTest', N'$2a$10$gjmLDLwrsnr0jhDhcRmifuiv8HD9VPBNoIICxAHkwys/5xdCSCsDS', N'newTestName', N'HCM', N'newgmail', N'https://i.pinimg.com/originals/64/81/22/6481225432795d8cdf48f0f85800cf66.jpg', N'0123123132', 1, 2, CAST(N'2022-03-02T14:34:27.517' AS DateTime), CAST(N'2022-03-02T14:34:27.517' AS DateTime), NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (11, N'newTest1', N'$2a$10$.DOn4tsfuDeOvvjVYYJa3.VHXmU43k/K7.ThKLE32fySNLcxwL1j6', N'aaaaaaaaaaaaaaaa', N'HCM', N'newgmai1l', N'https://www.vectorstock.com/royalty-free-vector/flat-business-man-user-profile-avatar-icon-vector-4333097', NULL, 0, 2, CAST(N'2022-03-02T14:34:50.007' AS DateTime), CAST(N'2022-03-02T19:17:38.337' AS DateTime), CAST(N'2022-03-02T19:17:38.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[AppUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (1, N'Development', N'This course gives students experience designing, implementing, testing, and debugging large programs. Students will also get advanced Java programming experience; covering topics such as inheritance, multithreading, networking, database programming, and web development', CAST(N'2022-01-21T21:01:28.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (2, N'Design', N'This course introduces the techniques used in typography, which is the visual communication of information through type. A historical perspective will trace the development of typography from its beginning to its current use in graphic design. Students will learn about the transition from traditional techniques and concepts to the creation of electronic documents utilizing quality typographic work. Attention to detail will be stressed so that students have an opportunity to acquire and demonstrate the use of the typographic skills necessary in today''s graphic design work.', CAST(N'2022-01-21T21:01:28.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (3, N'Bussiness', N'A smart business decision maker understands how to make their organization more profitable and productive through the use of technology. With a BAIS major, you can be that decision maker. Open the door to big-time careers where you''ll help your company succeed with the power of data.', CAST(N'2022-01-21T21:01:28.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (4, N'Marketing', N'Studying marketing means becoming a valuable employee in any industry. Marketing is everywhere, so it''s easy for us to find interesting, real-world experience for you. Some students create a social media campaign for a local restaurant, others get to design a brand new website. There''s so much to do, so we''ve narrowed marketing down to four specific tracks. Choose the one that fits your interests and personality and grow into a stand-out marketer.', CAST(N'2022-01-21T21:01:28.160' AS DateTime), CAST(N'2022-01-21T21:16:30.710' AS DateTime), NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (5, N'Finace & Accounting', N'In addition to meeting with your advisor throughout your time at Tippie, you''ll also use the course planning worksheet—it will help you know what courses you need to take for your major, as well as help you plan when you''ll take them. Plan your course schedule with the worksheet and read about the courses you''ll be taking below.', CAST(N'2022-01-21T21:01:28.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Catalog] ([id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (10, N'Personal Development', N'Personal development consists of activities that develop a person''s capabilities and potential, build human capital, facilitate employability, and enhance quality of life and the realization of dreams and aspirations', CAST(N'2000-04-04T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[Conversation] ON 

INSERT [dbo].[Conversation] ([id], [user_id_one], [user_id_two], [created_date], [updated_date], [deleted_date]) VALUES (1, 2, 1, CAST(N'2022-03-02T12:04:56.827' AS DateTime), CAST(N'2022-03-02T12:04:56.827' AS DateTime), NULL)
INSERT [dbo].[Conversation] ([id], [user_id_one], [user_id_two], [created_date], [updated_date], [deleted_date]) VALUES (2, 7, 1, CAST(N'2022-03-02T13:01:49.317' AS DateTime), CAST(N'2022-03-02T13:01:49.317' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Conversation] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (1, 1, N'JavaScript', N'Javascript for Beginners', N'Take this Javascript training course and start learning Javascript today.

"As a business guy I have no place in programming." Ten years ago you could have gotten away with that statement. Today you say that to your colleagues and they scoff at you before they go back to their computers to fix real problems and do real work.

If you want to do something useful start by learning Javascript . In these days when the browser is central to all computer use knowing "the language of the browser" is the most important step. A few years ago Javascript potential was uncertain and many programmers considered it useless. These days however competent programmers have identified Javascript real potential and uses and it has gone from a toy language to the main language of the browser. It has become one of the most useful languages of this era. Every developer needs at least a basic understanding of Javascript. A developer who knows Javascript is the rockstar of the company and is in constant demand by employers. Our online Javascript

course will get you started by teaching all the essential aspects of coding in Javascript. So... what''s it gonna be? Do you want to supercharge your career and be in constant demand by employers? Do you want to learn how to create dynamic and innovative Javascript documents? Start programming today with our Javascript course for Beginners training and take control of', NULL, N'Web Designers looking to improve their skill set
Programmers who need to learn Javascript for their web applications
People looking to start programming and need a first programming language to learn
Students who want to learn Javascript
People who manage a web site as a volunteer or as a hobby
Bloggers-- even if you use Wordpress or another CMS!
Anyone else who wants to learn Javascript', N'Extensive, informative and interesting video lecture
Complete Code demonstrated in lecture
Lab Exercises
Lab Solution Sets
All Powerpoint Demonstrations Used in Course
Instructor contact Email for questions and clarifications
Coverage of all important primary Javascript concepts', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'https://cdn.tgdd.vn/hoi-dap/1321801/javascript-la-gi-co-vai-tro-gi-cach-bat-javascript-tren.001.jpg', CAST(N'2022-01-22T12:38:26.683' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (2, 1, N'React', N'The quick guide to learn basic concepts and workflow of how to build React app', N'This short course will cover basic and core concepts that you need to know to get up and running with ReactJS.

React JS is a Javascript library for building user interfaces. It''s flexible, fast, easy to learn and fun to work with. ReactJS is designed to make the process of building modular, reusable user interface components simple and intuitive. React was developed at Facebook and focuses on the ''View'' aspect of MVC in web applications. React was built for the purpose of developing applications that are large in nature and have to deal with time changing data.

Also in this course, it will get you up to speed quickly with easy to follow short videos. It is project-oriented with hands-on examples, from simple to complex, that will help you with the most fundamentals concepts of React', NULL, N'Anyone who want to learn React without much knowledge of HTML or CSS.', N'Taste of how to build your very first React component.
How to handle event in components.
Understand two key concepts of React: State and Props.
How to reuse and nest components.
How to transfer data between Parent, Child components.', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/x0fSBAgBrOQ?list=PL_-VfJajZj0UXjlKfBwFX73usByw3Ph9Q', N'https://codelearn.io/Upload/Blog/react-js-co-ban-phan-1-63738082145.3856.jpg', CAST(N'2022-01-22T12:38:26.683' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (3, 1, N'CSS', N'Learn how to code in CSS in 1 hour. This class is set up for complete beginners!', N'In this tutorial series you get to learn about CSS. CSS is the number design language for the web. CSS is easy to learn and it is used in most web development today. This course is a 1 hour course of action packed material. By the end of it you will have a firm understanding of the concepts of CSS. ', NULL, N'People who want to learn about web development', N'Learn how to become a web developer
Learn CSS
Learn how to design websites', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://blog.haposoft.com/content/images/size/w2000/2021/10/6d07a36ebe6d55273b39440f2391f1d7e6d4092a.png', CAST(N'2022-01-22T12:38:26.683' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (4, 1, N'Angular', N'Have limited time to learn Angular 4 (Angular 2+)? Take this course and learn Angular in 10 hours!', N'Chances are you have heard that Angular developers are in demand these days. And you are here to learn Angular fast. 



There are tons of great courses out there for learning Angular. But most these courses are more than 20 hours long. If you''re a busy developer and need to quickly pick up Angular, this is the ideal course for you. 



This course contains 20 hours of content but you only need to watch the first 10 hours. The other 10 hours are recorded with an earlier version of Angular. You don''t need to watch those videos. 



So, in  just 10 hours, you can learn all the essential Angular concepts! You can simply dedicate a weekend to this course and by the end of the weekend you''ll have a good understanding of Angular and you''ll be able to build real client apps with Angular. ', NULL, N'Web developers wanting to build apps with Angular 2+', N'Master the essential Angular concepts
Troubleshoot common runtime errors
Write cleaner, more maintainable code', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/k5E2AVpwsko', N'https://www.hostinger.com/tutorials/wp-content/uploads/sites/2/2019/04/angular-homepage.jpg', CAST(N'2022-01-22T12:38:26.683' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (5, 1, N'NodeJs', N'Create & Deploy High Performance Node JS Apps on the Cloud and More !', N'NodeJS is a platform that allows developers to write server side high performance and networked applications. And that too using good old Javascript. But wait ! Isn''t Javascript meant to be used for forms and stuff on web pages ?

Well that was 10 years ago. The world has gone from ''Oops! You''ve not filled up the form properly !'' days to today''s modern web apps and social media sites that rely heavily on Javascript. Google Apps, Facebook, Twitter, Google Plus and LinkedIn, being handful examples of this movement. And to think that this quantum leap would not have been possible without Javascript is not an overstatement. Today, when you socialize with your friends on Facebook, or use your Gmail inbox, you''re running thousands of lines of code written in Javascript, in your browser.

With Node JS, you can take this knowledge back on the server, where usually you would expect to see the likes of PHP, Ruby, ASP dot NET etc. But that''s only a small portion of the reason why NodeJS is so cool. The fact that you can write full blown networked applications (think chat servers, collaborative tools, real-time data visualisation apps) with just a few lines of code is more than reason enough to not only look at NodeJS, but deep dive into it !', NULL, N'Web Designers & Front End Developers who wish to extend their knowledge of Javascript for building high performance network applications.', N'Build High Performance and Scalable Apps using NodeJS
Learn about ES6 with my free eBook - ECMAScript 6 QuickBytes
Use NodeJS Streams to write a Web Server
Use the Node Package Manager (NPM) for managing dependencies
Use the Express 4 Framework for building NodeJS Apps
', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/z2f7RHgvddc?list=PL_-VfJajZj0VatBpaXkEHK_UPHL7dW6I3', N'https://tuanntblog.com/wp-content/uploads/2018/11/nodejs-new-pantone-black-686x420.png', CAST(N'2022-01-22T12:38:26.683' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10002, 1, N'HTML', N'Learn modern HTML5, CSS3 and web design by building a stunning website for your portfolio! Includes flexbox and CSS Grid', N'*** The #1 bestselling HTML and CSS course on Udemy! ***

*** Completely re-built from scratch in July 2021 (35+ hours video) ***

"Having gone through other related courses on other platforms, I can say this course is the most practical and readily applicable course on web design and development I have taken." — Bernie Pacis



Open a new browser tab, type in www.omnifood.dev, and take a look around. I will wait here...

...

Amazing, right? What if you knew exactly how to design and build a website like that, completely from scratch? How amazing would that be?

Well, I''m here to teach you HTML, CSS, and web design, all by building the stunning website that you just saw, step-by-step.

So, after finishing this course, you will know exactly how to build a beautiful, professional, and ready-to-launch website just like Omnifood, by following a 7-step process. And it will even look great on any computer, tablet, and smartphone.

But what if you want to build a completely different website? Well, no problem! I designed the course curriculum with exactly this goal: to enable you to design and build any website that you can think of, not just copy the course project.

', NULL, N'Students with some knowledge about HTML and CSS, but who struggle to put together a great website
', N'Become a modern and confident HTML and CSS developer, no prior knowledge needed!
Design and build a stunning real-world project for your portfolio from scratch
Modern, semantic and accessible HTML5', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://d1iv5z3ivlqga1.cloudfront.net/wp-content/uploads/2021/02/30162210/html-va-css-1.jpg', CAST(N'2022-02-08T20:30:47.697' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10003, 1, N'PHP', N'Learn to Create an Online Store E-COMMERCE website in PHP & MySQLi from scratch with Admin Panel.', N'Learn to create an E-Commerce Website from scratch in PHP & MySQL, building an online shopping store in PHP & MySQL had never been easier from scratch before this course. You are going to create your first online store using PHP and MySQL from start to end.

What is this e-commerce site all about? 

E-commerce is an online shopping store for selling/buying products, we''ll use simple PHP and MySQL queries to create this project, if you are really serious about creating an eCommerce website from absolutely 0 knowledge, then this course is for you.', N'Basics of PHP will be a plus', N'Those who are strugglyingg to create a simple eCommerce site with PHP & MySQL
Students who want to create a practical project using PHP & MySQL from scratch
', N'Learn to create an ecommerce website with Admin Panel & online store
Build an online store with PHP and MySQL from scratch
Learn to Create a CMS (Content Management System) for eCommerce Website in PHP & MySQLi
A complete step by step project in PHP and MySQL for beginners
Create a fully pledge online store that can receive orders from customers', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://cafedev.vn/wp-content/uploads/2020/08/cafedev_tuhoc_php.png', CAST(N'2022-02-08T20:31:57.423' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10005, 1, N'Django', N'Dive in deep to the core concepts behind the power Django framework written in Python. Using Django 1.10 with Python 3
Rating: 4.4 out of 5
4.4
 (1,459 ratings)
85,634 students', N'Our philosophy is teaching individuals how to code by going through step by step projects. This drives the majority of our content with one exception: the Django Core course. 

In this course, we go in-depth into various Django concepts to provide a comprehensive guide to topics that include', N'Try Django 1.8 & Up (suggested course is Try Django 1.9 as it has Try Django 1.8 too)
Python knowledge is a plus (30 Days of Python is a suggested course)', N'Any student looking to build robust cutting edge web applications', N'Django Models
Model Instance Methods & Properties
Model-level field validation
Django Forms and Formsets
Form validation
Model Form
Function Based Views (FBVs)
Class Based Views (CBVs)
CRUD in Django Views (Create Retrieve Update Delete List)
Django Templates
Django translation
Deploying Django on a Live Server| Heroku, Webfaction, Linode, Digital Ocean
Celery + Redis for asynchronous tasks and scheduled tasks
and much more!
Requirements are Python 2.7 or 3.3 and Django 1.8 & up
We use Python 3 and Django 1.10 in this one', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://vi.hostmehost.com/shared_upload/django.jpg', CAST(N'2022-02-08T20:44:38.570' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10006, 2, N'Python', N'Learn A-Z everything about Python, from the basics, to advanced topics like Python GUI, Python Data Analysis, and more!', N'o you want to become a programmer? Do you want to learn how to create games, automate your browser, visualize data, and much more?

If you’re looking to learn Python for the very first time or need a quick brush-up, this is the course for you!

Python has rapidly become one of the most popular programming languages around the world. Compared to other languages such as Java or C++, Python consistently outranks and outperforms these languages in demand from businesses and job availability. The average Python developer makes over $100,000 - this number is only going to grow in the coming years.

The best part? Python is one of the easiest coding languages to learn right now. It doesn’t matter if you have no programming experience or are unfamiliar with the syntax of Python. By the time you finish this course, you''ll be an absolute pro at programming!', N'Macintosh (OSX)/ Windows(Vista and higher) Machine
Internet Connection', N'Even if you haven''t touched coding before, it won''t matter. The easy step-to-step lectures will quickly guide you through everything you''ll need to know about coding, mainly Python. This course is here for you to get accustomed and familiar with Python and its syntax. And above all, Python is one of the easiest coding languages to learn, and there''s a lot you can do with it.', N'Create their own Python Programs
Become an experienced Python Programmer
Parse the Web and Create their own Games', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://www.python.org/static/community_logos/python-logo-master-v3-TM.png', CAST(N'2022-02-08T20:58:45.190' AS DateTime), CAST(N'2022-01-22T12:38:26.683' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10007, 2, N'Machine Learning', N'Data science, machine learning, and artificial intelligence in Python for students and professionals', N'This course teaches you about one popular technique used in machine learning, data science and statistics: linear regression. We cover the theory from the ground up: derivation of the solution, and applications to real-world problems. We show you how one might code their own linear regression module in Python.In the first section, I will show you how to use 1-D linear regression to prove that Moore''s Law is true.

What''s that you say? Moore''s Law is not linear?

You are correct! I will show you how linear regression can still be applied.

In the next section, we will extend 1-D linear regression to any-dimensional linear regression - in other words, how to create a machine learning model that can learn from multiple inputs.

We will apply multi-dimensional linear regression to predicting a patient''s systolic blood pressure given their age and weight.

Finally, we will discuss some practical machine learning issues that you want to be mindful of when you perform data analysis, such as generalization, overfitting, train-test splits, and so on.', N'How to take a derivative using calculus
Basic Python programming
For the advanced section of the course, you will need to know probability', N'People who are interested in data science, machine learning, statistics and artificial intelligence
People new to data science who would like an easy introduction to the topic
People who wish to advance their career by getting into one of technology''s trending fields, data science', N'Derive and solve a linear regression model, and apply it appropriately to data science problems
Program your own version of a linear regression model in Python', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://khoahocphattrien.vn/Images/Uploaded/Share/2019/01/28/6d6hocmay.png', CAST(N'2022-02-22T18:47:49.063' AS DateTime), CAST(N'2022-02-22T18:47:49.063' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10008, 2, N'Data Analysis', N'This course is meant for newbies who are not familiar with machine learning, deep learning, computer vision and reinforcement learning or students looking for a quick refresher', N'Are you new to R?

Do you want to learn more about statistical programming?

Are you in a quantitative field?

You just started learning R but you struggle with all the free but unorganized material available elsewhere?

Do you want to hack the learning curve and stay ahead of your competition?

If your answer is YES to some of those points - read on!

This Tutorial is the first step - your Level 1 - to R mastery.

All the important aspects of statistical programming ranging from handling different data types to loops and functions, even graphs are covered.

While planing this course I used the Pareto 80/20 principle. I filtered for the most useful items in the R language which will give you a quick and efficient learning experience.

Learning R will help you conduct your projects. On the long run it is an invaluable skill which will enhance your career.

Your journey will start with the theoretical background of object and data types. You will then learn how to handle the most common types of objects in R. Much emphasis is put on loops in R since this is a crucial part of statistical programming. It is also shown how the apply family of functions can be used for looping.

In the graphics section you will learn how to create and tailor your graphs. As an example we will create boxplots, histograms and piecharts. Since the graphs interface is quite the same for all types of graphs, this will give you a solid foundation.

With the R Commander you will also learn about an alternative to RStudio. Especially for classic hypthesis tests the R Coomander GUI can save you some time.

According to the teaching principles of R Tutorials every section is enforced with exercises for a better learning experience. Furthermore you can also check out the r-tutorials R exercise database over at our webpage. In the database you will find more exercises on the topics of this course.
You can download the code pdf of every section to try the presented code on your own.

This tutorial is your first step to benefit from this open source software.

What R you waiting for?

Martin', N'interest in statistical programming
R and RStudio ready on your computer
basic understanding of statistics and data structure', N'scientists
data analysts
entrepreneurs
web developers
anybody interested in statistical programming', N'this course will show you how the most common types of graphs can be produced with R base
you will get a good understanding of functions and loops in R which are very useful programming skills to have
you will get the necessary theoretical background for R
you will learn how to create and handle different types of objects
you will get fluent in the R programming language to master your specific quantitative tasks', CAST(N'2022-01-22' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://teky.edu.vn/blog/wp-content/uploads/2021/07/Chia-se-ve-data-analysis.jpg', CAST(N'2022-02-24T22:42:46.643' AS DateTime), CAST(N'2022-02-24T22:42:46.643' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10009, 2, N'Statistics', N'Increase Your Data Analytic Skills – Highly Valued And Sought After By Employers', N'November, 2019. 

Join more than 1,000 students and get instant access to this best-selling content - enroll today!

Get marketable and highly sought after skills in this course that will substantially increase your knowledge of data analytics, with a focus in the area of significance testing, an important tool for A/B testing and product assessment.

Many tests covered, including three different t tests, two ANOVAs, post hoc tests, chi-square tests (great for A/B testing), correlation, and regression. Database management also covered!

Two in-depth examples provided of each test for additional practice.

This course is great for professionals, as it provides step by step instruction of tests with clear and accurate explanations. Get ahead of the competition and make these tests important parts of your data analytic toolkit!

Students will also have the tools needed to succeed in their statistics and experimental design courses.

Data Analytics is an rapidly growing area in high demand (e.g., McKinsey)

Statistics play a key role in the process of making sound business decisions that will generate higher profits. Without statistics, it''s difficult to determine what your target audience wants and needs. 

  Inferential statistics, in particular, help you understand a population''s needs better so that you can provide attractive products and services. 

  This course is designed for business professionals who want to know how to analyze data. You''ll learn how to use IBM SPSS to draw accurate conclusions on your research and make decisions that will benefit your customers and your bottom line. ', N'Introduction to statistics course (either currently taking or already have completed) is recommended but not absolutely necessary
Access to IBM SPSS Statistical software (strongly recommended)', N'Students seeking help with SPSS, especially how to analyze and interpret the results of statistical analyses
Professionals desiring to augment their statistical skills
Anyone seeking to increase their data analytic skills', N'In this course, you will gain proficiency in how to analyze a number of statistical procedures in SPSS.
You will learn how to interpret the output of a number of different statistical tests
Learn how to write the results of statistical analyses using APA format', CAST(N'2022-02-24' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://maas.vn/wp-content/uploads/2020/10/Picture1-1-768x432.png', CAST(N'2022-02-24T22:48:18.727' AS DateTime), CAST(N'2022-02-24T22:48:18.727' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10010, 2, N'Deep Learning', N'Machine Learning, Neural Networks, Computer Vision, Deep Learning and Reinforcement Learning in Keras and TensorFlow', N'Interested in Machine Learning, Deep Learning and Computer Vision? Then this course is for you!

This course is about the fundamental concepts of machine learning, deep learning, reinforcement learning and machine learning. These topics are getting very hot nowadays because these learning algorithms can be used in several fields from software engineering to investment banking.

In each section we will talk about the theoretical background for all of these algorithms then we are going to implement these problems together. We will use Python with SkLearn, Keras and TensorFlow.', N'Basic Python - we will use Panda and Numpy as well (we will cover the basics during implementations)', N'This course is meant for newbies who are not familiar with machine learning, deep learning, computer vision and reinforcement learning or students looking for a quick refresher', N'Solving regression problems (linear regression and logistic regression)
Solving classification problems (naive Bayes classifier, Support Vector Machines - SVMs)
Using neural networks (feedforward neural networks, deep neural networks, convolutional neural networks and recurrent neural networks
The most up to date machine learning techniques used by firms such as Google or Facebook
Face detection with OpenCV
TensorFlow and Keras
Deep learning - deep neural networks, convolutional neural networks (CNNS), recurrent neural networks (RNNs)', CAST(N'2022-02-24' AS Date), 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://longvan.net/hinhanh/tintuc/deep-learning-la-gi.png', CAST(N'2022-02-24T22:48:43.257' AS DateTime), CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10011, 3, N'Google Flutter', N'Learn Flutter mobile programming', N'Learn how to create fast and stunning mobile applications using Flutter, a new mobile framework by google. In this course you will quickly learn how to build an application in Flutter with no previous experience. It is HIGHLY recommended you understand the Dart programming language, see my Dart programming tutorials', N'Understanding of the Dart language', N'Anyone interested in learning Flutter mobile development', N'Make basic flutter applications', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://cg2010studio.files.wordpress.com/2021/08/flutter-app-dev.png', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10012, 3, N'Android Development', N'Learn the Basics of Developing an Android App and Build your very own Bluetooth Chat Application from Scratch.', N'Welcome to our course "A beginners guide to Android App Development (step by step)".

A Beginner''s Guide to Android App Development

Looking to launch your own app on Google Play Store but don''t know where to begin?

Then here''s your chance to learn the basics and build your skills in Android development. Before you read further, it is an essential prerequisite for a student to have a good understanding of Java (OOPs and Threads, in particular) 

The Android development course is a collection of Android Application Development tutorial videos. You will first get started with the software installation, cover basics like Layouts and Views, and gradually move on to more advanced topics. And then finally, you get to build your very own Bluetooth Chat Application right from scratch.

Take your first step and we will guide you into this amazing, ever-evolving world of Android.

More lectures will be uploaded soon.', N'Good understanding of Java (particularly OOPs and Threads)', N'Beginners who are new to Mobile Development
Freshers who want to learn Android Development', N'Android installation and setup for Android development
Concept of Layout and Views in Android development
Different ways to store your data on an Android device
Lists and Fragments in Android development
Trigger an Android notification
Build from scratch your very own Bluetooth Chat App to send and receive messages for Android', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://resources.mindx.edu.vn/uploads/images/tai-lieu-lap-trinh-android-2.jpg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10013, 3, N'Swift', N'Build iOS Apps & Learn iOS 11, Swift 4, ARKit (Augmented Reality), CoreML (Machine Learning)', N'Welcome to the world''s most comprehensive course on iOS development. This course is designed like an in-person coding bootcamp to give you the most amount of content and help with the least amount of cost.

NO PRIOR CODING EXPERIENCE REQUIRED', N'Must have a computer with OSX or macOS on it', N'If you are an absolute beginner to coding take this course
If you are an absolute beginner to iOS or mobile development then take this course', N'Build iOS 11 & Swift 4 apps
Work as an iOS contractor
Apply to jr. iOS development jobs
Submit iOS apps to the Apple App Store', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://media.vlpt.us/images/tiana/post/980ea546-6c09-4ce6-abaa-cdeb3a67af14/Swift.png', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10014, 3, N'IOS Development', N'In 10 days you can have your own app in the App Store! Learn how to make apps using Swift 4.2, Xcode 10, and iOS 12', N'Welcome to the 10-day iPhone App Bootcamp! If you''re looking for a course that is fun and gets straight to the point, then this is the course for you. This course will give brand-new programmers all of the skills that they need to create an app and submit it to the app store in just 10 days!

Other mega courses on Udemy offer 40+ hours of video content, but I wanted to create a course that was more manageable for beginners and didn''t include any fluff. In each video I dive straight into the topic, and don''t waste your time going over things that you don''t really need. I only focus on the essentials, and I give you hands-on practice so that you can easily master the things we are learning!', N'Must have a Mac Computer
No previous knowledge required :)', N'People who want to make an iPhone App
Complete beginners to programming', N'Submit Your Own App to the App Store!
Become a Swift 4 Programmer
Industry Tips Like How to Get a Job and Make Money from Your Apps
Create a Bitcoin Price Tracking App
Create a ToDo List App
Create a Joke Bank App
Create a Photo Based Collector App
Create an App With Machine Learning
', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'http://www.chammuseum.danang.vn/wp-content/uploads/2021/05/1.png', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10015, 3, N'Dart', N'No experience required', N'Learn how to create basic Dart programs. This course is aimed at the absolute beginner with no programming experience. Dart is an expressive and powerful language that has a very friendly learning curve. This makes it a great starting language. Dart helps you craft beautiful, high-quality experiences across all screens, with a client-optimized language, rich and powerful frameworks, flexible tooling', N'Basic computer skills', N'Anyone that wants to learn programming in Dart at a basic level', N'Installing an IDE
Varibales
Arrays
Flow Control
Functions
Error Handling', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10016, 3, N'Kotlin', N'Learn Kotlin from scratch! Grasp object-orientation and idiomatic Kotlin to realize coding projects and Android apps!', N'>> This is the only Udemy course that is referenced from the official Kotlin website as well as the official Android developers website for people who want to learn Kotlin, whether for Android or other purposes!

>> Learn programming in Kotlin, the most beautiful modern programming language based on Java!

>> Join this beginner-friendly course to learn to write code with an awesome and easy-to-learn language!

>> Expand your expertise as a Java or Android Developer and improve the quality of your code!

>> I''ll answer every question you have, help you personally if you get stuck and listen to your feedback! Join 15,000+ happy students of mine on Udemy!

This course will teach you programming in Kotlin! We begin with the basics so this course is completely suitable for beginners. You will put what you learn into practice in several coding challenges. So at the end, you''ll be able to create your own applications in Kotlin.

If you''re an Android developer, you can use this course to get up to speed with this awesome language. Kotlin will allow you to maintain a cleaner and more expressive code base, use concepts that go beyond even Java 8, and write more robust apps for Android.', N'We will go through all setup you need in order to use Kotlin
You must be able to install new software on your computer (JDK + IntelliJ), we will go through the actual process inside the course.', N'You do not need programming skills, we will start from scratch and slowly make our way to intermediate and more advanced topics
You should be excited to learn an awesome new programming language!
You will need basic skills in handling a PC, so you should know how to install and run applications on your computer.
Android developers who want to get started with Kotlin', N'Create professional applications using Kotlin, the new Java-based programming language developed by Jetbrains
Understand the concepts of the Kotlin language and how it integrates neatly with Java
Understand the basics of object-oriented software development, the most important development paradigm
Understand the principles behind other object-oriented languages like Java, C++, PHP, C#, Scala, or Swift
Use Intellij, the popular Java (and Kotlin) IDE, to write code effectively and professionally', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://images.viblo.asia/2185d41e-6e40-42ba-8464-201b818bee58.png', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10017, 3, N'React Native', N'Take you coding to the next level with React Native.', N'Do you want to learn the whole process of building an App ?. This is the course for you.

We will start from the very beginning, from "I don''t even know how to install it“ to actually understanding how React Native works and make it communicate with other technologies like Firebase and Redux.

You will learn all the logic and practice behind React Native  in different modules, and as we advance through the course we will be increasing the difficulty.

Since I believe that the best way to fully learn is by coding, after each important section we will put everything in practice with a very large practice project, using third party libraries, firebase and redux.', N'Knowing a little bit of Javascript ES5, we will use ES6 but you can learn it as we go.', N'From beginners in javascript to intermediate.', N'You will learn the whole React Native building process, from your pc to your phone.
Work with RNative and nosql databases like firebase.
Learn how Redux works and apply it on React Native', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://www.appcoda.com/wp-content/uploads/2015/04/react-native.png', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10018, 4, N'Unity', N'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', N'The course has recently been remastered in Unity 2021.1.

This course started as a runaway success on Kickstarter and has gone on to become the most popular and most watched Unity game development course on Udemy. The course has full English closed-captions throughout.

Learn how to create video games using Unity, the world-leading free-to-use game development tool. We start super simple so you need no prior experience of Unity or coding! With our online tutorials, you''ll be amazed what you can achieve right from the first moment you start the course. ', N'Mac or PC capable of running Unity 2019 or later.
A passion and willingness to learn how to code.', N'Competent and confident with using a computer.
Some programming experience helpful, but not required.
Artists who want to learn to bring their assets into games.
Complete beginners who are willing to work hard.
Developers who want to re-skill across to game development.', N'Learn C#, a powerful modern language, from scratch. No prior programming experience is necessary.
Become excellent at using the Unity game engine.
Build a solid foundation for game design and game development that will help you build your own games.
Learn how object oriented programming works in practice.
Create playable game projects - good for your portfolio, or just for your own sense of achievement.
Transfer your knowledge from this course to .NET, other languages, and more.
Develop highly transferable coding problem solving skills.
Be part of an amazing and supportive community of people similar to you.', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://gocnhintangphat.com/unity-la-gi/imager_1_5279_700.jpg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10019, 4, N'Unreal Engine', N'Learn Video Game Development & How To Design a Game From Scratch Using UE5', N'Learn game development with Unreal Engine 5. UE5 is the industry-leading 3D game design software that the professionals use to create today’s top games. Start your journey towards getting paid to make video games today!



Learn Video Game Development with this Unreal Engine 5 Course for Beginners

Begin your game development career with possibly the most up-to-date game dev course on the internet - Unreal Engine 5: The Complete Beginner''s Course. Every lecture in this course was filmed using version 5 of the Engine.

When I began trying to learn Unreal Engine, I found a lot of information, but it was unstructured and lacked detail. So I created this course to provide what others lacked - structure and detail. The course is laid out very carefully so that you can go into it knowing absolutely nothing, and then, little by little, each lecture builds upon the previous lectures, so that every time you learn something new, you already have all the knowledge you need to learn that new thing without any confusion.

Unlike other courses, it covers the fundamentals in detail, so by the end you should have a thorough understanding of all the basics of Unreal Engine and be fully prepared to move on to more intermediate topics. Depending on your goals, this might not be for you. This course was designed for those who want to learn as much about Unreal Engine 5 as possible. If you’re just looking to have a bit of fun and to tinker around a little bit, then this might not be the right course for you. But, if you’re interested in getting really good, possibly becoming an indie developer or even working for a major studio, then I strongly believe that this is the best course for you to start with. This course will teach you the knowledge that normally falls through the cracks.', N'Recommended: Desktop PC with Windows 7 (or later) 64-bit or a Mac with Mac OS X 10.9.2 or later
Recommended: 8 GB RAM
Recommended: Quad-core Intel or AMD processor, 2.5 GHz or faster
Recommended: DirectX 11 compatible video card
Unreal Engine 5 will run on desktops and laptops with specifications under these, but performance may be affected', N'This video game development course is for absolute beginners who are interested in making games & learning how to design a game from scratch using UE5
Designed for those who want to become professionals using Unreal Engine 5
No programming experience required', N'Learn game development using Unreal Engine 5
Build realistic looking environments for games to take place in
Define custom inputs and movements to control characters
Script logic to define gameplay without needing to know how to code', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://static.wikia.nocookie.net/rememberme/images/a/a2/UNREAL_4_LOGO.png/revision/latest?cb=20160616192531', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10020, 4, N'Game Development Fundamentals', N'Recommended: Desktop PC with Windows 7 (or later) 64-bit or a Mac with Mac OS X 10.9.2 or later
Recommended: 8 GB RAM
Recommended: Quad-core Intel or AMD processor, 2.5 GHz or faster
Recommended: DirectX 11 compatible video card
Unreal Engine 5 will run on desktops and laptops with specifications under these, but performance may be affected', N'Unity Game Development Academy by Devslopes

This is the most comprehensive course on Unity 3d on the Internet. We are avid game developers and were tired of all the junk out there - teaching students how to make 3D cubes without real world game development.

This Unity course is for absolute beginners & for seasoned programmers!

This course will take you down a guided learning path. You''ll learn to code in C# and then go on to build 2D & 3D games.

Not only will you build games, but you will learn how to do it the way the pros do. We''ll even cover advanced topics like lighting, cinematics, and multiplayer.', N'Must have a Mac or PC for Unity game development
No prior coding experience required or experience in Unity 3D', N'Beginners with no coding experience or Unity 3D experience
Programmers with no C# development experience
Game developers who want to learn Unity
Anyone who wants to learn Unity game development but doesn''t know where to start', N'Build 2D Unity games & work with sprites
Build 3D Unity games
Write programs in C#
Apply for Jr. Game Developer jobs as a Unity 3D developer', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10022, 4, N'C++', N'Complete Beginners
No really, if you can type, install a program using a wizard, and open the file explorer you are good to go!', N'Save your precious time by buying this course. You will learn how to program in C++ in a fast and easy way! 

The total length of the course is over 17 hours! You will learn theory and you will also gain lots of practice. During the course we will write many programs that will make you a great programmer.

All of this is presented by a young man who shares his knowledge, so the language used can be easily understood by everyone. 

The course is designed for those who don''t have any prior knowledge about programming. It doesn''t matter if you have never written any programs or you have no idea about programming... After my course all of this will change. You will bust the myth that programming is a difficult thing only for the few!   

After this course you will be able to use the advanced components of the C++ language. 

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

I believe that everyone has the ability to develop software if they are taught properly. Including you. I''m going to give you the context of each new concept I teach you. After my course you will finally understand everything that you code.', N'English language
Code::Blocks IDE (free)', N'beginner
person who wants to understand programming', N'How to use C++ language in action
What is compiler / IDE / Variables / types of variables etc.
How to work with files - fstream library (i/o operation on files)
operators - arithmetic, assigment, logical, bitwise
conditions like if / else / switch
arrays / multi-dimensional arrays
loops - for / while / do-while
functions, overloading functions, passing variables to functions etc.
structures
referencers
pointers
dynamic allocation of memory
creating project in IDE
classes
object oriented programming
class and function templates
namespaces
exceptions
input / output streams and validation of data
', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10023, 5, N'SQL', N'Using MySQL but applicable to Oracle SQL, Microsoft SQL Server, and PostgreSQL. Taught by a Data Scientist and PM.', N'If you have no technical background, don''t be afraid! We''ve distilled our knowledge and experience using SQL into a short course so that by the end, you''ll have the raw skills to do some real data analysis for your company using SQL - a language virtually EVERY company uses. Note: this courses teaches you real-world SQL - not just the theory in abstract, but real skills you can use to get more data-driven in your current job. ', N'No previous technical knowledge required', N'Marketers
Startup folks
Non-technical folks
Aspiring Data Analysts
Recent College Grads
Job-seekers
Product Managers', N'If you have no technical background, don''t be afraid! We''ve distilled our knowledge and experience using SQL into a short course so that by the end, you''ll have the raw skills to do some real data analysis for your company using SQL - a language virtually EVERY company uses. Note: this courses teaches you real-world SQL - not just the theory in abstract, but real skills you can use to get more data-driven in your current job. ', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10024, 5, N'Oracle SQL', N'Marketers
Startup folks
Non-technical folks
Aspiring Data Analysts
Recent College Grads
Job-seekers
Product Managers', N'* Covers Oracle Database 11g, Oracle 12c, Oracle 18c, and Oracle 19c

Oracle is currently the most popular relational database management system in the world. It is used by thousands of big companies who are usually willing to pay good salaries to the right people, which includes those with practical Oracle SQL knowledge that is based on best practices and experience.                    

Most SQL courses give you theoretical SQL knowledge. In this course, you will learn by actually writing code.', N'No prior Oracle SQL knowledge is required. You will learn Oracle SQL from scratch (if that is what you need).
If you want to install your own Oracle SQL database, you will need a computer running Windows or Linux, where you can install and run applications (A computer running Mac OS X can be used as well, but you will need to run your database software on a virtual machine).
You should have a real desire to learn Oracle SQL and time to watch the lectures and practice the concepts as suggested by the instructor.', N'Aspiring application or database developers looking to acquire solid SQL knowledge to improve their careers.
College/University students who need SQL knowledge to pass their database-related courses.
Anyone with only basic SQL knowledge wanting to solidify their skill and use the language with confidence.
This course is not for you if you are already an experienced Oracle SQL developer looking to learn the most advanced features of the language.
This course is not for you if you are looking for a theoretical course.', N'You will be able to use Oracle SQL to retrieve, filter, analyze, format and present information from Oracle databases.
You will be able to use SQL to insert, modify and delete information from Oracle databases.
You will understand Oracle SQL code written by other people and feel confident to modify it.
You will be able to write the SQL code needed to solve the most common problems found in real work situations and academic tests.
Please note that PL/SQL is not covered in this course.', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10025, 5, N'Database Management', N'Learn Database Management Systems from scratch as Database Management System forms the core of computer science', N'Welcome to the course Database Management system from scratch !!!

Mastering the concepts of Database Management System is very important to get started with Computer Science because Database Management System is the program which is responsible for the ease with which we are able to fetch the data from the database and that is the backbone of internet today. The concepts which we are going to study is going to give a very good understanding of Database Management System and by the end of it you will be able to answer any interview question on Database Management System.

Without using Database Management Systems ,it is extremely difficult to communicate with the data in the server. Every server today has Database Management System installed in it. Through this course you will not only master the basics of Database Management Systems but also get ready for venturing into advanced concepts of Database Management Systems.

In this course ,every concept of Database Management System is taught in an easy-to-understand manner such that anybody without any prerequisites will be able to master the concepts of Database Management System in the easiest way.

Come and join me, I assure you that you will have the best learning experience of not just Database Management Systems but also the core of Computer Science in a different dimension.', N'Have a PC with internet connection
Even ZERO knowledge in Database Management Systems is fine - I''ll teach you everything you need to know', N'Anybody who needs to learn Database Management System from scratch
Anybody who wants to pursue a career in Computer Science
Anybody who has Database Management System in the Bachelor''s degree
Anybody who is preparing for interview in product based companies
If you are preparing for exams like GATE , PGEE , BITS HD , ISRO ,..etc
If you are a Computer Science Engineer', N'You will become very familiar with the core concepts of Database Management Systems
You will be able to challenge the interviewer on questions related to Database Management Systems
You will view Computer Science in a different dimension
You will be able to answer all questions of exams like GATE,PGEE,ISRO
You will be able to get a top grade in your Database Management Systems course in your Bachelor''s degree', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10026, 5, N'SQL Server', N'Have a PC with internet connection
Even ZERO knowledge in Database Management Systems is fine - I''ll teach you everything you need to know', N'You learned a little SQL, but you are ready to take the next step and really understand how databases work. Or maybe you are a complete beginner. Here’s a little secret. It’s not that complicated. That’s right. Databases are actually a very simple concept that starts with a simple Table just like a spreadsheet in Excel. Everything else in the database is built around this little concept of a table.

With a little SQL Server knowledge, you can retrieve data yourself. You can automate your reporting. You can help management find information and troubleshoot problems. You can even transfer this knowledge to Oracle and MySQL.

In this course, veteran consultant, Joey Blue, takes you through the essentials of SQL Server right through advanced topics such as backups, security, and indexes. This course is recommended for all business and IT professionals that want to advance their careers by understanding their corporate database.', N'PC (Desktop or Laptop)
SQL Server Developer (FREE Edition)
Browser and Internet Connection', N'Business Analysts
IT Professional
Business Professional
Accountants
Web Developers
Managers
Software Developers
Programming Students
Financial Analysts
Process Engineers
Anyone interested in understanding data and databases.', N'By the end of the course, you will have a foundation in SQL Server and the vocabulary and understanding to talk about and use SQL Server with confidence.
You will know how to navigate SQL Server Management Studio (SSMS) to find database objects and business data.
You will understand how to take advantage of Management Studio to make you work faster and more efficient.
You will understand the different pieces in SQL Server. Including, Tables, Views, Stored Procedures, Security, Backups, Indexes and Schemas to help you talk to DBA''s, Programmers, IT and to sound smart when you are speaking about databases.
You will know how to write SQL statements to CREATE, Retrieve, Update, and Delete data.
You will be able to create basic Views and Stored Procedures.
You will be able to Filter, Join, Sort, and Group data.
You will be able to create basic Views, Stored Procedures, and Functions.
You will have foundational knowledge in Security, Backups, and Indexes', NULL, 1, CAST(100 AS Decimal(18, 0)), N'10', N'ENG', N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-02-24T22:48:43.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10029, 11, N'An Entire MBA', N'** #1 Best Selling Business Course! ** Everything You Need to Know About Business from Start-up to IPO', N'** #1 MOST PURCHASED BUSINESS COURSE ON UDEMY! ** OVER 400,000 STUDENTS IN 195 COUNTRIES ** 

** ACCORDING TO BUSINESS INSIDER: "Getting your MBA has never been easier. Haroun is one of the highest rated professors on Udemy, so you can expect to be in good hands through the course of your education." **

**  FREE 384 PAGE MBA BOOK INCLUDED. In order to further improve the student experience, there is a free download at the end of every section of this course (contains every slide & entire easy to read comprehensive scripts of all 49 lectures & >100 helpful internet links + more) keeping the course up to date, even easier to understand & even more fun and engaging! **

Are you ready to take your career to the next level? In this course, you will learn everything you need to know about business….from starting a company to taking it public. This course covers all of the important topics you will learn from getting an MBA from a top school + real life practical business concepts that will help make you more successful!

This course is taught by an award winning MBA professor with significant real world experience working at Goldman Sachs as well as in the venture capital, hedge fund and consulting industries (he has founded several companies and sits on several boards). Many business concepts are simply common sense', N'Nothing except a positive attitude! : )', N'Anyone interested in learning about business (only practical concepts that you can use and no boring theory + we won''t cover business topics that are common sense).', N'Over 400,000 students in 195 countries!
Superb reviews!
Free 384 page book version of this course included!
Take your career to the next level!
Launch a company from scratch.
Get any job the easy way.
Get many customers by using the best networking tool!
Raise a lot of money quickly.
Create financial models from scratch (the Professor makes it so easy to understand).
Analyze company financials with ease!
Understand how investment banking firms work and what they can do to help your business.
Understand how management consulting firms work and when you need to hire them.
Understand how macro economics and micro economics works.
Understand what is venture capital and how to partner with the top venture capital firms to take your company to the next level.
Present to investors and customers like a boss : )
Communicate the right way in business so that you don''t waste time.
Change careers easily.
Network and get a meeting with anyone (ideal tips on how to get a job or how to reinvent yourself or how to find customers).
Analyze entire markets and companies from a qualitative and quantitative perspective.
Understand how taxes work (don''t worry this section is not boring)!
Protect your family and assets in case your business gets sued.
Understand what business career makes most sense for you!
Restructure your company and the benefits of declaring bankruptcy protection if needed.
Partner with equity and debt providers.
After this course you will have the tools / skills needed to launch a company, grow it and then take it public!
Value companies the easy way.
Set up the correct and most beneficial legal entity for your company.
Identify what makes an entrepreneur extremely successful.
Set unbelievable goals for yourself (there are no limits to what you can achieve....)!', NULL, 1, CAST(22 AS Decimal(18, 0)), N'11', N'ENG', N'https://www.youtube.com/embed/YwXqVpf4ZJc', N'https://dospace.org/wp-content/uploads/2021/05/Fundamentals-of-Game-Development.jpeg', CAST(N'2022-03-02T18:44:05.637' AS DateTime), CAST(N'2022-03-02T18:44:05.637' AS DateTime), NULL)
INSERT [dbo].[Course] ([id], [subcatalog_id], [title], [short_description], [description], [requirement], [who_this_course_is_for], [what_you_will_learn], [update_date], [activate], [price], [video_duration], [language], [url_video_description], [image_video_description], [created_date], [updated_date], [deleted_date]) VALUES (10030, 6, N'aaa', N'aaaaaaa', N'aaaaaaa', N'aaaaaaa', N'aaaaaaa', N'aaaaaaa', NULL, 0, CAST(111 AS Decimal(18, 0)), N'10', N'JP', N'https://www.youtube.com/embed/Z2x_Z3ZZC2U', N'images/Capture.PNG', CAST(N'2022-03-02T18:54:33.693' AS DateTime), CAST(N'2022-03-02T19:01:42.793' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Lecture] ON 

INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (1, 14, N'Javascript for Beginners', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-08T20:44:38.583' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (2, 8, N'Intro', 2, N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'150', 1, CAST(N'2022-02-08T20:44:38.600' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (3, 9, N'Variable', 3, N'https://www.youtube.com/embed/k5E2AVpwsko', N'150', 0, CAST(N'2022-02-08T20:44:38.613' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (4, 10, N'Conditional Statements', 3, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-08T20:44:38.617' AS DateTime), CAST(N'2022-03-02T17:12:11.940' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (5, 10, N'Dialog Boxes', 1, N'https://www.youtube.com/embed/R6plN3FvzFY?list=PL_-VfJajZj0U9nEXa4qyfB4U5ZIYCMPlz', N'150', 0, CAST(N'2022-02-08T20:58:45.233' AS DateTime), CAST(N'2022-03-02T17:12:19.687' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (6, 11, N'Arrays', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-08T20:58:45.257' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (7, 12, N'String Object', 2, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-08T20:58:45.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (8, 12, N'Document Object', 3, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-08T20:58:45.263' AS DateTime), CAST(N'2022-03-02T17:12:31.270' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (9, 12, N'Functions', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-22T18:47:49.133' AS DateTime), CAST(N'2022-02-22T18:47:49.133' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (10, 12, N'Lab Solutions', 2, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-22T18:47:49.140' AS DateTime), CAST(N'2022-02-22T18:47:49.140' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (11, 12, N'Bonus', 3, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-22T18:47:49.153' AS DateTime), CAST(N'2022-02-22T18:47:49.153' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (12, 13, N'Project', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-22T18:47:49.153' AS DateTime), CAST(N'2022-02-22T18:47:49.153' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (13, 13, N'Testing', 2, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'150', 0, CAST(N'2022-02-24T22:42:46.690' AS DateTime), CAST(N'2022-02-24T22:42:46.690' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (30, 19, N'Intro video', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'11', 0, CAST(N'2022-03-02T18:44:05.647' AS DateTime), CAST(N'2022-03-02T18:44:05.647' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (31, 19, N'Intro video 2', 2, N'https://www.youtube.com/embed/Z2x_Z3ZZC2U', N'11', 0, CAST(N'2022-03-02T18:44:05.647' AS DateTime), CAST(N'2022-03-02T18:44:05.647' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (32, 20, N'Begin 1', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'1', 0, CAST(N'2022-03-02T18:44:05.650' AS DateTime), CAST(N'2022-03-02T18:44:05.650' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (33, 21, N'Lecture course 1', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'11', 0, CAST(N'2022-03-02T18:47:58.660' AS DateTime), CAST(N'2022-03-02T18:47:58.660' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (34, 22, N'lecture1', 1, N'https://www.youtube.com/embed/0SJE9dYdpps?list=PL_-VfJajZj0VgpFpEVFzS5Z-lkXtBe-x5', N'1', 0, CAST(N'2022-03-02T18:54:33.700' AS DateTime), CAST(N'2022-03-02T18:54:33.700' AS DateTime), NULL)
INSERT [dbo].[Lecture] ([id], [lesson_id], [title], [sort], [video_url], [video_duration], [preview], [created_date], [updated_date], [deleted_date]) VALUES (35, 23, N'lecture2', 1, N'https://www.youtube.com/embed/Z2x_Z3ZZC2U', N'1', 0, CAST(N'2022-03-02T18:54:33.703' AS DateTime), CAST(N'2022-03-02T18:54:33.703' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Lecture] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (7, 2, N'Javascript for Beginners', CAST(N'2022-02-22T18:47:49.150' AS DateTime), CAST(N'2022-02-22T18:47:49.150' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (8, 1, N'Intro', CAST(N'2022-02-24T22:42:46.673' AS DateTime), CAST(N'2022-02-24T22:42:46.673' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (9, 1, N'Variable', CAST(N'2022-02-24T22:42:46.697' AS DateTime), CAST(N'2022-02-24T22:42:46.697' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (10, 1, N'Conditional Statements', CAST(N'2022-02-24T22:48:18.740' AS DateTime), CAST(N'2022-02-24T22:48:18.740' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (11, 1, N'Project', CAST(N'2022-02-24T22:48:18.750' AS DateTime), CAST(N'2022-02-24T22:48:18.750' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (12, 1, N'Bonus', CAST(N'2022-02-24T22:48:43.267' AS DateTime), CAST(N'2022-02-24T22:48:43.267' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (13, 1, N'Testing', CAST(N'2022-02-24T22:48:43.277' AS DateTime), CAST(N'2022-02-24T22:48:43.277' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (14, 1, N'Javascript for Beginners', CAST(N'2022-03-02T16:55:54.900' AS DateTime), CAST(N'2022-03-02T16:55:54.900' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (19, 10029, N'Intro', CAST(N'2022-03-02T18:44:05.643' AS DateTime), CAST(N'2022-03-02T18:44:05.643' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (20, 10029, N'Begin', CAST(N'2022-03-02T18:44:05.647' AS DateTime), CAST(N'2022-03-02T18:44:05.647' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (21, 10029, N'Course 1', CAST(N'2022-03-02T18:46:48.907' AS DateTime), CAST(N'2022-03-02T18:46:48.907' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (22, 10030, N'lesson1', CAST(N'2022-03-02T18:54:33.697' AS DateTime), CAST(N'2022-03-02T18:54:33.697' AS DateTime), NULL)
INSERT [dbo].[Lesson] ([id], [course_id], [title], [created_date], [updated_date], [deleted_date]) VALUES (23, 10030, N'lesson2', CAST(N'2022-03-02T18:54:33.703' AS DateTime), CAST(N'2022-03-02T18:54:33.703' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([id], [user_id], [conversation_id], [message], [responsed], [created_date], [updated_date], [deleted_date]) VALUES (3, 1, 1, N'Hello there', 1, CAST(N'2022-03-02T12:45:23.990' AS DateTime), CAST(N'2022-03-02T12:54:56.957' AS DateTime), NULL)
INSERT [dbo].[Messages] ([id], [user_id], [conversation_id], [message], [responsed], [created_date], [updated_date], [deleted_date]) VALUES (4, 2, 1, N'Hello User', 1, CAST(N'2022-03-02T12:45:26.797' AS DateTime), CAST(N'2022-03-02T12:54:39.183' AS DateTime), NULL)
INSERT [dbo].[Messages] ([id], [user_id], [conversation_id], [message], [responsed], [created_date], [updated_date], [deleted_date]) VALUES (5, 1, 1, N'I have problem', 1, CAST(N'2022-03-02T12:54:39.207' AS DateTime), CAST(N'2022-03-02T12:54:56.957' AS DateTime), NULL)
INSERT [dbo].[Messages] ([id], [user_id], [conversation_id], [message], [responsed], [created_date], [updated_date], [deleted_date]) VALUES (6, 2, 1, N'Yeah, let me know it', 1, CAST(N'2022-03-02T12:54:56.980' AS DateTime), CAST(N'2022-03-02T13:03:22.410' AS DateTime), NULL)
INSERT [dbo].[Messages] ([id], [user_id], [conversation_id], [message], [responsed], [created_date], [updated_date], [deleted_date]) VALUES (7, 7, 1, N'I have problem', 0, CAST(N'2022-03-02T13:03:22.420' AS DateTime), CAST(N'2022-03-02T13:03:22.420' AS DateTime), NULL)
INSERT [dbo].[Messages] ([id], [user_id], [conversation_id], [message], [responsed], [created_date], [updated_date], [deleted_date]) VALUES (8, 7, 2, N'I have problem', 0, CAST(N'2022-03-02T13:04:47.917' AS DateTime), CAST(N'2022-03-02T13:04:47.917' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [course_id], [order_id], [created_date], [updated_date], [deleted_date]) VALUES (25, 1, 108, CAST(N'2022-03-05T14:00:26.393' AS DateTime), CAST(N'2022-03-05T14:00:26.393' AS DateTime), NULL)
INSERT [dbo].[OrderDetail] ([id], [course_id], [order_id], [created_date], [updated_date], [deleted_date]) VALUES (26, 2, 108, CAST(N'2022-03-05T14:00:26.393' AS DateTime), CAST(N'2022-03-05T14:00:26.393' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [order_number], [customer_id], [payment_id], [total_amount], [status_order], [date_order], [created_date], [updated_date], [deleted_date]) VALUES (108, N'ABC000508577', 7, 10, CAST(0 AS Decimal(18, 0)), 1, CAST(N'2022-03-05' AS Date), CAST(N'2022-03-05T14:00:26.390' AS DateTime), CAST(N'2022-03-05T14:00:26.390' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([id], [user_id], [order_id], [amount], [date_payment], [status], [created_date], [updated_date], [deleted_date]) VALUES (10, 7, N'22V62098LE965351W', CAST(222 AS Decimal(18, 0)), CAST(N'2022-03-05' AS Date), 1, CAST(N'2022-03-05T14:00:26.377' AS DateTime), CAST(N'2022-03-05T14:00:26.377' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([id], [ratting], [feedback], [customer_id], [course_id], [created_date], [updated_date], [deleted_date]) VALUES (3, 4.5, N'good job', 2, 2, CAST(N'2022-02-22T21:43:36.013' AS DateTime), CAST(N'2022-02-22T21:53:37.397' AS DateTime), CAST(N'2022-02-22T21:53:37.333' AS DateTime))
INSERT [dbo].[Review] ([id], [ratting], [feedback], [customer_id], [course_id], [created_date], [updated_date], [deleted_date]) VALUES (4, 3.5, N'good job', 2, 2, CAST(N'2022-02-22T22:01:12.293' AS DateTime), CAST(N'2022-02-22T22:01:12.293' AS DateTime), NULL)
INSERT [dbo].[Review] ([id], [ratting], [feedback], [customer_id], [course_id], [created_date], [updated_date], [deleted_date]) VALUES (5, 0, N'lâm code a\gà', 2, 1, CAST(N'2022-03-02T18:50:59.293' AS DateTime), CAST(N'2022-03-03T09:00:46.467' AS DateTime), CAST(N'2022-03-03T09:00:46.433' AS DateTime))
INSERT [dbo].[Review] ([id], [ratting], [feedback], [customer_id], [course_id], [created_date], [updated_date], [deleted_date]) VALUES (6, 4, N'Good Course', 2, 1, CAST(N'2022-03-03T09:12:49.980' AS DateTime), CAST(N'2022-03-03T10:53:27.620' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[SavedCourse] ON 

INSERT [dbo].[SavedCourse] ([id], [course_id], [user_id], [created_date], [updated_date], [deleted_date]) VALUES (5, 10002, 2, CAST(N'2022-03-03T09:12:23.347' AS DateTime), CAST(N'2022-03-03T09:12:23.347' AS DateTime), NULL)
INSERT [dbo].[SavedCourse] ([id], [course_id], [user_id], [created_date], [updated_date], [deleted_date]) VALUES (6, 2, 2, CAST(N'2022-03-03T09:12:30.150' AS DateTime), CAST(N'2022-03-03T09:12:30.150' AS DateTime), NULL)
INSERT [dbo].[SavedCourse] ([id], [course_id], [user_id], [created_date], [updated_date], [deleted_date]) VALUES (16, 1, 2, CAST(N'2022-03-03T11:12:11.587' AS DateTime), CAST(N'2022-03-03T11:12:11.587' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SavedCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCatalog] ON 

INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (1, 1, N'Web Development', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (2, 1, N'Data Science', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (3, 1, N'Mobile Development', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (4, 1, N'Game Development', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (5, 1, N'Database Design & Development', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (6, 2, N'Web Design', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (7, 2, N'Graphic Design & Illustration', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (8, 2, N'Game Design', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (9, 2, N'3D & Animation', NULL, CAST(N'2022-01-21T22:09:02.037' AS DateTime), CAST(N'2022-01-21T22:11:36.780' AS DateTime), NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (10, 2, N'Other Design', NULL, CAST(N'2022-01-21T22:11:26.727' AS DateTime), CAST(N'2022-02-07T19:49:23.207' AS DateTime), NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (11, 3, N'Entrepreneurship', NULL, CAST(N'2022-01-21T22:13:21.740' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (12, 3, N'Communication', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (13, 3, N'Sales', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (14, 3, N'Business Strategy', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (15, 3, N'E-Commerce', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (16, 4, N'Digital Marketing', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (17, 4, N'Branding', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (18, 4, N'Marketing Fundamentals', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (19, 4, N'Paid Advertising', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (20, 4, N'Other Marketing', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (21, 5, N'Accounting & Bokkkeeping', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (22, 5, N'Compliance', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (23, 5, N'Taxes', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (24, 5, N'Economics', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (25, 5, N'Other Finace & Accounting', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (31, 10, N'Leadership', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (32, 10, N'Creativity', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (33, 10, N'Motivation', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
INSERT [dbo].[SubCatalog] ([id], [catalog_id], [name], [description], [created_date], [updated_date], [deleted_date]) VALUES (34, 10, N'Influence', NULL, CAST(N'2022-01-21T22:08:21.787' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCatalog] OFF
GO
ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD  CONSTRAINT [FK_AppUser_AppRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[AppRole] ([id])
GO
ALTER TABLE [dbo].[AppUser] CHECK CONSTRAINT [FK_AppUser_AppRole]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AppUser] FOREIGN KEY([user_id_one])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Messages_AppUser]
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AppUser1] FOREIGN KEY([user_id_two])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Messages_AppUser1]
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
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AppUser2] FOREIGN KEY([user_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AppUser2]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Conversation] FOREIGN KEY([conversation_id])
REFERENCES [dbo].[Conversation] ([id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Conversation]
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
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_AppUser] FOREIGN KEY([customer_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_AppUser]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Course]
GO
ALTER TABLE [dbo].[SavedCourse]  WITH CHECK ADD  CONSTRAINT [FK_SavedCourse_AppUser] FOREIGN KEY([user_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[SavedCourse] CHECK CONSTRAINT [FK_SavedCourse_AppUser]
GO
ALTER TABLE [dbo].[SavedCourse]  WITH CHECK ADD  CONSTRAINT [FK_SavedCourse_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[SavedCourse] CHECK CONSTRAINT [FK_SavedCourse_Course]
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
