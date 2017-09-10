select Contests.contest_id, Contests.hacker_id, Contests.name,
    sum(TS), sum(TAS), sum(TV), sum(TUV)
from Contests
    left join Colleges on Colleges.contest_id = Contests.contest_id
    left join Challenges on Challenges.college_id = Colleges.college_id
    left join (select challenge_id, sum(total_views) as TV, sum(total_unique_views) as TUV 
               from View_Stats
              group by View_Stats.challenge_id) as VS 
              on VS.challenge_id = Challenges.challenge_id
    left join (select challenge_id, sum(total_submissions) as TS, sum(total_accepted_submissions) as TAS 
               from Submission_Stats
              group by Submission_Stats.challenge_id) as SS
              on SS.challenge_id = Challenges.challenge_id
group by Contests.contest_id, Contests.hacker_id, Contests.name 
having sum(TS) <> 0 or sum(TAS) <> 0 or sum(TV) <> 0 or sum(TUV) <> 0
order by Contests.contest_id