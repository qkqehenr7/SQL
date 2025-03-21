# function
# 1. 문자 관련 함수
# length, char_length, instr, substr, concat, replace, trim, lpad, rpad

# 1. length
select length('text');
select length('텍스트'); # 한글 한글자당 3바이트

# 2. substr
select substr('programmers', 2); # 2번째부터 남기기
select substr('programmers', 2, 5); # 2번째부터 5개만 남기기

select substr('programmers' from 2);
select substr('programmers' from 2 for 5);

# employee 테이블에서 남자인 직원을 조회하시오.
# 남자여부
select *
from employee
where emp_no like '%-1%' or emp_no like '%-3%';

select emp_id, emp_no
from employee
where substr(emp_no, 8, 1) in (1, 3);

# concat
select concat('pro', 'gram', 'mers');

# concat_ws
select concat_ws('!', 'pro', 'gram', 'mers');

# instr : 지정한 문자열에서 특정 문자가 처음으로 등장하는 인덱스 반환
select instr('programmers', 'r'); 

# locate : 지정한 인덱스 이후로 지정한 문자가 등장하는 인덱스 반환
select locate('r', 'programmers'); # instr과 같음
select locate('r', 'programmers', 6);

# replace : 지정한 문자열에서 특정 부분을 새로운 문자열로 대체
select replace('programmers', 'mers', '!');

# trim
select length(trim('    programmers    '))
, trim('   programmers   ');

# 문자열 앞에 지정된 문자 삭제
select trim(leading 'x' from 'xxxprogramersxxx');

select trim(trailing 'x' from 'xxxprogramersxxx');

select trim(both 'x' from 'xxxprogramersxxx'); # both는 생략 가능

select trim(trailing from '   programmers   ');

# pad : 지정 문자열의 길이가 될 떄까지 채우기
select lpad('program', 11, 'hi');
select rpad('program', 11, 'mers');
select lpad('program', 11, ' ');

# employee 테이블에서 사원명과 주민번호를 조회하시오.
# 단 주민번호의 뒤 8자리는 * 로 마스킹처리 해주세요.
SELECT emp_name, RPAD(SUBSTR(emp_no, 1, 7), 14, '*')
from employee;

SELECT emp_name, replace(emp_no, substr(emp_no,8), '*******')
from employee;

# 숫자 관련 함수
# abs, mod, floor, ceil, round, truncate
select abs(-22);
select mod(777, 10);
select floor(99.99999);
select floor(-99.99999);
select ceil(99.99999);
select ceil(-99.99999);
select round(99.99);
select round(93.99, -1);
select truncate(87.001, 0);
select truncate(87.001, -1);

# 날짜 관련 함수
# now, datediff, date_add, date_sub, year, month, date
select now(); # from dual 생략됨
select sysdate();
select curdate();

# datediff
# employee 테이블에서 사원들의 근무일자를 조회
select emp_name, datediff(now(), hire_date) as '근속일자'
from employee e 
where ent_yn = 'N';

# date_add
select date_add(now(), interval 1 day);
# 현재 시간에서 5분 10.0001초를 더한 시간을 구해보자
select date_sub(now(), interval '5:10.0001' minute_microsecond);

select NOW(),
YEAR(now()),
month(now()),
dayofweek(now()),
hour(now()),
minute(now()),
second(now());

# 형변환 함수
select cast('2025-03-21' as date) > '90-03-21';
select cast('2025-03-21 1:1:1.1111111' as datetime(3));
select cast('9999.99' as double);
select cast('9999.99' as decimal(6,2));
select cast('1979년' as year);

# case-when-then
# case
# when 조건식 then 표현식
# ...
# else 표현식
# end 별칭

# 급여레벨
select emp_name, salary,
case
	when salary >= 6000000 and salary <= 10000000 then 'S1'
	when salary >= 5000000 then 'S2'
	when salary >= 4000000 then 'S3'
	when salary >= 3000000 then 'S4'
	when salary >= 2000000 then 'S5'
	when salary >= 1000000 then 'S6'
	else 'S7'
end as '급여레벨'
from employee;


