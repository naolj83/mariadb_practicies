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
SELECT 
    a.emp_no as '사원번호',
    CONCAT(a.first_name, ' ', a.last_name) as '이름',
    d.dept_name as '부서',
    b.salary as '연봉'
FROM
    employees a,
    salaries b,
    dept_emp c,
    departments d,
    (SELECT 
        c.dept_no, max(b.salary) AS max_salary
    FROM
        employees a, salaries b, dept_emp c
    WHERE
        a.emp_no = b.emp_no
            AND a.emp_no = c.emp_no
            AND b.to_date = '9999-01-01'
            AND c.to_date = '9999-01-01'
    GROUP BY c.dept_no) e
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND c.dept_no = e.dept_no
        AND b.salary = e.max_salary
        AND e.dept_no = d.dept_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
ORDER BY b.salary DESC;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요
select a.emp_no, concat(a.first_name, ' ', a.last_name) as '이름', b.salary as '연봉'
from employees a, salaries b, dept_emp c, 
 (select c.dept_no, avg(b.salary) as avg_salary
    from employees a, salaries b, dept_emp c
   where a.emp_no = b.emp_no
	 and b.emp_no = c.emp_no
	 and b.to_date = '9999-01-01'
	 and c.to_date = '9999-01-01'
group by c.dept_no) d
where a.emp_no = c.emp_no
and b.emp_no = c.emp_no
and c.dept_no = d.dept_no
and b.salary > d.avg_salary
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01';

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.   
SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name) as name,
    CONCAT(d.first_name, ' ', d.last_name) as manage_name,
    e.dept_name
FROM
    employees a,
    dept_emp b,
    dept_manager c,
    employees d,
    departments e
WHERE
    a.emp_no = b.emp_no
        AND b.dept_no = c.dept_no
        AND d.emp_no = d.emp_no
        AND c.dept_no = e.dept_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01';


-- 문제5.
-- 평균 연봉이 가장 높은 부서는? (부서 이름, 평균연봉)
  select b.dept_no, c.dept_name as '부서이름', round(avg(a.salary)) as avg_salary
	from salaries a, dept_emp b, departments c
   where a.emp_no = b.emp_no
     and b.dept_no = c.dept_no
	 and a.to_date ='9999-01-01'
	 and b.to_date = '9999-01-01'
group by b.dept_no
order by avg_salary desc
   limit 0, 1;

-- 문제6.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select a.emp_no, concat(a.first_name, ' ', a.last_name) as '이름', b.title, c.salary
from employees a, titles b, salaries c, dept_emp d
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and a.emp_no = d.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and d.dept_no = (select a.dept_no 
				 from
				  (select b.dept_no, avg(a.salary) as avg_salary
					 from salaries a, dept_emp b
					where a.emp_no = b.emp_no
					  and a.to_date = '9999-01-01'
					  and b.to_date = '9999-01-01'
				 group by b.dept_no
				 order by avg_salary desc
					 limit 0, 1) a)
order by c.salary desc;

-- 문제7.
-- 평균 연봉이 가장 높은 직책?
   select round(avg(b.salary)) as avg_salary, c.title
	from employees a, salaries b, titles c
   where a.emp_no = b.emp_no
	 and b.emp_no = c.emp_no
	 and b.to_date = '9999-01-01'
	 and c.to_date = '9999-01-01'
group by c.title
order by avg_salary desc
   limit 0, 1;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
SELECT 
    f.dept_name AS '부서이름',
    a.first_name AS '사원이름',
    d.salary AS '연봉',
    g.first_name AS '매니저 이름',
    e.salary AS '매니저 연봉'
FROM
    employees a,
    dept_emp b,
    dept_manager c,
    salaries d,
    salaries e,
    departments f,
    employees g
WHERE
    a.emp_no = b.emp_no
        AND c.dept_no = b.dept_no
        AND a.emp_no = d.emp_no
        AND c.emp_no = e.emp_no
        AND c.dept_no = f.dept_no
        AND c.emp_no = g.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND e.to_date = '9999-01-01'
        AND d.salary > e.salary;