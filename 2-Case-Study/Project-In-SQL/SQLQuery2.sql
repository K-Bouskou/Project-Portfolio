-- Data Definition Language (DDL)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Real_Time_Traffic_Incident_Reports](
	[Traffic_Report_ID] [nvarchar](max) NULL,
	[Published_Date] [datetime2](7) NULL,
	[Issue_Reported] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Status_Date] [nvarchar](max) NULL,
	[Day_Of_Week] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


-- Drop all null value from table 
DELETE FROM Real_Time_Traffic_Incident_Reports
WHERE Issue_Reported IS NULL


-- Add Day_Of_Week column 
ALTER TABLE Real_Time_Traffic_Incident_Reports
ADD Day_Of_Week DATE


-- Copy data from Published_Date to Day_Of _Week 
UPDATE Real_Time_Traffic_Incident_Reports
SET Day_Of_Week = Published_Date


-- This Query for count number of accident by type in descending order .
SELECT Issue_Reported,
            COUNT(Issue_Reported) AS Number_Of_Accident
FROM Real_Time_Traffic_Incident_Reports
GROUP BY Issue_Reported
ORDER BY Number_Of_Accident DESC


-- This query to get to number of accident by day
SELECT Issue_Reported,
       COUNT(Issue_Reported) AS Number_of_accident,
      DATENAME(DW, Day_Of_Week) AS Day_of_Accident
FROM Real_Time_Traffic_Incident_Reports
GROUP BY Issue_Reported, DATENAME(DW, Day_Of_Week)
ORDER BY Issue_Reported
