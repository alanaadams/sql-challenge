-- Verify successful data import
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- List the employee number, last name, first name, sex, and salary of each employee
CREATE VIEW question_01 AS
SELECT salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
salaries.emp_no=employees.emp_no;
-- Query the table view created
SELECT *
FROM question_01;
-- Drop view
DROP VIEW question_01;


-- List the first name, last name, and hire date for the employees who were hired in 1986
CREATE VIEW question_02 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';
-- Query the table view created
SELECT *
FROM question_02;
-- Drop view
DROP VIEW question_02;


-- List the manager of each department along with their department number, department name, employee number, last name, and first name
CREATE VIEW question_03 AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no;
-- Query the table view created
SELECT *
FROM question_03;
-- Drop view
DROP VIEW question_03;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
CREATE VIEW question_04 AS
SELECT dept_emp.emp_no, dept_emp.dept_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no;
-- Query the table view created
SELECT *
FROM question_04;
-- Drop view
DROP VIEW question_04;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
CREATE VIEW question_05 AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
-- Query the table view created
SELECT *
FROM question_05;
-- Drop view
DROP VIEW question_05;

--List each employee in the Sales department, including their employee number, last name, and first name
CREATE VIEW question_06 AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
WHERE dept_emp.dept_no = 'd007';
-- Query the table view created
SELECT *
FROM question_06;
-- Drop view
DROP VIEW question_06;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
CREATE VIEW question_07 AS
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_emp.dept_no = 'd007'
OR dept_emp.dept_no = 'd005';
-- Query the table view created
SELECT *
FROM question_07;
-- Drop view
DROP VIEW question_07;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name
CREATE VIEW question_08 AS
SELECT last_name, COUNT(emp_no) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count";
-- Query the table view created
SELECT *
FROM question_08;
-- Drop view
DROP VIEW question_08;