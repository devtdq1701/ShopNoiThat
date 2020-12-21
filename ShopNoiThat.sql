USE [master]
GO
/****** Object:  Database [ShopNoiThat]    Script Date: 12/22/2020 1:40:05 AM ******/
CREATE DATABASE [ShopNoiThat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopNoiThat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShopNoiThat.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopNoiThat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShopNoiThat_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopNoiThat] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopNoiThat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopNoiThat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopNoiThat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopNoiThat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopNoiThat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopNoiThat] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopNoiThat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopNoiThat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopNoiThat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopNoiThat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopNoiThat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopNoiThat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopNoiThat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopNoiThat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopNoiThat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopNoiThat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopNoiThat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopNoiThat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopNoiThat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopNoiThat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopNoiThat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopNoiThat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopNoiThat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopNoiThat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopNoiThat] SET  MULTI_USER 
GO
ALTER DATABASE [ShopNoiThat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopNoiThat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopNoiThat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopNoiThat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopNoiThat] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopNoiThat]
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ContentHtml] [ntext] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdvisoryCustomers]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdvisoryCustomers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Mobile] [varchar](12) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[SentDate] [datetime] NULL,
	[ProductID] [bigint] NOT NULL,
 CONSTRAINT [PK_AdvisoryCustomers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Link] [varchar](250) NULL,
	[Type] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BannerGroups]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_BannerGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookOnlineCustomers]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookOnlineCustomers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Mobile] [varchar](12) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [varchar](50) NULL,
	[SentDate] [datetime] NULL,
 CONSTRAINT [PK_BookOnlineCustomers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Order] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Mobile] [varchar](12) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[SentDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contacts](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Mobile] [varchar](12) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[SentDate] [datetime] NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Logoes]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logoes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Logoes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Members]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Slogan] [nvarchar](250) NOT NULL,
	[Avatar] [nvarchar](250) NOT NULL,
	[Job] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Newses]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Newses](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[ShortDesc] [nvarchar](max) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[ContentHtml] [ntext] NOT NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[CategoryID] [bigint] NULL,
	[ViewCount] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Newses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[BannerImage] [nvarchar](250) NULL,
	[Order] [int] NULL,
	[Status] [bit] NOT NULL,
	[ParentID] [bigint] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Code] [varchar](50) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Images] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[CategoryID] [bigint] NULL,
	[ViewCount] [bigint] NULL,
	[Detail] [ntext] NULL,
	[ShortDesc] [ntext] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectCategories]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[ShortDesc] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[Content] [ntext] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[Status] [bit] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/22/2020 1:40:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AdvisoryCustomers] ON 

