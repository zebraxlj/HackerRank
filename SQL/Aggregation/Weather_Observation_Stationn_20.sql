-- MS SQL
-- for some reason, round(..., 4) doesn't work
SELECT cast(ROUND((MAX(T1.LAT_N) + MIN(T2.LAT_N)) / 2, 4) as decimal(10, 4))
FROM (SELECT TOP 50 PERCENT LAT_N
    FROM STATION
    ORDER BY LAT_N) AS T1,
    (SELECT TOP 50 PERCENT LAT_N
    FROM STATION
    ORDER BY LAT_N DESC) AS T2;
