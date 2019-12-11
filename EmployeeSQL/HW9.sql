CREATE VIEW q1 AS
SELECT employees.emp_no, first_name, last_name, gender, salary
FROM employees
JOIN salary
ON salary.emp_no = employees.emp_no
ORDER BY emp_no ASC
;

CREATE VIEW q2 AS
select * from employees
WHERE hire_date >= '1986-01-01' and hire_date < '1987-01-01'
ORDER BY hire_date ASC
;


REATE VIEW q3 AS
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, dept_manager.from_date,dept_manager.to_date, employees.first_name, employees.last_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees
ON employees.emp_no = dept_manager.emp_no
ORDER BY first_name ASC
;

CREATE VIEW q4 AS
SELECT  employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no
;

CREATE VIEW q5 AS
SELECT * 
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'
;


CREATE VIEW q6 AS
SELECT  employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Business Development'
;


CREATE VIEW q7 AS
SELECT  employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees
ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Development' or dept_name = 'Sales'
;

CREATE VIEW q8 as
SELECT  last_name, COUNT(first_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC
;
