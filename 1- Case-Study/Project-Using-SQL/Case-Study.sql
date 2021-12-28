-- Select Data --
SELECT * FROM [2020-11]

-- Get Total number of rows in the table --
SELECT COUNT(*) AS [Number_of_rows] FROM [2020-11]

-- Remove NULL Values From DataSet --
DELETE  FROM [2020-11]
WHERE COALESCE(rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id,
    start_lat, start_lng, end_lat, end_lng, member_casual) IS NULL;

-- Sort Data By started_at --
SELECT *
FROM [2020-11]
ORDER BY started_at

-- Summarize One Months Table --
SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
       CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
       CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
       CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
       CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
       CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2020-11]
GROUP BY member_casual
ORDER BY member_casual

-- Summarize 12 Months in One Table Using Union Function --
SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2020-11] 
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2020-12]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-01]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-02]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-03]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-04]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-05]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-06]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-07]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-08]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-09]
UNION SELECT CAST(AVG(CAST(started_at AS FLOAT)) AS DATETIME) AS [MEAN_Started_Date],
            CAST(AVG(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MEAN_Ended_Date],
            CAST(MAX(CAST(started_at AS FLOAT)) AS DATETIME) AS [MAX_Started_Date],
            CAST(MAX(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MAX_Ended_Date],
            CAST(MIN(CAST(started_at AS FLOAT)) AS DATETIME) AS [MIN_Started_Date],
            CAST(MIN(CAST(ended_at AS FLOAT)) AS DATETIME) AS [MIN_Ended_Date]
FROM [2021-10]




