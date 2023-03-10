-- Challenge: (Advanced Join) - SQL Project Planning
-- ==================================================

-- Solution 1:
with t1 as (
    select
        *,
        date_add(end_date, interval -row_number() over(order by end_date) day) as grp
    from
        tasks -- projects in HackerRank
)
select
    min(start_date) as prj_start_date,
    max(end_date) as prj_end_date
from
    t1
group by
    grp
order by 
	count(*)+1,
    prj_start_date
;