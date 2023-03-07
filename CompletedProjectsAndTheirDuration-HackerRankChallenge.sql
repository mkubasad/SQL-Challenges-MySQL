-- Challenge: Find the completed projects and their duration
with task_grp as (
	select
		*,
		row_number() over(order by end_date) as rnum,
		date_add(end_date, interval -row_number() over(order by end_date) day) as grp_dt
	from
		tasks
)
select
	min(start_date) as start_date, 
    max(end_date) as end_date, 
    count(*) as duratioin
from
	task_grp
group by
	grp_dt
order by
	count(*),
	min(start_date)
;