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
                                  

                  
                  
                  