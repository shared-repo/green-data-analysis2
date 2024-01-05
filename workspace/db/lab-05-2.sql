-- hr 계정으로 실행

-- HR 부서의 어떤 사원은 급여정보를 조회하는 업무를 맡고 있다. 
-- Tucker 사원보다 급여를 많이 받고 있는 사원의 이름과 성(Name으로 별칭), 업무, 급여를 출력하시오
select 
    e.first_name || ' ' || e.last_name name,
    e.job_id,
    e.salary
from employees e1
where e1.salary > (select e2.salary 
                   from employees e2
                   where e2.last_name = 'Tucker');

-- 사원의 급여 정보 중 업무별 최소 급여를 받고 있는 사원의 이름과 성(Name으로 별칭), 업무, 급여, 입사일을 출력하시오
select 
    e1.first_name || ' ' || e1.last_name name,
    e1.job_id,
    e1.salary
from employees e1
-- where e1.salary = ( 현재 조회중인 사원이 속한 업무의 최소 급여 )
-- where e1.salary = ( 현재 처리중인 e1의 행이 속한 업무의 최소 급여 )
where e1.salary = ( select min(e2.salary) 
                    from employees e2
                    where e2.job_id = e1.job_id );

select 
    e1.first_name || ' ' || e1.last_name name,
    e1.job_id,
    e1.salary
from employees e1
-- where e1.salary = ( 현재 조회중인 사원이 속한 업무의 최소 급여 )
-- where e1.salary = ( 현재 처리중인 e1의 행이 속한 업무의 최소 급여 )
where (e1.job_id, e1.salary) in ( select e2.job_id, min(e2.salary) 
                                  from employees e2
                                  group by e2.job_id );

-- 소속 부서의 평균 급여보다 많은 급여를 받는 사원의 이름과 성(Name으로 별칭), 급여, 부서번호, 업무를 출력하시오
select 
    e1.first_name || ' ' || e1.last_name name,
    e1.department_id,
    e1.job_id,
    e1.salary
from employees e1
where e1.salary > ( select avg(e2.salary) 
                    from employees e2
                    where e2.department_id = e1.department_id );

-- 사원들의 지역별 근무 현황을 조회하고자 한다. 
-- 도시이름이 영문 ‘O’로 시작하는 지역에서 근무하는 사원의 사원번호, 이름과 성(Name으로 별칭), 업무, 입사일을 출력하시오
select 
    e1.employee_id,
    e1.first_name || ' ' || e1.last_name name,
    e1.job_id,
    e1.hire_date
from employees e1
where e1.department_id = ( select d.department_id
                           from departments d, locations l
                           where d.location_id = l.location_id 
                                 and 
                                 l.city like 'O%' );
                                 
select 
    e1.employee_id,
    e1.first_name || ' ' || e1.last_name name,
    e1.job_id,
    e1.hire_date
from employees e1, departments d, locations l
where e1.department_id = d.department_id
      and d.location_id = l.location_id 
      and l.city like 'O%';

-- 모든 사원의 소속부서 평균연봉을 계산하여 사원별로 이름과 성(Name으로 별칭), 업무, 급여, 부서번호, 부서평균연봉(Department Avg Salary로 별칭)을 출력하시오
select 
    e1.first_name || ' ' || e1.last_name name,
    e1.job_id,
    e1.department_id,
    e1.salary,
--    현재 처리중인 e1의 행이 속한 부서의 평균 급여
    ( select round(avg(salary), 0)
      from employees e2
      where e2.department_id = e1.department_id ) 부서평균급여
from employees e1;









