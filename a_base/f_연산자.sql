# 산술연산자
# +, -, *, /
select 10 + 10;
select 10 - 10;
select 10 * 10;
select 10 / 3;

# 비교연산자
# <, >, <=, >=, =, [!=, <>]
select 20 < 10;
select 20 > 10;
select 20 <= 10;
select 20 >= 10;
select 20 = 10;
select 20 <> 10;
select date('90-01-01') > date('25-03-20');

# 논리연산자
# not, and, or
select true and true;
select not false and true; # not의 연산 우선순위가 and 보다 높다.
select false or false;
select true or false;