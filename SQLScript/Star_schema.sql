
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
