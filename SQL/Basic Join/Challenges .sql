select hackers.hacker_id, hackers.name, count(hackers.hacker_id) as challenge_count
from hackers join challenges on hackers.hacker_id = challenges.hacker_id
group by hackers.hacker_id, hackers.name
having challenge_count = (
        select count(hackers.hacker_id)
        from hackers join challenges on hackers.hacker_id = challenges.hacker_id
        group by hackers.hacker_id
        order by count(hackers.hacker_id) desc limit 1
    ) 
    or challenge_count in (
        select counts
        from (
            select count(hackers.hacker_id) as counts
            from hackers join challenges on hackers.hacker_id = challenges.hacker_id
            group by hackers.hacker_id
        ) as t
        group by counts
        having count(counts) = 1
    )
order by challenge_count desc, hackers.hacker_id