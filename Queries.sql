-- Data Analysis

-- 1.List the employee number, last name, first name, sex, and salary of each employee.
Create view Q1 as 
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no;

select * from q1;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
Create view Q2 as 
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' and hire_date < '1987-01-01';

select * from q2;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
Create view Q3 as 
select dept_manager.manager_emp_no, department.dept_no, department.dept_name, employees.last_name, employees.first_name
from dept_manager
join department on dept_manager.dept_no = department.dept_no
join employees on dept_manager.manager_emp_no = employees.emp_no;

select * from Q3;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Create view Q4 as 
select dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, department.dept_name
from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join department on dept_emp.dept_no = department.dept_no
order by dept_emp.dept_no;

select * from Q4;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Create view Q5 as 
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name LIKE 'B%';

select * from Q5;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
Create view Q6 as 
select emp_no, last_name, first_name
from Q4
where dept_name = 'Sales';

select * from Q6;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
Create view Q7 as 
select emp_no, last_name, first_name, dept_name
from Q4
where dept_name = 'Sales' or dept_name = 'Development';

select * from Q7;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
create view Q8 as
select last_name, count(last_name) as "last_name count"
from employees
group by last_name
order by count(last_name) DESC;

select * from Q8;
