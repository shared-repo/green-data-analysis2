-- ������Ȳ 1. SALES �μ��� �ٹ��ϴ� ���� ��ȸ
select * from emp; -- SALES �μ� Ȯ�� �Ұ�
select * from dept; -- SALES �μ��� �μ���ȣ Ȯ�� --> 30
SELECT * FROM emp where deptno = 30; -- ������ Ȯ���� �μ���ȣ�� ��ȸ

-- ������Ȳ 2. ���, �̸�, ����, �Ի�����, �μ��̸� ��ȸ
select * from emp;

-- ���� 1. ���, �̸�, ����, �Ի�����, �μ��̸� ��ȸ ( cross join )
select count(*) from emp;
select count(*) from dept;
select *
from emp, dept
order by empno;

-- ���� 2. ���, �̸�, ����, �Ի�����, �μ��̸� ��ȸ ( inner join )
select empno, ename, job, hiredate, dname
from emp, dept
where emp.deptno = dept.deptno;

select empno, ename, job, hiredate, dname
from emp
inner join dept
on emp.deptno = dept.deptno; -- on : join�� ���� where

select e.empno, e.ename, e.job, e.hiredate, d.deptno, d.dname
from emp e -- ���̺� ���� ��Ī �ο� : emp -> e
inner join dept d -- dept -> d
on e.deptno = d.deptno; -- on : join�� ���� where

-- SALES �μ��� �ٹ��ϴ� ���� ��ȸ
select e.*
from emp e, dept d
where d.dname = 'SALES' and e.deptno = d.deptno;

select e.*
from emp e
inner join dept d
on e.deptno = d.deptno
where d.dname = 'SALES';

-- �� �μ����� ���� ��� ��ȸ (group by X - outer join)
select * from dept;
select d.dname, e.*
from dept d, emp e
-- where d.deptno = e.deptno
where d.deptno = e.deptno(+) -- left outer join
order by d.deptno;

select d.dname, e.*
from dept d             -- dept�� ��� �� ��ȸ
left outer join emp e   -- emp�� deptno�� dept�� �����ϴ� �� ��ȸ
on d.deptno = e.deptno
order by d.deptno;

-- ���������� �޿���� ��ȸ (join)
select * from salgrade;
select e.*, s.*
from emp e, salgrade s
where e.sal between s.losal and s.hisal
order by e.empno;





