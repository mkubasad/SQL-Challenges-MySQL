-- Challenge: Find all the numbers that appear at least 3 times consecutively.
-- *****************************************************************
Create table Logs 
	( id integer primary key auto_increment,
	  num varchar(50)
	);
truncate Logs;
INSERT INTO Logs(num) VALUES ('1');
INSERT INTO Logs(num) VALUES ('1');
INSERT INTO Logs(num) VALUES ('1');
INSERT INTO Logs(num) VALUES ('2');
INSERT INTO Logs(num) VALUES ('1');
INSERT INTO Logs(num) VALUES ('2');
INSERT INTO Logs(num) VALUES ('2');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('1');
INSERT INTO Logs(num) VALUES ('5');
INSERT INTO Logs(num) VALUES ('3');

select * from logs;

with t1 as(
	select
		*,
        row_number() over(order by id) as rn,
	row_number() over(partition by num) as rn_num, 
        (row_number() over(order by id) - row_number() over(partition by num)) as rnum_diff
	from
		logs
)
select
	num, rnum_diff, count(*) as cnt
from
	t1
group by 
	rnum_diff
having 
	cnt >=3
;