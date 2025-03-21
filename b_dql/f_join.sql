# join
# 데이터 중복을 최소화하고 이상현상을 방지하기 위해 테이블을 설계하는 과정에서
# 연관된 데이터를 분리하여 저장
# 서로 연관된 데이터였으나 분리되어 저장된 테이블을 결합하여 조회할 때 사용

# 서브쿼리와 동일한 동작을 하는 쿼리를 작성하면 성능상의 문제를 최소화 할 수 있다.

# 모든 직원의 이름, 부서명을 조회
select emp_name,
(select dept_title from department where e.dept_code = dept_id) as '부서명'
from employee e ;

# employee와 department을 합치고 싶다! 근데 뭘 기준으로 합치지? > join
select * from employee;
select * from department;

select *
from employee e
join department d on (e.dept_code = d.dept_id);

# join
# cross join
# inner join
# outer join
#	left join
#	right join
#	full outer join - MySQL에서는 지원 X

# cross join : 쓰지 말자.
# join 조건절이 무조건 참인 join
# 30만개의 상품 데이터와 300만개의 주문데이터를 cross join
# 	=> 9천억개의 행을 가진 result set
select *
from employee
cross join department; # 23*9 = 201 row

# inner join (equals join, 등가조인)
# inner join => join 이라고 씀

# 사번 이름 직급명을 조회
select emp_id, e.job_code, emp_name, job_name # 식별자를 붙이지 않으면 에러 발생
from employee e
join job j on (e.job_code = j.job_code);

# using
select emp_id, job_code, emp_name, job_name
from employee e
join job j using (job_code); # column의 이름이 서로 같은 경우 using으로 대체 가능. 

# 여러 테이블 join 하기
# 모든 사원들의 사번, 이름, 부서명, 근무지를 출력
select emp_id, emp_name, dept_title, local_name
from employee e
join department d on (e.dept_code = d.dept_id)
join location l on (d.location_id = l.local_code);

# ASIA 지역에서 근무하는 사원 중 급여가 500만원 미만인 모든 사원을 조회하시오.
SELECT *
FROM employee e
JOIN location l ON () 

SELECT * FROM location;
select * from employee;
select * from department;

select emp_id, salary, local_name 
from department d
join location l on (d.LOCATION_ID = l.LOCAL_CODE)
join employee e on (d.DEPT_ID = e.dept_code)
where local_name like 'ASIA%' and salary < 5000000;

# outer join
# 특정 행의 모든 join 조건식이 false를 반환하더라도 result set에 추가
# left join
select emp_id, emp_name, dept_title
from employee e
left join department d on (e.dept_code = d.dept_id);

# right join
select emp_id, emp_name, dept_title
from employee e
right join department d on (e.dept_code = d.dept_id);

# self join
# employee 테이블에서 매니저 이름을 조회하는 쿼리를 작성하시오.
select emp_name, manager_id,
(select emp_name from employee where emp_id = e.manager_id) as '매니저 이름'
from employee e;

select e.emp_name, e.manager_id, e2.emp_name
from employee e
left join employee e2 on (e.manager_id = e2.emp_id);

