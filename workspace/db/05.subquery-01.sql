-- 'scott' �������� ������ �Ի��� ��� ��ȸ
select * from emp; -- scott ������ �Ի����� Ȯ��
select * from emp where hiredate > '1987-07-13'; -- Ȯ�ε� �Ի����ڷ� ��ȸ

select * 
from emp 
where hiredate < (select hiredate 
                  from emp
                  where ename = 'SCOTT');
                  
select e1.*
from emp e1, emp e2
where e2.ename = 'SCOTT' and e1.hiredate < e2.hiredate;

-- 20�� �μ� ������ ��ü ������ ��� �޿����� ���� �޿��� �޴� ���� ��ȸ
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
                                  
-- �� �μ��� �ְ�޿��� ������ �޿��� �޴� ���� ��ȸ
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
                   
-- 30�� �μ��� �ְ�޿� �������� ���� �޿��� �޴� ���� ��ȸ
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
                 
-- 30�� �μ��� �����޿� �������� ���� �޿��� �޴� ���� ��ȸ
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

-- �μ��� �ְ� �޿��� ��ȸ
select *
from emp
-- where sal IN ( select max(sal) from emp group by deptno );
where (deptno, sal) IN ( select deptno, max(sal)
                         from emp
                         group by deptno );
                         
-- 10�� �μ� ������ ���� ������ �μ� ���� ��ȸ ( emp, dept join )
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

-- �ְ�޿�, �����޿� ��ȸ
select max(sal) �ְ�޿�, min(sal) �����޿�
from emp;

select 
    ( select max(sal) from emp ) �ְ�޿�,
    ( select min(sal) from emp ) �����޿�
from dual; -- dual : �ӽ����̺� (���̺��� ���� �ܼ� select�� ��� ��� )

-- ����������ȸ : ���, �̸�, �Ի�����, �޿�, �ְ�޿���� ���� (����)
select empno, ename, hiredate, sal, sal/(select max(sal) from emp) ratio
from emp
order by ratio desc;
               

                                  

                  
                  
                  