# Pewlett-Hackard-Analysis

## Overview of the Analysis

To perform this analysis, we combined data from 6 different CSV spreadsheet using SQL. We created tables to hold the data and linked them together through primary key and foreign key relations. Below is a ERB showing the table structure:

![EmployeeDB](https://user-images.githubusercontent.com/104707395/206572215-b403992d-22af-43e2-a188-401587295919.png)

### Deliverable 1
  Pewlett-Hackard is a large tech company that is facing a retirement cliff due to a large number of their employees entering their final years before retirement. To prepare for the high number employees retiring in the near future, senior management has tasked me with scouring employee records to identify individuals that will be retiring soon. We defined employees eligible for retirment as those born between January 1, 1952 and December 31, 1955. We then used that criteria to determine how many vacancies there will be in each position in the company. 
  
### Deliverable 2  
   Pewlett-Hackard has also expressed interest in developing an Employee Mentorship Program to help future-proof the company by easing transition between retiring employees and new employees that will be replacing them. To accomplish this, we identified employees eligible to become mentors as those born between January 1, 195 and December 31, 1965. These individuals are likely to have many years of experience working for the company and will be retiring within the next few years. Armed with information provided through our analysis in Deliverables 1 and 2, we will have a good estimate of upcoming vacancies and individuals that can help us expedite new employee training to fill the vacancies. 
   
## Results 

### Deliverable 1
* Pewlett-Hackard has 300,024 employees and 72,458 of them will be retiring soon. That means that they will soon have a vacancy rate of 24.2 percent. That's great news for prospective employees, but not so great for the company.
* Out of the 72,458 employees that will soon be retiring, 50,842 (70%) of them hold senior positions. That means there will be a lot of opportunity for individuals holding Engineer and Staff titles to move up in the company. 
![Pewlett-Hackard_Retiring_Titles](https://user-images.githubusercontent.com/104707395/206574444-e34c0250-187d-46a3-a131-15d72330699f.png)

### Deliverable 2
* There are 1,549 potential mentors within the company that could help train new staff to fill vacancies. 
* When compared to the 72,458 positions that will soon be vacant, that is a mentee:mentor ratio of approximately 47:1. 

## Summary
Pewlett-Hackard is facing a monstrous retirement cliff, or as they like to call it, the "Silver Tsunami". They should begin preparations to promote existing staff and recruit new staff immediately. While the mentorship program that has been suggested would certainly help the transition of new staff into the company, the low number of potential mentors will likely dampen the programs effectiveness. Furthermore, it may be helpful to identify which positions the potential mentors are currently hiring to do this, run the following query:

* SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

That returns the following list:

![mentors_by_title](https://user-images.githubusercontent.com/104707395/206578279-173459da-a2bb-46b8-80e7-16110f10f038.png)

If we expand upon our mentorship criteria by including individuals born in 1964, we increase our number of eligible mentors from 1,549 to 19,905 and increase our mentee:mentor ratio to 1:3, which is an acceptable ratio.

Run the following queries to get the following table showing mentors by title:
* SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility2
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1964-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

* SELECT COUNT(emp_no), title
INTO mentor_titles2
FROM mentorship_eligibility2
GROUP BY title
ORDER BY COUNT(title) DESC;

![mentors_by_title_expanded](https://user-images.githubusercontent.com/104707395/206580502-6647f1fe-eaf1-4aec-bbfa-34b8baa0eacc.png)
