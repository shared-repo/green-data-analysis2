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

