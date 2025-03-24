# 1
select bk_idx, isbn, title, rent_cnt
from book
where rent_cnt >= 20;

# 2
select bk_idx, isbn, title, reg_date
from book
where reg_date > '2020-06-20';

# 3
select bk_idx, isbn, title, rent_cnt
from book
where category = 'B001' and rent_cnt = 8;

# 4
select bk_idx, isbn, title, author
from book
where author = '혜민 지음';

# 5
select title
from book
where title like '%소설%';

# 6
select bk_idx, isbn, title, author, reg_date, rent_cnt
from book
where reg_date < '2020-04-15' and rent_cnt <= 10;

# 7
select bk_idx, isbn, title, author, reg_date, rent_cnt
from book
where title like '나는%';

# 8
select category, avg(rent_cnt) as '평균 대출건수', sum(rent_cnt) as '총 대출건수'
from book
group by category;

# 9
select bk_idx, isbn, title, author, reg_date, rent_cnt
from book
order by rent_cnt desc
limit 0, 5;

# 10
select bk_idx, isbn, title, author, reg_date, rent_cnt
from book
where category = 'B002'
order by reg_date desc;

# 11
select *
from member
where grade = 'ROLE_USER'
order by user_id;

# 12
select *
from member
where grade = 'ROLE_ADMIN' and is_leave = 0;

# 13
select grade, count(grade)
from member
group by grade;

# 14
select *
from member
where grade = 'ROLE_USER' and tell like '%9';

# 15
select email
from member
where grade = 'ROLE_ADMIN' and is_leave = 0;

# 16
select *
from member
where grade = 'ROLE_USER' and is_leave = 0 and tell like '____4%' and user_id like 'E%';

# 17
select *
from board
where title like '%철학%' or content like '%철학%';

# 18
select *
from board
order by view_cnt desc
limit 10;

# 20??
select *
from board
where view_cnt >= 30 and a

# 21
select bk_idx, title, author,
case
	when category like 'B0%' then '문학'
	when category like 'B1%' then '전문서적'
	end as '대분류'
from book;

# 23
select *
from rent_book
where state = 'RE01';

# 24
select title
from rent_master
where rent_book_cnt >= 2;

# 25
select bk_idx, isbn, title, reg_date
from book
where reg_date between '2020-06-25' and '2020-06-30';

# 26 ??
select *
from member_info
where leave_date between '2023-11-01' and '2023-11-30';