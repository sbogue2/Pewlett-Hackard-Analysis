-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

--table 2
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (to_date = '9999-01-01')
ORDER BY rt.emp_no, to_date DESC;

--query 3
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--DELIVERABLE 2
--QUERY 1
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
