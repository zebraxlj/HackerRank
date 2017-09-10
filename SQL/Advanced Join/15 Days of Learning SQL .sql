-- key idea for this solution: do one at a time, since we are looking for the ONE for every day

SELECT submission_date ,
    (
        SELECT COUNT(DISTINCT hacker_id)  
        FROM Submissions s2  
        WHERE s2.submission_date = s1.submission_date 
            AND
            (
                SELECT COUNT(DISTINCT s3.submission_date)
                FROM Submissions s3 
                WHERE s3.hacker_id = s2.hacker_id
                   AND s3.submission_date < s1.submission_date
            ) = dateDIFF (s1.submission_date , '2016-03-01')
    ),
    (
        SELECT hacker_id
        FROM submissions s2 
        WHERE s2.submission_date = s1.submission_date 
        GROUP BY hacker_id 
        ORDER BY COUNT(submission_id) DESC , hacker_id LIMIT 1
    ) AS h_id,
    (SELECT name FROM hackers WHERE hacker_id = h_id
    )
FROM (SELECT DISTINCT submission_date FROM submissions) s1
GROUP BY submission_date

