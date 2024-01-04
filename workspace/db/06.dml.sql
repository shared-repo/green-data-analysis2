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

rollback; -- ������ commit or rollback ������ ��� dml �۾� ���
commit; -- ������ commit or rollback ������ ��� dml �۾� Ȯ��

-- ������ ����
insert into dept_temp -- ��� �÷��� ������� ����ϴ� ���� ����
values (60, 'MARKETING', 'BUSAN');

SELECT * FROM DEPT_TEMP;

-- �����ͻ��� -- NULL ��� �÷��� �����͸� �������� �ʾƵ� ����
insert into dept_temp (deptno, dname)
values (70, 'ENGINEER');

insert into dept_temp (deptno, dname, loc)
values (71, 'ENGINEER2', NULL);

SELECT * FROM DEPT_TEMP;

-- �ٸ� ���̺��� �����͸� �����ؼ� insert
insert into dept_temp2
select * from dept;

select * from dept_temp2;

commit; -- ������ commit or rollback ������ ��� dml Ȯ��

select * from dept_temp;

select sysdate from dual; -- sysdate : ���糯¥�׽ð�
select to_date('03012024', 'ddmmyyyy') from dual;

select sysdate from dual; -- dual : �ӽ����̺�, �ǹ̾��� ���̺�

-- ������ ����
select * from dept_temp;
update dept_temp
set loc = 'INCHEON'
where loc is null;
-- ROLLBACK;

-- ������ ����
update dept_temp
set deptno = 80, dname = 'DESIGNER', loc = 'DAEGU'
where deptno = 71;

select * from dept_temp;
COMMIT;

-- ������ ����
delete from dept_temp;
rollback;

delete from dept_temp
where deptno = 80;

select * from dept_temp;














