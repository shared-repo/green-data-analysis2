-- ���� �޿� �Ѿ�
select sum(sal) "�޿��Ѿ�"
from emp;

-- ���� �Ѿ�
select sum(comm) "�����Ѿ�"
from emp;

-- �޿��Ѿ�, �����Ѿ�, �����Ѿ�
select 
    sum(sal) "�޿��Ѿ�", 
    sum(comm) "�����Ѿ�", 
    sum(sal) + sum(comm) "�����Ѿ�"
from emp;

-- ������ ��ȸ
select count(*), count(distinct empno) "������", count(comm) "������2"
from emp;

-- �޿����
select 
    -- sum(sal) / count(sal) "�޿����1",
    round(sum(sal) / count(sal), 2) "�޿����2",
    ceil(sum(sal) / count(sal)) "�޿����3", 
    floor(sum(sal) / count(sal)) "�޿����4",
    round(avg(sal), 2) "�޿����5"
from emp;

-- ���� �� �ְ� �޿�
select 
    min(sal) �����޿�,
    max(sal) �ְ�޿�
from emp;

-- ���� �� �ְ� �޿� ���� ����
select *
from emp
-- where sal = min(sal) or sal = max(sal)
where 
    sal = (select min(sal) from emp) -- �μ� ���� ( subquery )
    or 
    sal = (select max(sal) from emp)
order by sal desc;

-- ������ �޿� �Ѿ�, �޿� ���, �����޿�, �ְ�޿� 1
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

-- ������ �޿� �Ѿ�, �޿� ���, �����޿�, �ְ�޿� 2
select 
    job,
    -- ename, -- ���� : group by �� ����� �÷��� �ƴϸ� select �� ���Ե� �� �����ϴ�.
    sum(sal), round(avg(sal), 2), min(sal), max(sal)
from emp
group by job;

-- ������ �޿� �Ѿ�, �޿� ���, �����޿�, �ְ�޿� ��ȸ
-- ��, job�� president�� �����ϰ� ��ձ޿��� 2000 �̻��� ��츸 ����
select 
    job,
    sum(sal), round(avg(sal), 2), min(sal), max(sal)
from emp
where 
    job != 'PRESIDENT'
    -- AND AVG(SAL) >= 2000 -- ���� : �����Լ��� WHERE���� ����� �� �����ϴ�.
group by job
having avg(sal) >= 2000;