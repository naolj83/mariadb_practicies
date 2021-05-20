update pet set death = null;
update pet set death = '2000-01-01' where name = 'Bowser';

-- 테이블 삭제하기
drop table pet;

-- 테이블 만들기
create table pet(
	name    varchar(20),
    owner   varchar(20),
    species varchar(20),
    gender  char(1),
    birth   date,
    death   date);

-- scheme 확인
desc pet;

-- 조회
select name, owner, species, gender from pet;
select * from pet;
-- 데이터 넣기(생성, create)
insert into pet
values ('성탄이', '안대혁', 'dog', 'm', '2018-12-25', null);

-- 데이터 삭제(delete)
delete from pet
where name='성탄이';

-- 조회 연습1 : where
-- 1990년 이후에 태어난 아이들은?
select *from pet where birth > '1990-12-31';

-- Gwen과 함께 사는 아이들은?
select *from pet where owner = 'gwen';

-- null 다루기1 : 살아있는 애들은?
select * from pet where death is null;

-- null 다루기2 : 죽은 애들은?
select * from pet where death is not null;

-- like 검색(패턴 매칭) : 이름이 b로 시작하는 아이들은?
select * from pet where name like 'b%';

-- like 검색(패턴 매칭) : 이름이 b로 시작하는 아이들중에 이름이 6자인애??
select * from pet where name like 'b_____';

-- 집계(통계) 함수
select count(*) from pet; 

-- 조회 연습2 : order by (반드시 해야함) 
-- 나이가 어린순으로 정렬
select * from pet order by birth desc;

-- 나이가 어린순으로 정렬하고 생일이 같으면 이름순으로 다시 정렬
select * from pet order by birth desc, name asc;


