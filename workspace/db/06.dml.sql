desc dept;
-- dept ���̺�� ���� ������ ���̺� �����
create table dept_temp2
(
    deptno number(2,0),
    dname varchar2(14 byte),
    loc varchar2(13 byte)
);
-- dept ���̺��� ������ �����͸� �����ؼ� ���̺� �����
create table dept_temp
as select * from dept;

-- ���� Ȯ��
select * from dept_temp;

-- ������ ����
insert into dept_temp (deptno, dname, loc)
values (50, 'ANALYSIS', 'SEOUL');
select * from dept_temp;

rollback;
commit; -- or rollback;











