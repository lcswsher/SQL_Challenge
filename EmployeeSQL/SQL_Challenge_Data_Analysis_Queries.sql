-- Data Analysis Queries 

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
-- -- Joins: Join Salaries with Employees on Emp_No.

select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Gender", s.salary as "Salary"
from employees as e
join salaries as s on e.emp_no = s.emp_no
order by e.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.

select first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date;

-- List the manager of each department with the following information: department number, 
-- -- department name, the manager's employee number, last name, first name.
-- -- Joins:  1) Dep_Manager to Departments on Dept_No. 2) Employees to Dept_Managers on Emp_no.

select d.dept_no as "Department Number", d.dept_name as "Department Name", m.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
from departments as d
left join dept_manager as m on d.dept_no = m.dept_no
left join employees as e on m.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name, 
-- first name, and department name.
-- -- Joins:  1) Departments to Department Employee on Dept_No.  2) Department Employee to Employees on Emp_No.

select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from dept_emp as de
left join departments as d on de.dept_no = d.dept_no
left join employees as e on de.emp_no = e.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name as "First Name" , last_name as "Last Name", sex as "Gender"
from employees
where first_name = 'Hercules'
and last_name like 'B%'
order by last_name;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- -- Joins: 1) Employees to Department Employee on Emp_Num.  2) Departments to Department Employee on Dept_Number

select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "Last First", d.dept_name as "Department Name"
from employees as e
left join dept_emp as de on e.emp_no = de.emp_no
left join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.emp_no;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- -- Joins: 1) Employees to Department Employee on Emp_Num.  2) Departments to Department Employee on Dept_Number

select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "Last First", d.dept_name as "Department Name"
from employees as e
left join dept_emp as de on e.emp_no = de.emp_no
left join departments as d on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'
order by e.emp_no;

-- In decending order, list the frequency count of employees last names, i.e., how many employees share each last name.

select last_name as "Last Name", count(*) as "Count of Employees Last Name"
from employees
group by last_name
order by "Count of Employees Last Name" desc;