-- procedure
-- procedure : 일련의 sql 작업을 수행
--			   값 반환 (X), out 변수를 통해 값을 반환할 수는 있다.
-- function : 일련의 sql 작업을 수행. 입력값을 받아서 결과값을 반환

-- 변수선언
-- @변수명 : 전역변수
-- declare 변수명 타입 : 지역변수
-- 조건문 : if then elseif then else and if;
-- 반복문


drop function fn_sal_grade;

delimiter $$
create function fn_sal_grade(salary int)
returns varchar(2) deterministic
begin
	declare grade varchar(2);
	if salary >= 6000000 and salary <= 10000000 then set grade = 'S1';
	elseif salary >= 5000000 then set grade = 'S2';
	elseif salary >= 4000000 then set grade = 'S3';
	elseif salary >= 3000000 then set grade = 'S4';
	elseif salary >= 2000000 then set grade = 'S5';
	else set grade = 'S6';
	end if;
	return grade;
end
$$

delimiter ;





select emp_name, salary, fn_sal_grade(salary)
from employee

drop function q2;

-- 부서가 위치한 국가가 한국이나 일본인 사원 중 가장 연봉이 높은 사원의 연봉을 반환하는 함수
delimiter $$
create function q2()
returns int deterministic
begin
	declare max_sal int;

	select max(e.salary) into max_sal
	from employee e
	join department d on (e.dept_code = d.dept_id)
	join location l on (l.local_code = d.location_id)
	join national n using (national_code)
	where n.national_name in ('한국', '일본');
	return max_sal;

end
$$

delimiter ;

select q2();


delimiter $$
create procedure sp_sum_repeat(from_num int, to_num int)
begin
	declare res int default 0;
	repeat
	set from_num = from_num + 1;
	set res = res + from_num;
	until from_num >= to_num
	end repeat;
	select res;
end
$$

delimiter ;
call sp_sum_repeat(0, 10)


delimiter $$
create procedure sp_sum_while(from_num int, to_num int, out res int)
begin
	declare tmp int default 0;
	while from_num < to_num
	do
		set from_num = from_num + 1;
		set tmp = tmp + from_num;
	end while;
	set res = tmp;
end
$$

delimiter ;

call sp_sum_while(1, 11, @res);
select @res;

