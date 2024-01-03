-- 테이블 목록 보기
select * from tab; -- 모든 테이블 표시
select table_name from user_tables;

-- 테이블 구조 정보 (컬럼 정보)
desc emp;
desc dept;

-- 테이블 내용 조회
select * from emp;
select * from dept;

-- emp 테이블의 모든 컬럼 데이터 조회
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

select * -- * : 모든 컬럼
from emp;

-- emp 테이블에서 empno, ename, job, hiredate, sal 컬럼 데이터 조회
select empno, ename, job, hiredate, sal
from emp;

-- emp 테이블에서 부서 정보 조회 ( 어떤 부서가 있는지 알고 싶어서 )
select deptno from emp; -- 모든 행 조회
select distinct deptno from emp; -- 중복 제거 조회

-- emp 테이블에서 부서, 업무 정보 조회 ( 어떤 부서와 업무가 있는지 알고 싶어서 )
select /* all */ deptno, job from emp;
select distinct deptno, job from emp;

-- 직원별 annual salary (sal * 12 + comm) 조회
select * from emp;
select comm, nvl(comm, 0) from emp; -- nvl : null -> 특정 값으로 변경
select empno, ename, sal*12+nvl(comm, 0) as annsal from emp; -- 별칭(alias) 지정
select empno, ename, sal*12+nvl(comm, 0) annsal from emp;

-- 직원별 annual salary (sal * 12 + comm) 높은직원-> 낮은직원순으로 조회
select empno, ename, sal*12+nvl(comm, 0) annsal 
from emp
order by annsal desc; -- asc :오름차순, desc: 내림차순

-- 입사일자가 빠른 순으로 직원 조회
select * from emp order by hiredate asc;

-- 업무별, 급여순으로 직원 조회
select * from emp order by job asc, sal desc; -- 2개 컬럼 기준 정렬 (1차정렬, 2차정렬)

-- *************************

-- 모든 직원 조회
select * from emp;

-- 부서번호가 30인 직원 조회
select * from emp where deptno = 30;

-- 부서번호가 30인 부서이름 조회
desc dept;
select * from dept where deptno = 30;

-- 사원번호가 7782인 직원 조회
desc emp;
select * from emp where empno = 7782;

-- 부서번호가 30이고 담당업무가 SALESMAN 직원 조회
select * 
from emp
where deptno = 30 and job = 'SALESMAN'; -- 문자열과 날짜는 작은따옴표로 표시

-- 담당업무가 SALESMAN 이면서 급여가 1500이상인 직원 조회
select *
from emp
where job = 'SALESMAN' and sal >= 1500;

-- 사번이 7499이면서 30번 부서 소속인 직원
select *
from emp
where empno = 7499 and deptno = 30;

-- 연봉이 20000이상인 직원 조회
select *
from emp
where sal * 12 >= 20000;

-- 급여가 3000인 직원
select *
from emp
where sal = 3000;

-- 급여가 3000이 아닌 직원
select *
from emp
-- where sal != 3000;
-- where sal <> 3000;
where not (sal = 3000);

-- 입사년도가 87년인 직원 조회
desc emp;
-- select * from emp;
select *
from emp
where hiredate >= '1987-01-01';

-- 직무가 salesman 또는 manager 또는 analyst인 직원 조회
select distinct job from emp;
select *
from emp
-- where job = 'SALESMAN' or job = 'MANAGER' or job = 'ANALYST';
where job in ('SALESMAN', 'MANAGER', 'ANALYST');

-- 직무가 salesman, manager, analyst가 아닌 직원 조회
select * 
from emp
-- where job != 'SALESMAN' and job != 'MANAGER' and job != 'ANALYST';
where job not in ('SALESMAN', 'MANAGER', 'ANALYST');

-- accounting 부서 또는 research 부서 직원 조회
select * from dept; -- accounting : 10, research : 20
select *
from emp
-- where deptno = 10 or deptno = 20;
where deptno in (10, 20);

-- 급여가 2000이상 3000이하 직원 조회
select *
from emp
-- where sal >= 2000 and sal <= 3000; 
where sal between 2000 and 3000;

-- 급여가 2000보다 작거나 3000보다 큰 직원 조회
select *
from emp
-- where sal < 2000 or sal > 3000; 
where sal not between 2000 and 3000;

-- 사원 이름에 AM이 포함된 직원
select *
from emp
where ename LIKE '%AM%';

-- 사원 이름에 AM이 포함되지 않은 직원
select *
from emp
where ename not LIKE '%AM%';

-- 사원이름이 A로 시작하는 직원
select *
from emp
where ename LIKE 'A%';

-- 사원이름의 두 번째 문자가 A인 직원
select *
from emp
where ename LIKE '_A%'; -- % : n개(0개 포함), _ : 1개

-- commision을 받지 않는 조회
select * 
from emp
-- where comm = NULL;
where comm is NULL; -- NULL을 비교할 때는 반드시 IS NULL 또는 IS NOT NULL 사용

-- commision을 받는 직원 조회
select * 
from emp
-- where comm != NULL;
where comm is NOT null;

-- 부서코드가 10 또는 20인 직원 조회
select * from emp where deptno in (10, 20);
select * from emp where deptno = 10
union
select * from emp where deptno = 20;

-- 부서코드가 30이 아닌 직원
select * from emp where deptno != 30;
select * from emp
minus
select * from emp where deptno = 30;

-- 부서코드가 20인 직원
select * from emp where deptno = 20;
select * from emp where deptno in (10, 20)
intersect
select * from emp where deptno in (20, 30);














