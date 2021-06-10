-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM
	employees
	JOIN salaries
		ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT
	first_name,
	last_name,
	hire_date
FROM
	employees
WHERE hire_date
	BETWEEN "1986-01-01" AND "1986-12-31";

-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM
	dept_manager
	JOIN departments
		ON (dept_manager.dept_no = departments.dept_no)
	JOIN employees
		ON (dept_manager.emp_no = employees.emp_no);

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
	JOIN dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	JOIN departments
		ON (dept_emp.dept_no = departments.dept_no);

-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT
	first_name,
	last_name,
	birth_date,
	sex
FROM
	employees
WHERE first_name = "Hercules"
	AND last_name LIKE "B%";

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
	JOIN dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = "Sales"
ORDER BY
	employees.emp_no;

-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
	JOIN dept_emp
		ON (employees.emp_no = dept_emp.emp_no)
	JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name IN ("Sales", "Development")
ORDER BY
	employees.emp_no;

-- Count the number of employees, grouped by last name
SELECT
	last_name,
	COUNT(last_name)
FROM
	employees
GROUP BY last_name
