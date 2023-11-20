

--  Write an SQL query to display the records with three or more rows with consecutive id‘s & dates and the number of people should be greater than or equal to 100 for each record.


create table "T1".visit_table (id int , visit_date date , no_of_people int);
insert into "T1".visit_table values (1,'2017-02-01',10);
insert into "T1".visit_table values (2,'2017-02-02',110);
insert into "T1".visit_table values (3,'2017-02-03',140);
insert into "T1".visit_table values (4,'2017-02-04',98);
insert into "T1".visit_table values (5,'2017-02-05',140);
insert into "T1".visit_table values (6,'2017-02-06',120);
insert into "T1".visit_table values (7,'2017-02-07',115);
insert into "T1".visit_table values (8,'2017-02-08',109);
insert into "T1".visit_table values (9,'2017-02-10',189);
insert into "T1".visit_table values (10,'2017-02-11',201);
insert into "T1".visit_table values (11,'2017-02-12',210);
select * from "T1".visit_table;





with prepared_data as
(
select
id ,
visit_date , 
count(diff_in_day_seq) over(partition by diff_in_day_seq) as "count"
from
(
	select
* , 
EXTRACT('Day' FROM visit_date) as "day",
row_number() over(order by visit_date) as seq , 
EXTRACT('Day' FROM visit_date) - row_number() over(order by visit_date) as diff_in_day_seq
from  "T1".visit_table where no_of_people >= 100

	
) as a
)
select id , visit_date from prepared_data where "count" >= 3;
