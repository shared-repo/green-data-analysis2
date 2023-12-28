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

