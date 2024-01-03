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
                                  

                  
                  
                  