# 1
select user_id, email, reg_date, title, content 
from board b
join member m using (user_id);

# 2
select user_id, email, grade, title, content 
from board b
join member m using (user_id)
where is_del = 0;

# 3
select user_id, grade, title, content
from board b
join member m using (user_id)
where user_id = 'Socrates';

# 4
select user_id, email, grade
from member m
join member_info mi using (user_id)
where leave_date like '2023-12%';

# 5 ?? 대출 도서수 말하는거 맞나?
select user_id, rent_book_cnt
from rent_master rm
where title like '디디%';

# 6 ??
select rm_idx, user_id, mi.reg_date, title
from member_info mi
join rent_master rm using (user_id)
where mi.reg_date > '2023-06-10';

# 7
select rm_idx, user_id, title, reg_date
from rent_master rm
join member m using (user_id)
where grade = 'ROLE_USER' and is_return = 0;

# 8
select user_id, email, rent_book_cnt
from rent_master rm
join member m using (user_id)
where rent_book_cnt >= 2;

# 9
select rb_idx, user_id, title, return_date
from rent_book rb
join rent_master rm using (rm_idx)
where datediff(return_date, rb.reg_date) <= 3;

# 10
select user_id, email, rent_book_cnt
from rent_master rm
join member m using (user_id)
where is_leave = 0
and rent_book_cnt = (
	select rent_book_cnt
	from rent_master
	order by rent_book_cnt desc
	limit 1
);

# 11
select rm_idx, user_id, title, rm.reg_date, info
from rent_master rm
join rent_book rb using (rm_idx)
join code c on (rb.state = c.code)
where info = '연체'
group by rm_idx;

# 12 - 연체 오타인가?
select rb_idx, user_id, b.title, return_date
from rent_book rb
join book b using (bk_idx)
join rent_master using (rm_idx)
join code c on (rb.state = c.code)
where return_date < '2023-06-15' and c.info = '연체';

# 13 - 예시대로 나오려면 연체한 이력이 있는 회원을 조회해야 함
select user_id, email, info
from rent_book rb
join rent_master rm using (rm_idx)
join member m using (user_id)
join code c on (c.code = rb.state)
where grade = 'ROLE_USER' and info != '연체';

# 14
select rm_idx, user_id, title, rm.reg_date
from rent_master rm
join rent_book rb using (rm_idx)
where state = 'RE01'
and rm.reg_date = (
	select reg_date
	from rent_master
	order by reg_date
	limit 1
);

# 15
select * from rent_master;
select * from rent_book;
select * from book;
select * from member;

select category, sum(book_amt)
from book b
group by category;

# 16
select code, upper_code, info
from code
where code like 'B00%';

# 17
select user_id, rent_book_cnt
from member_info mi
join rent_master rm using (user_id)
where login_date between '2023-12-01' and '2023-12-31';

# 18
select count(*) as overdue_count
from rent_book rb
join book b using (bk_idx)
join code c on (rb.state = c.code)
where c.info = '연체';

# 19 - 0개인 책은?
select sum(book_amt) as 도서재고, c.info
from book b
join code c on (b.category = c.code)
group by info;

# 20
select title, c1.info, c2.info
from book b
join code c1 on (b.category = c1.code)
join code c2 on substr(b.category, 1, 2) = c2.code;