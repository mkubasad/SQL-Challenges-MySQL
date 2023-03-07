-- Challenge: Print prime numbers betwee 1 and 1000 in a single line separated by &

with recursive nums as(
	select 2 as num
    union all
    select num+1 
    from nums
    where num < 1000
)
select
	group_concat(num separator '&') as primes
from 
	nums a
where
	not exists (
					select 1 from
                    nums b
                    where 
						a.num <> b.num
                    and b.num <= sqrt(a.num)
                    and a.num % b.num = 0
				)
;
