-- Challenge: (Advanced Select):  Binary tree nodes - Identify nodes by type
/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

select
    a.n,
    case
        when a.p is null then 'Root'
        when not exists(select * from bst b where a.n = b.p) then 'Leaf'
        else 'Inner'
    end as type
from
    bst a
order by
    a.n
;

-- Solution 2:
with t1 as (
	select
		a.n as node,
		a.p as parent,
		count(b.n) as children_count
	from
		bst a
	left join bst b on a.n = b.p
	group by
		a.n,
		a.p
)
select
	node,
    case
		when parent is null then 'Root'
        when children_count then 'Inner'
        else 'Leaf'
    end as type
from
	t1
order by 
	node
;