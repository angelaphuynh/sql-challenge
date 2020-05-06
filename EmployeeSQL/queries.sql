-- Query Tables

-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
FROM "Employees" e
JOIN "Salaries" s
ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
SELECT 
emp_no,
last_name,
first_name,
hire_date
FROM "Employees"
WHERE extract(year from hire_date) = '1986'; 

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
m.dept_no,
d.dept_name,
m.emp_no,
e.last_name,
e.first_name,
m.from_date,
m.to_date
FROM "Departments" d
JOIN "Dept_Manager" m
ON d.dept_no = m.dept_no
JOIN "Employees" e
ON e.emp_no = m.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM "Employees" e
JOIN "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
emp_no,
last_name,
first_name
FROM "Employees"
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%'); 

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM "Employees" e
JOIN "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE(dept_name) = 'Sales'; 

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM "Employees" e
JOIN "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE(dept_name) = 'Sales' or (dept_name)= 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
last_name,
COUNT(last_name) AS "shared_name_count"
from "Employees"
GROUP BY
last_name
ORDER BY shared_name_count DESC;

-- Epilogue "Search your ID number." You look down at your badge to see that your employee ID number is 499942.
SELECT
emp_no,
last_name,
first_name
FROM "Employees"
WHERE(emp_no) = '499942'; 