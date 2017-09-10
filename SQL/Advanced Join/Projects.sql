SELECT a.Start_Date, MIN(b.End_Date)
FROM 
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) AS a,
    (SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) AS b 
WHERE a.Start_Date < b.End_Date
GROUP BY a.Start_Date
ORDER BY DATEDIFF(MIN(b.End_Date), a.Start_Date), a.Start_Date
