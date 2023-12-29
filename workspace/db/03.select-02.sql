-- 직원 급여 총액
select sum(sal) "급여총액"
from emp;

-- 수당 총액
select sum(comm) "수당총액"
from emp;

-- 급여총액, 수당총액, 지급총액
select 
    sum(sal) "급여총액", 
    sum(comm) "수당총액", 
    sum(sal) + sum(comm) "지급총액"
from emp;

-- 직원수 조회
select count(*), count(distinct empno) "직원수", count(comm) "직원수2"
from emp;

-- 급여평균
select 
    -- sum(sal) / count(sal) "급여평균1",
    round(sum(sal) / count(sal), 2) "급여평균2",
    ceil(sum(sal) / count(sal)) "급여평균3", 
    floor(sum(sal) / count(sal)) "급여평균4",
    round(avg(sal), 2) "급여평균5"
from emp;

-- 최저 및 최고 급여
select 
    min(sal) 최저급여,
    max(sal) 최고급여
from emp;

-- 최저 및 최고 급여 수령 직원
select *
from emp
-- where sal = min(sal) or sal = max(sal)
where 
    sal = (select min(sal) from emp) -- 부속 질의 ( subquery )
    or 
    sal = (select max(sal) from emp)
order by sal desc;

-- 직무별 급여 총액, 급여 평균, 최저급여, 최고급여 1
select distinct job from emp;
select 'CLERK' JOB, sum(sal), round(avg(sal), 2), min(sal), max(sal) from emp where job = 'CLERK'
UNION
select 'SALESMAN' JOB, sum(sal), round(avg(sal), 2), min(sal), max(sal) from emp where job = 'SALESMAN'
UNION
select 'PRESIDENT' JOB, sum(sal), round(avg(sal), 2), min(sal), max(sal) from emp where job = 'PRESIDENT'
UNION
select 'MANAGER' JOB, sum(sal), round(avg(sal), 2), min(sal), max(sal) from emp where job = 'MANAGER'
UNION
select 'ANALYSIT' JOB, sum(sal), round(avg(sal), 2), min(sal), max(sal) from emp where job = 'ANALYST';

-- 직무별 급여 총액, 급여 평균, 최저급여, 최고급여 2
select 
    job,
    -- ename, -- 오류 : group by 에 적용된 컬럼이 아니면 select 에 포함될 수 없습니다.
    sum(sal), round(avg(sal), 2), min(sal), max(sal)
from emp
group by job;

-- 직무별 급여 총액, 급여 평균, 최저급여, 최고급여 조회
-- 단, job이 president는 제외하고 평균급여가 2000 이상인 경우만 포함
select 
    job,
    sum(sal), round(avg(sal), 2), min(sal), max(sal)
from emp
where 
    job != 'PRESIDENT'
    -- AND AVG(SAL) >= 2000 -- 오류 : 집계함수를 WHERE절에 사용할 수 없습니다.
group by job
having avg(sal) >= 2000;