
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DimDate](
	[Time_id] [bigint] IDENTITY(1,1) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
	[d_date] [DATETIME2] NULL,
	[day_of_month] [int] NULL,
	[day_of_week] [varchar](25) NULL,
	[month] [int] NULL,
	[month_name] [varchar](25) NULL,
	[year] [int] NULL,
	[quarter] [int] NULL,
	[week_of_year] [int] NULL 
) 
GO
/****** Object:  Table [DimRider]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DimRider](
	[rider_id] [int]  PRIMARY KEY NONCLUSTERED NOT ENFORCED,
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
/****** Object:  Table [DimStation]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DimStation](
	[station_id] [varchar](50) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
	[name] [varchar](75) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL
 
) 
GO
/****** Object:  Table [FactPayment]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FactPayment](
	[payment_id] [bigint]  PRIMARY KEY NONCLUSTERED NOT ENFORCED,
	[rider_id] [int] NULL,
	[date_id] [bigint] NULL,
	[amount] [float] NULL
 
) 
GO
/****** Object:  Table [FactTrips]    Script Date: 3/27/2023 11:55:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FactTrips](
	[trip_id] [varchar](50)  PRIMARY KEY NONCLUSTERED NOT ENFORCED,
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
ALTER TABLE [FactPayment]  WITH CHECK ADD  CONSTRAINT [FK_FactPayment_DimDate] FOREIGN KEY([date_id])
REFERENCES [DimDate] ([Time_id])
GO
ALTER TABLE [FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimDate]
GO
ALTER TABLE [FactPayment]  WITH CHECK ADD  CONSTRAINT [FK_FactPayment_DimRider] FOREIGN KEY([rider_id])
REFERENCES [DimRider] ([rider_id])
GO
ALTER TABLE [FactPayment] CHECK CONSTRAINT [FK_FactPayment_DimRider]
GO
ALTER TABLE [FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimDate] FOREIGN KEY([start_at_id])
REFERENCES [DimDate] ([Time_id])
GO
ALTER TABLE [FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimDate]
GO
ALTER TABLE [FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimDate1] FOREIGN KEY([ended_at_id])
REFERENCES [DimDate] ([Time_id])
GO
ALTER TABLE [FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimDate1]
GO
ALTER TABLE [FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimStation] FOREIGN KEY([start_station_id])
REFERENCES [DimStation] ([station_id])
GO
ALTER TABLE [FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimStation]
GO
ALTER TABLE [FactTrips]  WITH CHECK ADD  CONSTRAINT [FK_FactTrips_DimStation1] FOREIGN KEY([end_station_id])
REFERENCES [DimStation] ([station_id])
GO
ALTER TABLE [FactTrips] CHECK CONSTRAINT [FK_FactTrips_DimStation1]
GO
