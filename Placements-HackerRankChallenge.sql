-- Challenge: (Advanced join): Placements
-- ======================================
/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/
-- Solution:

select
    a.name
    -- a.name,
    -- b.friend_id,
    -- c.salary as salary,
    -- d.salary as friend_salary    
from
    students a
join friends b on a.id = b.id
join packages c on a.id = c.id
join packages d on b.friend_id = d.id
where
    d.salary > c.salary
order by
    d.salary
;