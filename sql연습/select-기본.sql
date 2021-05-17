-- select 연습
select *from departments;
select dept_no, dept_name from departments;

-- alias(as, 생략가능)
--  예제 :  employees 테이블에서 직원의 전체이름, 성별 , 입사일 출력
select *from employees;
select first_name as name, gender as 성별, hire_date as 입사일 from employees;

-- concat
-- 예제 : employees 테이블에서 직원의 전체이름, 성별 , 입사일 출력
select concat(first_name, ' ', last_name) as 전체이름, gender as 성별, hire_date as 입사일 from employees;

-- distict
-- 예제 1 : titles 테이블에서 모든 직급의 이름 출력
select *from titles;

-- 예제 2: titles 테이블에서 직급은 어떤 것들이 있는지 직급이름을 한 번씩만 출력
select distinct(title) from titles;

-- where 절 #1 : 산술 비교 연산자
-- 예제 : employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select first_name, gender, hire_date 
from employees 
where hire_date < '1991-01-01';

-- where 절 #2 : 논리 연산자
-- 예제 : employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
select *
from employees
where hire_date < '1989-01-01'
and gender = 'f';

-- where 절 #3 : in 연산자   
-- 예제 : dept_emp 테이블에서`  
select emp_no, dept_no
from dept_emp
where dept_no ='d005'
or dept_no = 'd009'; 

select emp_no, dept_no
from dept_emp
where dept_no in ('d005', 'd009'); 

-- where 절 #4 : LIKE 검색  
-- 예제 : employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력 
-- 논리연산자 and 사용
select first_name, hire_date
from employees
where '1988-12-31' < hire_date
and hire_date < '1990-01-01';

-- between 사용
select first_name, hire_date
from employees
where hire_date 
between '1988-12-31' and '1990-01-01';

-- like 사용
select first_name, hire_date
from employees
where hire_date like '1989-%';

-- order by 절 #1
-- 예제 1 : employees 테이블에서 남자 직원의 전체이름, 성별, 입사일을 입사일 순(선임부터)으로 출력
select first_name, gender, hire_date
from employees
where gender = 'm'
order by hire_date asc;

-- 예제 2 : salaries 테이블에서 직원들의 사변, 월급을 사번, 월급 순으로 출력
-- 한 명의 직원의 월급 히스토리 보여줌
select emp_no, salary, from_date, to_date
from salaries
order by emp_no asc;

-- 같은 사번 안에서 월급 내림차순으로
select emp_no, salary
from salaries
order by emp_no asc, salary desc;