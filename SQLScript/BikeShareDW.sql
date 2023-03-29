USE [BikeShareOLAP]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[Time_id] [bigint] NOT NULL PRIMARY KEY,
	[d_date] [timestamp] NULL,
	[year] [int] NULL,
	[quarter] [int] NULL,
	[month] [int] NULL,
	[day_of_week] [varchar](25) NULL,
	[day_of_month] [int] NULL,
	[week_of_year] [int] NULL 
) 
GO
/****** Object:  Table [dbo].[DimRider]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRider](
	[rider_id] [int] NOT NULL PRIMARY KEY,
	[first] [varchar](50) NULL,
	[last] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[birthday] [date] NULL,
	[account_start_date] [date] NULL,
	[account_end_date] [date] NULL,
	[is_member] [bit] NULL,
	[rider_age_at_acc_start] [int] NULL
 
) 
GO
/****** Object:  Table [dbo].[DimStation]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStation](
	[station_id] [varchar](50) NOT NULL PRIMARY KEY,
	[name] [varchar](75) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL
 
) 
GO
/****** Object:  Table [dbo].[FactPayment]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPayment](
	[payment_id] [bigint] NOT NULL PRIMARY KEY,
	[rider_id] [int] NULL,
	[date_id] [bigint] NULL,
	[amount] [float] NULL
 
) 
GO
/****** Object:  Table [dbo].[FactTrips]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTrips](
	[trip_id] [varchar](50) NOT NULL PRIMARY KEY,
	[rideable_type] [varchar](75) NULL,
	[start_at_id] [bigint] NULL,
	[ended_at_id] [bigint] NULL,
	[start_station_id] [varchar](50) NULL,
	[end_station_id] [varchar](50) NULL,
	[rider_id] [int] NULL,
	[rider_age] [int] NULL,
	[duration] [float] NULL
 
) 
GO
ALTER TABLE [dbo].[FactPayment]  WITH CHECK ADD  CONSTRAINT [FK_FactPayment_DimDate] FOREIGN KEY([date_id])
REFERENCES [dbo].[DimDate] ([Time_id])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimDate]
GO
ALTER TABLE [dbo].[FactPayment]  WITH CHECK ADD  CONSTRAINT [FK_FactPayment_DimRider] FOREIGN KEY([rider_id])
REFERENCES [dbo].[DimRider] ([rider_id])
GO
ALTER TABLE [dbo].[FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimRider]
GO
ALTER TABLE [dbo].[FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimDate] FOREIGN KEY([start_at_id])
REFERENCES [dbo].[DimDate] ([Time_id])
GO
ALTER TABLE [dbo].[FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimDate]
GO
ALTER TABLE [dbo].[FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimDate1] FOREIGN KEY([ended_at_id])
REFERENCES [dbo].[DimDate] ([Time_id])
GO
ALTER TABLE [dbo].[FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimDate1]
GO
ALTER TABLE [dbo].[FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimStation] FOREIGN KEY([start_station_id])
REFERENCES [dbo].[DimStation] ([station_id])
GO
ALTER TABLE [dbo].[FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimStation]
GO
ALTER TABLE [dbo].[FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimStation1] FOREIGN KEY([end_station_id])
REFERENCES [dbo].[DimStation] ([station_id])
GO
ALTER TABLE [dbo].[FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimStation1]
GO
