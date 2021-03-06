USE [master]
GO
/****** Object:  Database [ManegmentProductCRM]    Script Date: 02/07/2016 14:32:08 ******/
CREATE DATABASE [ManegmentProductCRM] ON  PRIMARY 
( NAME = N'ManegmentProductCRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ManegmentProductCRM.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ManegmentProductCRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ManegmentProductCRM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ManegmentProductCRM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ManegmentProductCRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ManegmentProductCRM] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET ARITHABORT OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ManegmentProductCRM] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ManegmentProductCRM] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ManegmentProductCRM] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET  DISABLE_BROKER
GO
ALTER DATABASE [ManegmentProductCRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ManegmentProductCRM] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ManegmentProductCRM] SET  READ_WRITE
GO
ALTER DATABASE [ManegmentProductCRM] SET RECOVERY FULL
GO
ALTER DATABASE [ManegmentProductCRM] SET  MULTI_USER
GO
ALTER DATABASE [ManegmentProductCRM] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ManegmentProductCRM] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ManegmentProductCRM', N'ON'
GO
USE [ManegmentProductCRM]
GO
/****** Object:  Table [dbo].[Tbl_Role]    Script Date: 02/07/2016 14:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Role] ON
INSERT [dbo].[Tbl_Role] ([RoleID], [RoleName], [RoleTitle]) VALUES (1, N'admin', N'مدیرکل')
INSERT [dbo].[Tbl_Role] ([RoleID], [RoleName], [RoleTitle]) VALUES (2, N'user', N'مشترک')
SET IDENTITY_INSERT [dbo].[Tbl_Role] OFF
/****** Object:  Table [dbo].[Tbl_Product]    Script Date: 02/07/2016 14:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Company] [nvarchar](150) NOT NULL,
	[Note] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Product] ON
INSERT [dbo].[Tbl_Product] ([ProductID], [ProductName], [Date], [Company], [Note]) VALUES (1, N'قطعه صنعی شماره', CAST(0x0000A5A500B24CBB AS DateTime), N'آلمان', N'توضیحات اضافی')
SET IDENTITY_INSERT [dbo].[Tbl_Product] OFF
/****** Object:  Table [dbo].[Tbl_User]    Script Date: 02/07/2016 14:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Family] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_FK_Tbl_User_Tbl_Role] ON [dbo].[Tbl_User] 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_User] ON
INSERT [dbo].[Tbl_User] ([UserID], [RoleID], [Username], [Password], [Name], [Family], [Email], [Date]) VALUES (1, 1, N'1', N'1', N'1', N'1', N'admin@yahoo.com', CAST(0x0000A12500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_User] OFF
/****** Object:  Table [dbo].[Tbl_Ticket]    Script Date: 02/07/2016 14:32:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Ticket](
	[TicketId] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Messge] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Pigiri] [int] NOT NULL,
	[ReplayMassge] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Tbl_Massge_Tbl_Product] ON [dbo].[Tbl_Ticket] 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_Tbl_Massge_Tbl_User] ON [dbo].[Tbl_Ticket] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[Tbl_Ticket] ([TicketId], [UserID], [ProductID], [Messge], [Date], [Pigiri], [ReplayMassge]) VALUES (0, 1, 1, N'داری مشکل است', CAST(0x0000A5A500B26C02 AS DateTime), 436399320, N'بله حل میشود ')
/****** Object:  ForeignKey [FK_Tbl_User_Tbl_Role]    Script Date: 02/07/2016 14:32:09 ******/
ALTER TABLE [dbo].[Tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_User_Tbl_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Tbl_Role] ([RoleID])
GO
ALTER TABLE [dbo].[Tbl_User] CHECK CONSTRAINT [FK_Tbl_User_Tbl_Role]
GO
/****** Object:  ForeignKey [FK_Tbl_Massge_Tbl_Product]    Script Date: 02/07/2016 14:32:09 ******/
ALTER TABLE [dbo].[Tbl_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Massge_Tbl_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Tbl_Product] ([ProductID])
GO
ALTER TABLE [dbo].[Tbl_Ticket] CHECK CONSTRAINT [FK_Tbl_Massge_Tbl_Product]
GO
/****** Object:  ForeignKey [FK_Tbl_Massge_Tbl_User]    Script Date: 02/07/2016 14:32:09 ******/
ALTER TABLE [dbo].[Tbl_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Massge_Tbl_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Tbl_User] ([UserID])
GO
ALTER TABLE [dbo].[Tbl_Ticket] CHECK CONSTRAINT [FK_Tbl_Massge_Tbl_User]
GO
