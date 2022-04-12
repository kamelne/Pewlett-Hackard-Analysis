-- create retiring titles table
select e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
Into retirement_titles
from employees as e
	inner join titles as t
		on (e.emp_no = t.emp_no)
Where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01' )
ORDER BY emp_no, to_date DESC;

-- show retiring totals by title
Select title, count(title)
into retiring_titles
from unique_titles
group by title
order by count(title) DESC;

-- mentorship eligibilty
select distinct on(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.from_date,
	d.to_date,
	t.title
Into mentorship_eligibilty
from employees as e
	inner join dept_emp as d
		on (e.emp_no = d.emp_no)
	inner join titles as t
		on (e.emp_no = t.emp_no)
Where (t.to_date = '9999-01-01' ) 
	   and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
Order by e.emp_no;