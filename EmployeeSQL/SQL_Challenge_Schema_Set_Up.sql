-- Creating table schema for SQL Challenge (6 tables)
-- Drop tables (if they have been set up)  

DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

-- 1) Creating Departments Table  

CREATE TABLE departments (
    dept_no varchar(5) NOT NULL,
    dept_name varchar(30) NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY (dept_no) 	
);

-- 2) Creating Employees Table 

CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id varchar (35) NOT NULL,
    birth_date date NOT NULL,
    first_name varchar (30) NOT NULL,
    last_name varchar (30) NOT NULL,
    sex varchar (10) NOT NULL,
    hire_date date NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY (emp_no) 
);

-- 3) Creating Titles Table 

CREATE TABLE titles (
    title_id varchar (35) NOT NULL,
    title varchar (30) NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (title_id)
);

-- 4) Creating Dept_Manager Table 

CREATE TABLE salaries(
    emp_no int NOT NULL,
    salary int NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (emp_no)
);

-- 5) Creating Dept_Emp Table 

CREATE TABLE dept_emp(
    emp_no int NOT NULL,
    dept_no varchar (5)  NOT NULL,
	CONSTRAINT pk_dep_emp PRIMARY KEY (emp_no, dept_no)
);

-- 6) Creating Dept_Manager Table 

CREATE TABLE dept_manager(
    dept_no varchar (5) NOT NULL,
    emp_no int NOT NULL,
	CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no)
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);


-- Note: populate CSV files to Postgres in this order: 
-- -- -- 1)titles, 2) employees, 3) salaries, 4) departments, 5) dept_manager, 6) dept_emp

-- SQL Code used for testing table population: 

-- SELECT * FROM departments
-- SELECT COUNT(dept_no) AS "TOTAL"
-- FROM departments;

-- SELECT * FROM employees
-- SELECT COUNT(emp_no) AS "TOTAL"
-- FROM employees

-- SELECT * FROM titles
-- SELECT COUNT(title_id) AS "TOTAL"
-- FROM titles;

-- SELECT * FROM salaries
-- SELECT COUNT(emp_no) AS "TOTAL"
-- FROM salaries;

-- SELECT * FROM dept_manager
-- SELECT COUNT(dept_no) AS "TOTAL"
-- FROM dept_manager;


