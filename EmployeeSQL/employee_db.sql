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

--list the department of each employee with the following information: employee number, last name,
--first name, **department name**
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN
(
	SELECT de.emp_no
	FROM dept_emp AS de
	WHERE de.dept_no IN
	(
		SELECT d.dept_no
		FROM departments AS d
		)
);
--List first name, last name, and sex for employees whose first name is "Hercules" and last names 
--begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';
	
--List all employees in the Sales department, including their employee number, last name, first name, 
--and **department name**. UNION?
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN
(
	SELECT de.emp_no
	FROM dept_emp AS de
	WHERE de.dept_no IN
	(
		SELECT d.dept_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales')
);

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and **department name**. UNION?
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN
(
	SELECT de.emp_no
	FROM dept_emp AS de
	WHERE de.dept_no IN
	(
		SELECT d.dept_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales'
		OR d.dept_name = 'Development')
);

--In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;
