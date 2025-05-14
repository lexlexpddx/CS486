select *
from student_classes sc
limit 5;

select d.dept_name, c.class_abbrev, c.class_description, c.class_credits
from classes c
join departments d on c.class_dept_id = d.dept_id
where c.class_credits < 4
order by d.dept_name, c.class_abbrev
limit 3;


create view classes_by_dept as
select 
	d.dept_name, c.class_abbrev, c.class_description, c.class_credits
from classes c
join departments d on c.class_dept_id = d.dept_id;

select *
from classes_by_dept
where class_credits >= 4
order by dept_name, class_abbrev;


select 
	d.dept_name,
	c.class_abbrev,
	c.class_description,
	c.class_credits
from
	classes c
left join departments d on
	c.class_dept_id = d.dept_id
where
	c.class_credits < 4
order by
	d.dept_name,
	c.class_abbrev;

select 
	d.dept_name,
	c.class_abbrev,
	c.class_description,
	c.class_credits
from
	classes c
left join departments d on
	c.class_dept_id = d.dept_id
where
	c.class_credits >= 4
order by
	d.dept_name,
	c.class_abbrev;

select
	d.dept_name,
	s.student_family_name,
	s.student_given_name
from
	students s
left join departments d on
	s.student_dept_id = d.dept_id
order by
	d.dept_name,
	s.student_family_name,
	s.student_given_name;

select
	d.dept_name,
	s.student_family_name,
	s.student_given_name
from
	students s
full outer join departments d on
	s.student_dept_id = d.dept_id
order by
	d.dept_name,
	s.student_family_name,
	s.student_given_name;

select s.student_given_name, s.student_family_name, c.class_abbrev
from students s
left join student_classes sc on s.student_id = sc.student_id
join classes c on sc.class_id = c.class_id
left join departments d on c.class_dept_id = d.dept_id
order by s.student_given_name, s.student_family_name, c.class_abbrev, d.dept_name