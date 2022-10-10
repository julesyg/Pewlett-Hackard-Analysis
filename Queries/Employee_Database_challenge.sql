-- DELIVERABLE 1

-- Create a Retirement Titles table for employees who are born between January 1, 1952 
-- and December 31, 1955.

SELECT  employees.emp_no, 
        employees.first_name, 
        employees.last_name,
        titles.title,
        titles.from_date,
        titles.to_date
INTO retirement_title
FROM employees 
    INNER JOIN titles
    ON employee.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_title

-- Create a Unique Titles table that contains the employee number, first and last name, 
-- and most recent title.

SElECT emp_no, first_name, last_name, title from retirement_title

SELECT DISTINCT ON (retirement_title.emp_no) retirement_title.emp_no,
    retirement_title.first_name,
    retirement_title.last_name,
    retirement_title.title
INTO unique_titles
FROM retirement_title
WHERE (to_date = '9999-01-01')
ORDER BY retirement_title.emp_no DESC;

SELECT * FROM unique_titles

-- create a Retiring Titles table that contains the number of titles filled by
--  employees who are retiring. 

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

SELECT * FROM retiring_titles

-- DELIVERABLE 2

-- Query written and executed to create a Mentorship Eligibility table for 
-- current employees who were born between January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON (e.emp_no) e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no DESC;

SELECT * FROM mentorship_eligibilty