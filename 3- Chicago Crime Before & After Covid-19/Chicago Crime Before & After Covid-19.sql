-- Select Everyhting in The Data Table to Explore it .

SELECT TOP 100
    *
FROM [Data]

--------------------------------------------------------------------------------

-- Check for Nulls Value in Data .

SELECT *
FROM [Data]
WHERE location_description IS NULL

-- Drop Null Value From location_description Column .
DELETE FROM [Data]
WHERE location_description IS NULL

--------------------------------------------------------------------------------


-- Check For Duplicates in case_number Column . 
-- Note: According To MetaData There Should Be No Duplicates .

SELECT case_number, COUNT(*) AS 'Number Of Duplicates'
FROM [Data]
GROUP BY case_number
HAVING COUNT(*) >1
ORDER BY [Number Of Duplicates] DESC

-- Drop Duplicates in case_number Column .

WITH
    drop_duplicates
    AS
    (
        SELECT case_number, ROW_NUMBER() OVER( PARTITION BY case_number ORDER BY case_number) row_num
        FROM [Data]
    )
DELETE FROM drop_duplicates
WHERE row_num > 1;

--------------------------------------------------------------------------------

-- Rename arrest & domestic Column Value into Yes & No Instead Of True & False .
UPDATE [Data]
    SET arrest = CASE WHEN arrest = 'false' THEN 'No'
                                WHEN arrest = 'true' THEN 'Yes' END

UPDATE [Data]                              
    SET domestic = CASE WHEN domestic = 'false' THEN 'No'
                                    WHEN domestic = 'true' THEN 'Yes' END

--------------------------------------------------------------------------------

-- Split Date Into Time, Days, Months and Years . 

-- 
ALTER TABLE Data 
ADD [Date] DATETIME
-- Extract Date from date column in varchar.
UPDATE Data
SET [Date] = SUBSTRING(old_date, 1, 16)

-- Create Day Column and Extract Day from Date Column .
ALTER TABLE [Data]
    ADD [Day] AS DATENAME(DAY, [date])


-- Create Time Column and Extract Time from Date Column .
ALTER TABLE [Data]
    ADD [Time] AS  CAST([date] AS TIME(2))


-- Create Month Column and Extract Month from Date Column .
ALTER TABLE [Data]
    ADD [Month] AS DATENAME(MONTH, [date])


-- Create Year Column and Extract Year from Date Column .
ALTER TABLE [Data]
    ADD [Year] AS DATENAME(YEAR, [date])

--------------------------------------------------------------------------------

-- Compare Number Of Accident Before & After Pandemic Then Calculate The Percentage Difference .
WITH Before_Pandemic AS
(
        SELECT COUNT(case_number) AS [Before Pandemic]
FROM [Data]
WHERE [date] BETWEEN '2018-01-24' AND '2020-01-25'
    )
, 
    After_Pandemic AS
(
        SELECT COUNT(case_number) AS [After Pandemic]
FROM [Data]
WHERE [date] BETWEEN '2020-01-24' AND '2022-01-25'
    )

SELECT * , CONCAT(([After Pandemic] - [Before Pandemic])*100 / [Before Pandemic], '%') AS 'PercentDiff'
FROM Before_Pandemic, After_Pandemic

--------------------------------------------------------------------------------

-- Compare Number Of Accident By Year .
WITH [2018_Year] AS (
        SELECT COUNT(case_number) AS '# Accident In 2018-2019 '
        FROM [Data]
        WHERE [date] BETWEEN '2018-01-24' AND '2019-01-25'
    ),
    [2019_Year] AS (
        SELECT COUNT(case_number) AS '# Accident In 2019-2020 '
        FROM [Data]
        WHERE [date] BETWEEN '2019-01-24' AND '2020-01-25'
    ),
    [2020_Year] AS (
        SELECT COUNT(case_number) AS '# Accident In 2020-2021 '
        FROM [Data]
        WHERE [date] BETWEEN '2020-01-24' AND '2021-01-25'
    ),
    [2021_Year] AS (
        SELECT COUNT(case_number) AS '# Accident In 2021-2022 '
        FROM [Data]
        WHERE [date] BETWEEN '2021-01-24' AND '2022-01-25'
)
SELECT * 
FROM [2018_Year], [2019_Year], [2020_Year], [2021_Year]

