--list the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM salaries AS s
INNER JOIN employees AS e ON
e.emp_no=s.emp_no;

--list first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE 
	hire_date between '1986-01-01' 
	AND '1986-12-31';
	
--list the manager of each department with the following information: department number, department name
--the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm ON
e.emp_no=dm.emp_no
JOIN departments AS d ON
dm.dept_no=d.dept_no;

