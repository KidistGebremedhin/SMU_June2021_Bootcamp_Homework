--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT a.emp_no, 
a.last_name,
a.first_name,
a.sex,
b.salary
FROM public."Employees" a
LEFT JOIN public."Salaries"  b
ON a.emp_no = b.emp_no
ORDER BY emp_no


--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name,last_name,hire_date FROM public."Employees"
WHERE EXTRACT(year FROM hire_date) = 1986
ORDER BY emp_no;


--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT a.dept_no, 
b.dept_name,
a.emp_no,
c.last_name, 
c.first_name
FROM public."Dept_Manager" a
LEFT JOIN public."Department" b
ON a.dept_no = b.dept_no
LEFT JOIN public."Employees" c 
ON a.emp_no = c.emp_no
ORDER BY emp_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT
a.emp_no,
a.last_name,
a.first_name,
c.dept_name
FROM public."Employees"  a
INNER JOIN public."Dept_Emp" b ON a.emp_no=b.emp_no
INNER JOIN public."Department" c  ON c.dept_no=b.dept_no
order by emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name,last_name,sex FROM public."Employees" 
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT 
a.emp_no, 
a.last_name, 
a.first_name,
c.dept_name
FROM public."Employees" a
LEFT JOIN public."Dept_Emp"  b
ON a.emp_no=b.emp_no
INNER JOIN public."Department" c 
ON c.dept_no=b.dept_no
WHERE c.dept_name='Sales';

-- 7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.

SELECT 
a.emp_no, 
a.last_name, 
a.first_name,
c.dept_name
FROM public."Employees" a 
LEFT JOIN public."Dept_Emp" b 
ON a.emp_no=b.emp_no
INNER JOIN public."Department" c 
ON c.dept_no=b.dept_no
WHERE c.dept_name in ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS freq_count
FROM public."Employees" 
GROUP BY last_name
ORDER BY freq_count DESC;