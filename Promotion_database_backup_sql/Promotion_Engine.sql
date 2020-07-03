USE [PromotionEngine]
GO
ALTER TABLE [dbo].[PromotionFormula] DROP CONSTRAINT [FK__Promotion__Promo__3B75D760]
GO
/****** Object:  Table [dbo].[PromotionFormula]    Script Date: 03-07-2020 09:52:19 PM ******/
DROP TABLE [dbo].[PromotionFormula]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 03-07-2020 09:52:19 PM ******/
DROP TABLE [dbo].[Promotion]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 03-07-2020 09:52:19 PM ******/
DROP TABLE [dbo].[Item]
GO
USE [master]
GO
/****** Object:  Database [PromotionEngine]    Script Date: 03-07-2020 09:52:19 PM ******/
DROP DATABASE [PromotionEngine]
GO
