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

rollback; -- 마지막 commit or rollback 이후의 모든 dml 작업 취소
commit; -- 마지막 commit or rollback 이후의 모든 dml 작업 확정

-- 데이터 삽입
insert into dept_temp -- 모든 컬럼을 순서대로 사용하는 생략 가능
values (60, 'MARKETING', 'BUSAN');

SELECT * FROM DEPT_TEMP;

-- 데이터삽입 -- NULL 허용 컬럼은 데이터를 지정하지 않아도 가능
insert into dept_temp (deptno, dname)
values (70, 'ENGINEER');

insert into dept_temp (deptno, dname, loc)
values (71, 'ENGINEER2', NULL);

SELECT * FROM DEPT_TEMP;

-- 다른 테이블의 데이터를 복사해서 insert
insert into dept_temp2
select * from dept;

select * from dept_temp2;

commit; -- 마지막 commit or rollback 이후의 모든 dml 확정

select * from dept_temp;

select sysdate from dual; -- sysdate : 현재날짜및시간
select to_date('03012024', 'ddmmyyyy') from dual;

select sysdate from dual; -- dual : 임시테이블, 의미없는 테이블

-- 데이터 수정
select * from dept_temp;
update dept_temp
set loc = 'INCHEON'
where loc is null;
-- ROLLBACK;

-- 데이터 수정
update dept_temp
set deptno = 80, dname = 'DESIGNER', loc = 'DAEGU'
where deptno = 71;

select * from dept_temp;
COMMIT;

-- 데이터 삭제
delete from dept_temp;
rollback;

delete from dept_temp
where deptno = 80;

select * from dept_temp;














