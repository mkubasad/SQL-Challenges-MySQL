-- Challenge: (Advanced Select):  Occupations pivot

with t1 as (
	select 
		name,
		case occupation
			when 'Doctor' then name
			else null
		end as doctor_name,
		case occupation
			when 'Professor' then name
			else null
		end as professor_name,
		case occupation
			when 'Singer' then name
			else null
		end as singer_name,
		case occupation
			when 'Actor' then name
			else null
		end as actor_name,
        row_number() over(partition by occupation order by name) as rnum
	from
		occupations
)
select
	min(doctor_name), min(professor_name), min(singer_name), min(actor_name)
from 
	t1
group by
	rnum
;