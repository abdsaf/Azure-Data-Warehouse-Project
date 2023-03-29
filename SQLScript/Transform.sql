insert into dbo.dimRider
SELECT  
	[rider_id]
	,[first]
	,[last]
	,[address]
	,[birthday]
	,[account_start_date]
	,[account_end_date]
	,[is_member]
	,DATEDIFF(year,[birthday],[account_start_date]) as age
FROM 
	[dbo].[rider]


insert into dbo.DimStation
SELECT  
	[station_id]
	,[name]
	,[latitude]
	,[longitude]
FROM 
	[dbo].[station]


with table1 as 
(	select distinct   [start_at]  FROM [dbo].[trip] 
	union 
	select distinct  [ended_at]  FROM [dbo].[trip] 
	union 
	select distinct [date] from [dbo].[payment] 
)

insert into dbo.DimDate
select  
        t.start_at,
        DATEPART(DAY,t.start_at),
        DATENAME(WEEKDAY,t.start_at),
        DATEPART(MONTH,t.start_at),
        DATENAME(MONTH,t.start_at),
        DATEPART(year,t.start_at),
        DATEPART(Quarter,t.start_at) ,
        DATEPART(WEEK,t.start_at)
from 
	table1 t

insert into dbo.[FactPayment]
SELECT 
	[payment_id]
	,t2.time_id
	,[amount]
	,[rider_id]
FROM 
	[dbo].[payment] t1
 	join dbo.[DimDate] t2 
	on  CONVERT(DATETIME2,t1.[date])=t2.d_date

insert into [dbo].[FactTrips]
SELECT 
	[trip_id]
	,[rideable_type]
	,t2.[time_id]
	,t3.[time_id]
	,[start_station_id]
	,[end_station_id]
	,t4.rider_id
	,DATEDIFF(YEAR,t4.[birthday],t3.d_date)
	,DATEDIFF(MINUTE,t2.d_date,t3.d_date)
 FROM 
	[dbo].[trip] t1
  	join dbo.[DimDate] t2 on  CONVERT(DATETIME2,t1.[start_at])=t2.d_date
  	join dbo.[DimDate] t3 on  CONVERT(DATETIME2,t1.[ended_at])=t3.d_date
  	join dbo.[DimRider] t4 on t4.rider_id=t1.[rider_id]  
    
    
    