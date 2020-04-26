-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select 
	employees.emp_no as employee_number,
	last_name,
	first_name,
	sex,
	salary
from employees join salaries on employees.emp_no = salaries.emp_no
order by employees.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select 
	first_name,
	last_name,
	hire_date
from employees
where hire_date between '1/1/1986' and '12/31/1986'
order by hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select
	departments.dept_no as department_number,
	dept_name,
	dept_mgr.emp_no as employee_number,
	last_name,
	first_name
from departments join dept_mgr on departments.dept_no = dept_mgr.dept_no
join employees on employees.emp_no = dept_mgr.emp_no
order by departments.dept_no, dept_mgr.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select
	dept_emp.emp_no as employee_number,
	last_name,
	first_name,
	dept_name
from employees join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
order by dept_name, dept_emp.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select
	first_name,
	last_name,
	sex
from employees
where first_name='Hercules'
and last_name like 'B%'
order by last_name;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
	employees.emp_no as employee_number,
	last_name,
	first_name,
	dept_name
from employees join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name='Sales'
order by employees.emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
	employees.emp_no as employee_number,
	last_name,
	first_name,
	dept_name
from employees join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name in ('Sales','Development')
order by dept_name,employees.emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
	last_name,
	count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc;
