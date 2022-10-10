-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name FROM employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date FROM titles;

-- Create a new table using the INTO clause.
-- Join both tables on the primary key.
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
-- Then, order by the employee number.

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

-- Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


SElECT emp_no, first_name, last_name, title from retirement_title

-- Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
-- Create a Unique Titles table using the INTO clause.

SELECT DISTINCT ON (retirement_title.emp_no) retirement_title.emp_no,
    retirement_title.first_name,
    retirement_title.last_name,
    retirement_title.title
INTO unique_titles
FROM retirement_title
WHERE (to_date = '9999-01-01')
ORDER BY retirement_title.emp_no DESC;

SELECT * FROM unique_titles

-- Write another query in the Employee_Database_challenge.sql file to retrieve the 
-- number of employees by their most recent job title who are about to retire.

-- Employee count by department number
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

SELECT * FROM retiring_titles