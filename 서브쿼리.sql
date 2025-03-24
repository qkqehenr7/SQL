# 1
select title
from rent_master rm
join rent_book rb using (rm_idx)
where rb.reg_date = '2023-06-18';

select * from rent_master;
select * from board;
select * from book;
select * from rent_book;

# 2
select author
from rent_book rb
join book b using (bk_idx)
where rb.RETURN_DATE = '2023-06-30';

# 3
select title
from rent_book rb
join book b using (bk_idx)
where b.RENT_CNT > 1 and rb.REG_DATE = '2023-06-28';

# 4 ??
select *
from rent_book rb
join book b using (bk_idx)
join rent_master rm using (rm_idx)
where rb.STATE = 'RE01';

# 5
select title
from rent_book rb
join book b using (bk_idx)
where rb.REG_DATE = rb.RETURN_DATE;

# 6
select AUTHOR 
from book b
join rent_book rb on (b.bk_idx = rb.bk_idx)
where rb.REG_DATE = '2023-06-07' and rb.return_date = '2023-06-11';

# 7
select title
from book b
join rent_book rb on (b.bk_idx = rb.bk_idx)
where rb.REG_DATE = '2023-06-15';

# 8 ?? 6월 30일에 대출 도서가 1개뿐임
select * from rent_book;
select * from rent_master;
select * from book;

select *
from book b
join rent_book rb on (b.bk_idx = rb.bk_idx);
where rb.reg_date = '2023-06-30';

# 9
select title, rent_cnt
from book
where bk_idx in (
	select bk_idx
	from rent_book
	where reg_date
	between '2023-06-01' and '2023-06-30'
) and (
	select avg(rent_cnt)
	from book b
);

# 10?? 문제 이해못함 상태가 뭐임 ?
select *
from rent_book rb
join rent_master rm using (rm_idx)
where state = 'RE02';

# 11
select title, length(content) as content_length
from board
order by content_length desc
limit 1;

# 12
select user_id, count(user_id) as post_count
from board
group by user_id
order by post_count desc

# 13
select title, reg_date
from board
where reg_date = (
	select reg_date
	from board
	order by reg_date desc
	limit 1
);

# 14
select user_id, reg_date
from member_info
where reg_date = (
	select reg_date
	from member_info
	order by reg_date
	limit 1
);

# 15
select user_id, avg(length(content)) as avg_length
from board
group by user_id
order by avg_length desc
limit 1;

# 16
select user_id, count(user_id) as post_count
from board
group by user_id
order by post_count desc
limit 1;

# 17
select user_id, count(user_id) as post_count
from board
group by user_id
order by post_count desc;

# 18
select sum(book_amt) as 카테고리수필권수 from book
group by category
having category = 'B003';

# 19
select user_id, reg_date
from member_info
where reg_date = (
	select reg_date
	from member_info
	order by reg_date desc
	limit 1
);

# 20 ??
select user_id, content, view_cnt
from board
where user_id = (
	select user_id
	from member_info
	order by leave_date is null, leave_date
	limit 1	
)
order by view_cnt desc
limit 1;

