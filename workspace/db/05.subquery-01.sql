-- 'scott' 직원보다 이전에 입사한 사원 조회
select * from emp; -- scott 직원의 입사일자 확인
select * from emp where hiredate > '1987-07-13'; -- 확인된 입사일자로 조회

select * 
from emp 
where hiredate < (select hiredate 
                  from emp
                  where ename = 'SCOTT');
                  
select e1.*
from emp e1, emp e2
where e2.ename = 'SCOTT' and e1.hiredate < e2.hiredate;

-- 20번 부서 직원중 전체 직원의 평균 급여보다 많은 급여를 받는 직원 조회
select e.*, d.*
from emp e, dept d
where e.deptno = d.deptno and
      e.deptno = 20 and e.sal > ( select avg(e2.sal)
                                  from emp e2 );
                                  
select e.*, d.*
from emp e
inner join dept d
on e.deptno = d.deptno
where e.deptno = 20 and e.sal > ( select avg(e2.sal)
                                  from emp e2 );
                                  
-- 각 부서별 최고급여와 동일한 급여를 받는 직원 조회
select max(sal)
from emp
group by deptno;

select *
from emp
where sal IN ( select max(sal)
               from emp
               group by deptno );
               
select *
from emp
where sal = ANY ( select max(sal)
                  from emp
                  group by deptno );
                  
select *
from emp
where sal = SOME ( select max(sal)
                   from emp
                   group by deptno );
                   
-- 30번 부서의 최고급여 직원보다 적은 급여를 받는 직원 조회
SELECT SAL FROM EMP WHERE DEPTNO = 30;

select *
from emp
where sal < ( select max(sal)
              from emp
              where deptno = 30);
              
select *
from emp
where sal < ANY( select sal
                 from emp
                 where deptno = 30 );
                 
-- 30번 부서의 최저급여 직원보다 적은 급여를 받는 직원 조회
select *
from emp
where sal < ( select min(sal)
              from emp
              where deptno = 30 );
              
select *
from emp
where sal < ALL ( select sal
                  from emp
                  where deptno = 30 );
                  
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT DEPTNO FROM DEPT;

select *
from emp
-- where ename in ( select ename from emp where deptno = 10 )
where exists ( select ename from emp where deptno = 40 );

-- 부서별 최고 급여자 조회
select *
from emp
-- where sal IN ( select max(sal) from emp group by deptno );
where (deptno, sal) IN ( select deptno, max(sal)
                         from emp
                         group by deptno );
                         
-- 10번 부서 직원의 개인 정보와 부서 정보 조회 ( emp, dept join )
select e.*, d.*
from emp e , dept d
where e.deptno = 10 and e.deptno = d.deptno;

select e2.*, d2.*
from ( select e.* from emp e where e.deptno = 10 ) e2, dept d2
where e2.deptno = d2.deptno;

select e2.*, d2.*
from ( select e.* 
       from emp e 
       where e.deptno = 10 ) e2
inner join dept d2
on e2.deptno = d2.deptno;

with
    e10 as ( select e.* from emp e where e.deptno = 10 ),
    d as ( select * from dept )
select *
from e10, d
where e10.deptno = d.deptno;

-- 최고급여, 최저급여 조회
select max(sal) 최고급여, min(sal) 최저급여
from emp;

select 
    ( select max(sal) from emp ) 최고급여,
    ( select min(sal) from emp ) 최저급여
from dual; -- dual : 임시테이블 (테이블이 없는 단순 select인 경우 사용 )

-- 직원정보조회 : 사번, 이름, 입사일자, 급여, 최고급여대비 수준 (비율)
select empno, ename, hiredate, sal, sal/(select max(sal) from emp) ratio
from emp
order by ratio desc;
               

                                  

                  
                  
                  