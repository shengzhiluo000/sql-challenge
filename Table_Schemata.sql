-- Data Modeling (required to import csv into respective table after.)
CREATE TABLE Department (
	dept_no VARCHAR(30) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE Title (
	title_id VARCHAR(30) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(30) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Title(title_id)
);

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	CONSTRAINT PK_emp_salary PRIMARY KEY (emp_no, salary)
);

CREATE TABLE Dept_Emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Dept_Manager (
	dept_no VARCHAR(30) NOT NULL,
	manager_emp_no integer NOT NULL,
	FOREIGN KEY (manager_emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);