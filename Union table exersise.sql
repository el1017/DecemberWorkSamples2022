SELECT (DATEPART(HOUR, [Timestamp]) * 3600) +(DATEPART(MINUTE, [Timestamp]) * 60) +(DATEPART(SECOND, [Timestamp])) AS TimeKey, 
	CAST(CONVERT(char(8),CONVERT(date,[timestamp],121),112) AS INT) AS DateKey,

[Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek AS [DayOfWeekNo], Month AS [MonthOfYearNo], RiverName, MonitoringStation,
CASE WHEN [Dayofweek] = 0 THEN 'Sunday'
	WHEN [Dayofweek] = 1 THEN 'Monday'
	WHEN [Dayofweek] = 2 THEN 'Tuesday'
	WHEN [Dayofweek] = 3 THEN 'Wednesday'
	WHEN [Dayofweek] = 4 THEN 'Thursday'
	WHEN [Dayofweek] = 5 THEN 'Friday'
	ELSE 'Saturday' END AS [DayOfWeek],
CASE WHEN [Month] = 1 THEN 'Janurary'
	WHEN [Month] = 2 THEN 'Feburary'
	WHEN [Month] = 3 THEN 'March'
	WHEN [Month] = 4 THEN 'April'
	WHEN [Month] = 5 THEN 'May'
	WHEN [Month] = 6 THEN 'June'
	WHEN [Month] = 7 THEN 'July'
	WHEN [Month] = 8 THEN 'August'
	WHEN [Month] = 9 THEN 'September'
	WHEN [Month] = 10 THEN 'October'
	WHEN [Month] = 11 THEN 'November'
	ELSE 'December' END AS [Month]
--INTO dbo.River_Analytics
FROM 
(SELECT [Timestamp], NULL AS Q, Conductivity, NO3, Temp, Turbidity, NULL AS Level, Dayofweek, Month, 'Johnstone' AS RiverName, 'Coquette Point' AS MonitoringStation
FROM Johnstone_river_coquette_point_joined
UNION ALL
SELECT [Timestamp], Q, NULL AS Conductivity, NULL AS NO3, NULL AS Temp, NULL AS Turbidity, Level, Dayofweek, Month, 'Johnstone' AS RiverName, 'Innisfail' AS MonitoringStation
FROM Johnstone_river_innisfail_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Mulgrave' AS RiverName, 'Deeral' AS MonitoringStation
FROM Mulgrave_river_deeral_joined
UNION ALL
SELECT [Timestamp], NULL AS Q, NULL AS Conductivity, NO3, Temp, NULL AS Turbidity, NULL AS Level, Dayofweek, Month, 'Pioneer' AS RiverName, 'Dumbleton' AS MonitoringStation
FROM Pioneer_Dumbleton_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Plane' AS RiverName, 'Sucrogen' AS MonitoringStation
FROM Plane_ck_sucrogen_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Proserpine' AS RiverName, 'Glen Isla' AS MonitoringStation
FROM Proserpine_river_glen_isla_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Russell' AS RiverName, 'East Russell' AS MonitoringStation
FROM russell_river_east_russell_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Sandy Creek' AS RiverName, 'Homebush' AS MonitoringStation
FROM sandy_ck_homebush_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Sandy Creek' AS RiverName, 'Sorbellos Road' AS MonitoringStation
FROM sandy_ck_sorbellos_road_joined
UNION ALL
SELECT [Timestamp], Q, Conductivity, NO3, Temp, Turbidity, Level, Dayofweek, Month, 'Tully' AS RiverName, 'Euramo' AS MonitoringStation
FROM Tully_river_euramo_joined
UNION ALL
SELECT [Timestamp], NULL AS Q, NULL AS Conductivity, NO3, NULL AS Temp, NULL AS Turbidity, Level, Dayofweek, Month, 'Tully' AS RiverName, 'Tully Gorge National Park' AS MonitoringStation
FROM Tully_River_Tully_Gorge_National_Park_joined) RA
	
