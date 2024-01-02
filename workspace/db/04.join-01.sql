-- 문제상황 1. SALES 부서에 근무하는 직원 조회
select * from emp; -- SALES 부서 확인 불가
select * from dept; -- SALES 부서의 부서번호 확인 --> 30
SELECT * FROM emp where deptno = 30; -- 위에서 확인한 부서번호로 조회

-- 문제상황 2. 사번, 이름, 업무, 입사일자, 부서이름 조회
select * from emp;

-- 조인 1. 사번, 이름, 업무, 입사일자, 부서이름 조회 ( cross join )
select count(*) from emp;
select count(*) from dept;
select *
from emp, dept
order by empno;

-- 조인 2. 사번, 이름, 업무, 입사일자, 부서이름 조회 ( inner join )
select empno, ename, job, hiredate, dname
from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, job, hiredate, dname
from emp
inner join dept
on emp.deptno = dept.deptno; -- on : join에 대한 where

select e.empno, e.ename, e.job, e.hiredate, d.deptno, d.dname
from emp e -- 테이블에 대한 별칭 부여 : emp -> e
inner join dept d -- dept -> d
on e.deptno = d.deptno; -- on : join에 대한 where

-- SALES 부서에 근무하는 직원 조회
select e.*
from emp e, dept d
where d.dname = 'SALES' and e.deptno = d.deptno;

select e.*
from emp e
inner join dept d
on e.deptno = d.deptno
where d.dname = 'SALES';

-- 각 부서별로 직원 목록 조회 (group by X - outer join)
select * from dept;
select d.dname, e.*
from dept d, emp e
-- where d.deptno = e.deptno
where d.deptno = e.deptno(+) -- left outer join
order by d.deptno;

select d.dname, e.*
from dept d             -- dept의 모든 행 조회
left outer join emp e   -- emp의 deptno가 dept에 존재하는 행 조회
on d.deptno = e.deptno
order by d.deptno;

-- 직원정보와 급여등급 조회 (join)
select * from salgrade;
select e.*, s.*
from emp e, salgrade s
where e.sal between s.losal and s.hisal
order by e.empno;





