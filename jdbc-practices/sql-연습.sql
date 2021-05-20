show tables;
desc employees;

select emp_no, birth_date, first_name 
  from employees
 where first_name like 'pat%';

 -- select
 select no, name from dept;

 -- insert
 insert into dept values(null, '총무');

 -- deletedept
 delete from dept where no = 4; 