INSERT [dbo].[AdvisoryCustomers] ([ID], [FullName], [Sex], [Mobile], [Email], [Note], [Status], [SentDate], [ProductID]) VALUES (1, N'Trần Đăng Quang', 0, N'0961273606', N'nnhuyenmy1701@gmail.com', N'Test', N'Chưa xử lý', CAST(N'2020-12-22 01:36:45.630' AS DateTime), 22)
SET IDENTITY_INSERT [dbo].[AdvisoryCustomers] OFF
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (1, N'Khuyến mãi rộn ràng, tân trang tổ ấm !!!', N'/khuyen-mai-ron-rang-tan-trang-to-am', 1, 1, N'/Data/images/Banner/Banner%20wed.jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (2, N'Thương hiệu nội thất uy tín từ năm 1999', NULL, 1, 1, N'/Data/images/Banner/slide-1.jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (3, N'THIẾT KẾ NỘI THẤT VỚI GIÁ “0” ĐỒNG', N'/tu-van-thiet-ke', 1, 1, N'/Data/images/Banner/%E1%BA%A2nh-slide-thi%E1%BA%BFt-k%E1%BA%BF-n%E1%BB%99i-th%E1%BA%A5t-gi%C3%A1-0%C4%91(1).jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (4, N'Bàn ăn thông minh - Nới rộng không gian, gắn kết tình cảm', N'/ban-an-thong-minh-mo-rong', 3, 1, N'/Data/images/Banner/ban-an-thong-minh-mo-rong.jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (5, N'Bộ sưu tập bàn trà cao cấp cho phòng khách sang trọng', N'/bo-suu-tap-ban-tra-cao-cap', 3, 1, N'/Data/images/Banner/bo-suu-tap-ban-tra-cao-cap.jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (6, N'Ưu đãi thiết kế từ Nội thất Nhà Đẹp | Duy nhất tháng 8', N'/uu-dai-thiet-ke-tu-noi-that-nha-dep-duy-nhat-thang-8', 5, 1, N'/Data/images/Banner/uu-dai-thiet-ke-thang-8-banner-trang-chu.jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (7, N'Sofa da Rinova - Độc quyền tại Nội thất Nhà Đẹp', N'/sofa-da-phong-khach?filter11=9977', 5, 1, N'/Data/images/Banner/sofa-da-rinova.jpg')
INSERT [dbo].[Banner] ([ID], [Title], [Link], [Type], [Status], [Image]) VALUES (10, N'Thiết kế thi công nội thất', N'/thiet-ke-noi-that', 4, 1, N'/Data/images/Banner/d907bb7e4f39b667ef28.jpg')
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[BannerGroups] ON 

INSERT [dbo].[BannerGroups] ([ID], [Title], [Status], [ParentID]) VALUES (1, N'Banner Trên', 1, 1)
INSERT [dbo].[BannerGroups] ([ID], [Title], [Status], [ParentID]) VALUES (2, N'Banner Giữa', 1, NULL)
INSERT [dbo].[BannerGroups] ([ID], [Title], [Status], [ParentID]) VALUES (3, N'Banner Giữa - Trước', 1, 2)
INSERT [dbo].[BannerGroups] ([ID], [Title], [Status], [ParentID]) VALUES (4, N'Banner Giữa - Dọc', 1, 2)
INSERT [dbo].[BannerGroups] ([ID], [Title], [Status], [ParentID]) VALUES (5, N'Banner Giữa - Sau', 1, 2)
SET IDENTITY_INSERT [dbo].[BannerGroups] OFF
SET IDENTITY_INSERT [dbo].[BookOnlineCustomers] ON 

INSERT [dbo].[BookOnlineCustomers] ([ID], [ProductID], [FullName], [Sex], [Mobile], [Email], [Note], [Status], [SentDate]) VALUES (1, 21, N'Trần Đăng Quang', 0, N'0961273606', N'nnhuyenmy1701@gmail.com', N'Test', N'Chưa x? l?', CAST(N'2020-12-22 01:27:35.833' AS DateTime))
SET IDENTITY_INSERT [dbo].[BookOnlineCustomers] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (1, N'Phòng khách', N'phong-khach', 1, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (2, N'Phòng ăn', N'phong-an', 2, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (3, N'Phòng ngủ', N'phong-ngu', 3, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (4, N'Cách lựa chọn đồ', N'cach-lua-chon-do', 4, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (5, N'Cách trang trí', N'cach-trang-tri', 5, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (6, N'Không gian trẻ', N'khong-gian-tre', 6, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (7, N'Không gian nội thất', N'khong-gian-noi-that', 7, 1)
INSERT [dbo].[Categories] ([ID], [Title], [MetaTitle], [Order], [Status]) VALUES (8, N'Khuyến mãi', N'khuyen-mai', 8, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [Name], [Mobile], [Email], [Content], [Status], [SentDate]) VALUES (1, N'Trần Đăng Quang', N'0961273606', N'nnhuyenmy1701@gmail.com', N'Test', 0, CAST(N'2020-12-22 01:16:19.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([ID], [FullName], [Mobile], [Email], [Comment], [SentDate]) VALUES (1, N'Trần Đăng Quang', N'0961273606', N'nnhuyenmy1701@gmail.com', N'Test', CAST(N'2020-12-21 20:56:24.613' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Logoes] ON 

INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (1, N'/Data/images/Logoes/logo-nhadep.jpg', N'Nội thất Nhà Đẹp', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (2, N'/Data/images/Logoes/logo-phobien.jpg', N'Nhà hàng Phố Biển', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (3, N'/Data/images/Logoes/logo-fit24.jpg', N'Trung tâm thể thao Fit24', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (4, N'/Data/images/Logoes/logo-vanhoa.jpg', N'Nhà hàng tiệc cưới Vạn Hoa', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (5, N'/Data/images/Logoes/logo-mammamia.jpg', N'Nhà hàng Ý Mamma Mia', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (6, N'/Data/images/Logoes/logo-hola.jpg', N'Nhà hàng lẩu Hola', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (7, N'/Data/images/Logoes/logo-nha-hang-de-nhat.jpg', N'Nhà hàng Đệ Nhất', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (8, N'/Data/images/Logoes/logo-zcafe.jpg', N'Nhà hàng Zcafe', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (9, N'/Data/images/Logoes/logo-tct-group.jpg', N'TCT group', 1)
INSERT [dbo].[Logoes] ([ID], [Image], [Title], [Status]) VALUES (10, N'/Data/images/Logoes/logo-thien-son-plaza.jpg', N'TTTM Thiên Sơn Plaza', 1)
SET IDENTITY_INSERT [dbo].[Logoes] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([ID], [Name], [Slogan], [Avatar], [Job], [Status]) VALUES (1, N'Đoàn Văn Khoa', N'Sự khác biệt giữa một thiết kế đẹp và xấu là thời gian ta dành cho nó.', N'/Data/images/kts-khoa-180x180.jpg', N'Kiến trúc sư', 1)
INSERT [dbo].[Members] ([ID], [Name], [Slogan], [Avatar], [Job], [Status]) VALUES (2, N'Đào Duy Long', N'Đặt lòng tin vào các kiến trúc sư, họ sẽ mang tới một không gian sống dành riêng cho bạn.', N'/Data/images/kts-dao-duy-long-nha-dep.jpg', N'Kiến trúc sư', 1)
INSERT [dbo].[Members] ([ID], [Name], [Slogan], [Avatar], [Job], [Status]) VALUES (3, N'Nguyễn Mạnh Hùng', N'Thiết kế nội thất là một cách chúng tôi biến thế giới trở nên lý tưởng hơn.', N'/Data/images/kts-hunfg-180x180.jpg', N'Kiến trúc sư', 1)
INSERT [dbo].[Members] ([ID], [Name], [Slogan], [Avatar], [Job], [Status]) VALUES (4, N'Hoàng Ngọc Khang', N'Tôi tin rằng cuộc sống của chúng ta phần nào được định hướng bởi không gian nội thất.', N'/Data/images/kts-khang-180x180.jpg', N'Kiến trúc sư', 1)
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[Newses] ON 

INSERT [dbo].[Newses] ([ID], [Title], [ShortDesc], [MetaTitle], [ContentHtml], [Image], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Status]) VALUES (1, N'Miễn phí thiết kế nội thất 100%', N'Lần đầu tiên tại Nhà Đẹp, chúng tôi sẽ thiết kế nội thất miễn phí cho gia đình bạn!', N'mien-phi-thiet-ke-noi-that-100', N'<p>Lần đầu ti&ecirc;n tại Nh&agrave; Đẹp, ch&uacute;ng t&ocirc;i sẽ thiết kế nội thất miễn ph&iacute; cho gia đ&igrave;nh bạn!&nbsp;</p>

<p><br />
Duy nhất trong th&aacute;ng 7 - Bạn sẽ c&oacute; cơ hội:</p>

<p><br />
- Được miễn ho&agrave;n to&agrave;n 100% chi ph&iacute; thiết kế khi k&iacute; hợp đồng thi c&ocirc;ng, &aacute;p dụng cho căn hộ chung cư.<br />
- Được trực tiếp thiết kế nội thất v&agrave; tư vấn bởi kiến tr&uacute;c sư chuy&ecirc;n m&ocirc;n cao.<br />
- Được tối ưu kh&ocirc;ng gian sử dụng m&agrave; vẫn đảm bảo nhu cầu c&aacute; nh&acirc;n v&agrave; t&iacute;nh thẩm mỹ.</p>

<div><br />
Chương tr&igrave;nh &aacute;p dụng từ ng&agrave;y 01/07/2020 &ndash; 31/07/2020<br />
<br />
Xem th&ecirc;m c&aacute;c mẫu thiết kế nội thất tại:&nbsp;<a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fnhadep.com.vn%2Fthiet-ke-noi-that%3Ffbclid%3DIwAR1YI5fn6OnhstQxCCM7a_dsvw-QXg4Lgf3sRZ_EC_5-OI2RCy2fQ6F1vhI&amp;h=AT1gKcdKYC1K4xhELEFMoaVpU5zzuYw1ko6rJHeNqSsVwp1YkiwbJyzfuD27Fcfy_L_X2DSR149gFMz7GeOjLxbg2aJ9StDkP3UtDISkOXxavhL7mUws1tew8nGzq6sYzQ0&amp;__tn__=-UK-R&amp;c[0]=AT3eXxnybVzhxw53ay36rPYngklK5RLJRk37LGglPBmAaTVu_lYUonL3-o7pt-U1APXWuVuwGRxI2IPLGzAlsOD5zaesTX7Ft_5mJ7oMUb7VLENL4MRvPqLHQhG2iHxPAywgiCJGxL4fWuU2A_XI0SThbE-YDwxswiryKo8NFpgJ3be7nUUqrpl9Ajn6" rel="nofollow noopener" tabindex="0" target="_blank">https://nhadep.com.vn/thiet-ke-noi-that</a><br />
<br />
THIẾT KẾ NỘI THẤT NH&Agrave; ĐẸP CAM KẾT:<br />
- Uy t&iacute;n, cam kết đảm bảo tiến độ<br />
- C&ocirc;ng năng ph&ugrave; hợp, tiện nghi&nbsp;<br />
- Thiết kế nội thất tinh tế, nhẹ nh&agrave;ng<br />
- Dịch vụ bảo h&agrave;nh tận t&acirc;m<br />
<br />
NỘI THẤT NH&Agrave; ĐẸP:</div>
', N'/Data/images/News/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20mi%E1%BB%85n%20ph%C3%AD%20100%25%201200x900.png', CAST(N'2020-12-20 15:19:45.023' AS DateTime), N'ngoc', CAST(N'2020-12-20 15:13:19.503' AS DateTime), N'ngocadmin', 8, 0, 1)
INSERT [dbo].[Newses] ([ID], [Title], [ShortDesc], [MetaTitle], [ContentHtml], [Image], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Status]) VALUES (2, N'Ưu điểm đặc biệt của sofa da Italia nhập khẩu', N'Mỗi khi có ý định mua sắm nội thất phòng khách, thì chắc chắn gia đình nào cũng đều hơn một lần nghĩ tới Sofa da Italia nhập khẩu. Sở hữu một chiếc sofa da Italia chính hãng không chỉ thể hiện đẳng [...]', N'uu-diem-dac-biet-cua-sofa-da-italia-nhap-khau', N'</div>
                                <p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Đã từ rất lâu, mỗi khi có ý định mua sắm nội thất phòng khách, thì chắc chắn gia đình nào cũng đều hơn một lần nghĩ tới Sofa da Italia nhập khẩu. Sở hữu một chiếc sofa da Italia chính hãng không chỉ thể hiện đẳng cấp, tính thẩm mỹ mà còn là niềm tự hào của gia chủ. Vậy, những ưu điểm mà sofa da Italia sở hữu là gì mà khiến nó trở nên thu hút đến vậy?</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">1. Sofa da Italia nhập nhẩu có chất liệu cao cấp</span></b></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Tu-van-noi-that/Phong-khach/uu-diem-cua-sofa-da-italia-1.jpg" style="width: 750px; height: 500px;" /></span></b></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Ngành công nghiệp thuộc da đã nhen nhóm hình thành từ những năm 1300 trước Công nguyên và dần dần xuất hiện ở khắp nơi trên thế giới. Trong các khu vực mà ngành công nghiệp này để lại dấu ấn, Italia được xem là nơi phát triển vượt bậc hơn cả. Nước Ý đã nổi tiếng thế giới với công nghệ thuộc da từ gần 1000 năm nay, trong khi ngành công nghiệp thuộc da của các nước khác mới chỉ bắt đầu &ldquo;đuổi theo&rdquo; từ thế kỷ 17.</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tuy vậy, thời gian không phải yếu tố duy nhất giúp ngành thuộc da nước này đứng đầu thế giới. Nguồn nước đặc trưng mà nghệ nhân nước này sử dụng để xử lý da chính là đặc điểm thiết yếu làm nên một chiếc sofa da Italia hoàn hảo. Một số nguồn nước ở Ý có chứa chất hóa học mà không nơi đâu có được, các hợp chất này rất tốt trong việc xử lý da, giúp da mềm và mịn hơn so với khi được xử lý ở các đất nước khác. </span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Thêm vào đó, sự chi tiết của những nghệ nhân thuộc da Italia còn đến từ khâu tuyển chọn bò để lấy da. Chất lượng da của những chú bò này ảnh hưởng rất lớn đến sản phẩm cuối cùng. Những chú bò được lựa chọn phải được đảm bảo về sức khỏe, da ít khiếm khuyết.</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Chất liệu da của Italia cực kỳ mềm mại, có độ bóng tự nhiên đầy thu hút và đặc biệt là rất bền. Chính vì vậy sofa da Italia cao cấp luôn được coi là hình mẫu tiêu chuẩn cho toàn ngành công nghiệp sản xuất sofa trên thế giới, là biểu tượng của thiết kế đẳng cấp, phong cách lịch lãm &nbsp;và chất lượng hàng đầu.</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">2. Sofa da Italia nhập nhẩu có độ bền cao</span></b></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Tu-van-noi-that/Phong-khach/uu-diem-cua-sofa-da-italia-2.jpg" style="width: 750px; height: 500px;" /></span></b></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nhờ quá trình thuộc da đẳng cấp, một chiếc sofa da Italia cao cấp có thể có độ bền lên đến hàng chục năm. Thêm vào đó, công nghệ hiện đại không ngừng được cải tiến và nâng tầm cho ngành công nghiệp sản xuất sofa vốn dĩ đã hết sức điêu luyện của Italia, khiến độ bền của các bộ sofa da Italia chính hãng ngày càng được kéo dài. </span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">3. Sofa da Italia nhập nhẩu được thiết kế hiện đại, đẳng cấp</span></b></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Tu-van-noi-that/Phong-khach/uu-diem-cua-sofa-da-italia-3.jpg" style="width: 750px; height: 500px;" /></span></b></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Đất nước hình chiếc ủng ngay từ xa xưa đã luôn là &ldquo;kẻ dẫn đầu&rdquo; trong việc kiến tạo nên những xu hướng trong lĩnh vực thiết kế.&nbsp; Chính vì lẽ đó, những sản phẩm được tạo ra ở đây luôn mang một phong cách rất đặc trưng và khác biệt. </span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Từ kiến trúc, thời trang, điêu khắc, hội họa cho đến nội thất, sofa cũng không ngoại lệ, những thiết kế sofa đến từ Italia luôn toát lên sự tinh tế và đẳng cấp. Không chỉ đa dạng về kiểu dáng, sofa da Italia da nhập khẩu còn không ngừng cải tiến về công năng, đáp ứng được nhu cầu ngày một cao của khách hàng khi sử dụng.</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Mỗi đất nước mà những chiếc sofa da Italia cao cấp này đi qua, chúng đều trở thành tiêu chuẩn và biểu tượng cho chất lượng và sự hoàn mỹ ở nơi đó. </span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nếu bạn đang đi tìm cho mình một chiếc sofa phù hợp, Sofa Italia da nhập khẩu chính hãng luôn là lựa chọn hoàn hảo của bạn. Sofa da sẽ tôn thêm sự sang trọng cũng như tinh tế cho không gian ngôi nhà. Nếu còn băn khoăn và do dự khi đưa ra quyết định, hãy đến với Nội Thất Nhà Đẹp để nhận được sự tư vấn nhiệt tình và chu đáo nhất!</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nội Thất Nhà Đẹp tự hào là công ty cung cấp sofa da Italia uy tín và chất lượng, với nhiều thương hiệu sản xuất sofa da Italia cao cấp nổi tiếng tại Italia và trên thế giới. Đặc biệt với sản phẩm sofa da, Nhà Đẹp thực hiện chế độ bảo hành 10 năm cho khung, 2 năm cho da và bảo dưỡng da miễn phí 6 tháng/lần trong 5 năm.</span></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tham khảo các sản phẩm sofa da Italia nhập khẩu chính hãng tại Nhà Đẹp:&nbsp;</span></span></span></span><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><a href="https://nhadep.com.vn/search?keyword=sofa+da+italia" style="color:blue; text-decoration:underline">https://nhadep.com.vn/search?keyword=sofa+da+italia</a></span></span></span></p>

<p style="text-align:justify; margin:0cm 0cm 10pt">&nbsp;</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Liên hệ tư vấn thiết kế nội thất: 093 636 2998</span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom Nội Thất Nhà Đẹp</span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom 1: Tầng 1, Thiên Sơn Plaza, 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội</span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom 2: Tầng 1, Thiên Sơn Plaza, 89 Lê Đức Thọ, Mỹ Đình, Từ Liêm, Hà Nội</span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Hotline: 0906 264 268 | Website: www.nhadep.com.vn</span></span></span></span></div>', N'/Data/images/News/%C6%AFu-%C4%91i%E1%BB%83m-%C4%91%E1%BA%B7c-bi%E1%BB%87t-sofa-da-italia-5.jpg', CAST(N'2020-12-20 15:19:45.023' AS DateTime), N'ngocadmin', NULL, NULL, 1, 0, 1)
INSERT [dbo].[Newses] ([ID], [Title], [ShortDesc], [MetaTitle], [ContentHtml], [Image], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Status]) VALUES (3, N'4 kiểu tủ bếp hiện đại', N'Việc lựa chọn một hệ thống tủ bếp phù hợp với không gian bếp của mình không hẳn là dễ dàng với nhiều người. Nội Thất Nhà Đẹp sẽ giúp bạn tìm ra câu trả lời trong số 4 kiểu dáng tủ bếp hiện đại dưới [...]', N'4-kieu-tu-bep-hien-dai', N'<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Việc lựa chọn một hệ thống tủ bếp phù hợp với không gian bếp của mình không hẳn là dễ dàng với nhiều người. Nội Thất Nhà Đẹp sẽ giúp bạn tìm ra câu trả lời trong số 4 kiểu dáng tủ bếp hiện đại dưới đây.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nhìn chung, bếp hình chữ I và chữ L phù hợp hơn với những căn bếp có diện tích từ 4 đến 6 mét vuông, còn lại kiểu bếp hình chữ U và bếp đảo phù hợp với những căn bếp có diện tích lớn hơn.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">1, Tủ bếp chữ I</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(17).jpg" style="width: 750px; height: 503px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(5).jpg" style="width: 750px; height: 441px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Thiết kế tủ bếp hình chữ I đơn giản, thông thoáng, tiết kiệm diện tích. Theo thói quen của gia chủ, các khu vực thao tác được sắp xếp lần lượt từ trái qua phải hoặc từ phải qua trái bao gồm khu vực sơ chế, nấu nướng và dọn dẹp. Tủ bếp chữ I tuy đơn giản nhưng không hề đơn điệu, rất linh hoạt trong các phong cách khác nhau.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Ưu điểm của tủ bếp hình chữ I:</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(7).jpg" style="width: 750px; height: 503px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nó phù hợp nhất cho không gian hẹp. Không có chướng ngại vật ảnh hưởng đến chuyển động trong quá trình hoạt động. Mọi ngăn tủ đều có thể được sử dụng hết và có thể nhìn thấy tất cả các thiết bị trong nháy mắt.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tủ bếp hình chữ I giúp gia chủ đặt tất cả các thiết bị và ngăn tủ dọc theo một bức tường. Tủ bếp chữ I kết nối các khu vực chức năng thành một đường thẳng, bao gồm bếp nấu, bồn nước, khu sơ chế rau củ. Ưu điểm là tối ưu hóa không gian và mang lại cảm giác thông thoáng. </span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">2, Tủ bếp hình chữ L</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(8).jpg" style="width: 750px; height: 516px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(15).jpg" style="width: 750px; height: 516px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tủ chữ L phần góc thường được thiết kế để làm vị trí đặt bồn rửa. Bằng cách này, khoảng cách giữa bếp nấu và bồn rửa có thể được mở rộng, không gian của khu vực sơ chế được tăng lên. Và cùng với phần tủ góc, khả năng lưu trữ được nâng cao hơn.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Ưu điểm của tủ bếp chữ L:</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(9).JPG" style="width: 750px; height: 833px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(18).JPG" style="width: 750px; height: 833px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Bếp hình chữ L là dạng bếp bán mở, có thể đáp ứng được hầu hết các kiểu bếp, ở giữa cũng có thể lắp thêm bàn đảo làm bàn ăn, rất tiết kiệm diện tích. Và nó cũng giúp cung cấp không gian lưu trữ đầy đủ.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">3, Tủ bếp hình chữ U</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(19).JPG" style="width: 750px; height: 516px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tủ bếp hình chữ U đặc biệt phù hợp với những căn bếp có diện tích rộng nên loại tủ này rất được ưa chuộng ở nước ngoài. Dạng tủ bếp này có đủ không gian cho cả 2 người sử dụng cùng lúc mà không gây cảm giác chật chội.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Ưu điểm của tủ bếp chữ U:</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tủ bếp hình chữ U có nhiều chỗ để phân chia khu vực nấu nướng hơn và khả năng lưu trữ tốt hơn. Nếu là thiết kế bếp mở, quầy ở một bên bếp cũng có thể được dùng làm quầy bar hoặc bàn ăn.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tủ bếp hình chữ U cũng giúp gia chủ tận dụng lợi thế của góc bếp, mở tường ngăn giữa bếp và phòng ăn, sử dụng quầy bar để thiết lập vách ngăn, tăng không gian của bếp, đồng thời cũng tăng công năng cho việc thưởng thức đồ ăn và chuẩn bị bữa ăn.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">4, Tủ bếp đảo</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(12).jpg" style="width: 750px; height: 516px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(11).jpg" style="width: 750px; height: 516px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tủ bếp đảo một khu vực hoạt động riêng biệt độc lập với tủ bếp và có thân tủ bên dưới. Bếp đảo giúp gia chủ có thể thoải mái sử dụng bếp ở mọi hướng, là điểm nhấn trong không gian bếp ăn và giúp cho việc sử dụng bếp được dễ dàng hơn.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Ưu điểm của tủ bếp dạng đảo:</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/T%E1%BB%A7%20B%E1%BA%BFp%20(1).jpg" style="width: 750px; height: 459px;" /></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Bệ đảo bếp chủ yếu dùng để chế biến các món ăn, phân chia các món ăn sống và chín hoặc vệ sinh một số loại rau củ quả theo thói quen sinh hoạt và sở thích của gia chủ.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Quầy đảo bếp còn có thể được cách tân kết hợp thành quầy bar và bàn ăn tạm thời. Nó không chỉ có thể làm cho không gian sạch sẽ và gọn gàng hơn mà còn trở thành một điểm nhấn thú vị cho không gian bếp.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Với đội ngũ thiết kế tinh tế và tận tâm, đội ngũ thi công nhanh nhẹn và nhiệt tình cùng nhiều năm kinh nghiệm trong lĩnh vực thiết kế và thi công nội thất, Nhà Đẹp luôn đem đến sự hài lòng và yên tâm cho mọi khách hàng.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">NỘI THẤT NHÀ ĐẸP:</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">HOTLINE: 0906 264 268 </span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom Hoàn Kiếm: 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tel: 024 3932 3366 - 024 3932 9255</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom Mỹ Đình: 89 Lê Đức Thọ, Mỹ Đình, Hà Nội</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:12.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tel: 024 3795 1757 - 024 3795 1758</span></span></span></span></span></span></div>

                                <div style="border-top: 1px solid #ccc; padding-top: 10px; clear: both;">
                                    <div class="share-this">', N'/Data/images/News/T%E1%BB%A7%20B%E1%BA%BFp%20(11).jpg', CAST(N'2020-12-20 15:24:33.930' AS DateTime), N'ngocadmin', NULL, NULL, 2, 0, 1)
INSERT [dbo].[Newses] ([ID], [Title], [ShortDesc], [MetaTitle], [ContentHtml], [Image], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Status]) VALUES (4, N'KHUYẾN MÃI RỘN RÀNG, TÂN TRANG TỔ ẤM!', N'Trong tháng 12 này, Nội Thất Nhà Đẹp gửi tới Quý khách hàng chương trình khuyến mãi đặc biệt lên tới 25% toàn bộ sản phẩm nội thất!', N'khuyen-mai-ron-rang-tan-trang-to-am', N'                                <p>&nbsp;</p>

<p>Bạn có biết rằng tân trang lại ngôi nhà của mình cũng là một cách hữu hiệu để đón thêm những cơ hội và thành công mới? Vậy thì sao không bắt đầu luôn từ hôm nay nhỉ?</p>

<p>Trong tháng 11 này, Nội Thất Nhà Đẹp gửi tới Quý khách hàng chương trình khuyến mãi đặc biệt lên tới 25% toàn bộ sản phẩm nội thất!</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Giảm giá 20% các sản phẩm nội thất phòng khách</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Giảm giá 15% các sản phẩm nội thất phòng ăn</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Giảm giá 25% các sản phẩm nội thất phòng ngủ</p>

<p>Chương trình được bắt đầu từ 01/11/2020 &ndash; 30/11/2020, áp dụng cho toàn bộ showroom Nhà Đẹp.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-bai-viet-trang-KM/CTKM-T11_2.jpg" style="width: 750px; height: 750px;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-bai-viet-trang-KM/CTKM-T11_3%20(1).jpg" style="width: 750px; height: 750px;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-bai-viet-trang-KM/CTKM-T11_4%20(1).jpg" style="width: 750px; height: 750px;" /></p>

<p>--------------</p>

<p>Nội thất Nhà đẹp - Cùng bạn kiến tạo ngôi nhà mơ ước</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Bảo trì trọn đời sản phẩm</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Bảo hành từ 01 năm - 10 năm</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Miễn phí dịch vụ tư vấn bằng hình ảnh 3D</p>

<p><img alt="☑️" height="16" src="https://static.xx.fbcdn.net/images/emoji.php/v9/t8d/1/16/2611.png" width="16" /> Miễn phí gói bảo dưỡng sofa da trong 5 NĂM</p>

<p>--------------</p>

<p>NỘI THẤT NHÀ ĐẸP &ndash; Thương hiệu nội thất hàng đầu Việt Nam</p>

<p>HOTLINE: 0906 264 268 &bull; Tư vấn thiết kế: 093 636 2998</p>

<p>Website: nhadep.com.vn</p>

<p>Showroom Hoàn Kiếm: 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội</p>

<p>Tel: 024 3932 3366 - 024 3932 9255</p>

<p>Showroom Mỹ Đình: 89 Lê Đức Thọ, Mỹ Đình, Hà Nội</p>

<p>Tel: 024 3795 1757 - 024 3795 1758</p>', N'/Data/images/News/CTKM-T11_1.jpg', CAST(N'2020-12-20 15:27:20.773' AS DateTime), N'ngocadmin', NULL, NULL, 8, 0, 1)
INSERT [dbo].[Newses] ([ID], [Title], [ShortDesc], [MetaTitle], [ContentHtml], [Image], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Status]) VALUES (5, N'Những tone màu sofa đẹp bạn không thể bỏ qua', N'Khi mua sofa, điều mà các gia chủ cũng nên cân nhắc kĩ lưỡng bên cạnh chất liệu và kiểu dáng đó chính là màu sắc của chiếc sofa. Màu sắc sofa cũng có một sự ảnh hưởng lớn đến thẩm mỹ không gian [...]', N'nhung-tone-mau-sofa-dep-ban-khong-the-bo-qua', N'<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Khi mua sofa, điều mà các gia chủ cũng nên cân nhắc kĩ lưỡng bên cạnh chất liệu và kiểu dáng đó chính là màu sắc của chiếc sofa. Màu sắc sofa cũng có một sự ảnh hưởng lớn đến thẩm mỹ không gian chung của phòng khách.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Vì vậy, việc lựa chọn một bộ ghế sofa phù hợp thì màu sắc là yếu tố vô cùng quan trọng và cần thiết tiếp thêm năng lượng tích cực cho cả gia đình. Hãy cùng Nhà Đẹp khám phá những tone màu tuyệt vời dưới đây, hy vọng sẽ mang đến cho bạn nhiều sự lựa chọn:</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Sang trọng với sofa da tone màu tối</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tone màu tối luôn luôn là tone màu kinh điển và được lựa chọn bởi rất nhiều gia đình. Màu tối được lựa chọn cho bộ sofa khiến cho phòng khách cảm giác sang trọng, tinh tế, độ bền của màu giúp cho sản phẩm lúc nào cũng như mới. Khi được sử dụng trên chất liệu da bóng, các tone màu tối giúp chiếc sofa thực sự trở thành điểm nhấn ấn tượng tại nhiều không gian.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%201.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Bên cạnh đó, tone màu tối được lựa chọn bởi nó dễ dàng kết hợp với các món nội thất khác. Bạn sẽ không mất nhiều thời gian khi lựa chọn các món đồ trang trí trong ngôi nhà. </span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%205.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Về phong thủy, màu đen huyền bí thường được ưu tiên lựa chọn vì ý nghĩa phong thuỷ khá tốt, rất dễ thu hút nguồn năng lượng cơ hội tiền tài và danh lợi đến cho gia chủ. Màu đen là màu tượng trưng cho quyền lực, sự tôn kính và danh vọng. Vì vậy, khi đặt chúng ở phòng khách được xem là vị trí đặc biệt thu hút tài lộc và vận may vô cùng tốt, giúp gia đình đón nhận được nhiều điều may mắn, thuận lợi.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%206.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tone màu nâu cũng là tone màu được nhiều da chủ lựa chọn do chúng mang sắc thái thanh lịch, sang trọng và tạo cảm giác bình yên cho gia chủ mỗi khi quay về nhà.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Hiện đại với sofa tone màu trung tính</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Tone màu trung tính được ưa chuộng khi lựa chọn sofa thường thấy là màu ghi nhạt, màu be, màu sữa&hellip; Tone màu này rất dễ phối hợp cùng nhiều gam màu khác trong phòng khách. Giúp gia chủ tiết kiệm thời gian mua sắm và trang trí cho ngôi nhà của mình.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%204.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Màu trung tính cũng được nhiều khách hàng yêu thích bởi không dễ bị lộ bụi bẩn. Nhất là được làm từ chất liệu da thì việc làm sạch bộ ghế hàng ngày được thực hiện một cách dễ dàng.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%203.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><b><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Phá cách với sofa tone màu nổi bật</span></span></span></b></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nếu bạn là một người ưa sự cá tính và muốn phòng khách của mình mang vẻ hiện đại và nổi bật, hãy thử lựa chọn sofa với các tone màu nổi bật và trẻ trung như vàng, xanh biển, cam&hellip;</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%208.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Màu vàng tượng trưng cho sự quý phái và sang trọng. Nó mang đến cho bạn cảm giác được khám phá và tràn đầy hi vọng. Một chiếc sofa màu vàng trong phòng khách sẽ thu hút mọi ánh nhìn và mang sức sống bất tận cho không gian phòng khách nhà bạn.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%209.jpg" style="width: 750px; height: 472px;" /></span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Với sofa màu xanh biển, không gian phòng khách sẽ mang một phong cách rất hiện đại và bắt mắt. Sofa màu xanh biển kết hợp với các đồ nội thất có màu trung tính khác là một cách hữu hiệu để khiến phòng khách nổi bật mà vẫn vô cùng thẩm mỹ.</span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/Blog%20T%C6%B0%20V%E1%BA%A5n/Sofa%207.jpg" style="width: 750px; height: 472px;" /></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Màu cam cũng là màu sắc đáng chú ý khi lựa chọn sofa có màu nổi bật. Màu cam thường được rất nhiều người trẻ tuổi, cá tính lựa chọn để biến không gian sống trở nên cuốn hút và quyến rũ hơn. Ghế sofa màu cam mang đến cho không gian sống sự nhiệt huyết, năng động và khiến căn phòng sẽ trông thật ấn tượng hơn khi sử dụng.</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<p style="text-align:justify; margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Quá trình chọn mua sofa vẫn chưa bao giờ là điều dễ dàng và đòi hỏi gia chủ cần tìm hiểu sản phẩm và nghiên cứu kĩ lưỡng không gian nhà mình. Nhà Đẹp chúc bạn có những lựa chọn đúng đắn khi mua ghế sofa đặt trong căn phòng khách và nếu cần sự hỗ trợ, hãy liên lạc ngay với Nhà Đẹp nhé!</span></span></span></span></span></span></p>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Chi tiết xin vui lòng liên hệ:</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">HOTLINE: 0906 264 268 &bull; Tư vấn thiết kế: 093 636 2998</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom Hoàn Kiếm: 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội</span></span></span></span></span></span></div>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-size:13.0pt"><span style="line-height:115%"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Showroom Mỹ Đình: 89 Lê Đức Thọ, Mỹ Đình, Hà Nội</span></span></span></span></span></span></div>

<p style="text-align:justify; margin:0in 0in 10pt">&nbsp;</p>', N'/Data/images/News/Sofa%204.jpg', CAST(N'2020-12-20 15:30:33.550' AS DateTime), N'ngocadmin', NULL, NULL, 1, 0, 1)
INSERT [dbo].[Newses] ([ID], [Title], [ShortDesc], [MetaTitle], [ContentHtml], [Image], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Status]) VALUES (6, N'LỄ HỘI TÂN TRANG - NHẬN QUÀ TẶNG VÀNG', N'Không chỉ là khuyến mãi, từ 01/12/2020 – 31/12/2020, quà tặng ngập tràn cho các hóa đơn mua hàng tại Nhà Đẹp!', N'le-hoi-tan-trang-nhan-qua-tang-vang', N'<p>LỄ HỘI T&Acirc;N TRANG</p>

<p>NHẬN QU&Agrave; TẶNG V&Agrave;NG&nbsp;</p>

<p>&nbsp;</p>

<p>Th&aacute;ng 12 - M&ugrave;a lễ hội, m&ugrave;a mua sắm, m&ugrave;a t&acirc;n trang, m&ugrave;a ưu đ&atilde;i &ldquo;v&agrave;ng&rdquo; của Nh&agrave; Đẹp!</p>

<p>Kh&ocirc;ng chỉ l&agrave; khuyến m&atilde;i, từ 01/12/2020 &ndash; 31/12/2020, qu&agrave; tặng ngập tr&agrave;n cho c&aacute;c h&oacute;a đơn mua h&agrave;ng tại Nh&agrave; Đẹp!</p>

<p>&nbsp;</p>

<p>Ưu đ&atilde;i giảm gi&aacute; hấp dẫn:</p>

<p>- Giảm 25% cho c&aacute;c sản phẩm ph&ograve;ng kh&aacute;ch</p>

<p>- Giảm 20% cho c&aacute;c sản phẩm ph&ograve;ng ăn</p>

<p>- Giảm 30% cho c&aacute;c sản phẩm ph&ograve;ng ngủ</p>

<p>- Giảm 35% cho sản phẩm sofa da &Yacute; Gyform</p>

<p>- Giảm 25% nếu kh&aacute;ch mua 01 b&agrave;n ăn + 04 ghế ăn trở l&ecirc;n</p>

<p>&nbsp;</p>

<p>Ưu đ&atilde;i tặng qu&agrave; si&ecirc;u lớn:</p>

<p>- Tặng ngay 01 thảm bất kỳ khi mua sofa da &Yacute; 03 chỗ hoặc sofa g&oacute;c k&egrave;m b&agrave;n tr&agrave;</p>

<p>- Đặc biệt, h&atilde;y c&ugrave;ng chờ đ&oacute;n ưu đ&atilde;i may mắn &ldquo;MỪNG GI&Aacute;NG SINH SANG &ndash; RINH QU&Agrave; TẶNG V&Agrave;NG&rdquo; từ Nh&agrave; Đẹp nh&eacute;!</p>

<p>Chương tr&igrave;nh &aacute;p dụng cho to&agrave;n hệ thống Showroom Nh&agrave; Đẹp!</p>

<p style="text-align:center"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/KM/Artboard%203%403x-100%20(1).jpg" style="height:700px; width:700px" /></p>

<p style="text-align:center"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/KM/Artboard%204%403x-100%20(1).jpg" style="height:700px; width:700px" /></p>

<p style="text-align:center"><img alt="" src="https://nhadep.com.vn/Uploads/images/%E1%BA%A2nh%20kh%C3%A1c/KM/Artboard%205%403x-100.jpg" style="height:700px; width:700px" /></p>

<p>--------------</p>

<p>NỘI THẤT NH&Agrave; ĐẸP &ndash; Thương hiệu nội thất h&agrave;ng đầu Việt Nam</p>

<p>HOTLINE: 0906 264 268 &bull; Tư vấn thiết kế: 093 636 2998</p>

<p>Website: nhadep.com.vn</p>

<p>Showroom Ho&agrave;n Kiếm: 02 Chương Dương Độ, Ho&agrave;n Kiếm, Hà N&ocirc;̣i</p>

<p>Showroom Mỹ Đ&igrave;nh: 89 L&ecirc; Đức Thọ, Mỹ Đình, Hà N&ocirc;̣i</p>
', N'/Data/images/News/Artboard%202%403x-100.jpg', CAST(N'2020-12-20 15:19:45.023' AS DateTime), N'ngoc', CAST(N'2020-12-20 15:32:51.870' AS DateTime), N'ngocadmin', 8, 0, 1)
SET IDENTITY_INSERT [dbo].[Newses] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (1, N'Phòng khách', N'phong-khach', N'/Data/images/ProductCategory/danh-muc-sofa-da.jpg', 1, 1, NULL)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (2, N'Phòng ăn', N'phong-an', NULL, 2, 1, NULL)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (3, N'Phòng ngủ', N'phong-ngu', N'/Data/images/ProductCategory/danh-muc-phong-ngu.jpg', 3, 1, NULL)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (4, N'Trang trí và gia dụng', N'trang-tri-va-gia-dung', NULL, 4, 1, NULL)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (5, N'Sofa da', N'sofa-da', N'/Data/images/ProductCategory/danh-muc-sofa-da.jpg', 1, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (6, N'Sofa vải', N'sofa-vai', N'/Data/images/ProductCategory/danh-muc-sofa-vai.jpg', 2, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (7, N'Sofa giường', N'sofa-giuong', N'/Data/images/ProductCategory/danh-muc-sofa-bed.jpg', 3, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (8, N'Bàn trà', N'ban-tra', N'/Data/images/ProductCategory/danh-muc-ban-tra.jpg', 4, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (9, N'Ghế thư giãn', N'ghe-thu-gian', NULL, 5, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (10, N'Tủ - Kệ', N'tu-ke', NULL, 6, 1, 1)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (11, N'Bàn ăn gỗ', N'ban-an-go', N'/Data/images/ProductCategory/danh-muc-ban-an-go.jpg', 1, 1, 2)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (12, N'Bàn ăn thông minh mở rộng', N'ban-an-thong-minh-mo-rong', N'/Data/images/ProductCategory/danh-muc-ban-an-thong-minh.jpg', 2, 1, 2)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (13, N'Ghế gỗ', N'ghe-go', NULL, 3, 1, 2)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (14, N'Ghế kim loại', N'ghe-kim-loai', NULL, 4, 1, 2)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (15, N'Tủ ly, tủ rượu', N'tu-ly-tu-ruou', NULL, 5, 1, 2)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (16, N'Phòng ngủ người lớn', N'phong-ngu-nguoi-lon', N'/Data/images/ProductCategory/danh-muc-phong-ngu-nguoi-lon.jpg', 1, 1, 3)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (17, N'Phòng ngủ trẻ em', N'phong-ngu-tre-em', N'/Data/images/ProductCategory/danh-muc-giuong-ngu-tre-em.jpg', NULL, 1, 3)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (18, N'Tượng trang trí', N'tuong-trang-tri', NULL, 1, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (19, N'Tranh - Khung ảnh', N'tranh-khung-anh', NULL, 2, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (20, N'Lọ trang trí', N'lo-trang-tri', NULL, 3, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (21, N'Đèn trang trí', N'den-trang-tri', NULL, 4, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (22, N'Thảm', N'tham', NULL, 5, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (23, N'Gối tựa sofa', N'goi-tua-sofa', NULL, 6, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (24, N'Gương trang trí', N'guong-trang-tri', NULL, 7, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (25, N'Hoa giả', N'hoa-gia', NULL, 8, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (26, N'Đồ dùng bàn ăn', N'do-dung-ban-an', NULL, 9, 1, 4)
INSERT [dbo].[ProductCategories] ([ID], [Title], [MetaTitle], [BannerImage], [Order], [Status], [ParentID]) VALUES (27, N'Dụng cụ nhà bếp', N'dung-cu-nha-bep', NULL, 10, 1, 4)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (1, N'Tủ áo 4 cánh', N'84823006', N'tu-ao-4-canh', N'/Data/images/Product/H19D001.jpg', N'<Images><Images>/Data/images/Product/H19D001.jpg</Images></Images>', CAST(17810000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:25:13.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:48:55.567' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p><em>Xu hướng nội thất hiện đại ng&agrave;y c&agrave;ng ch&uacute; &yacute; hơn đến nhu cầu của c&aacute; nh&acirc;n. Ch&iacute;nh v&igrave; thế, những kh&ocirc;ng gian mang đậm c&aacute;c t&iacute;nh chất ri&ecirc;ng tư như ph&ograve;ng ngủ ng&agrave;y c&agrave;ng được ch&uacute; &yacute;. B&ecirc;n cạnh giường ngủ, tủ &aacute;o cũng đang đ&oacute;ng một vai tr&ograve; r&otilde; r&agrave;ng trong việc định h&igrave;nh phong c&aacute;ch ph&ograve;ng ngủ của bạn.</em></p>

<p>D&ugrave; muốn hay kh&ocirc;ng muốn, bạn vẫn phải thừa nhận rằng phần lớn thời gian của bản th&acirc;n khi ở nh&agrave; l&agrave; ở trong ph&ograve;ng ngủ, &iacute;t nhất cũng l&agrave; thời gian ban đ&ecirc;m khi ngủ. B&ecirc;n cạnh đ&oacute;, đ&acirc;y cũng kh&ocirc;ng gian để bạn chuẩn bị mọi thứ thực sự sẵn s&agrave;ng trước khi ra ngo&agrave;i. Vậy n&ecirc;n c&oacute; cho m&igrave;nh một kh&ocirc;ng gian để nghỉ ngơi thư gi&atilde;n ho&agrave;n hảo tại ph&ograve;ng ngủ sau một ng&agrave;y d&agrave;i lao động, học tập cần rất nhiều sự đầu tư trong việc t&igrave;m v&agrave; chọn sản phẩm ph&ugrave; hợp với bản th&acirc;n. Tủ &aacute;o cũng kh&ocirc;ng phải ngoại lệ khi đ&acirc;y l&agrave; vật dụng thường bắt gặp trong mỗi ph&ograve;ng ngủ v&agrave; được sử dụng một c&aacute;ch thường xuy&ecirc;n. V&agrave; nếu bạn đang c&ograve;n c&acirc;n nhắc, đắn đo kh&ocirc;ng biết n&ecirc;n chọn tủ &aacute;o như n&agrave;o th&igrave; h&atilde;y tới với Nh&agrave; Đẹp. Nh&agrave; Đẹp sẽ gi&uacute;p bạn chọn lựa sản phẩm tủ &aacute;o ưng &yacute; bởi tủ &aacute;o tại Nh&agrave; Đẹp:</p>

<p><strong>Đa dạng về phong c&aacute;ch</strong>. D&ugrave; bạn theo đuổi bất kỳ phong c&aacute;ch nội thất n&agrave;o, Nh&agrave; Đẹp cũng c&oacute; thể chọn lựa sản phẩm tủ &aacute;o ph&ugrave; hợp với bạn. Cho d&ugrave; l&agrave; phong c&aacute;ch hiện đại, trẻ trung, phong c&aacute;ch cổ điển, sang trọng hay phong c&aacute;ch đơn giản, ph&oacute;ng kho&aacute;ng, Nh&agrave; Đẹp lu&ocirc;n c&oacute; những mẫu tủ &aacute;o đ&aacute;p ứng được nhu cầu của bạn</p>

<p><strong>Bền v&agrave; đẹp.&nbsp;</strong>C&aacute;c sản phẩm tủ &aacute;o tại Nh&agrave; Đẹp đều được sản xuất dựa tr&ecirc;n c&aacute;c ti&ecirc;u chuẩn kỹ thuật ngặt ngh&egrave;o với phần khung được l&agrave;m từ gỗ tự nhi&ecirc;n v&agrave; c&aacute;c bề mặt l&agrave; gỗ c&ocirc;ng nghiệp cao cấp. C&aacute;c sản phẩm giường ngủ n&agrave;y đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu cao trong việc chống mối mọt, cong v&ecirc;nh. B&ecirc;n cạnh đ&oacute;, kiểu d&aacute;ng cũng như m&agrave;u sắc của sản phẩm tủ &aacute;o của Nh&agrave; Đẹp được chọn lựa một c&aacute;ch kỹ c&agrave;ng đem lại t&iacute;nh thẩm mỹ cao cho sản phẩm</p>

<p><strong>Ph&ugrave; hợp với nhu cầu người d&ugrave;ng.&nbsp;</strong>C&aacute;c sản phẩm tủ &aacute;o tại Nh&agrave; Đẹp được ch&uacute; &yacute; hết sức kỹ lưỡng để ph&ugrave; hợp với nhu cầu người d&ugrave;ng. C&aacute;ch ph&acirc;n chia c&aacute;c ngăn tủ cũng như vị tr&iacute; của gương v&agrave; hộc tủ phụ hợp l&yacute; gi&uacute;p người sử dụng c&oacute; được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p>

<p><strong>Bảo h&agrave;nh d&agrave;i l&acirc;u.&nbsp;</strong>L&agrave; đơn vị đi đầu trong lĩnh vực b&aacute;n lẻ nội thất gia dụng tại thị trường ph&iacute;a Bắc, Nh&agrave; Đẹp lu&ocirc;n cung cấp cho kh&aacute;ch h&agrave;ng những sản phẩm v&agrave; dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất kh&aacute;c tại đ&acirc;y, tủ &aacute;o của Nh&agrave; Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu m&atilde;i uy t&iacute;n. C&aacute;c sản phẩm tủ &aacute;o đều được bảo h&agrave;nh tới 2 năm. B&ecirc;n cạnh đ&oacute;, tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 160x60x210</li>
	<li>Chất liệu Gỗ c&ocirc;ng nghiệp, phủ melamin</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 2 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (2, N'Giường ngủ 1.8x2m', N'83223010', N'giuong-ngu-1-8x2m', N'/Data/images/Product/Thumb/giuong.jpg', N'<Images><Images>/Data/images/Product/H19A003YN.png</Images></Images>', CAST(9710000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:28:39.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:46:08.433' AS DateTime), N'ngocadmin', 5, 20, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Xu hướng nội thất hiện đại ng&agrave;y c&agrave;ng ch&uacute; &yacute; hơn đến nhu cầu của c&aacute; nh&acirc;n. Ch&iacute;nh v&igrave; thế, những kh&ocirc;ng gian mang đậm c&aacute;c t&iacute;nh chất ri&ecirc;ng tư như ph&ograve;ng ngủ ng&agrave;y c&agrave;ng được ch&uacute; &yacute;. Một trong c&aacute;c cấu th&agrave;nh quan trọng bậc nhất của nội thất ph&ograve;ng ngủ ch&iacute;nh l&agrave; những chiếc giường ngủ</em></p>

<p style="text-align:justify">D&ugrave; muốn hay kh&ocirc;ng muốn, bạn vẫn phải thừa nhận rằng phần lớn thời gian của bản th&acirc;n khi ở nh&agrave; l&agrave; ở trong ph&ograve;ng ngủ, &iacute;t nhất cũng l&agrave; thời gian ban đ&ecirc;m khi ngủ. Vậy n&ecirc;n c&oacute; cho m&igrave;nh một kh&ocirc;ng gian để nghỉ ngơi thư gi&atilde;n ho&agrave;n hảo tại ph&ograve;ng ngủ sau một ng&agrave;y d&agrave;i lao động, học tập cần rất nhiều sự đầu tư trong việc t&igrave;m v&agrave; chọn sản phẩm ph&ugrave; hợp với bản th&acirc;n. Đặc biệt l&agrave; với giường ngủ. C&oacute; thể coi giường ngủ ch&iacute;nh l&agrave; tr&aacute;i tim của nội thất ph&ograve;ng ngủ khi n&oacute; kh&ocirc;ng chỉ vật dụng chiếm nhiều diện t&iacute;ch nhất trong ph&ograve;ng ngủ m&agrave; c&ograve;n l&agrave; thứ bạn sử dụng thường xuy&ecirc;n bậc nhất. V&agrave; nếu bạn đang c&ograve;n c&acirc;n nhắc, đắn đo kh&ocirc;ng biết n&ecirc;n chọn giường ngủ như n&agrave;o th&igrave; h&atilde;y tới với Nh&agrave; Đẹp. Nh&agrave; Đẹp sẽ gi&uacute;p bạn chọn lựa sản phẩm giường ngủ ưng &yacute; bởi giường ngủ tại Nh&agrave; Đẹp:</p>

<p style="text-align:justify"><strong>Đa dạng về phong c&aacute;ch</strong>. D&ugrave; bạn theo đuổi bất kỳ phong c&aacute;ch nội thất n&agrave;o, Nh&agrave; Đẹp cũng c&oacute; thể chọn lựa sản phẩm giường ngủ ph&ugrave; hợp với bạn. Cho d&ugrave; l&agrave; phong c&aacute;ch hiện đại, trẻ trung, phong c&aacute;ch cổ điển, sang trọng hay phong c&aacute;ch đơn giản, ph&oacute;ng kho&aacute;ng, Nh&agrave; Đẹp lu&ocirc;n c&oacute; những mẫu giường ngủ đ&aacute;p ứng được nhu cầu của bạn</p>

<p style="text-align:justify"><strong>Bền v&agrave; đẹp.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp đều được sản xuất dựa tr&ecirc;n c&aacute;c ti&ecirc;u chuẩn kỹ thuật ngặt ngh&egrave;o với phần khung được l&agrave;m từ gỗ tự nhi&ecirc;n v&agrave; c&aacute;c bề mặt l&agrave; gỗ c&ocirc;ng nghiệp cao cấp. C&aacute;c sản phẩm giường ngủ n&agrave;y đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu cao trong việc chống mọt, cong v&ecirc;nh. B&ecirc;n cạnh đ&oacute;, kiểu d&aacute;ng cũng như m&agrave;u sắc của sản phẩm giường ngủ của Nh&agrave; Đẹp được chọn lựa một c&aacute;ch kỹ c&agrave;ng đem lại t&iacute;nh thẩm mỹ cao cho sản phẩm</p>

<p style="text-align:justify"><strong>Ph&ugrave; hợp với nhu cầu người d&ugrave;ng.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp được ch&uacute; &yacute; hết sức kỹ lưỡng để ph&ugrave; hợp với nhu cầu người d&ugrave;ng. Độ cao hợp l&yacute; c&ugrave;ng thiết kế cấu tr&uacute;c hệ thống ch&acirc;n v&agrave; d&aacute;t giường vững chắc gi&uacute;p người sử dụng c&oacute; được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p>

<p style="text-align:justify"><strong>Bảo h&agrave;nh d&agrave;i l&acirc;u.&nbsp;</strong>L&agrave; đơn vị đi đầu trong lĩnh vực b&aacute;n lẻ nội thất gia dụng tại thị trường ph&iacute;a Bắc, Nh&agrave; Đẹp lu&ocirc;n cung cấp cho kh&aacute;ch h&agrave;ng những sản phẩm v&agrave; dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất kh&aacute;c tại đ&acirc;y, giường ngủ của Nh&agrave; Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu m&atilde;i uy t&iacute;n. C&aacute;c sản phẩm giường ngủ đều được bảo h&agrave;nh tới 2 năm. B&ecirc;n cạnh đ&oacute;, tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 213x186x87</li>
	<li>Chất liệu Gỗ c&ocirc;ng nghiệp, phủ melamin</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 2 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (3, N'Giường ngủ 1.8x2m', N'83223009', N'giuong-ngu-1-8x2m', N'/Data/images/Product/Thumb/giuong.jpg', N'<Images><Images>/Data/images/Product/H19A001YN.jpg</Images></Images>', CAST(10080000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:33:18.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:46:19.043' AS DateTime), N'ngocadmin', 5, 20, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Xu hướng nội thất hiện đại ng&agrave;y c&agrave;ng ch&uacute; &yacute; hơn đến nhu cầu của c&aacute; nh&acirc;n. Ch&iacute;nh v&igrave; thế, những kh&ocirc;ng gian mang đậm c&aacute;c t&iacute;nh chất ri&ecirc;ng tư như ph&ograve;ng ngủ ng&agrave;y c&agrave;ng được ch&uacute; &yacute;. Một trong c&aacute;c cấu th&agrave;nh quan trọng bậc nhất của nội thất ph&ograve;ng ngủ ch&iacute;nh l&agrave; những chiếc giường ngủ</em></p>

<p style="text-align:justify">D&ugrave; muốn hay kh&ocirc;ng muốn, bạn vẫn phải thừa nhận rằng phần lớn thời gian của bản th&acirc;n khi ở nh&agrave; l&agrave; ở trong ph&ograve;ng ngủ, &iacute;t nhất cũng l&agrave; thời gian ban đ&ecirc;m khi ngủ. Vậy n&ecirc;n c&oacute; cho m&igrave;nh một kh&ocirc;ng gian để nghỉ ngơi thư gi&atilde;n ho&agrave;n hảo tại ph&ograve;ng ngủ sau một ng&agrave;y d&agrave;i lao động, học tập cần rất nhiều sự đầu tư trong việc t&igrave;m v&agrave; chọn sản phẩm ph&ugrave; hợp với bản th&acirc;n. Đặc biệt l&agrave; với giường ngủ. C&oacute; thể coi giường ngủ ch&iacute;nh l&agrave; tr&aacute;i tim của nội thất ph&ograve;ng ngủ khi n&oacute; kh&ocirc;ng chỉ vật dụng chiếm nhiều diện t&iacute;ch nhất trong ph&ograve;ng ngủ m&agrave; c&ograve;n l&agrave; thứ bạn sử dụng thường xuy&ecirc;n bậc nhất. V&agrave; nếu bạn đang c&ograve;n c&acirc;n nhắc, đắn đo kh&ocirc;ng biết n&ecirc;n chọn giường ngủ như n&agrave;o th&igrave; h&atilde;y tới với Nh&agrave; Đẹp. Nh&agrave; Đẹp sẽ gi&uacute;p bạn chọn lựa sản phẩm giường ngủ ưng &yacute; bởi giường ngủ tại Nh&agrave; Đẹp:</p>

<p style="text-align:justify"><strong>Đa dạng về phong c&aacute;ch</strong>. D&ugrave; bạn theo đuổi bất kỳ phong c&aacute;ch nội thất n&agrave;o, Nh&agrave; Đẹp cũng c&oacute; thể chọn lựa sản phẩm giường ngủ ph&ugrave; hợp với bạn. Cho d&ugrave; l&agrave; phong c&aacute;ch hiện đại, trẻ trung, phong c&aacute;ch cổ điển, sang trọng hay phong c&aacute;ch đơn giản, ph&oacute;ng kho&aacute;ng, Nh&agrave; Đẹp lu&ocirc;n c&oacute; những mẫu giường ngủ đ&aacute;p ứng được nhu cầu của bạn</p>

<p style="text-align:justify"><strong>Bền v&agrave; đẹp.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp đều được sản xuất dựa tr&ecirc;n c&aacute;c ti&ecirc;u chuẩn kỹ thuật ngặt ngh&egrave;o với phần khung được l&agrave;m từ gỗ tự nhi&ecirc;n v&agrave; c&aacute;c bề mặt l&agrave; gỗ c&ocirc;ng nghiệp cao cấp. C&aacute;c sản phẩm giường ngủ n&agrave;y đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu cao trong việc chống mọt, cong v&ecirc;nh. B&ecirc;n cạnh đ&oacute;, kiểu d&aacute;ng cũng như m&agrave;u sắc của sản phẩm giường ngủ của Nh&agrave; Đẹp được chọn lựa một c&aacute;ch kỹ c&agrave;ng đem lại t&iacute;nh thẩm mỹ cao cho sản phẩm</p>

<p style="text-align:justify"><strong>Ph&ugrave; hợp với nhu cầu người d&ugrave;ng.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp được ch&uacute; &yacute; hết sức kỹ lưỡng để ph&ugrave; hợp với nhu cầu người d&ugrave;ng. Độ cao hợp l&yacute; c&ugrave;ng thiết kế cấu tr&uacute;c hệ thống ch&acirc;n v&agrave; d&aacute;t giường vững chắc gi&uacute;p người sử dụng c&oacute; được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p>

<p style="text-align:justify"><strong>Bảo h&agrave;nh d&agrave;i l&acirc;u.&nbsp;</strong>L&agrave; đơn vị đi đầu trong lĩnh vực b&aacute;n lẻ nội thất gia dụng tại thị trường ph&iacute;a Bắc, Nh&agrave; Đẹp lu&ocirc;n cung cấp cho kh&aacute;ch h&agrave;ng những sản phẩm v&agrave; dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất kh&aacute;c tại đ&acirc;y, giường ngủ của Nh&agrave; Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu m&atilde;i uy t&iacute;n. C&aacute;c sản phẩm giường ngủ đều được bảo h&agrave;nh tới 2 năm. B&ecirc;n cạnh đ&oacute;, tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 214x186x100</li>
	<li>Chất liệu Gỗ c&ocirc;ng nghiệp, phủ melamin</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 2 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (4, N'Sofa vải Libby', N'82636090', N'sofa-vai-libby', N'/Data/images/Product/Thumb/_DSC1485%20(1).png', N'<Images><Images>/Data/images/Product/_DSC1485.png</Images><Images>/Data/images/Product/_DSC1488.png</Images></Images>', CAST(15930000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:35:22.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:48:27.043' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Dường như việc chọn mua một bộ&nbsp;Sofa đẹp&nbsp;kh&ocirc;ng phải l&agrave; một c&ocirc;ng việc dễ d&agrave;ng khi phong c&aacute;ch, kiểu d&aacute;ng, m&agrave;u sắc, gi&aacute; cả v&agrave; chất lượng của&nbsp;Sofa rất phong ph&uacute; v&agrave; đa dạng.&nbsp;Chắc chắn sẽ c&oacute; rất nhiều băn khoăn, nhiều c&acirc;u hỏi được đặt ra như: t&igrave;m mua Sofa vải ở đ&acirc;u? Sofa vải thế n&agrave;o l&agrave; chất lượng tốt?&hellip;&nbsp;Hẳn kh&ocirc;ng &iacute;t&nbsp;kh&aacute;ch h&agrave;ng đang muốn t&igrave;m một địa chỉ đ&aacute;ng tin cậy để chọn cho m&igrave;nh một bộ Sofa ưng &yacute;. V&agrave; sau đ&acirc;y Nh&agrave; đẹp sẽ chia sẻ với c&aacute;c bạn một số kinh nghiệm khi bạn cần cho m&igrave;nh một bộ Sofa đ&uacute;ng như mong muốn.</em></p>

<p style="text-align:justify">D&ograve;ng sản phẩm Sofa bọc vải của Nội Thất Nh&agrave; Đẹp được đặt sản xuất theo y&ecirc;u cầu, ti&ecirc;u chuẩn ri&ecirc;ng của Nh&agrave; Đẹp, nhằm c&oacute; được những sản phẩm chất lượng cao, đ&aacute;p ứng được nhu cầu v&agrave; thị hiếu của kh&aacute;ch h&agrave;ng. Khi kh&aacute;ch h&agrave;ng đến với Nội thất Nh&agrave; Đẹp, kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m để lựa chọn những bộ Sofa vải của Nh&agrave; Đẹp v&igrave; những l&yacute; do sau:</p>

<p style="text-align:justify">Khung của Sofa được l&agrave;m bằng gỗ thịt chắc chắn, tuổi của gỗ l&agrave; tr&ecirc;n 10 năm. Ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng gỗ tạp, gỗ non như những sản phẩm gia c&ocirc;ng, h&agrave;ng chợ, h&agrave;ng sản xuất nhỏ lẻ đơn chiếc tại c&aacute;c c&ocirc;ng ty hoặc xưởng gỗ nhỏ.</p>

<p style="text-align:justify">Phần vải bọc Sofa được thiết kế để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o ra để giặt vệ sinh. Hiện nay tr&ecirc;n thị trường kh&ocirc;ng c&oacute; nhiều c&ocirc;ng ty l&agrave;m được theo y&ecirc;u cầu như vậy. Trong qu&aacute; tr&igrave;nh sử dụng, nếu kh&aacute;ch qu&aacute; bận rộn v&agrave; kh&ocirc;ng c&oacute; thời gian để vệ sinh bộ Sofa của m&igrave;nh, Qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Nh&agrave; Đẹp để được hỗ trợ với mức ph&iacute; rất thấp.</p>

<p style="text-align:justify">Kiểu d&aacute;ng, m&agrave;u sắc của sản phẩm rất sắc n&eacute;t, nổi bật, đơn giản nhưng tinh tế. Ho&agrave;n to&agrave;n kh&aacute;c biệt với những mẫu Sofa sản xuất gia c&ocirc;ng, kiểu d&aacute;ng cục mịch, đơn giản đến mức th&ocirc; sơ.</p>

<p style="text-align:justify">Phần đệm ngồi v&agrave; tựa lưng được nghi&ecirc;n cứu v&agrave; thiết kế nhằm mang đến cảm gi&aacute;c thư th&aacute;i, dễ chịu cho người sử dụng. Cấu tạo ch&iacute;nh l&agrave; gồm c&oacute; l&ograve; xo (l&ograve; xo t&uacute;i hoặc l&ograve; xo ziz zắc), đai chun hoặc đai kim loại, 3-4 lớp đệm m&uacute;t, b&ocirc;ng hoặc l&ocirc;ng vũ. Sản phẩm c&oacute; độ &ecirc;m &aacute;i, dễ chịu khi sử dụng m&agrave; vẫn đảm bảo c&aacute;c t&iacute;nh năng đ&agrave;n hồi, gi&uacute;p&nbsp; giữ được phom d&aacute;ng của bộ Sofa trong thời gian d&agrave;i. Đối với c&aacute;c h&agrave;ng sản xuất gia c&ocirc;ng, thường sẽ sử dụng c&aacute;c vật liệu v&agrave; phụ kiện k&eacute;m chất lượng hoặc thậm ch&iacute; bớt x&eacute;n vật tư (l&ograve; xo, đai, đệm), dẫn đến sản phẩm nhanh xẹp l&uacute;n, xuống cấp. Ngo&agrave;i ra c&ograve;n một trường hợp kh&aacute;c l&agrave; c&aacute;c c&ocirc;ng ty, xưởng sản xuất nhỏ hay tư vấn cho kh&aacute;ch h&agrave;ng sử dụng đệm cứng để n&acirc;ng cao tuổi thọ của sản phẩm, thực tế đ&acirc;y l&agrave; tư vấn&nbsp;rất sai&nbsp;v&agrave; kh&ocirc;ng v&igrave; quyền lợi của kh&aacute;ch h&agrave;ng. Bởi v&igrave;, khi ngồi l&acirc;u tr&ecirc;n bộ Sofa cứng, kh&aacute;ch h&agrave;ng sẽ bị đau mỏi, như vậy ho&agrave;n to&agrave;n đi ngược với chức năng sử dụng của sofa. Lẽ ra, sau những ng&agrave;y l&agrave;m việc mệt mỏi, khi trở về nh&agrave; kh&aacute;ch h&agrave;ng sẽ được ho&agrave;n to&agrave;n thư gi&atilde;n, c&oacute; được một cảm gi&aacute;c thoải m&aacute;i khi ngồi l&ecirc;n bộ ghế Sofa nhưng với Sofa đệm cứng th&igrave; kh&aacute;ch h&agrave;ng lại c&agrave;ng th&ecirc;m mệt mỏi. Hơn nữa, đệm cứng thực chất rẻ hơn rất nhiều so với đệm m&uacute;t cao su.</p>

<p style="text-align:justify">Ngo&agrave;i yếu tố về chất lượng sản phẩm, Nh&agrave; Đẹp cũng mang đến cho kh&aacute;ch h&agrave;ng rất nhiều dịch vụ tiện &iacute;ch miễn ph&iacute; đi k&egrave;m như tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng v&agrave; lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch. Thời gian bảo h&agrave;nh của sản phẩm d&agrave;i, khung Sofa bảo h&agrave;nh 10 năm v&agrave; 1 năm cho c&aacute;c phần c&ograve;n lại. Nh&agrave; Đẹp cũng bảo tr&igrave; trọn đời sản phẩm với mức ph&iacute; hỗ trợ kh&aacute;ch h&agrave;ng. Trong trường hợp kh&aacute;ch c&oacute; nhu cầu thay vỏ bọc Sofa, Nh&agrave; Đẹp cũng hỗ trợ bọc lại mới cho kh&aacute;ch.</p>

<p style="text-align:justify">Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm tốt, th&aacute;i độ phục vụ nhiệt t&igrave;nh, chu đ&aacute;o, Nh&agrave; Đẹp c&ograve;n lu&ocirc;n ch&uacute; &yacute; v&agrave; gia tăng c&aacute;c dịch vụ hậu m&atilde;i, c&aacute;c quyền lợi v&agrave; ưu đ&atilde;i d&agrave;nh ri&ecirc;ng cho c&aacute;c kh&aacute;ch h&agrave;ng quen, kh&aacute;ch h&agrave;ng th&acirc;n thiết. Hơn thế nữa, Nh&agrave; Đẹp c&ograve;n thường xuy&ecirc;n thực hiện c&aacute;c chương tr&igrave;nh ưu đ&atilde;i theo tuần, theo th&aacute;ng để kh&aacute;ch h&agrave;ng may mắn c&oacute; cơ hội sở hữu những sản phẩm cao cấp với gi&aacute; phải chăng.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 266x89x83</li>
	<li>Chất liệu Khung gỗ, nhồi đệm kết hợp l&ograve; xo, bọc vải, ch&acirc;n kim loại</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 1 năm cho c&aacute;c phần c&ograve;n lại</li>
	<li>Th&aacute;o vỏ Kh&ocirc;ng</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (5, N'Sofa da Italia Elestial', N'72608046', N'sofa-da-italia-elestial', N'/Data/images/Product/Thumb/sofa-da-italia-elestial-goc-phai-72608046-4%20(1).jpg', N'<Images><Images>/Data/images/Product/sofa-da-italia-elestial-goc-phai-72608046-4.jpg</Images><Images>/Data/images/Product/sofa-da-italia-elestial-goc-phai-72608046-2.jpg</Images><Images>/Data/images/Product/sofa-da-italia-elestial-goc-phai-72608046-3.jpg</Images><Images>/Data/images/Product/sofa-da-italia-elestial-goc-phai-72608046.jpg</Images></Images>', CAST(147220000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:37:44.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:46:40.857' AS DateTime), N'ngocadmin', 5, 19, N'<p>&nbsp;</p>

<p style="text-align:justify">Sofa da &Yacute; l&agrave; một trong những d&ograve;ng sản phẩm lu&ocirc;n được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng kh&ocirc;ng k&eacute;m phần thoải m&aacute;i, dễ chịu v&agrave; tiện nghi m&agrave; ch&uacute;ng mang lại. Sofa da &Yacute; lu&ocirc;n mang lại n&eacute;t lịch l&atilde;m c&ugrave;ng phong c&aacute;ch kh&aacute;c biệt cho chủ nh&acirc;n.</p>

<p style="text-align:justify"><strong>THIẾT KẾ SANG TRỌNG</strong></p>

<p style="text-align:justify">To&agrave;n bộ bề mặt sofa sử dụng da b&ograve; thật của &Yacute;, nệm ngồi bọc m&uacute;t tạo cảm gi&aacute;c &ecirc;m &aacute;i với&nbsp;độ đ&agrave;n hồi vừa phải. Những đường n&eacute;t mạnh mẽ ở phần ch&acirc;n crom kết hợp với đường cong mềm mại ở tay sofa đem lại một vẻ đẹp h&agrave;i h&ograve;a.&nbsp;Sofa c&oacute; m&agrave;u n&acirc;u thời thượng, dễ d&agrave;ng kết hợp với nhiều kiểu nội thất kh&aacute;c nhau.</p>

<p style="text-align:justify"><strong>NHẬP KHẨU TRỰC TIẾP TỪ &Yacute;</strong></p>

<p style="text-align:justify">IPD l&agrave; nh&agrave; cung cấp trực tiếp Sofa da &Yacute; của Nh&agrave; Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với &yacute; tưởng mang đến thị trường nước ngo&agrave;i c&aacute;c sản phẩm da phổ biến v&agrave; c&oacute; nhiều y&ecirc;u cầu cao trong sản xuất tại &Yacute;. IDP đạt chứng nhận 100% Original Italian Quality với nguy&ecirc;n vật&nbsp;liệu cao cấp&nbsp;của &Yacute;, thiết kế của &Yacute;, sản xuất tại &Yacute;; điều m&agrave; kh&ocirc;ng phải thương hiệu n&agrave;o cũng đạt được v&igrave; phần lớn sofa &Yacute; sản xuất tại xưởng của c&aacute;c nước đang ph&aacute;t triển.</p>

<p style="text-align:justify"><strong>DỊCH VỤ CHU Đ&Aacute;O</strong></p>

<p style="text-align:justify">Đ&atilde; từ l&acirc;u, dịch vụ tại Nội Thất Nh&agrave; Đẹp vẫn lu&ocirc;n được c&aacute;c kh&aacute;ch h&agrave;ng khen ngợi v&agrave; đ&aacute;nh gi&aacute; rất cao. Nh&agrave; Đẹp lu&ocirc;n phục vụ kh&aacute;ch chu đ&aacute;o, nhiệt t&igrave;nh từ l&uacute;c trước, trong v&agrave; sau khi mua h&agrave;ng. D&ugrave; bạn mua hoặc kh&ocirc;ng mua sản phẩm th&igrave; tất cả c&aacute;c nh&acirc;n vi&ecirc;n của Nh&agrave; Đẹp vẫn lu&ocirc;n phục vụ nhiệt t&igrave;nh v&agrave; tận t&acirc;m nhất.</p>

<p style="text-align:justify">Đặc biệt với sofa da, Nh&agrave; Đẹp thực hiện chế độ bảo h&agrave;nh 10 NĂM cho khung, 2 NĂM cho da v&agrave; bảo dưỡng da MIỄN PH&Iacute; 6 th&aacute;ng/lần trong 5 năm.</p>

<p style="text-align:justify"><strong>Nội Thất Nh&agrave; Đẹp tự h&agrave;o l&agrave; c&ocirc;ng ty nhập khẩu sofa da &Yacute; uy t&iacute;n v&agrave; chất lượng, với nhiều thương hiệu sản xuất sofa da &Yacute; nổi tiếng tại &Yacute; v&agrave; tr&ecirc;n thế giới. Kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về t&iacute;nh ch&iacute;nh x&aacute;c của nguồn gốc c&aacute;c sản phẩm sofa &Yacute; do Nội Thất Nh&agrave; Đẹp nhập về.</strong></p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 284x230x90</li>
	<li>Xuất xứ Italia</li>
	<li>Chất liệu Da thật top grain 100%, khung gỗ, ch&acirc;n crom</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn ph&iacute; 6 th&aacute;ng/lần</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (6, N'Bộ phòng ngủ Thomas', N'83252001-84352001-84852001-81252001-82352001', N'bo-phong-ngu-thomas', N'/Data/images/Product/Thumb/bo-phong-ngu-thomas-500x358.jpg', N'<Images><Images>/Data/images/Product/bo-phong-ngu-thomas-2.jpg</Images><Images>/Data/images/Product/giuong-ngu-thomas-83252001.jpg</Images><Images>/Data/images/Product/tu-ao-thomas-4-canh-84852001.jpg</Images><Images>/Data/images/Product/tu-dau-giuong-thomas-84352001.jpg</Images><Images>/Data/images/Product/ban-trang-diem-thomas-81252001.jpg</Images><Images>/Data/images/Product/don-thomas-82352001.jpg</Images></Images>', CAST(43420000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:41:04.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:45:48.943' AS DateTime), N'ngocadmin', 5, 10, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Xu hướng nội thất hiện đại ng&agrave;y c&agrave;ng ch&uacute; &yacute; hơn đến nhu cầu của c&aacute; nh&acirc;n. Ch&iacute;nh v&igrave; thế, những kh&ocirc;ng gian mang đậm c&aacute;c t&iacute;nh chất ri&ecirc;ng tư như ph&ograve;ng ngủ ng&agrave;y c&agrave;ng được ch&uacute; &yacute;. Một trong c&aacute;c cấu th&agrave;nh quan trọng bậc nhất của nội thất ph&ograve;ng ngủ ch&iacute;nh l&agrave; những chiếc giường ngủ</em></p>

<p style="text-align:justify">D&ugrave; muốn hay kh&ocirc;ng muốn, bạn vẫn phải thừa nhận rằng phần lớn thời gian của bản th&acirc;n khi ở nh&agrave; l&agrave; ở trong ph&ograve;ng ngủ, &iacute;t nhất cũng l&agrave; thời gian ban đ&ecirc;m khi ngủ. Vậy n&ecirc;n c&oacute; cho m&igrave;nh một kh&ocirc;ng gian để nghỉ ngơi thư gi&atilde;n ho&agrave;n hảo tại ph&ograve;ng ngủ sau một ng&agrave;y d&agrave;i lao động, học tập cần rất nhiều sự đầu tư trong việc t&igrave;m v&agrave; chọn sản phẩm ph&ugrave; hợp với bản th&acirc;n. Đặc biệt l&agrave; với giường ngủ. C&oacute; thể coi giường ngủ ch&iacute;nh l&agrave; tr&aacute;i tim của nội thất ph&ograve;ng ngủ khi n&oacute; kh&ocirc;ng chỉ vật dụng chiếm nhiều diện t&iacute;ch nhất trong ph&ograve;ng ngủ m&agrave; c&ograve;n l&agrave; thứ bạn sử dụng thường xuy&ecirc;n bậc nhất. V&agrave; nếu bạn đang c&ograve;n c&acirc;n nhắc, đắn đo kh&ocirc;ng biết n&ecirc;n chọn giường ngủ như n&agrave;o th&igrave; h&atilde;y tới với Nh&agrave; Đẹp. Nh&agrave; Đẹp sẽ gi&uacute;p bạn chọn lựa sản phẩm giường ngủ ưng &yacute; bởi giường ngủ tại Nh&agrave; Đẹp:</p>

<p style="text-align:justify"><strong>Đa dạng về phong c&aacute;ch</strong>. D&ugrave; bạn theo đuổi bất kỳ phong c&aacute;ch nội thất n&agrave;o, Nh&agrave; Đẹp cũng c&oacute; thể chọn lựa sản phẩm giường ngủ ph&ugrave; hợp với bạn. Cho d&ugrave; l&agrave; phong c&aacute;ch hiện đại, trẻ trung, phong c&aacute;ch cổ điển, sang trọng hay phong c&aacute;ch đơn giản, ph&oacute;ng kho&aacute;ng, Nh&agrave; Đẹp lu&ocirc;n c&oacute; những mẫu giường ngủ đ&aacute;p ứng được nhu cầu của bạn</p>

<p style="text-align:justify"><strong>Bền v&agrave; đẹp.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp đều được sản xuất dựa tr&ecirc;n c&aacute;c ti&ecirc;u chuẩn kỹ thuật ngặt ngh&egrave;o với phần khung được l&agrave;m từ gỗ tự nhi&ecirc;n v&agrave; c&aacute;c bề mặt l&agrave; gỗ c&ocirc;ng nghiệp cao cấp. C&aacute;c sản phẩm giường ngủ n&agrave;y đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu cao trong việc chống mối mọt, cong v&ecirc;nh. B&ecirc;n cạnh đ&oacute;, kiểu d&aacute;ng cũng như m&agrave;u sắc của sản phẩm giường ngủ của Nh&agrave; Đẹp được chọn lựa một c&aacute;ch kỹ c&agrave;ng đem lại t&iacute;nh thẩm mỹ cao cho sản phẩm</p>

<p style="text-align:justify"><strong>Ph&ugrave; hợp với nhu cầu người d&ugrave;ng.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp được ch&uacute; &yacute; hết sức kỹ lưỡng để ph&ugrave; hợp với nhu cầu người d&ugrave;ng. Độ cao hợp l&yacute; c&ugrave;ng thiết kế cấu tr&uacute;c hệ thống ch&acirc;n v&agrave; d&aacute;t giường vững chắc gi&uacute;p người sử dụng c&oacute; được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p>

<p style="text-align:justify"><strong>Bảo h&agrave;nh d&agrave;i l&acirc;u.&nbsp;</strong>L&agrave; đơn vị đi đầu trong lĩnh vực b&aacute;n lẻ nội thất gia dụng tại thị trường ph&iacute;a Bắc, Nh&agrave; Đẹp lu&ocirc;n cung cấp cho kh&aacute;ch h&agrave;ng những sản phẩm v&agrave; dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất kh&aacute;c tại đ&acirc;y, giường ngủ của Nh&agrave; Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu m&atilde;i uy t&iacute;n. C&aacute;c sản phẩm giường ngủ đều được bảo h&agrave;nh tới 2 năm. B&ecirc;n cạnh đ&oacute;, tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 213.3x191.8x106.6</li>
	<li>Chất liệu Gỗ c&ocirc;ng nghiệp, phủ melamin</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 2 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (7, N'Giường ngủ Jimmy', N'83252002', N'giuong-ngu-jimmy', N'/Data/images/Product/Thumb/bo-phong-ngu-jimmy%20(1).jpg', N'<Images><Images>/Data/images/Product/bo-phong-ngu-jimmy.jpg</Images><Images>/Data/images/Product/bo-phong-ngu-jimmy-2.jpg</Images><Images>/Data/images/Product/giuong-ngu-jimmy-83252002-2.jpg</Images><Images>/Data/images/Product/giuong-ngu-jimmy-83252002.jpg</Images></Images>', CAST(16320000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 06:43:53.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:46:28.413' AS DateTime), N'ngocadmin', 5, 11, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Xu hướng nội thất hiện đại ng&agrave;y c&agrave;ng ch&uacute; &yacute; hơn đến nhu cầu của c&aacute; nh&acirc;n. Ch&iacute;nh v&igrave; thế, những kh&ocirc;ng gian mang đậm c&aacute;c t&iacute;nh chất ri&ecirc;ng tư như ph&ograve;ng ngủ ng&agrave;y c&agrave;ng được ch&uacute; &yacute;. Một trong c&aacute;c cấu th&agrave;nh quan trọng bậc nhất của nội thất ph&ograve;ng ngủ ch&iacute;nh l&agrave; những chiếc giường ngủ</em></p>

<p style="text-align:justify">D&ugrave; muốn hay kh&ocirc;ng muốn, bạn vẫn phải thừa nhận rằng phần lớn thời gian của bản th&acirc;n khi ở nh&agrave; l&agrave; ở trong ph&ograve;ng ngủ, &iacute;t nhất cũng l&agrave; thời gian ban đ&ecirc;m khi ngủ. Vậy n&ecirc;n c&oacute; cho m&igrave;nh một kh&ocirc;ng gian để nghỉ ngơi thư gi&atilde;n ho&agrave;n hảo tại ph&ograve;ng ngủ sau một ng&agrave;y d&agrave;i lao động, học tập cần rất nhiều sự đầu tư trong việc t&igrave;m v&agrave; chọn sản phẩm ph&ugrave; hợp với bản th&acirc;n. Đặc biệt l&agrave; với giường ngủ. C&oacute; thể coi giường ngủ ch&iacute;nh l&agrave; tr&aacute;i tim của nội thất ph&ograve;ng ngủ khi n&oacute; kh&ocirc;ng chỉ vật dụng chiếm nhiều diện t&iacute;ch nhất trong ph&ograve;ng ngủ m&agrave; c&ograve;n l&agrave; thứ bạn sử dụng thường xuy&ecirc;n bậc nhất. V&agrave; nếu bạn đang c&ograve;n c&acirc;n nhắc, đắn đo kh&ocirc;ng biết n&ecirc;n chọn giường ngủ như n&agrave;o th&igrave; h&atilde;y tới với Nh&agrave; Đẹp. Nh&agrave; Đẹp sẽ gi&uacute;p bạn chọn lựa sản phẩm giường ngủ ưng &yacute; bởi giường ngủ tại Nh&agrave; Đẹp:</p>

<p style="text-align:justify"><strong>Đa dạng về phong c&aacute;ch</strong>. D&ugrave; bạn theo đuổi bất kỳ phong c&aacute;ch nội thất n&agrave;o, Nh&agrave; Đẹp cũng c&oacute; thể chọn lựa sản phẩm giường ngủ ph&ugrave; hợp với bạn. Cho d&ugrave; l&agrave; phong c&aacute;ch hiện đại, trẻ trung, phong c&aacute;ch cổ điển, sang trọng hay phong c&aacute;ch đơn giản, ph&oacute;ng kho&aacute;ng, Nh&agrave; Đẹp lu&ocirc;n c&oacute; những mẫu giường ngủ đ&aacute;p ứng được nhu cầu của bạn</p>

<p style="text-align:justify"><strong>Bền v&agrave; đẹp.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp đều được sản xuất dựa tr&ecirc;n c&aacute;c ti&ecirc;u chuẩn kỹ thuật ngặt ngh&egrave;o với phần khung được l&agrave;m từ gỗ tự nhi&ecirc;n v&agrave; c&aacute;c bề mặt l&agrave; gỗ c&ocirc;ng nghiệp cao cấp. C&aacute;c sản phẩm giường ngủ n&agrave;y đ&aacute;p ứng được c&aacute;c y&ecirc;u cầu cao trong việc chống mối mọt, cong v&ecirc;nh. B&ecirc;n cạnh đ&oacute;, kiểu d&aacute;ng cũng như m&agrave;u sắc của sản phẩm giường ngủ của Nh&agrave; Đẹp được chọn lựa một c&aacute;ch kỹ c&agrave;ng đem lại t&iacute;nh thẩm mỹ cao cho sản phẩm</p>

<p style="text-align:justify"><strong>Ph&ugrave; hợp với nhu cầu người d&ugrave;ng.&nbsp;</strong>C&aacute;c sản phẩm giường ngủ tại Nh&agrave; Đẹp được ch&uacute; &yacute; hết sức kỹ lưỡng để ph&ugrave; hợp với nhu cầu người d&ugrave;ng. Độ cao hợp l&yacute; c&ugrave;ng thiết kế cấu tr&uacute;c hệ thống ch&acirc;n v&agrave; d&aacute;t giường vững chắc gi&uacute;p người sử dụng c&oacute; được những trải nghiệm tốt nhất khi sử dụng sản phẩm</p>

<p style="text-align:justify"><strong>Bảo h&agrave;nh d&agrave;i l&acirc;u.&nbsp;</strong>L&agrave; đơn vị đi đầu trong lĩnh vực b&aacute;n lẻ nội thất gia dụng tại thị trường ph&iacute;a Bắc, Nh&agrave; Đẹp lu&ocirc;n cung cấp cho kh&aacute;ch h&agrave;ng những sản phẩm v&agrave; dịch vụ tốt nhất. Cũng như mọi sản phẩm nội thất kh&aacute;c tại đ&acirc;y, giường ngủ của Nh&agrave; Đẹp được cam kết về chất lượng sản phẩm cũng như dịch vụ hậu m&atilde;i uy t&iacute;n. C&aacute;c sản phẩm giường ngủ đều được bảo h&agrave;nh tới 2 năm. B&ecirc;n cạnh đ&oacute;, tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 215x196.4x92</li>
	<li>Chất liệu Gỗ c&ocirc;ng nghiệp, phủ melamin</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 2 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (8, N'Bàn ăn mở rộng Fiona', N'71304003', N'ban-an-mo-rong-fiona', N'/Data/images/Product/Thumb/ban-an-fiona-trang-71304003-500x358.jpg', N'<Images><Images>/Data/images/Product/ban-an-fiona-trang-71304003-2.jpg</Images><Images>/Data/images/Product/ban-an-fiona-trang-71304003.jpg</Images><Images>/Data/images/Product/ban-an-fiona-trang-71304003-3.jpg</Images></Images>', CAST(19280000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:17:11.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:44:59.330' AS DateTime), N'ngocadmin', 5, 12, N'<p>&nbsp;</p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)"><strong>B&agrave;n ăn mở rộng &ndash; sự lựa chọn th&ocirc;ng minh cho cuộc sống hiện đại</strong></span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">C&aacute;c mẫu thiết kế b&agrave;n ăn mở rộng tuy đơn giản nhưng rất gi&agrave;u t&iacute;nh ứng dụng v&agrave; kh&ocirc;ng k&eacute;m phần hiện đại, trẻ trung. Việc sở hữu một chiếc b&agrave;n ăn mở rộng sẽ gi&uacute;p bạn chủ động hơn trong việc sắp xếp kh&ocirc;ng gian khi nh&agrave; bất ngờ c&oacute; kh&aacute;ch m&agrave; vẫn đảm bảo t&iacute;nh thẩm mỹ của kh&ocirc;ng gian ph&ograve;ng ăn.</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">&nbsp;Phần mở rộng của chiếc b&agrave;n được thiết kế dạng trượt chạy ngầm dưới gầm b&agrave;n, v&agrave; khi cần sử dụng bạn chỉ cần k&eacute;o phần n&agrave;y ra m&agrave; kh&ocirc;ng cần phải c&oacute; th&ecirc;m bất cứ động t&aacute;c th&aacute;o lắp phức tạp n&agrave;o.&nbsp;</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Sản phẩm c&oacute; khung hợp kim,phủ sơn&nbsp;cao cấp, đem lại cảm gi&aacute;c sạch sẽ, đơn giản v&agrave; cũng dễ lau ch&ugrave;i.</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Mặt k&iacute;nh b&agrave;n ăn l&agrave; k&iacute;nh cường lực &ndash; loại k&iacute;nh c&oacute; chất lượng cao, được t&ocirc;i trong nhiệt độ 700 độ C v&agrave; được l&agrave;m nguội nhanh bằng kh&iacute; để tạo sức căng bề mặt, khả năng chịu lực v&agrave; chống lực va đập. K&iacute;nh cường lực chịu lực gấp 4-5 lần so với k&iacute;nh nổi b&igrave;nh thường c&ugrave;ng loại, c&ugrave;ng độ d&agrave;y v&agrave; k&iacute;ch thước.</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Đặc biệt, sản phẩm ghế ăn kết hợp với b&agrave;n mở rộng cũng rất đa dạng m&agrave;u sắc v&agrave; sang trọng. Ghế được bọc PVC cao cấp, khung hợp kim. C&aacute;c ghế c&oacute; thể xếp chồng l&ecirc;n nhau gi&uacute;p tiết kiệm diện t&iacute;ch.</span></p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 160x100x76 - 240x100x76</li>
	<li>Chất liệu Khung kim loại, kết hợp gỗ. Mặt k&iacute;nh cường lực</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 1 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (9, N'Sofa giường', N'82623005', N'sofa-giuong', N'/Data/images/Product/H19S006-3%20(1).jpg', N'<Images><Images>/Data/images/Product/H19S006-3.jpg</Images><Images>/Data/images/Product/H19S006-2.jpg</Images></Images>', CAST(7920000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:19:13.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:34.407' AS DateTime), N'ngocadmin', 5, 14, NULL, N'
	<li>K&iacute;ch thước(cm) xx</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (10, N'Sofa giường', N'82623003', N'sofa-giuong', N'/Data/images/Product/H19S001-1.jpg', N'<Images><Images>/Data/images/Product/H19S007-1(1).jpg</Images><Images>/Data/images/Product/H19S007-2.jpg</Images><Images>/Data/images/Product/H19S007-3.jpg</Images></Images>', CAST(9590000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:20:31.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:41.737' AS DateTime), N'ngocadmin', 5, 15, NULL, N'
	<li>K&iacute;ch thước(cm) xx</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (11, N'Sofa giường', N'82623002', N'sofa-giuong', N'/Data/images/Product/H19S007-3.jpg', N'<Images><Images>/Data/images/Product/H19S001-3.jpg</Images><Images>/Data/images/Product/H19S001-1.jpg</Images><Images>/Data/images/Product/H19S001-2.jpg</Images></Images>', CAST(9790000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:21:48.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:50.760' AS DateTime), N'ngocadmin', 5, 19, NULL, N'
	<li>K&iacute;ch thước(cm) xx</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (12, N'Sofa vải Merin', N'82636117', N'sofa-vai-merin', N'/Data/images/Product/Thumb/12%20(1).jpg', N'<Images><Images>/Data/images/Product/12.jpg</Images><Images>/Data/images/Product/13.jpg</Images></Images>', CAST(17870000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:25:52.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:48:46.343' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Dường như việc chọn mua một bộ&nbsp;Sofa đẹp&nbsp;kh&ocirc;ng phải l&agrave; một c&ocirc;ng việc dễ d&agrave;ng khi phong c&aacute;ch, kiểu d&aacute;ng, m&agrave;u sắc, gi&aacute; cả v&agrave; chất lượng của&nbsp;Sofa rất phong ph&uacute; v&agrave; đa dạng.&nbsp;Chắc chắn sẽ c&oacute; rất nhiều băn khoăn, nhiều c&acirc;u hỏi được đặt ra như: t&igrave;m mua Sofa vải ở đ&acirc;u? Sofa vải thế n&agrave;o l&agrave; chất lượng tốt?&hellip;&nbsp;Hẳn kh&ocirc;ng &iacute;t&nbsp;kh&aacute;ch h&agrave;ng đang muốn t&igrave;m một địa chỉ đ&aacute;ng tin cậy để chọn cho m&igrave;nh một bộ Sofa ưng &yacute;. V&agrave; sau đ&acirc;y Nh&agrave; đẹp sẽ chia sẻ với c&aacute;c bạn một số kinh nghiệm khi bạn cần cho m&igrave;nh một bộ Sofa đ&uacute;ng như mong muốn.</em></p>

<p style="text-align:justify">D&ograve;ng sản phẩm Sofa bọc vải của Nội Thất Nh&agrave; Đẹp được đặt sản xuất theo y&ecirc;u cầu, ti&ecirc;u chuẩn ri&ecirc;ng của Nh&agrave; Đẹp, nhằm c&oacute; được những sản phẩm chất lượng cao, đ&aacute;p ứng được nhu cầu v&agrave; thị hiếu của kh&aacute;ch h&agrave;ng. Khi kh&aacute;ch h&agrave;ng đến với Nội thất Nh&agrave; Đẹp, kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m để lựa chọn những bộ Sofa vải của Nh&agrave; Đẹp v&igrave; những l&yacute; do sau:</p>

<p style="text-align:justify">Khung của Sofa được l&agrave;m bằng gỗ thịt chắc chắn, tuổi của gỗ l&agrave; tr&ecirc;n 10 năm. Ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng gỗ tạp, gỗ non như những sản phẩm gia c&ocirc;ng, h&agrave;ng chợ, h&agrave;ng sản xuất nhỏ lẻ đơn chiếc tại c&aacute;c c&ocirc;ng ty hoặc xưởng gỗ nhỏ.</p>

<p style="text-align:justify">Phần vải bọc Sofa được thiết kế để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o ra để giặt vệ sinh. Hiện nay tr&ecirc;n thị trường kh&ocirc;ng c&oacute; nhiều c&ocirc;ng ty l&agrave;m được theo y&ecirc;u cầu như vậy. Trong qu&aacute; tr&igrave;nh sử dụng, nếu kh&aacute;ch qu&aacute; bận rộn v&agrave; kh&ocirc;ng c&oacute; thời gian để vệ sinh bộ Sofa của m&igrave;nh, Qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Nh&agrave; Đẹp để được hỗ trợ với mức ph&iacute; rất thấp.</p>

<p style="text-align:justify">Kiểu d&aacute;ng, m&agrave;u sắc của sản phẩm rất sắc n&eacute;t, nổi bật, đơn giản nhưng tinh tế. Ho&agrave;n to&agrave;n kh&aacute;c biệt với những mẫu Sofa sản xuất gia c&ocirc;ng, kiểu d&aacute;ng cục mịch, đơn giản đến mức th&ocirc; sơ.</p>

<p style="text-align:justify">Phần đệm ngồi v&agrave; tựa lưng được nghi&ecirc;n cứu v&agrave; thiết kế nhằm mang đến cảm gi&aacute;c thư th&aacute;i, dễ chịu cho người sử dụng. Cấu tạo ch&iacute;nh l&agrave; gồm c&oacute; l&ograve; xo (l&ograve; xo t&uacute;i hoặc l&ograve; xo ziz zắc), đai chun hoặc đai kim loại, 3-4 lớp đệm m&uacute;t, b&ocirc;ng hoặc l&ocirc;ng vũ. Sản phẩm c&oacute; độ &ecirc;m &aacute;i, dễ chịu khi sử dụng m&agrave; vẫn đảm bảo c&aacute;c t&iacute;nh năng đ&agrave;n hồi, gi&uacute;p&nbsp; giữ được phom d&aacute;ng của bộ Sofa trong thời gian d&agrave;i. Đối với c&aacute;c h&agrave;ng sản xuất gia c&ocirc;ng, thường sẽ sử dụng c&aacute;c vật liệu v&agrave; phụ kiện k&eacute;m chất lượng hoặc thậm ch&iacute; bớt x&eacute;n vật tư (l&ograve; xo, đai, đệm), dẫn đến sản phẩm nhanh xẹp l&uacute;n, xuống cấp. Ngo&agrave;i ra c&ograve;n một trường hợp kh&aacute;c l&agrave; c&aacute;c c&ocirc;ng ty, xưởng sản xuất nhỏ hay tư vấn cho kh&aacute;ch h&agrave;ng sử dụng đệm cứng để n&acirc;ng cao tuổi thọ của sản phẩm, thực tế đ&acirc;y l&agrave; tư vấn&nbsp;rất sai&nbsp;v&agrave; kh&ocirc;ng v&igrave; quyền lợi của kh&aacute;ch h&agrave;ng. Bởi v&igrave;, khi ngồi l&acirc;u tr&ecirc;n bộ Sofa cứng, kh&aacute;ch h&agrave;ng sẽ bị đau mỏi, như vậy ho&agrave;n to&agrave;n đi ngược với chức năng sử dụng của sofa. Lẽ ra, sau những ng&agrave;y l&agrave;m việc mệt mỏi, khi trở về nh&agrave; kh&aacute;ch h&agrave;ng sẽ được ho&agrave;n to&agrave;n thư gi&atilde;n, c&oacute; được một cảm gi&aacute;c thoải m&aacute;i khi ngồi l&ecirc;n bộ ghế Sofa nhưng với Sofa đệm cứng th&igrave; kh&aacute;ch h&agrave;ng lại c&agrave;ng th&ecirc;m mệt mỏi. Hơn nữa, đệm cứng thực chất rẻ hơn rất nhiều so với đệm m&uacute;t cao su.</p>

<p style="text-align:justify">Ngo&agrave;i yếu tố về chất lượng sản phẩm, Nh&agrave; Đẹp cũng mang đến cho kh&aacute;ch h&agrave;ng rất nhiều dịch vụ tiện &iacute;ch miễn ph&iacute; đi k&egrave;m như tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng v&agrave; lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch. Thời gian bảo h&agrave;nh của sản phẩm d&agrave;i, khung Sofa bảo h&agrave;nh 10 năm v&agrave; 1 năm cho c&aacute;c phần c&ograve;n lại. Nh&agrave; Đẹp cũng bảo tr&igrave; trọn đời sản phẩm với mức ph&iacute; hỗ trợ kh&aacute;ch h&agrave;ng. Trong trường hợp kh&aacute;ch c&oacute; nhu cầu thay vỏ bọc Sofa, Nh&agrave; Đẹp cũng hỗ trợ bọc lại mới cho kh&aacute;ch.</p>

<p style="text-align:justify">Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm tốt, th&aacute;i độ phục vụ nhiệt t&igrave;nh, chu đ&aacute;o, Nh&agrave; Đẹp c&ograve;n lu&ocirc;n ch&uacute; &yacute; v&agrave; gia tăng c&aacute;c dịch vụ hậu m&atilde;i, c&aacute;c quyền lợi v&agrave; ưu đ&atilde;i d&agrave;nh ri&ecirc;ng cho c&aacute;c kh&aacute;ch h&agrave;ng quen, kh&aacute;ch h&agrave;ng th&acirc;n thiết. Hơn thế nữa, Nh&agrave; Đẹp c&ograve;n thường xuy&ecirc;n thực hiện c&aacute;c chương tr&igrave;nh ưu đ&atilde;i theo tuần, theo th&aacute;ng để kh&aacute;ch h&agrave;ng may mắn c&oacute; cơ hội sở hữu những sản phẩm cao cấp với gi&aacute; phải chăng.</p>

<p>&nbsp;</p>
', N'<li>K&iacute;ch thước(cm) 259x148x70</li>
	<li>Chất liệu Khung gỗ, nhồi đệm kết hợp l&ograve; xo, bọc vải, ch&acirc;n kim loại</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 1 năm cho c&aacute;c phần c&ograve;n lại</li>
	<li>Th&aacute;o vỏ C&oacute;</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (13, N'Sofa da Waldo', N'82603944', N'sofa-da-waldo', N'/Data/images/Product/82603944-sofa-da-waldo-xam-goc-trai-2.jpg', N'<Images><Images>/Data/images/Product/82603944-sofa-da-waldo-xam-goc-trai.jpg</Images><Images>/Data/images/Product/82603944-sofa-da-waldo-xam-goc-trai-2.jpg</Images></Images>', CAST(76920000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:29:46.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:25.317' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p style="text-align:justify"><strong>THIẾT KẾ SANG TRỌNG</strong></p>

<p style="text-align:justify">Sofa sử dụng ch&acirc;n kim loại mạ crom,&nbsp;khung gỗ,&nbsp;ph&ugrave; hợp với nhiều kiểu căn hộ đa dạng diện t&iacute;ch. Sofa da WALDO nổi bật bởi những đường may nổi trải d&agrave;i phần tựa lưng. To&agrave;n bộ bề mặt sofa sử dụng da b&ograve; thật, nệm ngồi bọc m&uacute;t tạo cảm gi&aacute;c &ecirc;m &aacute;i, độ đ&agrave;n hồi vừa phải. M&agrave;u n&acirc;u v&agrave; x&aacute;m&nbsp;sang trọng dễ d&agrave;ng kết hợp với nhiều đồ nội thất kh&aacute;c.</p>

<p style="text-align:justify"><strong>CHẤT LƯỢNG ĐẢM BẢO</strong></p>

<p style="text-align:justify">Sofa được bọc 100%&nbsp;da thật Full-grain cao cấp nhất. Phần tựa lưng v&agrave; phần ngồi của sofa da được Nh&agrave; Đẹp y&ecirc;u cầu nh&agrave; sản xuất nghi&ecirc;n cứu tỉ mỉ, đảm bảo lu&ocirc;n tạo cảm gi&aacute;c &ecirc;m &aacute;i, dễ chịu cho người sử dụng. Đệm m&uacute;t, hệ thống l&ograve; xo, d&acirc;y đ&agrave;n hồi kết hợp với nhau nhịp nh&agrave;ng, đảm bảo sản phẩm giữ được phom d&aacute;ng l&acirc;u d&agrave;i, trong suốt qu&aacute; tr&igrave;nh sử dụng.</p>

<p style="text-align:justify"><strong>DỊCH VỤ CHU Đ&Aacute;O</strong></p>

<p style="text-align:justify">Đ&atilde; từ l&acirc;u, dịch vụ tại Nội Thất Nh&agrave; Đẹp vẫn lu&ocirc;n được c&aacute;c kh&aacute;ch h&agrave;ng khen ngợi v&agrave; đ&aacute;nh gi&aacute; rất cao. Nh&agrave; Đẹp lu&ocirc;n phục vụ kh&aacute;ch chu đ&aacute;o, nhiệt t&igrave;nh từ l&uacute;c trước, trong v&agrave; sau khi mua h&agrave;ng. D&ugrave; bạn mua hoặc kh&ocirc;ng mua sản phẩm th&igrave; tất cả c&aacute;c nh&acirc;n vi&ecirc;n của Nh&agrave; Đẹp vẫn lu&ocirc;n phục vụ nhiệt t&igrave;nh v&agrave; tận t&acirc;m nhất.</p>

<p style="text-align:justify">Đặc biệt với sofa da, Nh&agrave; Đẹp thực hiện chế độ bảo h&agrave;nh 10 NĂM cho khung, 2 NĂM cho da v&agrave; bảo dưỡng da MIỄN PH&Iacute; 6 th&aacute;ng/lần trong 5 năm.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 290x183x95</li>
	<li>Xuất xứ Kh&aacute;c</li>
	<li>Chất liệu Da thật full-grain 100%, khung gỗ, ch&acirc;n kim loại mạ crom</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn ph&iacute; 6 th&aacute;ng/lần</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (14, N'Sofa da Italia Impressive', N'72608050', N'sofa-da-italia-impressive', N'/Data/images/Product/Thumb/sofa-da-italia-impressive-goc-phai-72608050-2%20(1).jpg', N'<Images><Images>/Data/images/Product/sofa-da-italia-impressive-goc-phai-72608050.jpg</Images><Images>/Data/images/Product/sofa-da-italia-impressive-goc-phai-72608050-3.jpg</Images><Images>/Data/images/Product/sofa-da-italia-impressive-goc-phai-72608050-2.jpg</Images></Images>', CAST(101200000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:32:35.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:07.670' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p style="text-align:justify">Sofa da &Yacute; l&agrave; một trong những d&ograve;ng sản phẩm lu&ocirc;n được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng kh&ocirc;ng k&eacute;m phần thoải m&aacute;i, dễ chịu v&agrave; tiện nghi m&agrave; ch&uacute;ng mang lại. Sofa da &Yacute; lu&ocirc;n mang lại n&eacute;t lịch l&atilde;m c&ugrave;ng phong c&aacute;ch kh&aacute;c biệt cho chủ nh&acirc;n.</p>

<p style="text-align:justify"><strong>THIẾT KẾ SANG TRỌNG</strong></p>

<p style="text-align:justify">Sofa da Italia Impressive c&oacute; 2 loại k&iacute;ch thước l&agrave; sofa 3 chỗ v&agrave; sofa g&oacute;c. To&agrave;n bộ bề mặt l&agrave; da thật top-grain cao cấp. Lưng v&agrave; tay sofa được may gh&eacute;p da h&igrave;nh quả tr&aacute;m độc đ&aacute;o. Khung gỗ chắc chắn, nệm ngồi bọc m&uacute;t tạo cảm gi&aacute;c &ecirc;m &aacute;i với&nbsp;độ đ&agrave;n hồi vừa phải. Kiểu d&aacute;ng bề thế ph&ugrave; hợp với ph&ograve;ng kh&aacute;ch rộng v&agrave;&nbsp;sang trọng.</p>

<p style="text-align:justify"><strong>NHẬP KHẨU TRỰC TIẾP TỪ &Yacute;</strong></p>

<p style="text-align:justify">IPD l&agrave; nh&agrave; cung cấp trực tiếp Sofa da &Yacute; của Nh&agrave; Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với &yacute; tưởng mang đến thị trường nước ngo&agrave;i c&aacute;c sản phẩm da phổ biến v&agrave; c&oacute; nhiều y&ecirc;u cầu cao trong sản xuất tại &Yacute;. IDP đạt chứng nhận 100% Original Italian Quality với nguy&ecirc;n vật&nbsp;liệu cao cấp&nbsp;của &Yacute;, thiết kế của &Yacute;, sản xuất tại &Yacute;; điều m&agrave; kh&ocirc;ng phải thương hiệu n&agrave;o cũng đạt được v&igrave; phần lớn sofa &Yacute; sản xuất tại xưởng của c&aacute;c nước đang ph&aacute;t triển.</p>

<p style="text-align:justify"><strong>DỊCH VỤ CHU Đ&Aacute;O</strong></p>

<p style="text-align:justify">Đ&atilde; từ l&acirc;u, dịch vụ tại Nội Thất Nh&agrave; Đẹp vẫn lu&ocirc;n được c&aacute;c kh&aacute;ch h&agrave;ng khen ngợi v&agrave; đ&aacute;nh gi&aacute; rất cao. Nh&agrave; Đẹp lu&ocirc;n phục vụ kh&aacute;ch chu đ&aacute;o, nhiệt t&igrave;nh từ l&uacute;c trước, trong v&agrave; sau khi mua h&agrave;ng. D&ugrave; bạn mua hoặc kh&ocirc;ng mua sản phẩm th&igrave; tất cả c&aacute;c nh&acirc;n vi&ecirc;n của Nh&agrave; Đẹp vẫn lu&ocirc;n phục vụ nhiệt t&igrave;nh v&agrave; tận t&acirc;m nhất.</p>

<p style="text-align:justify">Đặc biệt với sofa da, Nh&agrave; Đẹp thực hiện chế độ bảo h&agrave;nh 10 NĂM cho khung, 2 NĂM cho da v&agrave; bảo dưỡng da MIỄN PH&Iacute; 6 th&aacute;ng/lần trong 5 năm.</p>

<p style="text-align:justify"><strong>Nội Thất Nh&agrave; Đẹp tự h&agrave;o l&agrave; c&ocirc;ng ty nhập khẩu sofa da &Yacute; uy t&iacute;n v&agrave; chất lượng, với nhiều thương hiệu sản xuất sofa da &Yacute; nổi tiếng tại &Yacute; v&agrave; tr&ecirc;n thế giới. Kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về t&iacute;nh ch&iacute;nh x&aacute;c của nguồn gốc c&aacute;c sản phẩm sofa do &Yacute; do Nội Thất Nh&agrave; Đẹp nhập về.</strong></p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 300x148x88</li>
	<li>Xuất xứ Italia</li>
	<li>Chất liệu Da thật top grain 100%, khung gỗ</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn ph&iacute; 6 th&aacute;ng/lần</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (15, N'Bàn trà Jade', N'81141004', N'ban-tra-jade', N'/Data/images/Product/Thumb/ban-tra-jade-81141004-500x358.jpg', N'<Images><Images>/Data/images/Product/ban-tra-jade-81141004.jpg</Images><Images>/Data/images/Product/ban-tra-jade-81141004-2.jpg</Images></Images>', CAST(6300000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:34:26.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:44:35.983' AS DateTime), N'ngocadmin', 5, 1, N'<p>&nbsp;</p>

<p>B&agrave;n tr&agrave;&nbsp;Nh&agrave; Đẹp c&oacute; mẫu m&atilde; đa dạng với&nbsp;lớp mặt bằng k&iacute;nh cường lực, gỗ c&ocirc;ng nghiệp phủ veneer hoặc đ&aacute; nh&acirc;n tạo, gi&uacute;p cho Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; th&ecirc;m nhiều sự lựa chọn ph&ugrave; hợp với phong c&aacute;ch v&agrave;&nbsp;kh&ocirc;ng gian nội thất của gia đ&igrave;nh.</p>

<p><strong>Gỗ c&ocirc;ng nghiệp ti&ecirc;u chuẩn Ch&acirc;u &Acirc;u</strong></p>

<p>Th&agrave;nh phần gỗ sử dụng trong sản phẩm b&agrave;n tr&agrave;&nbsp;Nh&agrave; Đẹp l&agrave; gỗ c&ocirc;ng nghiệp&nbsp;cao cấp đạt ti&ecirc;u chuẩn E1 Ch&acirc;u &Acirc;u. Bề mặt gỗ được bao phủ bởi lớp veneer hoặc sơn b&oacute;ng, vừa bảo vệ cho bề mặt gỗ lu&ocirc;n b&oacute;ng&nbsp;v&agrave;&nbsp;c&ograve;n c&oacute; t&aacute;c dụng hạn chế thấm đọng nước, x&acirc;y&nbsp;xước sản phẩm, giữa cho sản phẩm bền&nbsp;đẹp với thời gian.</p>

<p><strong>Ch&acirc;n&nbsp;inox cao cấp</strong></p>

<p>Ch&acirc;n inox vừa tạo hiệu ứng s&aacute;ng b&oacute;ng sang trọng cho sản phẩm, vừa giữ cho sản phẩm lu&ocirc;n c&oacute; được vẻ đẹp ban đầu.</p>

<p><strong>Dễ vệ sinh</strong></p>

<p>Sản phẩm được sản xuất bởi vật liệu cao cấp v&agrave;&nbsp;c&oacute; độ b&oacute;ng cao hạn chế b&aacute;m bụi n&ecirc;n thao t&aacute;c l&agrave;m sạch, vệ sinh hết sức dễ d&agrave;ng,&nbsp;nhanh gọn. B&agrave;n tr&agrave;&nbsp;Nh&agrave; Đẹp sẽ lu&ocirc;n đẹp như mới, t&ocirc; điểm cho kh&ocirc;ng gian ph&ograve;ng kh&aacute;ch th&ecirc;m nổi bật.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 140x80x32</li>
	<li>Chất liệu Mặt gỗ c&ocirc;ng nghiệp sơn b&oacute;ng, ch&acirc;n inox</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 1 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (16, N'Bộ bàn ăn gỗ 4 ghế Lucy', N'71309004-72109006', N'bo-ban-an-go-4-ghe-lucy', N'/Data/images/Product/ban-an-go-Lucy-chan-xam.jpg', N'<Images><Images>/Data/images/Product/ban-an-go-Lucy-chan-xam.jpg</Images><Images>/Data/images/Product/ban-an-go-Lucy-chan-xam-3.jpg</Images><Images>/Data/images/Product/ban-an-go-Lucy-chan-xam-2.jpg</Images></Images>', CAST(8150000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:38:10.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:45:06.320' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p><strong>Bộ sản phẩm gồm:&nbsp;</strong>1 b&agrave;n ăn v&agrave; 4 ghế ăn</p>

<p><strong>Bảo h&agrave;nh:&nbsp;</strong>2 năm cho b&agrave;n v&agrave; 1 năm cho ghế</p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Để lựa chọn cho gia đ&igrave;nh m&igrave;nh một kh&ocirc;ng gian l&yacute; tưởng, nơi mọi th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh c&ugrave;ng nhau qu&acirc;y quần sau mỗi ng&agrave;y l&agrave;m việc mệt mỏi, hoặc tụ họp bạn b&egrave; mỗi dịp cuối tuần hẳn kh&ocirc;ng &iacute;t gia chủ phải đau đầu trước mu&ocirc;n v&agrave;n lựa chọn đầy hấp dẫn. N&ecirc;n mua b&agrave;n ăn gỗ hay b&agrave;n ăn kim loại? B&agrave;n ăn mở rộng hay kh&ocirc;ng mở rộng? Mua b&agrave;n ăn ở đ&acirc;u? Bạn c&oacute; rất nhiều c&acirc;u hỏi cần được tư vấn để c&oacute; thể đưa ra quyết định v&agrave; chọn cho m&igrave;nh một bộ b&agrave;n ăn ưng &yacute; nhất. Hăy đến với Nh&agrave; Đẹp, ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng hỗ trợ bạn.</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Nếu ng&ocirc;i nh&agrave; của bạn được thiết kế theo phong c&aacute;ch cổ điển, sang trọng th&igrave; những bộ b&agrave;n ăn gỗ với thiết kế đơn giản nhưng kh&ocirc;ng k&eacute;m phần lịch l&atilde;m của Nh&agrave; Đẹp sẽ l&agrave; sự lựa chọn ho&agrave;n hảo cho bạn. B&agrave;n ăn gỗ của Nh&agrave; Đẹp c&oacute; những ưu điểm nổi bật như sau:</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)"><strong>1. Bền, đẹp với thời gian</strong></span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">B&agrave;n ăn gỗ của Nh&agrave; Đẹp c&oacute; khung l&agrave;m từ gỗ tự nhi&ecirc;n 10 năm tuổi n&ecirc;n c&oacute; độ bền cao. Ngo&agrave;i ra, phần khung cũng được xử l&yacute; kỹ nhằm đ&aacute;p ứng với điều kiện thời tiết n&oacute;ng ẩm của nước ta n&ecirc;n khả năng chống mọt, cong v&ecirc;nh, mốc&hellip; của sản phẩm l&agrave; rất tốt.</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">B&ecirc;n cạnh đ&oacute;, b&agrave;n ăn gỗ n&oacute;i ri&ecirc;ng cũng như c&aacute;c sản phẩm nội thất gỗ n&oacute;i chung lu&ocirc;n l&agrave; xu hướng nội thất kh&ocirc;ng bao giờ lỗi mốt. C&aacute;c mẫu b&agrave;n ăn gỗ lu&ocirc;n ph&ugrave; hợp trong việc b&agrave;i tr&iacute; nội thất khi đ&acirc;y l&agrave; vật dụng sẽ l&agrave;m t&ocirc;n l&ecirc;n vẻ sang trọng cho ng&ocirc;i nh&agrave; của bạn</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)"><strong>2. Mẫu m&atilde; đa dạng</strong></span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Nh&agrave; Đẹp hiện đang c&oacute; rất nhiều mẫu b&agrave;n ăn gỗ với c&aacute;c kiểu thiết kế kh&aacute;c nhau . Với mỗi kiểu lại c&oacute; c&aacute;c lựa chọn kh&aacute;c nhau về m&agrave;u sắc, nhưng trong đ&oacute;, nổi bật nhất l&agrave; t&ocirc;ng m&agrave;u wallnut qu&yacute; ph&aacute;i đầy lịch l&atilde;m. Đ&acirc;y l&agrave; gam m&agrave;u tối ưu cho một bộ b&agrave;n ăn gỗ trang nhă đồng thời c&oacute; khả năng phối hợp cao với hầu hết c&aacute;c t&ocirc;ng m&agrave;u của đồ nội thất v&agrave; trang tr&iacute; kh&aacute;c trong nh&agrave;.</span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)"><strong>3. Dịch vụ chu đ&aacute;o, bảo h&agrave;nh d&agrave;i l&acirc;u</strong></span></p>

<p style="text-align:justify"><span style="color:rgb(0, 0, 0)">Nh&agrave; Đẹp l&agrave; một thương hiệu đi đầu trong lĩnh vực nội thất, trang tr&iacute; v&agrave; gia dụng, bắt đầu hoạt động từ năm 1999. Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm, ch&uacute;ng t&ocirc;i c&ograve;n lu&ocirc;n nỗ lực mang đến cho Qu&yacute; kh&aacute;ch h&agrave;ng c&aacute;c dịch vụ tốt nhất, chu đ&aacute;o nhất như: tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng nhanh ch&oacute;ng, lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch h&agrave;ng, gia tăng nhiều ưu đăi v&agrave; quyền lợi cho kh&aacute;ch h&agrave;ng th&acirc;n thiết, &aacute;p dụng c&aacute;c chế độ bảo h&agrave;nh, bảo tr&igrave; l&acirc;u d&agrave;i từ 1 đến 10 năm. Tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất. Đến với Nh&agrave; Đẹp chắc chắn bạn sẽ thấy h&agrave;i l&ograve;ng v&igrave; sự h&agrave;i l&ograve;ng của bạn l&agrave; niềm tự h&agrave;o của ch&uacute;ng t&ocirc;i.</span></p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 150x90x74 - 46x55x79</li>
	<li>Chất liệu Mặt gỗ c&ocirc;ng nghiệp phủ sơn, ch&acirc;n gỗ thịt</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (17, N'Bàn trà Clara', N'81140001', N'ban-tra-clara', N'/Data/images/Product/Thumb/ban-tra-clara-81140001-500x358.jpg', N'<Images><Images>/Data/images/Product/ban-tra-clara-81140001.jpg</Images><Images>/Data/images/Product/ban-tra-clara-81140001-2.jpg</Images></Images>', CAST(11900000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:41:39.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:44:23.917' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p style="text-align:justify">B&agrave;n tr&agrave;&nbsp;Nh&agrave; Đẹp c&oacute; mẫu m&atilde; đa dạng với&nbsp;lớp mặt bằng k&iacute;nh cường lực, gỗ c&ocirc;ng nghiệp phủ veneer hoặc đ&aacute; nh&acirc;n tạo, gi&uacute;p cho Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; th&ecirc;m nhiều sự lựa chọn ph&ugrave; hợp với phong c&aacute;ch v&agrave;&nbsp;kh&ocirc;ng gian nội thất của gia đ&igrave;nh.</p>

<p style="text-align:justify"><strong>Mặt k&iacute;nh cường lực</strong></p>

<p style="text-align:justify">Kh&ocirc;ng c&ograve;n lạ lẫm trong sản xuất đồ nội thất, mặt k&iacute;nh cường lực c&oacute; ưu điểm l&agrave; chịu va đập v&agrave; chịu lực tốt, lại dễ d&agrave;ng vệ sinh cũng như tăng t&iacute;nh thẩm mỹ cho sản phẩm.</p>

<p style="text-align:justify"><strong>Dễ vệ sinh</strong></p>

<p style="text-align:justify">Sản phẩm được sản xuất bởi vật liệu cao cấp v&agrave;&nbsp;c&oacute; độ b&oacute;ng cao hạn chế b&aacute;m bụi n&ecirc;n thao t&aacute;c l&agrave;m sạch, vệ sinh hết sức dễ d&agrave;ng,&nbsp;nhanh gọn. B&agrave;n tr&agrave;&nbsp;Nh&agrave; Đẹp sẽ lu&ocirc;n đẹp như mới, t&ocirc; điểm cho kh&ocirc;ng gian ph&ograve;ng kh&aacute;ch th&ecirc;m nổi bật.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 120x120x38</li>
	<li>Chất liệu Mặt k&iacute;nh cường lực, ch&acirc;n l&agrave; gỗ &oacute;c ch&oacute;</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 1 năm</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (18, N'Sofa vải Marcus', N'82636019', N'sofa-vai-marcus', N'/Data/images/Product/Thumb/sofa-vai-marcus-goc-xanh-82636019-3%20(1).jpg', N'<Images><Images>/Data/images/Product/z2011771321394_57ef0dae4aeb8fb2d39682e3dbc0cf49.jpg</Images><Images>/Data/images/Product/sofa-vai-marcus-goc-xanh-82636019-3.jpg</Images></Images>', CAST(21600000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:43:32.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:48:34.623' AS DateTime), N'ngocadmin', 5, 1, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Dường như việc chọn mua một bộ&nbsp;Sofa đẹp&nbsp;kh&ocirc;ng phải l&agrave; một c&ocirc;ng việc dễ d&agrave;ng khi phong c&aacute;ch, kiểu d&aacute;ng, m&agrave;u sắc, gi&aacute; cả v&agrave; chất lượng của&nbsp;Sofa rất phong ph&uacute; v&agrave; đa dạng.&nbsp;Chắc chắn sẽ c&oacute; rất nhiều băn khoăn, nhiều c&acirc;u hỏi được đặt ra như: t&igrave;m mua Sofa vải ở đ&acirc;u? Sofa vải thế n&agrave;o l&agrave; chất lượng tốt?&hellip;&nbsp;Hẳn kh&ocirc;ng &iacute;t&nbsp;kh&aacute;ch h&agrave;ng đang muốn t&igrave;m một địa chỉ đ&aacute;ng tin cậy để chọn cho m&igrave;nh một bộ Sofa ưng &yacute;. V&agrave; sau đ&acirc;y Nh&agrave; đẹp sẽ chia sẻ với c&aacute;c bạn một số kinh nghiệm khi bạn cần cho m&igrave;nh một bộ Sofa đ&uacute;ng như mong muốn.</em></p>

<p style="text-align:justify">D&ograve;ng sản phẩm Sofa bọc vải của Nội Thất Nh&agrave; Đẹp được đặt sản xuất theo y&ecirc;u cầu, ti&ecirc;u chuẩn ri&ecirc;ng của Nh&agrave; Đẹp, nhằm c&oacute; được những sản phẩm chất lượng cao, đ&aacute;p ứng được nhu cầu v&agrave; thị hiếu của kh&aacute;ch h&agrave;ng. Khi kh&aacute;ch h&agrave;ng đến với Nội thất Nh&agrave; Đẹp, kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m để lựa chọn những bộ Sofa vải của Nh&agrave; Đẹp v&igrave; những l&yacute; do sau:</p>

<p style="text-align:justify">Khung của Sofa được l&agrave;m bằng gỗ thịt chắc chắn, tuổi của gỗ l&agrave; tr&ecirc;n 10 năm. Ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng gỗ tạp, gỗ non như những sản phẩm gia c&ocirc;ng, h&agrave;ng chợ, h&agrave;ng sản xuất nhỏ lẻ đơn chiếc tại c&aacute;c c&ocirc;ng ty hoặc xưởng gỗ nhỏ.</p>

<p style="text-align:justify">Phần vải bọc Sofa được thiết kế để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o ra để giặt vệ sinh. Hiện nay tr&ecirc;n thị trường kh&ocirc;ng c&oacute; nhiều c&ocirc;ng ty l&agrave;m được theo y&ecirc;u cầu như vậy. Trong qu&aacute; tr&igrave;nh sử dụng, nếu kh&aacute;ch qu&aacute; bận rộn v&agrave; kh&ocirc;ng c&oacute; thời gian để vệ sinh bộ Sofa của m&igrave;nh, Qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Nh&agrave; Đẹp để được hỗ trợ với mức ph&iacute; rất thấp.</p>

<p style="text-align:justify">Kiểu d&aacute;ng, m&agrave;u sắc của sản phẩm rất sắc n&eacute;t, nổi bật, đơn giản nhưng tinh tế. Ho&agrave;n to&agrave;n kh&aacute;c biệt với những mẫu Sofa sản xuất gia c&ocirc;ng, kiểu d&aacute;ng cục mịch, đơn giản đến mức th&ocirc; sơ.</p>

<p style="text-align:justify">Phần đệm ngồi v&agrave; tựa lưng được nghi&ecirc;n cứu v&agrave; thiết kế nhằm mang đến cảm gi&aacute;c thư th&aacute;i, dễ chịu cho người sử dụng. Cấu tạo ch&iacute;nh l&agrave; gồm c&oacute; l&ograve; xo (l&ograve; xo t&uacute;i hoặc l&ograve; xo ziz zắc), đai chun hoặc đai kim loại, 3-4 lớp đệm m&uacute;t, b&ocirc;ng hoặc l&ocirc;ng vũ. Sản phẩm c&oacute; độ &ecirc;m &aacute;i, dễ chịu khi sử dụng m&agrave; vẫn đảm bảo c&aacute;c t&iacute;nh năng đ&agrave;n hồi, gi&uacute;p&nbsp; giữ được phom d&aacute;ng của bộ Sofa trong thời gian d&agrave;i. Đối với c&aacute;c h&agrave;ng sản xuất gia c&ocirc;ng, thường sẽ sử dụng c&aacute;c vật liệu v&agrave; phụ kiện k&eacute;m chất lượng hoặc thậm ch&iacute; bớt x&eacute;n vật tư (l&ograve; xo, đai, đệm), dẫn đến sản phẩm nhanh xẹp l&uacute;n, xuống cấp. Ngo&agrave;i ra c&ograve;n một trường hợp kh&aacute;c l&agrave; c&aacute;c c&ocirc;ng ty, xưởng sản xuất nhỏ hay tư vấn cho kh&aacute;ch h&agrave;ng sử dụng đệm cứng để n&acirc;ng cao tuổi thọ của sản phẩm, thực tế đ&acirc;y l&agrave; tư vấn&nbsp;rất sai&nbsp;v&agrave; kh&ocirc;ng v&igrave; quyền lợi của kh&aacute;ch h&agrave;ng. Bởi v&igrave;, khi ngồi l&acirc;u tr&ecirc;n bộ Sofa cứng, kh&aacute;ch h&agrave;ng sẽ bị đau mỏi, như vậy ho&agrave;n to&agrave;n đi ngược với chức năng sử dụng của sofa. Lẽ ra, sau những ng&agrave;y l&agrave;m việc mệt mỏi, khi trở về nh&agrave; kh&aacute;ch h&agrave;ng sẽ được ho&agrave;n to&agrave;n thư gi&atilde;n, c&oacute; được một cảm gi&aacute;c thoải m&aacute;i khi ngồi l&ecirc;n bộ ghế Sofa nhưng với Sofa đệm cứng th&igrave; kh&aacute;ch h&agrave;ng lại c&agrave;ng th&ecirc;m mệt mỏi. Hơn nữa, đệm cứng thực chất rẻ hơn rất nhiều so với đệm m&uacute;t cao su.</p>

<p style="text-align:justify">Ngo&agrave;i yếu tố về chất lượng sản phẩm, Nh&agrave; Đẹp cũng mang đến cho kh&aacute;ch h&agrave;ng rất nhiều dịch vụ tiện &iacute;ch miễn ph&iacute; đi k&egrave;m như tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng v&agrave; lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch. Thời gian bảo h&agrave;nh của sản phẩm d&agrave;i, khung Sofa bảo h&agrave;nh 10 năm v&agrave; 1 năm cho c&aacute;c phần c&ograve;n lại. Nh&agrave; Đẹp cũng bảo tr&igrave; trọn đời sản phẩm với mức ph&iacute; hỗ trợ kh&aacute;ch h&agrave;ng. Trong trường hợp kh&aacute;ch c&oacute; nhu cầu thay vỏ bọc Sofa, Nh&agrave; Đẹp cũng hỗ trợ bọc lại mới cho kh&aacute;ch.</p>

<p style="text-align:justify">Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm tốt, th&aacute;i độ phục vụ nhiệt t&igrave;nh, chu đ&aacute;o, Nh&agrave; Đẹp c&ograve;n lu&ocirc;n ch&uacute; &yacute; v&agrave; gia tăng c&aacute;c dịch vụ hậu m&atilde;i, c&aacute;c quyền lợi v&agrave; ưu đ&atilde;i d&agrave;nh ri&ecirc;ng cho c&aacute;c kh&aacute;ch h&agrave;ng quen, kh&aacute;ch h&agrave;ng th&acirc;n thiết. Hơn thế nữa, Nh&agrave; Đẹp c&ograve;n thường xuy&ecirc;n thực hiện c&aacute;c chương tr&igrave;nh ưu đ&atilde;i theo tuần, theo th&aacute;ng để kh&aacute;ch h&agrave;ng may mắn c&oacute; cơ hội sở hữu những sản phẩm cao cấp với gi&aacute; phải chăng.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 254x152x89</li>
	<li>Chất liệu Khung gỗ, nhồi đệm kết hợp l&ograve; xo, bọc vải, ch&acirc;n kim loại</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 1 năm cho c&aacute;c phần c&ograve;n lại</li>
	<li>Th&aacute;o vỏ C&oacute;</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (19, N'Ghế ăn bọc PU', N'72104088', N'ghe-an-boc-pu', N'/Data/images/Product/Thumb/_DSC1150%20(1).jpg', N'<Images><Images>/Data/images/Product/_DSC1152.jpg</Images><Images>/Data/images/Product/_DSC1151.jpg</Images><Images>/Data/images/Product/_DSC1150.jpg</Images></Images>', CAST(1370000 AS Decimal(18, 0)), 100, CAST(N'2020-12-20 07:45:13.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:46:00.653' AS DateTime), N'ngocadmin', 5, 0, N'<p>&nbsp;</p>

<p style="text-align:justify">Sau những giờ l&agrave;m việc, học tập trong suốt một ng&agrave;y d&agrave;i, bữa cơm gia đ&igrave;nh l&agrave; nơi tập hợp đầy đủ c&aacute;c th&agrave;nh vi&ecirc;n. Ch&iacute;nh v&igrave; vậy, ph&ograve;ng ăn l&agrave; phần cực kỳ quan trong trọng trong cấu tr&uacute;c nội thất của mỗi căn nh&agrave;. B&ecirc;n cạnh một chiếc b&agrave;n ăn đẹp, trang nh&atilde;, người gia chủ cũng lu&ocirc;n quan t&acirc;m tới ghế ăn v&igrave; đ&acirc;y ch&iacute;nh l&agrave; người bạn đồng h&agrave;nh trong suốt bữa ăn của cả gia đ&igrave;nh. Tuy nhi&ecirc;n, để lựa chọn được một chiếc ghế ăn tốt kh&ocirc;ng phải dễ bởi tr&ecirc;n thị trường c&oacute; qu&aacute; nhiều sự lựa chọn. Ghế gỗ hay ghế kim loại, ghế nhựa? Ghế c&oacute; bọc vải hay giả da? Mua ghế n&agrave;y th&igrave; c&oacute; đồng bộ với b&agrave;n kia hay kh&ocirc;ng? Nếu vẫn c&ograve;n thắc mắc th&igrave; h&atilde;y để Nh&agrave; Đẹp c&ugrave;ng bạn t&igrave;m ra chiếc ghế ăn ho&agrave;n hảo m&agrave; bạn vẫn hằng kiếm t&igrave;m nh&eacute;! Bởi Nh&agrave; Đẹp l&agrave; nơi m&agrave; bạn c&oacute; thể thấy những chiếc ghế ăn mang những đặc t&iacute;nh sau:</p>

<ol>
	<li style="text-align:justify"><strong>Mẫu m&atilde; đa dạng, phong ph&uacute;:</strong></li>
</ol>

<p style="text-align:justify">D&ugrave; bạn c&oacute; theo đuổi bất kỳ phong c&aacute;ch nội thất n&agrave;o cho ph&ograve;ng ăn của m&igrave;nh th&igrave; Nh&agrave; Đẹp cũng lu&ocirc;n sẵn s&agrave;ng hỗ trợ bạn t&igrave;m ra chiếc ghế ăn ph&ugrave; hợp nhất. Bởi tại nơi đ&acirc;y, bạn c&oacute; thể dễ d&agrave;ng bắt gặp c&aacute;c mẫu ghế ăn với đa dạng về chất liệu, mẫu m&atilde; cũng như k&iacute;ch thước.</p>

<p style="text-align:justify">Nếu bạn theo đuổi phong c&aacute;ch sang trọng, cổ điển, những chiếc ghế ăn gỗ sẽ l&agrave; sự lựa chọn tuyệt vời. C&ograve;n sự lựa chọn của bạn l&agrave; phong c&aacute;ch trẻ trung hiện đại th&igrave; những chiếc ghế ăn bọc giả da chắc chắn sẽ l&agrave;m bạn h&agrave;i l&ograve;ng&hellip;</p>

<ol start="2">
	<li style="text-align:justify"><strong>Bền, đẹp, tiện lợi</strong></li>
</ol>

<p style="text-align:justify">Ghế ăn do Nh&agrave; Đẹp cung cấp lu&ocirc;n mang lại cho qu&yacute; kh&aacute;ch h&agrave;ng những trải nghiệm tuyệt vời bởi đ&acirc;y l&agrave; những sản phẩm được chọn lọc kỹ c&agrave;ng bởi c&aacute;c chuy&ecirc;n gia nội thất của Nh&agrave; Đẹp với những ti&ecirc;u chuẩn khắt khe nhất nhằm đ&aacute;p ứng đầy đủ 3 ti&ecirc;u ch&iacute;: bền, đẹp v&agrave; tiện lợi.</p>

<p style="text-align:justify">C&aacute;c sản phẩm ghế ăn Nh&agrave; Đẹp cho d&ugrave; l&agrave;m bằng bất kỳ chất liệu g&igrave; lu&ocirc;n phải đ&aacute;p ứng tất cả c&aacute;c chỉ ti&ecirc;u th&ocirc;ng số kỹ th&ocirc;ng thuật về độ chịu lực, khả năng chống ẩm mốc, khả năng chống mọt&hellip; Ngo&agrave;i ra với thiết kế bề ngo&agrave;i trang nh&atilde;, m&agrave;u sắc được chọn lựa kỹ c&agrave;ng nhằm ph&ugrave; hợp với kh&ocirc;ng gian ph&ograve;ng ăn, ghế ăn do Nh&agrave; Đẹp cung cấp l&agrave; sản phẩm kh&ocirc;ng chỉ &ldquo;tốt gỗ&rdquo; m&agrave; c&ograve;n tốt cả &ldquo;nước sơn&rdquo;.</p>

<p style="text-align:justify">T&iacute;nh tiện lợi của sản phẩm cũng l&agrave; 1 yếu tố được c&aacute;c chuy&ecirc;n gia Nh&agrave; Đẹp c&acirc;n nhắc khi gửi chọn lựa c&aacute;c mẫu m&atilde; sản phẩm ghế ăn tới qu&yacute; kh&aacute;ch h&agrave;ng. C&aacute;c yếu tố như độ nặng, khả năng xếp chồng, diện t&iacute;ch mặt ghế được chọn lựa rất kỹ để mỗi sản phẩm ghế ăn do Nh&agrave; Đẹp cung cấp đều khiến kh&aacute;ch h&agrave;ng cảm thấy h&agrave;i l&ograve;ng khi sử dụng.</p>

<ol start="3">
	<li style="text-align:justify"><strong>Dịch vụ chu đ&aacute;o, bảo h&agrave;nh d&agrave;i l&acirc;u</strong></li>
</ol>

<p style="text-align:justify">Nh&agrave; Đẹp l&agrave; một thương hiệu đi đầu trong lĩnh vực nội thất, trang tr&iacute; v&agrave; gia dụng, bắt đầu hoạt động từ năm 1999. Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm, ch&uacute;ng t&ocirc;i c&ograve;n lu&ocirc;n nỗ lực mang đến cho Qu&yacute; kh&aacute;ch h&agrave;ng c&aacute;c dịch vụ tốt nhất, chu đ&aacute;o nhất như: tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng nhanh ch&oacute;ng, lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch h&agrave;ng, gia tăng nhiều ưu đăi v&agrave; quyền lợi cho kh&aacute;ch h&agrave;ng th&acirc;n thiết, &aacute;p dụng c&aacute;c chế độ bảo h&agrave;nh, bảo tr&igrave; l&acirc;u d&agrave;i từ 1 đến 10 năm. Tất cả c&aacute;c kh&aacute;ch h&agrave;ng khi đến với Nh&agrave; Đẹp đều được tư vấn nhiệt t&igrave;nh, được phục vụ tận t&igrave;nh, chu đ&aacute;o. V&agrave; cho d&ugrave; bạn c&oacute; sử dụng sản phẩm của Nh&agrave; Đẹp hay kh&ocirc;ng, ch&uacute;ng t&ocirc;i vẫn lu&ocirc;n sẵn s&agrave;ng cung cấp cho bạn mọi th&ocirc;ng tin cần thiết để bạn c&oacute; thể lựa chọn v&agrave; đưa ra được những quyết định đ&uacute;ng đắn nhất. Đến với Nh&agrave; Đẹp chắc chắn bạn sẽ thấy h&agrave;i l&ograve;ng v&igrave; sự h&agrave;i l&ograve;ng của bạn l&agrave; niềm tự h&agrave;o của ch&uacute;ng t&ocirc;i.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 62x48x93.5</li>
	<li>Chất liệu Khung kim loại, bọc PU</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 1 năm</li>')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (20, N'Sofa da Italia Raffa', N'72608066', N'sofa-da-italia-raffa', N'/Data/images/Product/72608066-Raffa-DaBo-Gocphai.jpg', N'<Images><Images>/Data/images/Product/72608066-Raffa-DaBo-Gocphai%20(3).jpg</Images><Images>/Data/images/Product/72608066-Raffa-DaBo-Gocphai.jpg</Images></Images>', CAST(115530000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:47:19.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:16.893' AS DateTime), N'ngocadmin', 5, 1, N'<p>&nbsp;</p>

<p style="text-align:justify">Sofa da &Yacute; l&agrave; một trong những d&ograve;ng sản phẩm lu&ocirc;n được nhiều người lựa chọn bởi sự sang trọng, đẳng cấp nhưng cũng kh&ocirc;ng k&eacute;m phần thoải m&aacute;i, dễ chịu v&agrave; tiện nghi m&agrave; ch&uacute;ng mang lại. Sofa da &Yacute; lu&ocirc;n mang lại n&eacute;t lịch l&atilde;m c&ugrave;ng phong c&aacute;ch kh&aacute;c biệt cho chủ nh&acirc;n.</p>

<p style="text-align:justify"><strong>THIẾT KẾ SANG TRỌNG</strong></p>

<p style="text-align:justify">Sofa da Asta c&oacute; thiết kế băng thời thượng, k&iacute;ch thước ph&ugrave; hợp với đa số chung cư hiện nay. To&agrave;n bộ bề mặt được bọc da thật top-grain cao cấp, đệm&nbsp;m&uacute;t &ecirc;m &aacute;i với&nbsp;độ đ&agrave;n hồi vừa phải. Phần tựa đầu t&ugrave;y biến điều chỉnh theo &yacute; muốn của người d&ugrave;ng. Điểm nhấn kim loại nơi tay ghế mang với n&eacute;t cuốn h&uacute;t mạnh mẽ v&agrave; hiện đại cho mẫu sofa n&agrave;y.</p>

<p style="text-align:justify"><strong>NHẬP KHẨU TRỰC TIẾP TỪ &Yacute;</strong></p>

<p style="text-align:justify">IPD l&agrave; nh&agrave; cung cấp trực tiếp Sofa da &Yacute; của Nh&agrave; Đẹp. IDP (Industria Divani e Poltrone) bắt đầu lĩnh vực kinh doanh từ năm 1981 với &yacute; tưởng mang đến thị trường nước ngo&agrave;i c&aacute;c sản phẩm da phổ biến v&agrave; c&oacute; nhiều y&ecirc;u cầu cao trong sản xuất tại &Yacute;. IDP đạt chứng nhận 100% Original Italian Quality với nguy&ecirc;n vật&nbsp;liệu cao cấp&nbsp;của &Yacute;, thiết kế của &Yacute;, sản xuất tại &Yacute;; điều m&agrave; kh&ocirc;ng phải thương hiệu n&agrave;o cũng đạt được v&igrave; phần lớn sofa &Yacute; sản xuất tại xưởng của c&aacute;c nước đang ph&aacute;t triển.</p>

<p style="text-align:justify"><strong>DỊCH VỤ CHU Đ&Aacute;O</strong></p>

<p style="text-align:justify">Đ&atilde; từ l&acirc;u, dịch vụ tại Nội Thất Nh&agrave; Đẹp vẫn lu&ocirc;n được c&aacute;c kh&aacute;ch h&agrave;ng khen ngợi v&agrave; đ&aacute;nh gi&aacute; rất cao. Nh&agrave; Đẹp lu&ocirc;n phục vụ kh&aacute;ch chu đ&aacute;o, nhiệt t&igrave;nh từ l&uacute;c trước, trong v&agrave; sau khi mua h&agrave;ng. D&ugrave; bạn mua hoặc kh&ocirc;ng mua sản phẩm th&igrave; tất cả c&aacute;c nh&acirc;n vi&ecirc;n của Nh&agrave; Đẹp vẫn lu&ocirc;n phục vụ nhiệt t&igrave;nh v&agrave; tận t&acirc;m nhất.</p>

<p style="text-align:justify">Đặc biệt với sofa da, Nh&agrave; Đẹp thực hiện chế độ bảo h&agrave;nh 10 NĂM cho khung, 2 NĂM cho da v&agrave; bảo dưỡng da MIỄN PH&Iacute; 6 th&aacute;ng/lần trong 5 năm.</p>

<p style="text-align:justify"><strong>Nội Thất Nh&agrave; Đẹp tự h&agrave;o l&agrave; c&ocirc;ng ty nhập khẩu sofa da &Yacute; uy t&iacute;n v&agrave; chất lượng, với nhiều thương hiệu sản xuất sofa da &Yacute; nổi tiếng tại &Yacute; v&agrave; tr&ecirc;n thế giới. Kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m về t&iacute;nh ch&iacute;nh x&aacute;c của nguồn gốc c&aacute;c sản phẩm sofa &Yacute; do Nội Thất Nh&agrave; Đẹp nhập về.</strong></p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 250x105x82 - 250x105x82</li>
	<li>Xuất xứ Italia</li>
	<li>Chất liệu Da thật top grain 100%, khung gỗ, ch&acirc;n kim loại mạ crom</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 2 năm cho phần da. Bảo dưỡng miễn ph&iacute; 6 th&aacute;ng/lần</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (21, N'Sofa vải Cyrus', N'82636093', N'sofa-vai-cyrus', N'/Data/images/Product/sofa-vai-Cyrus-3-cho-mau-xam-doni-82636093.jpg', N'<Images><Images>/Data/images/Product/sofa-vai-Cyrus-3-cho-xam-doni-82636093.jpg</Images><Images>/Data/images/Product/sofa-vai-Cyrus-3-cho-mau-xam-doni-82636093.jpg</Images><Images>/Data/images/Product/sofa-vai-3-cho-mau-xam-Cyrus-82636093.jpg</Images></Images>', CAST(16630000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:49:45.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:47:57.970' AS DateTime), N'ngocadmin', 5, 1, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Dường như việc chọn mua một bộ&nbsp;Sofa đẹp&nbsp;kh&ocirc;ng phải l&agrave; một c&ocirc;ng việc dễ d&agrave;ng khi phong c&aacute;ch, kiểu d&aacute;ng, m&agrave;u sắc, gi&aacute; cả v&agrave; chất lượng của&nbsp;Sofa rất phong ph&uacute; v&agrave; đa dạng.&nbsp;Chắc chắn sẽ c&oacute; rất nhiều băn khoăn, nhiều c&acirc;u hỏi được đặt ra như: t&igrave;m mua Sofa vải ở đ&acirc;u? Sofa vải thế n&agrave;o l&agrave; chất lượng tốt?&hellip;&nbsp;Hẳn kh&ocirc;ng &iacute;t&nbsp;kh&aacute;ch h&agrave;ng đang muốn t&igrave;m một địa chỉ đ&aacute;ng tin cậy để chọn cho m&igrave;nh một bộ Sofa ưng &yacute;. V&agrave; sau đ&acirc;y Nh&agrave; đẹp sẽ chia sẻ với c&aacute;c bạn một số kinh nghiệm khi bạn cần cho m&igrave;nh một bộ Sofa đ&uacute;ng như mong muốn.</em></p>

<p style="text-align:justify">D&ograve;ng sản phẩm Sofa bọc vải của Nội Thất Nh&agrave; Đẹp được đặt sản xuất theo y&ecirc;u cầu, ti&ecirc;u chuẩn ri&ecirc;ng của Nh&agrave; Đẹp, nhằm c&oacute; được những sản phẩm chất lượng cao, đ&aacute;p ứng được nhu cầu v&agrave; thị hiếu của kh&aacute;ch h&agrave;ng. Khi kh&aacute;ch h&agrave;ng đến với Nội thất Nh&agrave; Đẹp, kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m để lựa chọn những bộ Sofa vải của Nh&agrave; Đẹp v&igrave; những l&yacute; do sau:</p>

<p style="text-align:justify">Khung của Sofa được l&agrave;m bằng gỗ thịt chắc chắn, tuổi của gỗ l&agrave; tr&ecirc;n 10 năm. Ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng gỗ tạp, gỗ non như những sản phẩm gia c&ocirc;ng, h&agrave;ng chợ, h&agrave;ng sản xuất nhỏ lẻ đơn chiếc tại c&aacute;c c&ocirc;ng ty hoặc xưởng gỗ nhỏ.</p>

<p style="text-align:justify">Phần vải bọc Sofa được thiết kế để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o ra để giặt vệ sinh. Hiện nay tr&ecirc;n thị trường kh&ocirc;ng c&oacute; nhiều c&ocirc;ng ty l&agrave;m được theo y&ecirc;u cầu như vậy. Trong qu&aacute; tr&igrave;nh sử dụng, nếu kh&aacute;ch qu&aacute; bận rộn v&agrave; kh&ocirc;ng c&oacute; thời gian để vệ sinh bộ Sofa của m&igrave;nh, Qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Nh&agrave; Đẹp để được hỗ trợ với mức ph&iacute; rất thấp.</p>

<p style="text-align:justify">Kiểu d&aacute;ng, m&agrave;u sắc của sản phẩm rất sắc n&eacute;t, nổi bật, đơn giản nhưng tinh tế. Ho&agrave;n to&agrave;n kh&aacute;c biệt với những mẫu Sofa sản xuất gia c&ocirc;ng, kiểu d&aacute;ng cục mịch, đơn giản đến mức th&ocirc; sơ.</p>

<p style="text-align:justify">Phần đệm ngồi v&agrave; tựa lưng được nghi&ecirc;n cứu v&agrave; thiết kế nhằm mang đến cảm gi&aacute;c thư th&aacute;i, dễ chịu cho người sử dụng. Cấu tạo ch&iacute;nh l&agrave; gồm c&oacute; l&ograve; xo (l&ograve; xo t&uacute;i hoặc l&ograve; xo ziz zắc), đai chun hoặc đai kim loại, 3-4 lớp đệm m&uacute;t, b&ocirc;ng hoặc l&ocirc;ng vũ. Sản phẩm c&oacute; độ &ecirc;m &aacute;i, dễ chịu khi sử dụng m&agrave; vẫn đảm bảo c&aacute;c t&iacute;nh năng đ&agrave;n hồi, gi&uacute;p&nbsp; giữ được phom d&aacute;ng của bộ Sofa trong thời gian d&agrave;i. Đối với c&aacute;c h&agrave;ng sản xuất gia c&ocirc;ng, thường sẽ sử dụng c&aacute;c vật liệu v&agrave; phụ kiện k&eacute;m chất lượng hoặc thậm ch&iacute; bớt x&eacute;n vật tư (l&ograve; xo, đai, đệm), dẫn đến sản phẩm nhanh xẹp l&uacute;n, xuống cấp. Ngo&agrave;i ra c&ograve;n một trường hợp kh&aacute;c l&agrave; c&aacute;c c&ocirc;ng ty, xưởng sản xuất nhỏ hay tư vấn cho kh&aacute;ch h&agrave;ng sử dụng đệm cứng để n&acirc;ng cao tuổi thọ của sản phẩm, thực tế đ&acirc;y l&agrave; tư vấn&nbsp;rất sai&nbsp;v&agrave; kh&ocirc;ng v&igrave; quyền lợi của kh&aacute;ch h&agrave;ng. Bởi v&igrave;, khi ngồi l&acirc;u tr&ecirc;n bộ Sofa cứng, kh&aacute;ch h&agrave;ng sẽ bị đau mỏi, như vậy ho&agrave;n to&agrave;n đi ngược với chức năng sử dụng của sofa. Lẽ ra, sau những ng&agrave;y l&agrave;m việc mệt mỏi, khi trở về nh&agrave; kh&aacute;ch h&agrave;ng sẽ được ho&agrave;n to&agrave;n thư gi&atilde;n, c&oacute; được một cảm gi&aacute;c thoải m&aacute;i khi ngồi l&ecirc;n bộ ghế Sofa nhưng với Sofa đệm cứng th&igrave; kh&aacute;ch h&agrave;ng lại c&agrave;ng th&ecirc;m mệt mỏi. Hơn nữa, đệm cứng thực chất rẻ hơn rất nhiều so với đệm m&uacute;t cao su.</p>

<p style="text-align:justify">Ngo&agrave;i yếu tố về chất lượng sản phẩm, Nh&agrave; Đẹp cũng mang đến cho kh&aacute;ch h&agrave;ng rất nhiều dịch vụ tiện &iacute;ch miễn ph&iacute; đi k&egrave;m như tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng v&agrave; lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch. Thời gian bảo h&agrave;nh của sản phẩm d&agrave;i, khung Sofa bảo h&agrave;nh 10 năm v&agrave; 1 năm cho c&aacute;c phần c&ograve;n lại. Nh&agrave; Đẹp cũng bảo tr&igrave; trọn đời sản phẩm với mức ph&iacute; hỗ trợ kh&aacute;ch h&agrave;ng. Trong trường hợp kh&aacute;ch c&oacute; nhu cầu thay vỏ bọc Sofa, Nh&agrave; Đẹp cũng hỗ trợ bọc lại mới cho kh&aacute;ch.</p>

<p style="text-align:justify">Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm tốt, th&aacute;i độ phục vụ nhiệt t&igrave;nh, chu đ&aacute;o, Nh&agrave; Đẹp c&ograve;n lu&ocirc;n ch&uacute; &yacute; v&agrave; gia tăng c&aacute;c dịch vụ hậu m&atilde;i, c&aacute;c quyền lợi v&agrave; ưu đ&atilde;i d&agrave;nh ri&ecirc;ng cho c&aacute;c kh&aacute;ch h&agrave;ng quen, kh&aacute;ch h&agrave;ng th&acirc;n thiết. Hơn thế nữa, Nh&agrave; Đẹp c&ograve;n thường xuy&ecirc;n thực hiện c&aacute;c chương tr&igrave;nh ưu đ&atilde;i theo tuần, theo th&aacute;ng để kh&aacute;ch h&agrave;ng may mắn c&oacute; cơ hội sở hữu những sản phẩm cao cấp với gi&aacute; phải chăng.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 239x97x85</li>
	<li>Chất liệu Khung gỗ, nhồi đệm kết hợp l&ograve; xo, bọc vải, ch&acirc;n kim loại</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 1 năm cho c&aacute;c phần c&ograve;n lại</li>
	<li>Th&aacute;o vỏ Kh&ocirc;ng</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (22, N'Sofa vải Jessica', N'82636061', N'sofa-vai-jessica', N'/Data/images/Product/sofa-vai-jessica-3-cho-xanh-82636061.jpg', N'<Images><Images>/Data/images/Product/sofa-vai-jessica-3-cho-xanh-82636061.jpg</Images></Images>', CAST(15930000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:51:30.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:48:17.323' AS DateTime), N'ngocadmin', 5, 2, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Dường như việc chọn mua một bộ&nbsp;Sofa đẹp&nbsp;kh&ocirc;ng phải l&agrave; một c&ocirc;ng việc dễ d&agrave;ng khi phong c&aacute;ch, kiểu d&aacute;ng, m&agrave;u sắc, gi&aacute; cả v&agrave; chất lượng của&nbsp;Sofa rất phong ph&uacute; v&agrave; đa dạng.&nbsp;Chắc chắn sẽ c&oacute; rất nhiều băn khoăn, nhiều c&acirc;u hỏi được đặt ra như: t&igrave;m mua Sofa vải ở đ&acirc;u? Sofa vải thế n&agrave;o l&agrave; chất lượng tốt?&hellip;&nbsp;Hẳn kh&ocirc;ng &iacute;t&nbsp;kh&aacute;ch h&agrave;ng đang muốn t&igrave;m một địa chỉ đ&aacute;ng tin cậy để chọn cho m&igrave;nh một bộ Sofa ưng &yacute;. V&agrave; sau đ&acirc;y Nh&agrave; đẹp sẽ chia sẻ với c&aacute;c bạn một số kinh nghiệm khi bạn cần cho m&igrave;nh một bộ Sofa đ&uacute;ng như mong muốn.</em></p>

<p style="text-align:justify">D&ograve;ng sản phẩm Sofa bọc vải của Nội Thất Nh&agrave; Đẹp được đặt sản xuất theo y&ecirc;u cầu, ti&ecirc;u chuẩn ri&ecirc;ng của Nh&agrave; Đẹp, nhằm c&oacute; được những sản phẩm chất lượng cao, đ&aacute;p ứng được nhu cầu v&agrave; thị hiếu của kh&aacute;ch h&agrave;ng. Khi kh&aacute;ch h&agrave;ng đến với Nội thất Nh&agrave; Đẹp, kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m để lựa chọn những bộ Sofa vải của Nh&agrave; Đẹp v&igrave; những l&yacute; do sau:</p>

<p style="text-align:justify">Khung của Sofa được l&agrave;m bằng gỗ thịt chắc chắn, tuổi của gỗ l&agrave; tr&ecirc;n 10 năm. Ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng gỗ tạp, gỗ non như những sản phẩm gia c&ocirc;ng, h&agrave;ng chợ, h&agrave;ng sản xuất nhỏ lẻ đơn chiếc tại c&aacute;c c&ocirc;ng ty hoặc xưởng gỗ nhỏ.</p>

<p style="text-align:justify">Phần vải bọc Sofa được thiết kế để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o ra để giặt vệ sinh. Hiện nay tr&ecirc;n thị trường kh&ocirc;ng c&oacute; nhiều c&ocirc;ng ty l&agrave;m được theo y&ecirc;u cầu như vậy. Trong qu&aacute; tr&igrave;nh sử dụng, nếu kh&aacute;ch qu&aacute; bận rộn v&agrave; kh&ocirc;ng c&oacute; thời gian để vệ sinh bộ Sofa của m&igrave;nh, Qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Nh&agrave; Đẹp để được hỗ trợ với mức ph&iacute; rất thấp.</p>

<p style="text-align:justify">Kiểu d&aacute;ng, m&agrave;u sắc của sản phẩm rất sắc n&eacute;t, nổi bật, đơn giản nhưng tinh tế. Ho&agrave;n to&agrave;n kh&aacute;c biệt với những mẫu Sofa sản xuất gia c&ocirc;ng, kiểu d&aacute;ng cục mịch, đơn giản đến mức th&ocirc; sơ.</p>

<p style="text-align:justify">Phần đệm ngồi v&agrave; tựa lưng được nghi&ecirc;n cứu v&agrave; thiết kế nhằm mang đến cảm gi&aacute;c thư th&aacute;i, dễ chịu cho người sử dụng. Cấu tạo ch&iacute;nh l&agrave; gồm c&oacute; l&ograve; xo (l&ograve; xo t&uacute;i hoặc l&ograve; xo ziz zắc), đai chun hoặc đai kim loại, 3-4 lớp đệm m&uacute;t, b&ocirc;ng hoặc l&ocirc;ng vũ. Sản phẩm c&oacute; độ &ecirc;m &aacute;i, dễ chịu khi sử dụng m&agrave; vẫn đảm bảo c&aacute;c t&iacute;nh năng đ&agrave;n hồi, gi&uacute;p&nbsp; giữ được phom d&aacute;ng của bộ Sofa trong thời gian d&agrave;i. Đối với c&aacute;c h&agrave;ng sản xuất gia c&ocirc;ng, thường sẽ sử dụng c&aacute;c vật liệu v&agrave; phụ kiện k&eacute;m chất lượng hoặc thậm ch&iacute; bớt x&eacute;n vật tư (l&ograve; xo, đai, đệm), dẫn đến sản phẩm nhanh xẹp l&uacute;n, xuống cấp. Ngo&agrave;i ra c&ograve;n một trường hợp kh&aacute;c l&agrave; c&aacute;c c&ocirc;ng ty, xưởng sản xuất nhỏ hay tư vấn cho kh&aacute;ch h&agrave;ng sử dụng đệm cứng để n&acirc;ng cao tuổi thọ của sản phẩm, thực tế đ&acirc;y l&agrave; tư vấn&nbsp;rất sai&nbsp;v&agrave; kh&ocirc;ng v&igrave; quyền lợi của kh&aacute;ch h&agrave;ng. Bởi v&igrave;, khi ngồi l&acirc;u tr&ecirc;n bộ Sofa cứng, kh&aacute;ch h&agrave;ng sẽ bị đau mỏi, như vậy ho&agrave;n to&agrave;n đi ngược với chức năng sử dụng của sofa. Lẽ ra, sau những ng&agrave;y l&agrave;m việc mệt mỏi, khi trở về nh&agrave; kh&aacute;ch h&agrave;ng sẽ được ho&agrave;n to&agrave;n thư gi&atilde;n, c&oacute; được một cảm gi&aacute;c thoải m&aacute;i khi ngồi l&ecirc;n bộ ghế Sofa nhưng với Sofa đệm cứng th&igrave; kh&aacute;ch h&agrave;ng lại c&agrave;ng th&ecirc;m mệt mỏi. Hơn nữa, đệm cứng thực chất rẻ hơn rất nhiều so với đệm m&uacute;t cao su.</p>

<p style="text-align:justify">Ngo&agrave;i yếu tố về chất lượng sản phẩm, Nh&agrave; Đẹp cũng mang đến cho kh&aacute;ch h&agrave;ng rất nhiều dịch vụ tiện &iacute;ch miễn ph&iacute; đi k&egrave;m như tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng v&agrave; lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch. Thời gian bảo h&agrave;nh của sản phẩm d&agrave;i, khung Sofa bảo h&agrave;nh 10 năm v&agrave; 1 năm cho c&aacute;c phần c&ograve;n lại. Nh&agrave; Đẹp cũng bảo tr&igrave; trọn đời sản phẩm với mức ph&iacute; hỗ trợ kh&aacute;ch h&agrave;ng. Trong trường hợp kh&aacute;ch c&oacute; nhu cầu thay vỏ bọc Sofa, Nh&agrave; Đẹp cũng hỗ trợ bọc lại mới cho kh&aacute;ch.</p>

<p style="text-align:justify">Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm tốt, th&aacute;i độ phục vụ nhiệt t&igrave;nh, chu đ&aacute;o, Nh&agrave; Đẹp c&ograve;n lu&ocirc;n ch&uacute; &yacute; v&agrave; gia tăng c&aacute;c dịch vụ hậu m&atilde;i, c&aacute;c quyền lợi v&agrave; ưu đ&atilde;i d&agrave;nh ri&ecirc;ng cho c&aacute;c kh&aacute;ch h&agrave;ng quen, kh&aacute;ch h&agrave;ng th&acirc;n thiết. Hơn thế nữa, Nh&agrave; Đẹp c&ograve;n thường xuy&ecirc;n thực hiện c&aacute;c chương tr&igrave;nh ưu đ&atilde;i theo tuần, theo th&aacute;ng để kh&aacute;ch h&agrave;ng may mắn c&oacute; cơ hội sở hữu những sản phẩm cao cấp với gi&aacute; phải chăng.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 213x97x70</li>
	<li>Chất liệu Khung gỗ, nhồi đệm kết hợp l&ograve; xo, bọc vải, ch&acirc;n kim loại</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 1 năm cho c&aacute;c phần c&ograve;n lại</li>
	<li>Th&aacute;o vỏ C&oacute;</li>

')
INSERT [dbo].[Products] ([ID], [Title], [Code], [MetaTitle], [Thumb], [Images], [Price], [Quantity], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [CategoryID], [ViewCount], [Detail], [ShortDesc]) VALUES (23, N'Sofa vải Elena 3 chỗ', NULL, N'sofa-vai-elena-3-cho', N'/Data/images/Product/sofa-vai-elena-vang-82636052-2.jpg', N'<Images><Images>/Data/images/Product/sofa-vai-elena-vang-82636052-3.jpg</Images><Images>/Data/images/Product/sofa-vai-elena-vang-82636052-2.jpg</Images><Images>/Data/images/Product/sofa-vai-elena-vang-82636052.jpg</Images></Images>', CAST(14980000 AS Decimal(18, 0)), 10, CAST(N'2020-12-20 07:53:03.000' AS DateTime), N'ngocadmin', CAST(N'2020-12-22 00:48:06.377' AS DateTime), N'ngocadmin', 5, 5, N'<p>&nbsp;</p>

<p style="text-align:justify"><em>Dường như việc chọn mua một bộ&nbsp;Sofa đẹp&nbsp;kh&ocirc;ng phải l&agrave; một c&ocirc;ng việc dễ d&agrave;ng khi phong c&aacute;ch, kiểu d&aacute;ng, m&agrave;u sắc, gi&aacute; cả v&agrave; chất lượng của&nbsp;Sofa rất phong ph&uacute; v&agrave; đa dạng.&nbsp;Chắc chắn sẽ c&oacute; rất nhiều băn khoăn, nhiều c&acirc;u hỏi được đặt ra như: t&igrave;m mua Sofa vải ở đ&acirc;u? Sofa vải thế n&agrave;o l&agrave; chất lượng tốt?&hellip;&nbsp;Hẳn kh&ocirc;ng &iacute;t&nbsp;kh&aacute;ch h&agrave;ng đang muốn t&igrave;m một địa chỉ đ&aacute;ng tin cậy để chọn cho m&igrave;nh một bộ Sofa ưng &yacute;. V&agrave; sau đ&acirc;y Nh&agrave; đẹp sẽ chia sẻ với c&aacute;c bạn một số kinh nghiệm khi bạn cần cho m&igrave;nh một bộ Sofa đ&uacute;ng như mong muốn.</em></p>

<p style="text-align:justify">D&ograve;ng sản phẩm Sofa bọc vải của Nội Thất Nh&agrave; Đẹp được đặt sản xuất theo y&ecirc;u cầu, ti&ecirc;u chuẩn ri&ecirc;ng của Nh&agrave; Đẹp, nhằm c&oacute; được những sản phẩm chất lượng cao, đ&aacute;p ứng được nhu cầu v&agrave; thị hiếu của kh&aacute;ch h&agrave;ng. Khi kh&aacute;ch h&agrave;ng đến với Nội thất Nh&agrave; Đẹp, kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n c&oacute; thể y&ecirc;n t&acirc;m để lựa chọn những bộ Sofa vải của Nh&agrave; Đẹp v&igrave; những l&yacute; do sau:</p>

<p style="text-align:justify">Khung của Sofa được l&agrave;m bằng gỗ thịt chắc chắn, tuổi của gỗ l&agrave; tr&ecirc;n 10 năm. Ho&agrave;n to&agrave;n kh&ocirc;ng sử dụng gỗ tạp, gỗ non như những sản phẩm gia c&ocirc;ng, h&agrave;ng chợ, h&agrave;ng sản xuất nhỏ lẻ đơn chiếc tại c&aacute;c c&ocirc;ng ty hoặc xưởng gỗ nhỏ.</p>

<p style="text-align:justify">Phần vải bọc Sofa được thiết kế để kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng th&aacute;o ra để giặt vệ sinh. Hiện nay tr&ecirc;n thị trường kh&ocirc;ng c&oacute; nhiều c&ocirc;ng ty l&agrave;m được theo y&ecirc;u cầu như vậy. Trong qu&aacute; tr&igrave;nh sử dụng, nếu kh&aacute;ch qu&aacute; bận rộn v&agrave; kh&ocirc;ng c&oacute; thời gian để vệ sinh bộ Sofa của m&igrave;nh, Qu&yacute; kh&aacute;ch ho&agrave;n to&agrave;n c&oacute; thể li&ecirc;n hệ với Nh&agrave; Đẹp để được hỗ trợ với mức ph&iacute; rất thấp.</p>

<p style="text-align:justify">Kiểu d&aacute;ng, m&agrave;u sắc của sản phẩm rất sắc n&eacute;t, nổi bật, đơn giản nhưng tinh tế. Ho&agrave;n to&agrave;n kh&aacute;c biệt với những mẫu Sofa sản xuất gia c&ocirc;ng, kiểu d&aacute;ng cục mịch, đơn giản đến mức th&ocirc; sơ.</p>

<p style="text-align:justify">Phần đệm ngồi v&agrave; tựa lưng được nghi&ecirc;n cứu v&agrave; thiết kế nhằm mang đến cảm gi&aacute;c thư th&aacute;i, dễ chịu cho người sử dụng. Cấu tạo ch&iacute;nh l&agrave; gồm c&oacute; l&ograve; xo (l&ograve; xo t&uacute;i hoặc l&ograve; xo ziz zắc), đai chun hoặc đai kim loại, 3-4 lớp đệm m&uacute;t, b&ocirc;ng hoặc l&ocirc;ng vũ. Sản phẩm c&oacute; độ &ecirc;m &aacute;i, dễ chịu khi sử dụng m&agrave; vẫn đảm bảo c&aacute;c t&iacute;nh năng đ&agrave;n hồi, gi&uacute;p&nbsp; giữ được phom d&aacute;ng của bộ Sofa trong thời gian d&agrave;i. Đối với c&aacute;c h&agrave;ng sản xuất gia c&ocirc;ng, thường sẽ sử dụng c&aacute;c vật liệu v&agrave; phụ kiện k&eacute;m chất lượng hoặc thậm ch&iacute; bớt x&eacute;n vật tư (l&ograve; xo, đai, đệm), dẫn đến sản phẩm nhanh xẹp l&uacute;n, xuống cấp. Ngo&agrave;i ra c&ograve;n một trường hợp kh&aacute;c l&agrave; c&aacute;c c&ocirc;ng ty, xưởng sản xuất nhỏ hay tư vấn cho kh&aacute;ch h&agrave;ng sử dụng đệm cứng để n&acirc;ng cao tuổi thọ của sản phẩm, thực tế đ&acirc;y l&agrave; tư vấn&nbsp;rất sai&nbsp;v&agrave; kh&ocirc;ng v&igrave; quyền lợi của kh&aacute;ch h&agrave;ng. Bởi v&igrave;, khi ngồi l&acirc;u tr&ecirc;n bộ Sofa cứng, kh&aacute;ch h&agrave;ng sẽ bị đau mỏi, như vậy ho&agrave;n to&agrave;n đi ngược với chức năng sử dụng của sofa. Lẽ ra, sau những ng&agrave;y l&agrave;m việc mệt mỏi, khi trở về nh&agrave; kh&aacute;ch h&agrave;ng sẽ được ho&agrave;n to&agrave;n thư gi&atilde;n, c&oacute; được một cảm gi&aacute;c thoải m&aacute;i khi ngồi l&ecirc;n bộ ghế Sofa nhưng với Sofa đệm cứng th&igrave; kh&aacute;ch h&agrave;ng lại c&agrave;ng th&ecirc;m mệt mỏi. Hơn nữa, đệm cứng thực chất rẻ hơn rất nhiều so với đệm m&uacute;t cao su.</p>

<p style="text-align:justify">Ngo&agrave;i yếu tố về chất lượng sản phẩm, Nh&agrave; Đẹp cũng mang đến cho kh&aacute;ch h&agrave;ng rất nhiều dịch vụ tiện &iacute;ch miễn ph&iacute; đi k&egrave;m như tư vấn thiết kế miễn ph&iacute;, giao h&agrave;ng v&agrave; lắp đặt miễn ph&iacute; tại nh&agrave; kh&aacute;ch. Thời gian bảo h&agrave;nh của sản phẩm d&agrave;i, khung Sofa bảo h&agrave;nh 10 năm v&agrave; 1 năm cho c&aacute;c phần c&ograve;n lại. Nh&agrave; Đẹp cũng bảo tr&igrave; trọn đời sản phẩm với mức ph&iacute; hỗ trợ kh&aacute;ch h&agrave;ng. Trong trường hợp kh&aacute;ch c&oacute; nhu cầu thay vỏ bọc Sofa, Nh&agrave; Đẹp cũng hỗ trợ bọc lại mới cho kh&aacute;ch.</p>

<p style="text-align:justify">Kh&ocirc;ng chỉ dừng lại ở chất lượng sản phẩm tốt, th&aacute;i độ phục vụ nhiệt t&igrave;nh, chu đ&aacute;o, Nh&agrave; Đẹp c&ograve;n lu&ocirc;n ch&uacute; &yacute; v&agrave; gia tăng c&aacute;c dịch vụ hậu m&atilde;i, c&aacute;c quyền lợi v&agrave; ưu đ&atilde;i d&agrave;nh ri&ecirc;ng cho c&aacute;c kh&aacute;ch h&agrave;ng quen, kh&aacute;ch h&agrave;ng th&acirc;n thiết. Hơn thế nữa, Nh&agrave; Đẹp c&ograve;n thường xuy&ecirc;n thực hiện c&aacute;c chương tr&igrave;nh ưu đ&atilde;i theo tuần, theo th&aacute;ng để kh&aacute;ch h&agrave;ng may mắn c&oacute; cơ hội sở hữu những sản phẩm cao cấp với gi&aacute; phải chăng.</p>

<p>&nbsp;</p>
', N'
	<li>K&iacute;ch thước(cm) 221x91x86</li>
	<li>Chất liệu Khung gỗ, nhồi đệm kết hợp l&ograve; xo, bọc vải, ch&acirc;n kim loại</li>
	<li>Bảo h&agrave;nh Bảo h&agrave;nh 10 năm cho khung, 1 năm cho c&aacute;c phần c&ograve;n lại</li>
	<li>Th&aacute;o vỏ Kh&ocirc;ng</li>

')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProjectCategories] ON 

INSERT [dbo].[ProjectCategories] ([ID], [Title], [MetaTitle], [Status]) VALUES (1, N'Chung cư', N'chung-cu', 1)
INSERT [dbo].[ProjectCategories] ([ID], [Title], [MetaTitle], [Status]) VALUES (2, N'Biệt thự', N'biet-thu', 1)
INSERT [dbo].[ProjectCategories] ([ID], [Title], [MetaTitle], [Status]) VALUES (3, N'Nhà phố', N'nha-pho', 1)
SET IDENTITY_INSERT [dbo].[ProjectCategories] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ID], [Title], [MetaTitle], [ShortDesc], [Image], [Content], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [CategoryID]) VALUES (1, N'Thiết kế căn hộ 186m2 chung cư The Legend', N'thiet-ke-can-ho-186m2-chung-cu-the-legend', N'Căn hộ theo phong cách không thống nhất và các mảng tường, mảng gỗ, đá với thiết kế khá lỗi lời đã được KTS Nội Thất Nhà Đẹp biến hóa để trở thành [...]', N'/Data/images/Project/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(1).jpg', N'<p style="margin:0in 0in 10pt">&nbsp;</p>

<p style="margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">&ldquo;</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝑫𝒂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̀</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒏𝒉</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒕𝒓𝒐</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̣</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒏</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒕𝒂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̂</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒎</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒉𝒖𝒚𝒆</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">́</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒕</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒄𝒉𝒐</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒕𝒐</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̉ </span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">́</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒎</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒄𝒖</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̉</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒂</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒌𝒉𝒂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">́</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒄𝒉</span> <span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒉𝒂</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">̀</span><span style="font-family:&quot;Cambria Math&quot;,&quot;serif&quot;">𝒏𝒈</span><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">&rdquo;</span></span></span></span></p>

<p style="margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Dự án: Chung cư The Legend &ndash;&nbsp; 4 phòng ngủ </span></span></span></span></p>

<p style="margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Phong cách: Hiện đại</span></span></span></span></p>

<p style="margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Diện tích: 186m2</span></span></span></span></p>

<p style="margin:0in 0in 10pt">&nbsp;</p>

<p style="margin:0in 0in 10pt"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Yêu cầu của khách hàng sở hữu căn hộ chung cư The Legend có thể coi là một bài toán khó. </span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Gia chủ mong muốn tổ ấm của mình mang thiết kế hiện đại. Tuy nhiên trước khi cải tạo, căn hộ còn khá nhiều mảng màu lộn xộn, đặc biệt là các tone màu gỗ đang được sử dụng đều không thống nhất, có phong cách cũ và lỗi thời.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Gia đình có 2 bé nhỏ tuổi nên yêu cầu có những khoảng không gian thoáng đãng để các bé thỏa sức vui chơi tuy nhiên căn hộ vẫn phải đảm bảo đầy đủ tiện nghi và nhiều góc đặt đồ trang trí. </span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: justify;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Gia chủ còn đặc biệt thích ánh nắng tự nhiên ngập tràn căn hộ. Ngoài ra một số góc sinh hoạt không được dịch chuyển, phải đặt đúng hướng như gia chủ yêu cầu.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(1).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(8).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(15).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(13).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(14).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(9).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><font face="Cambria, serif"><span style="font-size: 14.6667px;">Theo yêu cầu của gia chủ, vị trí đặt bàn thờ không được thay đổi để đảm bảo tài lộc và thịnh vượng cho gia đình.</span></font></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(4).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Khoảng không gian sau sofa được chọn là nơi dành cho các bé thỏa sức vui chơi</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(5).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Bàn ăn được tách biệt hẳn với phòng khách để dành không gian cho các bé vui chơi.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(11).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(10).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Phòng ngủ Master với tông màu sáng và hiện đại của gỗ sồi, vân gỗ kết hợp hài hòa với màu sàn cũ của căn hộ mà không gây cảm giác mâu thuẫn.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(12).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Phòng ngủ được thiết kế khá đơn giản theo yêu cầu của chủ nhà, để dành nhiều không gian cho bé 1 tuổi của gia đình.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(2).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Vì bé 1 tuổi sẽ ở cùng bố mẹ nên kích thước giường của phòng ngủ Master cũng được cẩn thận thiết kế rộng rãi để đảm bảo cảm giác thoải mái trong giấc ngủ cho cả gia đình.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(3).jpg" style="width: 750px; height: 563px;" /></span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Vì gia chủ đặc biệt thích ánh sáng tự nhiên nên KTS đã khéo léo đặt một chiếc sofa giường bên cửa sổ, vừa khiến gia đình tận hưởng cảm giác thư giãn với ánh nắng, vừa đem lại cho căn phòng sự hiện đại và tăng tính thẩm mỹ.</span></span></span></span></p>

<p style="margin: 0in 0in 10pt; text-align: center;"><span style="font-size:11pt"><span style="line-height:115%"><span style="font-family:Calibri,sans-serif"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/The%20Legend/Thi%E1%BA%BFt%20k%E1%BA%BF%20n%E1%BB%99i%20th%E1%BA%A5t%20chung%20c%C6%B0%20The%20Legend%20(7).jpg" style="width: 750px; height: 469px;" /></span></span></span></span></p>

<p style="margin:0in 0in 10pt">&nbsp;</p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">Liên hệ tư vấn thiết kế nội thất: 093 636 2998<br />
Showroom Nội Thất Nhà Đẹp<br />
Showroom 1: Tầng 1, Thiên Sơn Plaza, 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội<br />
Showroom 2: Tầng 1, Thiên Sơn Plaza, 89 Lê Đức Thọ, Mỹ Đình, Từ Liêm, Hà Nội<br />
Hotline: 0906 264 268 | Website: www.nhadep.com.vn</div>

<p style="margin:0in 0in 10pt">&nbsp;</p>

                    <hr/>', CAST(N'2020-12-20 17:05:23.500' AS DateTime), N'ngocadmin', NULL, NULL, 1, 1)
INSERT [dbo].[Projects] ([ID], [Title], [MetaTitle], [ShortDesc], [Image], [Content], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [CategoryID]) VALUES (2, N'Thiết kế nội thất căn hộ 124.6m2 chung cư Premier Berriver Long Biên', N'thiet-ke-noi-that-can-ho-124-6m2-chung-cu-premier-berriver-long-bien', N'Căn hộ chung cư Premier Berriver Long Biên được thiết kế theo yêu cầu của khách hàng với phong cách hiện đại, đơn giản nhưng vẫn đem lại sự thoải [...]', N'/Data/images/Project/bp3.jpg', N'                    <p>&nbsp;</p>

<p>𝑴𝒂̃𝒏 𝒏𝒉𝒂̃𝒏 𝒗𝒐̛́𝒊 𝒄𝒂̆𝒏 𝒉𝒐̣̂ 𝒕𝒊𝒏𝒉 𝒕𝒆̂́ 𝒗𝒂̀ 𝒉𝒊𝒆̣̂𝒏 đ𝒂̣𝒊 𝒕𝒂̣𝒊 𝑷𝒓𝒆𝒎𝒊𝒆𝒓 𝑩𝒆𝒓𝒓𝒊𝒗𝒆𝒓 𝑳𝒐𝒏𝒈 𝑩𝒊𝒆̂𝒏</p>

<p>Căn hộ: Chung cư Premier Berriver Long Biên &ndash; 3 phòng ngủ</p>

<p>Phong cách: Hiện đại</p>

<p>Diện tích: 124.6m2</p>

<p>&nbsp;</p>

<p><img alt="🔸" height="16" src="https://www.facebook.com/images/emoji.php/v9/t72/1/16/1f538.png" width="16" /> Căn hộ chung cư Premier Berriver Long Biên được thiết kế theo yêu cầu của khách hàng với phong cách hiện đại, đơn giản nhưng vẫn đem lại sự thoải mái cho gia đình.</p>

<p><img alt="🔸" height="16" src="https://www.facebook.com/images/emoji.php/v9/t72/1/16/1f538.png" width="16" /> Căn hộ nổi bật với nét tinh tế được thể hiện qua cách sử dụng tone màu trung tính như xám hay nâu, sự kết hợp màu sắc này tuy đơn giản nhưng không bao giờ lỗi thời và gây cảm giác đơn điệu.</p>

<p><img alt="🔸" height="16" src="https://www.facebook.com/images/emoji.php/v9/t72/1/16/1f538.png" width="16" /> Bàn làm việc được đưa ra phòng khách, tạo thành điểm nhấn cho một không gian mở hết sức phóng khoáng.</p>

<p><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp3.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp4.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp7.JPG" style="width: 750px; height: 516px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp8.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp9.JPG" style="width: 750px; height: 833px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp10.JPG" style="width: 750px; height: 833px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bp11.JPG" style="width: 750px; height: 833px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn1.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn2.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn3.JPG" style="width: 750px; height: 833px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn4.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn1.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn7.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn9.JPG" style="width: 750px; height: 563px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Chung-cu/Thiet-ke-noi-that-chung-cu/Berriver%20Long%20Bi%C3%AAn/bpn5.JPG" style="width: 750px; height: 563px;" /></p>

<div style="background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;">Liên hệ tư vấn thiết kế nội thất: 093 636 2998<br />
Showroom Nội Thất Nhà Đẹp<br />
Showroom 1: Tầng 1, Thiên Sơn Plaza, 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội<br />
Showroom 2: Tầng 1, Thiên Sơn Plaza, 89 Lê Đức Thọ, Mỹ Đình, Từ Liêm, Hà Nội<br />
Hotline: 0906 264 268 | Website: www.nhadep.com.vn</div>

<p>&nbsp;</p>

                    <hr/>', CAST(N'2020-12-20 17:09:49.207' AS DateTime), N'ngocadmin', NULL, NULL, 1, 1)
INSERT [dbo].[Projects] ([ID], [Title], [MetaTitle], [ShortDesc], [Image], [Content], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [CategoryID]) VALUES (3, N'Ảnh thực tế thi công nội thất nhà chị Chi - Vinhomes Riverside', N'anh-thuc-te-thi-cong-noi-that-nha-chi-chi-vinhomes-riverside', N'Chị Chi đã tin tưởng lựa chọn Nội thất Nhà Đẹp là đơn vị thi công nội thất cho căn biệt thự của mình tại Vinhomes Riverside.', N'/Data/images/Project/tien-do-thi-cong-nha-cchi(22).jpg', N'<p>Chị Chi đã tin tưởng lựa chọn Nội thất Nhà Đẹp là đơn vị thi công cho căn biệt thự của mình tại Vinhomes Riverside.</p>

<p>Hãy cùng xem tiến độ thi công công trình nhé!</p>

<p>&nbsp;</p>

<p>Phong cách: Tân Cổ Điển</p>

<p>Mặt bằng sử dụng: 106m2</p>

<p>Hạng mục thi công: Nội thất phòng khách, phòng ngủ, bếp</p>

<p>&nbsp;</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(22).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi.jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(1).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(2).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(3).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(4).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(5).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(6).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(7).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(8).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(9).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(10).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(11).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(12).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(13).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(14).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(15).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(16).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(17).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(19).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(20).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(21).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(18).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(24).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(25).jpg" style="width: 80%;" /></p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-thiet-ke-thi-cong-Gallery/thi-cong-nha-chi-chi-vinhome-riverside/tien-do-thi-cong-nha-cchi(26).jpg" style="width: 80%;" /></p>

                    <hr/>', CAST(N'2020-12-20 17:13:42.147' AS DateTime), N'ngocadmin', NULL, NULL, 1, 2)
INSERT [dbo].[Projects] ([ID], [Title], [MetaTitle], [ShortDesc], [Image], [Content], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [Status], [CategoryID]) VALUES (4, N'Thiết kế nội thất nhà liền kề Vinhomes Riverside - The Harmony, tiểu khu Phong Lan', N'thiet-ke-noi-that-nha-lien-ke-vinhomes-riverside-the-harmony-tieu-khu-phong-lan', N'Phong cách tân cổ điển bắt nguồn từ thế kỷ 18, lấy cảm hứng nghệ thuật cổ điển kết hợp cùng nét phóng khoáng trong phong cách hiện đại', N'/Data/images/Project/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-khach-1.jpg', N'<p>&nbsp;</p>

<p>&nbsp;</p>

<p>Nhà liền kề&nbsp;Vinhomes Riverside - The Harmony, tiểu khu Phong Lan của gia đình nhà chị Nguyệt được thiết kế theo phong cách tân cổ điển bắt nguồn từ thế kỷ 18, lấy cảm hứng nghệ thuật cổ điển kết hợp cùng nét phóng khoáng trong phong cách hiện đại.</p>

<p>&nbsp;</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-khach-1.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Điểm nhấn của căn phòng là bộ sofa xanh được kết hợp khéo léo với các món đồ nội thất màu trung tính, điểm thêm những chi tiết trang trí vàng ánh kim xa hoa, mang tới một tổng thể hài hòa và không kém phần đẳng cấp.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-khach-2.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Phòng khách mang phong cách tân cổ điển, thể hiện vẻ đẹp sang trọng, thanh lịch.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-khach-3.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Các chi tiết trang trí không quá rườm rà mà rất tinh tế. Những mảng tường ốp đá, kệ tủ gỗ nâu trầm chạm khắc hoa văn làm tăng tính thẩm mỹ, xóa bỏ cảm giác đơn điệu thường thấy.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-bep.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-an-1.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-an-2.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Gian bếp chữ I sử dụng tông nâu chủ đạo có chút hoài cổ, đồng thời cũng thể hiện sự sang trọng và đầy đủ tiện nghi. Bàn ăn mặt đá hòa hợp với phong cách chung của căn phòng.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-an-3.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-hanh-lang-1.jpg" style="width: 800px; height: 445px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-hanh-lang-2.jpg" style="width: 800px; height: 445px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-mat-tien.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-1.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Phòng ngủ master lột tả những gì chắt lọc nhất của phong cách tân cổ điển. Thiết kế đầu giường đối xứng tạo sự cân bằng.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-2.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-3.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Thiết kế tủ kệ thông minh và đa chức năng, vừa là kệ trang trí, kệ tivi, tủ để đồ, vừa kết hợp bàn làm việc.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-4.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Không gian thoáng đãng, gọn gàng nhưng không đơn điệu. Sàn gỗ được biến tấu với họa tiết ziczac, tạo nên sự khác biệt cho chốn nghỉ ngơi riêng tư.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-5.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-6.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-ngu-master-8.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-tam-1.jpg" style="width: 800px; height: 889px;" /></p>

<p style="text-align: center;">Phòng tắm ốp đá sang trọng, nhã nhặn, được nhấn nhá bằng những mảng tường phối họa tiết pixel lạ mắt.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-tam-2.jpg" style="width: 800px; height: 889px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-tam-tang-3-1.jpg" style="width: 800px; height: 889px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-tam-tang-3-2.jpg" style="width: 800px; height: 889px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-gai-1.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-gai-2.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Phòng ngủ con gái gây ấn tượng với tông màu xanh bạc hà thanh mát, vừa tao nhã vừa dịu dàng. Mảng tường đầu giường được trang trí với họa tiết thiên nhiên khoáng đạt nhưng không làm mất đi vẻ nữ tính.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-gai-3.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-gai-5.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Đáp ứng nhu cầu của chủ nhân căn phòng, tủ áo được thay thế bằng một phòng thay đồ hiện đại, đầy đủ ngăn kệ với chức năng riêng biệt.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-gai-7.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-gai-8.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-trai-1.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">Lấy cảm hứng từ những bộ đồ thủy thủ, phòng ngủ con trai có tông xanh trắng tươi mát, mang lại cảm giác thoải mái, dễ chịu cho người nhìn.</p>

<p style="text-align: center;"><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-trai-2.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-trai-3.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-trai-4.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-phong-con-trai-5.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-tang-4-1.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-tang-4-2.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-tang-4-4.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-tang-4-3.jpg" style="width: 800px; height: 470px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-tang-4-5.jpg" style="width: 800px; height: 286px;" /><img alt="" src="https://nhadep.com.vn/Uploads/images/Anh-du-an/Biet-thu/Li%E1%BB%81n%20k%E1%BB%81%20Riverside/thiet-ke-noi-that-nha-lien-ke-vinhomes-the-harmony-tieu-canh-2.jpg" style="width: 800px; height: 470px;" /></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><strong>NỘI THẤT NHÀ ĐẸP - THƯƠNG HIỆU UY TÍN TỪ NĂM 1999</strong></p>

<p style="text-align: center;">Showroom Hoàn Kiếm: 02 Chương Dương Độ, Hoàn Kiếm, Hà Nội</p>

<p style="text-align: center;">Tel: 024 3932 3366 - 024 3932 9255</p>

<p style="text-align: center;">Showroom Mỹ Đình: 89 Lê Đức Thọ, Mỹ Đình, Hà Nội</p>

<p style="text-align: center;">Tel: 024 3795 1757 - 024 3795 1758</p>

                    <hr/>', CAST(N'2020-12-20 17:16:43.880' AS DateTime), N'ngocadmin', NULL, NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Email], [Mobile], [Name], [Address], [Sex]) VALUES (2, N'ngocadmin', N'202cb962ac59075b964b07152d234b70', N'ngoc123@gmail.com', N'0961234567', N'Ngọc', N'Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD  CONSTRAINT [FK_Banner_BannerGroups] FOREIGN KEY([Type])
REFERENCES [dbo].[BannerGroups] ([ID])
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK_Banner_BannerGroups]
GO
ALTER TABLE [dbo].[Newses]  WITH CHECK ADD  CONSTRAINT [FK_Newses_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Newses] CHECK CONSTRAINT [FK_Newses_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_ProjectCategories1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProjectCategories] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_ProjectCategories1]
GO
USE [master]
GO
ALTER DATABASE [ShopNoiThat] SET  READ_WRITE 
GO
