-- 서브쿼리(SUBQUERY) SQL - practice04(혼합)

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
 from salaries
where to_date = '9999-01-01' 
  and salary > (select avg(salary)
				  from salaries
                 where to_date = '9999-01-01');
                 
-- 문제2.
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단
-- 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.
  select a.emp_no, concat(a.first_name, ' ', a.last_name) as 'name', b.salary as '연봉'
    from employees a, salaries b, dept_emp c
   where a.emp_no = b.emp_no
     and b.emp_no = c.emp_no
     and b.to_date = '9999-01-01'
     and c.to_date = '9999-01-01'
     and (c.dept_no, b.salary) =any(select a.dept_no, max(b.salary)
									  from dept_emp a, salaries b
								     where a.emp_no = b.emp_no
									   and a.to_date = '9999-01-01'
									   and b.to_date = '9999-01-01'
								  group by a.dept_no)
order by b.salary desc;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요
select b.dept_no, avg(salary) as avg_salary
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.dept_no;

select *
from salaries a, dept_emp b, employees c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and a.to_date ='9999-01-01'
and b.to_date = '9999-01-01'
and (b.dept_no, a.salary) in (select b.dept_no, avg(a.salary) as avg_salary
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.dept_no);




-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no, concat(a.first_name, ' ', a.last_name) as 'name', c.dept_name, d.title
  from employees a, dept_manager b, departments c, titles d
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and a.emp_no = d.emp_no
   and b.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
   and d.title = 'manager';

-- 문제5.
-- 평균 연봉이 가장 높은 부서는? (부서 이름, 평균연봉)
select c.dept_name, avg(a.salary)
from salaries a, dept_emp b, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by c.dept_name;

select *
from salaries a, dept_emp b, departments c, (select c.dept_name, avg(a.salary)
from salaries a, dept_emp b, departments c
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
group by c.dept_name) d
where a.emp_no = b.emp_no 
and b.dept_no = c.dept_no
and c.dept_no = d.dept_no
and ;

-- 문제6.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select b.dept_no, max(a.salary) as max_salary
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.dept_no
order by max_salary desc
limit 0, 1;

select *
from employees a, titles b, salaries c, dept_emp d, (select b.dept_no, max(a.salary) as max_salary
from salaries a, dept_emp b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.dept_no
order by max_salary desc
limit 0, 1) e
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.emp_no = d.emp_no
and d.dept_no = e.dept_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and e.to_date = '9999-01-01'
and c.salary = d.max_salary;


-- 문제7.
-- 평균 연봉이 가장 높은 직책?
  select b.title, max(a.salary) as max_salary
	from salaries a, titles b
   where a.emp_no = b.emp_no
	 and a.to_date = '9999-01-01'
	 and b.to_date = '9999-01-01'
group by b.title
order by max_salary desc
   limit 0, 1;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
select *
from titles a, dept_emp b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01';