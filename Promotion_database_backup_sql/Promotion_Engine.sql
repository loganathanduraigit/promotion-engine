USE [master]
GO
/****** Object:  Database [PromotionEngine]    Script Date: 03-07-2020 09:57:36 PM ******/
CREATE DATABASE [PromotionEngine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PromotionEngine', FILENAME = N'C:\promotion-engine\promotion-engine\PromotionEngine\App_Data\PromotionEngine.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PromotionEngine_log', FILENAME = N'C:\promotion-engine\promotion-engine\PromotionEngine\App_Data\PromotionEngine_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PromotionEngine] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PromotionEngine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PromotionEngine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PromotionEngine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PromotionEngine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PromotionEngine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PromotionEngine] SET ARITHABORT OFF 
GO
ALTER DATABASE [PromotionEngine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PromotionEngine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PromotionEngine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PromotionEngine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PromotionEngine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PromotionEngine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PromotionEngine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PromotionEngine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PromotionEngine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PromotionEngine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PromotionEngine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PromotionEngine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PromotionEngine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PromotionEngine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PromotionEngine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PromotionEngine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PromotionEngine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PromotionEngine] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PromotionEngine] SET  MULTI_USER 
GO
ALTER DATABASE [PromotionEngine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PromotionEngine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PromotionEngine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PromotionEngine] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PromotionEngine] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PromotionEngine] SET QUERY_STORE = OFF
GO
USE [PromotionEngine]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 03-07-2020 09:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemName] [char](1) NOT NULL,
	[ItemPrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 03-07-2020 09:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[PromotionName] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionFormula]    Script Date: 03-07-2020 09:57:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionFormula](
	[PromotionFormulaId] [int] IDENTITY(1,1) NOT NULL,
	[PromotionId] [int] NOT NULL,
	[ItemQty] [int] NOT NULL,
	[ItemNames] [varchar](250) NOT NULL,
	[PromotionValue] [int] NOT NULL,
	[FormulaDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionFormulaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Item] ([ItemName], [ItemPrice]) VALUES (N'A', 50)
INSERT [dbo].[Item] ([ItemName], [ItemPrice]) VALUES (N'B', 30)
INSERT [dbo].[Item] ([ItemName], [ItemPrice]) VALUES (N'C', 20)
INSERT [dbo].[Item] ([ItemName], [ItemPrice]) VALUES (N'D', 15)
SET IDENTITY_INSERT [dbo].[Promotion] ON 

INSERT [dbo].[Promotion] ([PromotionId], [PromotionName]) VALUES (1, N'Promotion 1')
INSERT [dbo].[Promotion] ([PromotionId], [PromotionName]) VALUES (4, N'Promotion 2')
INSERT [dbo].[Promotion] ([PromotionId], [PromotionName]) VALUES (5, N'Promotion 3')
INSERT [dbo].[Promotion] ([PromotionId], [PromotionName]) VALUES (6, N'Promotion 1')
SET IDENTITY_INSERT [dbo].[Promotion] OFF
SET IDENTITY_INSERT [dbo].[PromotionFormula] ON 

INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1, 1, 3, N'A', 130, N'3 of A''s for 130')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (2, 1, 2, N'B', 45, N'2 of B''s for 45')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (3, 1, 1, N'C&D', 30, N'C & D for 30')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1008, 4, 1, N'A&B', 30, N'A & B for 30')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1009, 4, 2, N'C', 45, N'2 of B''s for 45')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1010, 4, 3, N'D', 50, N'3 of C''s for 50')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1011, 5, 1, N'A&B&C', 30, N'A & B & C for 30')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1012, 5, 2, N'D', 11, N'2 of D''s for 10')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1013, 6, 3, N'A', 130, N'3 of A''s for 130')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1014, 6, 2, N'B', 45, N'2 of B''s for 45')
INSERT [dbo].[PromotionFormula] ([PromotionFormulaId], [PromotionId], [ItemQty], [ItemNames], [PromotionValue], [FormulaDescription]) VALUES (1015, 6, 1, N'C&D', 30, N'C & D for 30')
SET IDENTITY_INSERT [dbo].[PromotionFormula] OFF
ALTER TABLE [dbo].[PromotionFormula]  WITH CHECK ADD FOREIGN KEY([PromotionId])
REFERENCES [dbo].[Promotion] ([PromotionId])
GO
USE [master]
GO
ALTER DATABASE [PromotionEngine] SET  READ_WRITE 
GO
