-- ���̺� ��� ����
select * from tab; -- ��� ���̺� ǥ��
select table_name from user_tables;

-- ���̺� ���� ���� (�÷� ����)
desc emp;
desc dept;

-- ���̺� ���� ��ȸ
select * from emp;
select * from dept;

-- emp ���̺��� ��� �÷� ������ ��ȸ
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

select * -- * : ��� �÷�
from emp;

-- emp ���̺��� empno, ename, job, hiredate, sal �÷� ������ ��ȸ
select empno, ename, job, hiredate, sal
from emp;

-- emp ���̺��� �μ� ���� ��ȸ ( � �μ��� �ִ��� �˰� �; )
select deptno from emp; -- ��� �� ��ȸ
select distinct deptno from emp; -- �ߺ� ���� ��ȸ

-- emp ���̺��� �μ�, ���� ���� ��ȸ ( � �μ��� ������ �ִ��� �˰� �; )
select /* all */ deptno, job from emp;
select distinct deptno, job from emp;

-- ������ annual salary (sal * 12 + comm) ��ȸ
select * from emp;
select comm, nvl(comm, 0) from emp; -- nvl : null -> Ư�� ������ ����
select empno, ename, sal*12+nvl(comm, 0) as annsal from emp; -- ��Ī(alias) ����
select empno, ename, sal*12+nvl(comm, 0) annsal from emp;

-- ������ annual salary (sal * 12 + comm) ��������-> �������������� ��ȸ
select empno, ename, sal*12+nvl(comm, 0) annsal 
from emp
order by annsal desc; -- asc :��������, desc: ��������

-- �Ի����ڰ� ���� ������ ���� ��ȸ
select * from emp order by hiredate asc;

-- ������, �޿������� ���� ��ȸ
select * from emp order by job asc, sal desc; -- 2�� �÷� ���� ���� (1������, 2������)

-- *************************

-- ��� ���� ��ȸ
select * from emp;

-- �μ���ȣ�� 30�� ���� ��ȸ
select * from emp where deptno = 30;

-- �μ���ȣ�� 30�� �μ��̸� ��ȸ
desc dept;
select * from dept where deptno = 30;

-- �����ȣ�� 7782�� ���� ��ȸ
desc emp;
select * from emp where empno = 7782;

-- �μ���ȣ�� 30�̰� �������� SALESMAN ���� ��ȸ
select * 
from emp
where deptno = 30 and job = 'SALESMAN'; -- ���ڿ��� ��¥�� ��������ǥ�� ǥ��

-- �������� SALESMAN �̸鼭 �޿��� 1500�̻��� ���� ��ȸ
select *
from emp
where job = 'SALESMAN' and sal >= 1500;

-- ����� 7499�̸鼭 30�� �μ� �Ҽ��� ����
select *
from emp
where empno = 7499 and deptno = 30;

-- ������ 20000�̻��� ���� ��ȸ
select *
from emp
where sal * 12 >= 20000;

-- �޿��� 3000�� ����
select *
from emp
where sal = 3000;

-- �޿��� 3000�� �ƴ� ����
select *
from emp
-- where sal != 3000;
-- where sal <> 3000;
where not (sal = 3000);

-- �Ի�⵵�� 87���� ���� ��ȸ
desc emp;
-- select * from emp;
select *
from emp
where hiredate >= '1987-01-01';

-- ������ salesman �Ǵ� manager �Ǵ� analyst�� ���� ��ȸ
select distinct job from emp;
select *
from emp
-- where job = 'SALESMAN' or job = 'MANAGER' or job = 'ANALYST';
where job in ('SALESMAN', 'MANAGER', 'ANALYST');

-- ������ salesman, manager, analyst�� �ƴ� ���� ��ȸ
select * 
from emp
-- where job != 'SALESMAN' and job != 'MANAGER' and job != 'ANALYST';
where job not in ('SALESMAN', 'MANAGER', 'ANALYST');

-- accounting �μ� �Ǵ� research �μ� ���� ��ȸ
select * from dept; -- accounting : 10, research : 20
select *
from emp
-- where deptno = 10 or deptno = 20;
where deptno in (10, 20);

-- �޿��� 2000�̻� 3000���� ���� ��ȸ
select *
from emp
-- where sal >= 2000 and sal <= 3000; 
where sal between 2000 and 3000;

-- �޿��� 2000���� �۰ų� 3000���� ū ���� ��ȸ
select *
from emp
-- where sal < 2000 or sal > 3000; 
where sal not between 2000 and 3000;

-- ��� �̸��� AM�� ���Ե� ����
select *
from emp
where ename LIKE '%AM%';

-- ��� �̸��� AM�� ���Ե��� ���� ����
select *
from emp
where ename not LIKE '%AM%';

-- ����̸��� A�� �����ϴ� ����
select *
from emp
where ename LIKE 'A%';

-- ����̸��� �� ��° ���ڰ� A�� ����
select *
from emp
where ename LIKE '_A%'; -- % : n��(0�� ����), _ : 1��

-- commision�� ���� �ʴ� ��ȸ
select * 
from emp
-- where comm = NULL;
where comm is NULL; -- NULL�� ���� ���� �ݵ�� IS NULL �Ǵ� IS NOT NULL ���

-- commision�� �޴� ���� ��ȸ
select * 
from emp
-- where comm != NULL;
where comm is NOT null;

-- �μ��ڵ尡 10 �Ǵ� 20�� ���� ��ȸ
select * from emp where deptno in (10, 20);
select * from emp where deptno = 10
union
select * from emp where deptno = 20;

-- �μ��ڵ尡 30�� �ƴ� ����
select * from emp where deptno != 30;
select * from emp
minus
select * from emp where deptno = 30;

-- �μ��ڵ尡 20�� ����
select * from emp where deptno = 20;
select * from emp where deptno in (10, 20)
intersect
select * from emp where deptno in (20, 30);














