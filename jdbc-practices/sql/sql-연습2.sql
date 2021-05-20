desc employees;

-- EmployeeDao.findByName
select emp_no, first_name, last_name, date_format(hire_date, '%Y-%m-%d') 
  from employees 
 where first_name like '%ko%'
   and last_name like '%ko%';
   
-- EmployeeDao.findBySalary
  select a.emp_no, a.first_name, a.last_name, b.salary 
    from employees a, salaries b
   where a.emp_no = b.emp_no
     and b.to_date = '9999-01-01'
     and b.salary between 30000 and 50000
order by b. salary asc;