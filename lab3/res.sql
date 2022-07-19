-- 1 -- 
-- a
select * from univercity.course
where credits > 3;
-- b
select * from univercity.classroom
where building='Watson' or building='Packard';
-- с
select * from univercity.course
where dept_name='Comp. Sci.';
-- d
select c.* from univercity.course c, univercity.section s
where c.course_id=s.course_id and s.semester='Fall';
-- e
select * from univercity.student
where tot_cred>45 and tot_cred<90;
-- f
select * from univercity.student
where right(name,1) in  ('a', 'e', 'i', 'o', 'u');
-- g
select c.* from univercity.course c
join univercity.prereq p
on c.course_id = p.course_id 
where p.prereq_id='CS-101';


-- 2 -- 
-- a
select dept_name, avg(salary) from univercity.instructor 
group by dept_name 
order by avg(salary) asc;
-- b
select building, count(course_ID) from univercity.section 
group by building 
order by count(course_ID) desc
limit 1;
-- c
select dept_name, count(course_ID) from univercity.course 
group by dept_name 
order by count(course_ID) 
limit 1;
-- d
select ID, count(course_ID) from univercity.takes 
where course_ID like 'CS%' 
group by ID having count(course_ID) > 3;
-- e
select * from univercity.instructor 
where dept_name ='Biology' or dept_name ='Philosophy' or dept_name ='Music';
-- f
select i.ID, name, year from univercity.instructor i 
join univercity.teaches t on i.ID = t.ID 
where year = 2018 and not year = 2017
group by i.ID, year;


-- 3
-- a
select distinct(s.name), s.ID, t.grade
from univercity.student s 
inner join univercity.takes t 
on s.ID = t.ID 
inner join univercity.course c
on c.course_ID = t.course_ID
where c.dept_name = 'Comp. Sci.' and t.grade = 'A' or t.grade = 'A-'; 

-- b
select i.name, t.grade from univercity.instructor i 
inner join univercity.advisor a 
on i.ID = a.i_ID 
inner join univercity.takes t 
on t.ID = a.s_ID
where not t.grade = 'A'
		and not t.grade = 'A-'
		and not t.grade = 'B+' 
		and not t.grade = 'B' ;
		
-- c
select d.dept_name from univercity.department d
where d.dept_name not in(
	select d.dept_name from univercity.department d
	inner join univercity.student s
	on d.dept_name = s.dept_name 
	inner join univercity.takes t
	on s.id=t.id
	where (t.grade ='F' OR t.grade = 'C')
);

-- d
select i.name from univercity.instructor i
where i.id not in(
	select i.id from univercity.instructor i
	inner join univercity.teaches t
	on i.ID = t.ID 
	inner join univercity.takes ta
	on t.course_id = ta.course_id
	where ta.grade = 'A'
); 

-- e
select distinct(title), end_hr, end_min, c.course_id from univercity.section s 
inner join univercity.time_slot t
on t.time_slot_id = s.time_slot_id
inner join univercity.course c 
on s.course_id = c.course_id
where end_hr < 13 and end_min <=50 ; 


