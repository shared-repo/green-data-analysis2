desc dept;
-- dept 테이블과 같은 구조의 테이블 만들기
create table dept_temp2
(
    deptno number(2,0),
    dname varchar2(14 byte),
    loc varchar2(13 byte)
);
-- dept 테이블의 구조와 데이터를 복제해서 테이블 만들기
create table dept_temp
as select * from dept;

-- 복제 확인
select * from dept_temp;

-- 데이터 삽입
insert into dept_temp (deptno, dname, loc)
values (50, 'ANALYSIS', 'SEOUL');
select * from dept_temp;

rollback;
commit; -- or rollback;











