USE [master]
GO
/****** Object:  Database [EduOnline]    Script Date: 12/28/2021 6:16:57 PM ******/
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
/****** Object:  Table [dbo].[AppRole]    Script Date: 12/28/2021 6:16:57 PM ******/
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
/****** Object:  Table [dbo].[AppUser]    Script Date: 12/28/2021 6:16:57 PM ******/
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
/****** Object:  Table [dbo].[Catalog]    Script Date: 12/28/2021 6:16:57 PM ******/
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
/****** Object:  Table [dbo].[ContentLesson]    Script Date: 12/28/2021 6:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentLesson](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lession_id] [bigint] NULL,
	[title] [varchar](255) NULL,
	[description] [text] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_ContentLesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/28/2021 6:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[subcatalog_id] [bigint] NULL,
	[title] [varchar](255) NULL,
	[description] [text] NULL,
	[requirement] [text] NULL,
	[type_level] [varchar](50) NULL,
	[status] [bit] NULL,
	[total_sold] [bigint] NULL,
	[price] [decimal](18, 0) NULL,
	[video_duration] [nchar](10) NULL,
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/28/2021 6:16:57 PM ******/
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
/****** Object:  Table [dbo].[Lesson]    Script Date: 12/28/2021 6:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[course_id] [bigint] NULL,
	[title] [varchar](255) NULL,
	[description] [text] NULL,
	[url_video] [varchar](255) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/28/2021 6:16:57 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 12/28/2021 6:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_number] [char](12) NULL,
	[customer_id] [bigint] NULL,
	[card_id] [bigint] NULL,
	[total_amound] [decimal](18, 0) NULL,
	[status_order] [bit] NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentCard]    Script Date: 12/28/2021 6:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentCard](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NULL,
	[number] [varchar](16) NULL,
	[expiration_date] [date] NULL,
	[cvv] [varchar](30) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[deleted_date] [datetime] NULL,
 CONSTRAINT [PK_PaymentCard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCatalog]    Script Date: 12/28/2021 6:16:57 PM ******/
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

INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (1, N'admin', N'$2a$10$rLDk5aqPJpqx69mROloB4OCD6MTrG0c/JCPJMroGlGCPWqBhCGFTe', NULL, NULL, N'admin@gmail.com', NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[AppUser] ([id], [username], [password], [fullname], [address], [email], [avatar_image], [phone], [enabled], [role_id], [created_date], [updated_date], [deleted_date]) VALUES (2, N'user', N'$2a$10$U/azznwkJb8w/7n5LjBUd.0SaUL/FQEHdN1n3VhtOK36kGOAjhuI2', NULL, NULL, N'user@gmail.com', NULL, NULL, 1, 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AppUser] OFF
GO
ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD  CONSTRAINT [FK_AppUser_AppRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[AppRole] ([id])
GO
ALTER TABLE [dbo].[AppUser] CHECK CONSTRAINT [FK_AppUser_AppRole]
GO
ALTER TABLE [dbo].[ContentLesson]  WITH CHECK ADD  CONSTRAINT [FK_ContentLesson_Lesson] FOREIGN KEY([lession_id])
REFERENCES [dbo].[Lesson] ([id])
GO
ALTER TABLE [dbo].[ContentLesson] CHECK CONSTRAINT [FK_ContentLesson_Lesson]
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
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_SubCatalog] FOREIGN KEY([course_id])
REFERENCES [dbo].[SubCatalog] ([id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_SubCatalog]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentCard] FOREIGN KEY([card_id])
REFERENCES [dbo].[PaymentCard] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentCard]
GO
ALTER TABLE [dbo].[PaymentCard]  WITH CHECK ADD  CONSTRAINT [FK_PaymentCard_AppUser] FOREIGN KEY([customer_id])
REFERENCES [dbo].[AppUser] ([id])
GO
ALTER TABLE [dbo].[PaymentCard] CHECK CONSTRAINT [FK_PaymentCard_AppUser]
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
