SELECT 
	t2.year
	,t2.quarter 
	,t2.month
	,sum([amount]) as TotalAmount
FROM 
	[dbo].[FactPayment] t1
 	join [dbo].[DimDate] t2 on t1.date_id=t2.time_id
group by 
	t2.year,t2.quarter ,t2.month
order by 
	1,2,3
