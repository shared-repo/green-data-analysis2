-- hr 계정으로 작업 수행
select 'abc' || ' ' || 'def' from dual;

-- 테이블 탐색

-- 사원정보(Employees) 테이블에서 사원번호, 이름, 급여, 업무, 입사일, 상사의 사원번호를 출력하시오. 
-- 이때 이름은 이름과 성을 연결하여 Name이라는 별칭으로 출력하시오
select 
    employee_id
    , first_name || ' ' || last_name as Name
    , salary
    , job_id
    , hire_date
    , manager_id
from 
    employees;

-- 사원정보(Employees) 테이블에서 사원의 이름과 성은 Name, 업무는 Job, 급여는 Salary, 
-- 연봉에 $100 보너스를 추가하여 계산한 값은 Increase Ann_Salary, 
-- 급여에 $100 보너스를 추가하여 계산한 연봉은 Increase Salary라는 별칭을 붙여 출력하시오
select 
    first_name || ' ' || last_name as Name,
    job_id job,
    salary,
    salary * 12 + 100 "Increase Ann Salary",
    (salary + 100) * 12 "Increase Salary"
from employees;

-- 사원정보(Employees) 테이블에서 모든 사원의 성(last_name)과 연봉을 
-- “성: 1 Year Salary = $연봉” 형식으로 출력하고, 1 Year Salary라는 별칭을 붙여 출력하시오
select 
    last_name || ': 1 Year Salary = $' || salary * 12 as "1 Year Salary"
from employees;

-- 부서별로 담당하는 업무를 한 번씩만 출력하시오
select distinct department_id, job_id 
from employees
order by department_id;

-- HR 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 
-- 사원정보(Employees) 테이블에서 급여가 $7,000~$10,000 범위 이외인 사람의 
-- 이름과 성(Name으로 별칭) 및 급여를 급여가 적은 순서로 출력하시오
select 
    first_name || ' ' || last_name Name,
    salary
from employees
where salary not between 7000 and 10000
order by salary asc;

-- 사원의 성(last_name) 중에 ‘e’ 및 ‘o’ 글자가 포함된 사원을 출력하시오. 
-- 이때 머리글은 ‘e or o Name’이라고 출력하시오
select last_name "e or o Name"
from employees
where last_name like '%e%' or last_name like '%o%';

-- 2006년 05월 20일부터 2007년 05월 20일 사이에 고용된 사원들의 
-- 이름과 성(Name으로 별칭), 업무, 입사일을 출력하시오. 
-- 단, 입사일이 빠른 순으로 정렬하시오
select 
    first_name || ' ' || last_name Name,
    job_id,
    hire_date
from employees
where hire_date between '2006-05-20' and '2007-05-20'
order by hire_date asc;

-- HR 부서에서는 급여(salary)와 수당율(commission_pct)에 대한 지출 보고서를 작성하려고 한다. 
-- 수당을 받는 모든 사원의 이름과 성(Name으로 별칭), 급여, 업무, 수당율을 출력하시오. 
-- 이때 급여가 큰 순서대로 정렬하되, 급여가 같으면 수당율이 큰 순서대로 정렬하시오
select 
    first_name || ' ' || last_name Name,
    salary,
    job_id,
    commission_pct 
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;