--------------------------------------------------------------------------------

-- Total Number of accident by Accident Type .
SELECT primary_type,
    COUNT(case_number) AS 'Number Of Accident'
FROM [Data]
GROUP BY primary_type
ORDER BY 'Number Of Accident' DESC

--------------------------------------------------------------------------------

-- Compare Number of Accident by Accident Type and Before & After Pandemic and Calculate The Percentage Difference .
-- Note : NULL Value Means No Data .
WITH Before_Pandemic AS (
        SELECT COUNT(case_number) AS 'Before Pandemic',
                    primary_type
        FROM [Data]
        WHERE [date] BETWEEN '2018-01-24' AND '2020-01-25'
        GROUP BY primary_type
    ), 
    After_Pandemic AS (
        SELECT COUNT(case_number) AS 'After Pandemic',
                    primary_type
        FROM [Data]
        WHERE [date] BETWEEN '2020-01-24' AND '2022-01-25'
        GROUP BY primary_type
    )

SELECT *, CONCAT(([After Pandemic] - [Before Pandemic])*100 / [Before Pandemic], '%') AS PercentDiff
FROM Before_Pandemic FULL JOIN After_Pandemic ON Before_Pandemic.primary_type = After_Pandemic.primary_type
ORDER BY 'Before Pandemic' DESC

--------------------------------------------------------------------------------

-- Get The Top 20 Location Description Difference Before and After Pandemic .
WITH Before_Pandemic AS (
        SELECT COUNT(case_number) AS 'Before Pandemic',
                        location_description
        FROM [Data]
        WHERE [date] BETWEEN '2018-01-24' AND '2020-01-25'
        GROUP BY location_description
    ),
After_Pandemic AS(
        SELECT COUNT(case_number) AS 'After Pandemic',
                        location_description
        FROM [Data]
        WHERE [date] BETWEEN '2020-01-24' AND '2022-01-25'
        GROUP BY location_description
    )
SELECT TOP 20 *, CONCAT(([After Pandemic] - [Before Pandemic])*100 / [Before Pandemic], '%') AS PercentDiff
FROM Before_Pandemic FULL JOIN After_Pandemic ON After_Pandemic.location_description = Before_Pandemic.location_description
ORDER BY Before_Pandemic.[Before Pandemic] DESC

--------------------------------------------------------------------------------

-- Compare The Difference of Arrest Before and After Pandemic .
WITH Before_Pandemic AS (
        SELECT COUNT(case_number) AS 'Before Pandemic',
                        arrest
        FROM [Data]
        WHERE [date] BETWEEN '2018-01-24' AND '2020-01-25'
        GROUP BY arrest
    ),
    After_Pandemic AS (
            SELECT COUNT(case_number) AS 'After Pandemic',
                            arrest
            FROM [Data]
            WHERE [date] BETWEEN '2020-01-24' AND '2022-01-25'
            GROUP BY arrest
    )
SELECT *, CONCAT(([After Pandemic] -[Before Pandemic])*100 / [Before Pandemic], '%') AS PercentDiff
FROM Before_Pandemic FULL JOIN After_Pandemic ON After_Pandemic.arrest = Before_Pandemic.arrest

--------------------------------------------------------------------------------

-- Compare The Difference of Domestic Before and After Pandemic .
WITH Before_Pandemic AS (
        SELECT COUNT(case_number) AS 'Before Pandemic',
                        domestic
        FROM [Data]
        WHERE [date] BETWEEN '2018-01-24' AND '2020-01-25'
        GROUP BY domestic
    ),
    After_Pandemic AS (
        SELECT COUNT(case_number) AS 'After Pandemic',
                        domestic
        FROM [Data]
        WHERE [date] BETWEEN '2020-01-24' AND '2022-01-25'
        GROUP BY domestic
    )

SELECT *, CONCAT(([After Pandemic] - [Before Pandemic])*100 / [Before Pandemic], '%') AS PercentDiff
FROM Before_Pandemic FULL JOIN After_Pandemic ON After_Pandemic.domestic = Before_Pandemic.domestic

--------------------------------------------------------------------------------


