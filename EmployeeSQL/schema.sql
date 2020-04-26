-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Schema for SQL Challenge
CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     ),
    CONSTRAINT uc_departments_dept_name UNIQUE (
        dept_name
    )
);

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     ),
    CONSTRAINT uc_titles_title UNIQUE (
        title
    )
);

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL check(sex='M' OR sex='F'),
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE dept_mgr (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL,
    CONSTRAINT pk_dept_mgr PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_mgr ADD CONSTRAINT fk_dept_mgr_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_mgr ADD CONSTRAINT fk_dept_mgr_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

-- Added Trigger Function to check if birth_date is greater then the current date
-- Change birth_date to 19xx
CREATE OR REPLACE FUNCTION check_birth_date()
  RETURNS trigger AS
$BODY$
BEGIN
	IF NEW.birth_date > CURRENT_DATE THEN
		NEW.birth_date = NEW.birth_date - interval '100 year';
	END IF;

	RETURN NEW;
END;
$BODY$
LANGUAGE 'plpgsql';

-- Trigger on employees table to check birth_date
CREATE TRIGGER employees_trigger BEFORE INSERT OR UPDATE ON employees
    FOR EACH ROW EXECUTE PROCEDURE check_birth_date();
