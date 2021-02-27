DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;


CREATE TABLE departments (
	dept_no VARCHAR(50) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);


CREATE TABLE titles (
  title_id VARCHAR(50) NOT NULL PRIMARY KEY,
  title VARCHAR(300) NOT NULL
);


CREATE TABLE employees (
	emp_no VARCHAR(50) NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(50) NOT NULL,
	birth_date VARCHAR(300) NOT NULL,
	first_name VARCHAR(300) NOT NULL,
	last_name VARCHAR(300) NOT NULL,
	sex VARCHAR(50) NOT NULL,
	hire_date VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE salaries (
	emp_no VARCHAR(50) NOT NULL PRIMARY KEY,
	salary VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- FK is to ensure that data should be valid from the respective tables &
-- composite key is to ensure duplicate data should not populate.
CREATE TABLE dept_emp (
	emp_no VARCHAR(50) NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT dept_emp_pk PRIMARY KEY (emp_no,dept_no)
	
);


CREATE TABLE dept_manager (
	dept_no VARCHAR(50) NOT NULL,
	emp_no VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT dept_mgr_pk PRIMARY KEY (emp_no,dept_no)

);







