-- 함수 : 날짜 함수

-- CURDATE(), CURRENT_DATE
select CURDATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME
select CURTIME(), CURRENT_TIME;

-- now랑 CURTIME(), CURRENT_TIME은 별 차이 없음

-- now() vs sysdate()
select now(), sysdate();
select now(), sleep(2), now(); -- 쿼리가 들어갔을 때 시간(일정)
select now(), sleep(2), sysdate(); -- sysdate은 쿼리 때릴때마다 그래서 다름

-- date_format(date, format)
select date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s초');
select date_format(now(), '%Y년 %c월 %d일 %h시 %i분 %s초');

-- period_diff
-- YYMM, YYYYMM
-- 예제 : 근무 개월 수를 출력
select first_name,
	   period_diff(date_format(curdate(), '%Y%m'), date_format(hire_date,'%Y%m'))
from employees;

-- date_add(= adddate), date_sub(subdate)
-- 날짜 date에 type(day, month, year) 형식으로 expr값을 더하거나 뺀다
-- 예제 : 각 사원들의 근무 년 수가 5년이 되는 날은 언제 인가요?
select first_name, hire_date,
	   date_add(hire_date, interval 5 year)
from employees;

-- cast
select cast('2021-05-07' as date);
select cast('12345' as int) + 10;
select now(), cast(now() as date);
select cast(1-2 as unsigned);
select cast(cast(1-2 as unsigned) as signed);

-- mysql type
-- varchar(공간 가변, 공간 낭비X), char(공간 고정) - 크기 2000정도, < text(크기 5000정도), CLOB
-- signed(unsigned) int(integer), mediun int, big int, int(11)
-- float, double
-- time, date, datetime
-- LOB(Large OBject) : CLOB, BLOB(이미지)

