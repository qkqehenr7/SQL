# group by
# 특정 컬럼을 기준으로 grouping을 하기 위해 사용
# group by 컬럼명 [, 컬럼명]
# having 조건절
# having 조건절에서는 집계함수를 사용할 수 있다.

# sum, count, avg, max, min
select sum(salary), count(salary), avg(salary),
max(salary), min(salary)
from employee;

# 부서별 급여의 총합, 평균, max, min
select dept_code, sum(salary), avg(salary),
max(salary), min(salary)
from employee
group by dept_code;

# 부서내 직급별 총합, 평균, max, min
# group by로 지정한 column만 조회가능
select dept_code, job_code, sum(salary), avg(salary),
max(salary), min(salary)
from employee
group by dept_code, job_code;

# having 절
# group by에 지정된 group에 대한 조건절
select dept_code, sum(salary), avg(salary),
max(salary), min(salary)
from employee
group by dept_code
having avg(salary) >= 3000000;
# where avg(salary) >= 3000000 처럼 where절에서는 avg와 같은 집계함수 사용불가


# where 절의 우선순위가 높기 때문에 where 이후 데이터에서 grouping과 집계함수가 실행됨
select dept_code, sum(salary)
from employee
where ent_yn = 'Y'
group by dept_code;

select dept_code, sum(salary)
from employee
group by dept_code;

# rollup, grouping
# 그룹별 중간 집계와 총 집계를 조회
select dept_code, job_code, sal_level,
sum(salary), avg(salary)
from employee
group by dept_code, job_code, sal_level
with rollup
order by
dept_code is null asc,
job_code is null asc,
sal_level is null asc,
dept_code asc,
job_code asc,
sal_level asc;

# grouping
# 해당 행의 집계연산에 포함된 컬럼이면 0, 아니면 1
select dept_code, job_code, sal_level,
grouping(dept_code),
grouping(job_code),
grouping(sal_level),
sum(salary), avg(salary)
from employee
group by dept_code, job_code, sal_level
with rollup
order by
dept_code is null asc,
job_code is null asc,
sal_level is null asc,
dept_code asc,
job_code asc,
sal_level asc;