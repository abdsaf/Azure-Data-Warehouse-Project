IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'bikesharefs_bikesharelakeg2_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [bikesharefs_bikesharelakeg2_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://bikesharefs@bikesharelakeg2.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.payment (
	[payment_id] bigint,
	[date] varchar(50),
	[amount] float,
	[rider_id] bigint
	)
	WITH (
	LOCATION = 'publicpayment.txt',
	DATA_SOURCE = [bikesharefs_bikesharelakeg2_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.payment
GO