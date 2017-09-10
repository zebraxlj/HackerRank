select f1.x, f1.y
from functions f1 join functions f2 on f1.x = f2.y and f1.y = f2.x and f1.x < f1.y
union
select * from (
    select f1.x, f1.y
    from functions f1 join functions f2 on f1.x = f2.y and f1.y = f2.x and f1.x = f1.y
) as temp1
group by x
having count(x) > 2
order by x