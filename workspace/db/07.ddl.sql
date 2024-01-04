-- ���� ���̺� ����
drop table dept_temp;
drop table dept_temp2;

-- ���� ���̺��� �����ؼ� �� ���̺� ����� -- ���������� �������� �ʽ��ϴ�.
create table dept_temp3
as select * from dept;
-- ������ ���̺� ������ Ȯ���ؼ� ���� ���� �������� �˻�

-- �ڷ���
-- ������ : NUMBER(��ü�ڸ���, �Ҽ��������ڸ���)
-- ������ : VARCHAR2(����, CHAR|BYTE), CHAR(����, CHAR|BYTE)
-- ��¥�� : date, datetime

-- ������ : �ڷ��� + �������� ( ����� ���� �ڷ��� )

-- ���� ���̺� ������ �����ؼ� ���̺� ����
DESC EMP;
create table emp_temp
(
    -- �÷��̸� �ڷ��� [null?] [�⺻Ű] [�ܷ�Ű] [check] [default-value]
    empno number(4,0) not null,   -- null �����
    ename varchar2(10 byte) null, -- null ��� (default)
    job varchar2(9 byte),
    mgr number(4,0), -- empno ����
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0)
);
insert into emp_temp(empno, ename)
values(1, 'john doe');
select * from emp_temp;

-- ���� : empno�� not null�̹Ƿ� �ݵ�� ������ ���� �ʿ�
insert into emp_temp(ename, job) 
values('jane doe', 'sales');

drop table emp_temp;

-- ���� ���̺� ������ �����ؼ� ���̺� ���� 2
create table emp_temp
(
    -- �÷��̸� �ڷ��� [null?] [�⺻Ű] [�ܷ�Ű] [check] [default-value]
    -- empno number(4,0) not null primary key, -- �⺻Ű ����
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null ��� (default)
    job varchar2(9 byte),
    mgr number(4,0), -- empno ����
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0),
    -- primary key (empno) -- empno�� pk�� ����
    constraint pk_emp_temp primary key (empno), -- empno�� pk�� ����
    constraint fk_emp_temp_to_dept -- �� ���� ���� ����
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- �� ���� ���� ����
    foreign key (mgr) references emp_temp(empno)
);
drop table emp_temp;

-- ���� ���̺� ������ �����ؼ� ���̺� ���� 3
create table emp_temp
(
    -- �÷��̸� �ڷ��� [null?] [�⺻Ű] [�ܷ�Ű] [check] [default-value]
    -- empno number(4,0) not null primary key, -- �⺻Ű ����
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null ��� (default)
    job varchar2(9 byte),
    mgr number(4,0), -- empno ����
    hiredate date default(sysdate),
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0),
    -- primary key (empno) -- empno�� pk�� ����
    constraint pk_emp_temp primary key (empno), -- empno�� pk�� ����
    constraint fk_emp_temp_to_dept -- �� ���� ���� ����
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- �� ���� ���� ����
    foreign key (mgr) references emp_temp(empno)
);
insert into emp_temp (empno)
values (1);
select * from emp_temp;
drop table emp_temp;

-- ���� ���̺� ������ �����ؼ� ���̺� ���� 4
create table emp_temp
(
    -- �÷��̸� �ڷ��� [null?] [�⺻Ű] [�ܷ�Ű] [check] [default-value]
    -- empno number(4,0) not null primary key, -- �⺻Ű ����
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null ��� (default)
    job varchar2(9 byte),
    mgr number(4,0), -- �ڱ� ���� ���̺��� foreign key�� null ���
    hiredate date default(sysdate),
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0) not null, -- ���� foreign key column�� not null�� ����
    -- primary key (empno) -- empno�� pk�� ����
    constraint pk_emp_temp primary key (empno), -- empno�� pk�� ����
    constraint fk_emp_temp_to_dept -- �� ���� ���� ����
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- �� ���� ���� ����
    foreign key (mgr) references emp_temp(empno)
);
insert into emp_temp(empno, deptno)
values (1, 10); -- deptno�� �ݵ�� dept ���̺� �����ϴ� ���� ����ؾ� �մϴ�.
select * from emp_temp;
commit;
delete from dept where deptno = 10; -- �ٸ� ���̺��� �����ϰ� �ִ� �����ʹ� ���� �Ұ���

drop table emp_temp;

-- ���� ���̺� ������ �����ؼ� ���̺� ���� 5
create table emp_temp
(
    -- �÷��̸� �ڷ��� [null?] [�⺻Ű] [�ܷ�Ű] [check] [default-value]
    -- empno number(4,0) not null primary key, -- �⺻Ű ����
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null ��� (default)
    job varchar2(9 byte),
    mgr number(4,0), -- �ڱ� ���� ���̺��� foreign key�� null ���
    hiredate date default(sysdate),
    sal number(7,2) check(sal > 0),
    comm number(7,2),
    deptno number(2,0) not null, -- ���� foreign key column�� not null�� ����
    -- primary key (empno) -- empno�� pk�� ����
    constraint pk_emp_temp primary key (empno), -- empno�� pk�� ����
    constraint fk_emp_temp_to_dept -- �� ���� ���� ����
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- �� ���� ���� ����
    foreign key (mgr) references emp_temp(empno)
);
insert into emp_temp (empno, deptno, sal)
values (1, 10, -1000); -- check �������� ���� insert ����
select * from emp_temp;

drop table emp_temp;

-- ���� ���̺� ������ �����ؼ� ���̺� ���� 6
create table emp_temp
(
    -- �÷��̸� �ڷ��� [null?] [�⺻Ű] [�ܷ�Ű] [check] [default-value]
    -- empno number(4,0) not null primary key, -- �⺻Ű ����
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null ��� (default)
    job varchar2(9 byte),
    mgr number(4,0), -- �ڱ� ���� ���̺��� foreign key�� null ���
    hiredate date default(sysdate),
    sal number(7,2) check(sal > 0),
    comm number(7,2),
    deptno number(2,0) not null, -- ���� foreign key column�� not null�� ����
    -- primary key (empno) -- empno�� pk�� ����
    constraint pk_emp_temp primary key (empno), -- empno�� pk�� ����
    constraint fk_emp_temp_to_dept -- �� ���� ���� ����
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- �� ���� ���� ����
    foreign key (mgr) references emp_temp(empno)
);
create sequence emp_temp_sequence;
select emp_temp_sequence.nextval from dual;
insert into emp_temp(empno, deptno, sal)
values (emp_temp_sequence.nextval, 10, 1000);
select * from emp_temp;


