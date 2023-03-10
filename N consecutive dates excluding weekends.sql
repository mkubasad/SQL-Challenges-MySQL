-- Find n consecutive dates excluding weekends. 
-- ********************************************************************************
with t1 as(
	select
		dt, dayname(dt),
		lag(dt) over(order by dt), 
        dayname(lag(dt) over(order by dt)),
        case 
			when ((dt - lag(dt) over(order by dt)) = 1) OR (dayofweek(dt)=2 and date_add(dt, interval -3 day) = lag(dt) over(order by dt))  then 0
            else 1
        end as diff
	from 
		Jan2023
), t2 as (
	select 
		*, sum(diff) over(order by dt) grp_num
	from 
		t1
)
select
	min(dt), max(dt), count(*)
from
	t2
group by grp_num
order by
	min(dt)
;