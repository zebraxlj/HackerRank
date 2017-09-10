select s.name
from students as s
        join packages as p on p.id = s.id
        join friends as f on f.id = s.id
        join packages as fp on fp.id = f.friend_id
where p.salary < fp.salary
order by fp.salary