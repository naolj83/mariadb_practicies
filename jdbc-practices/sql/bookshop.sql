-- scheme 확인
desc author;
desc book;

-- Author : insert
insert into author values(null, '원수연');

-- Author : select
select no, name from author;

-- Book  : insert
insert into book values(null, '풀하우스', '대여가능', 1);

-- Book : select
select * from book;