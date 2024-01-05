-- 기존 테이블 제거
drop table dept_temp;
drop table dept_temp2;

-- 기존 테이블을 복사해서 새 테이블 만들기 -- 제약조건은 복제되지 않습니다.
create table dept_temp3
as select * from dept;
-- 복제후 테이블 구조를 확인해서 제약 조건 복제여부 검사

-- 자료형
-- 숫자형 : NUMBER(전체자리수, 소수점이하자리수)
-- 문자형 : VARCHAR2(길이, CHAR|BYTE), CHAR(길이, CHAR|BYTE)
-- 날짜형 : date, datetime

-- 도메인 : 자료형 + 제약조건 ( 사용자 정의 자료형 )

-- 직접 테이블 구조를 지정해서 테이블 생성
DESC EMP;
create table emp_temp
(
    -- 컬럼이름 자료형 [null?] [기본키] [외래키] [check] [default-value]
    empno number(4,0) not null,   -- null 불허용
    ename varchar2(10 byte) null, -- null 허용 (default)
    job varchar2(9 byte),
    mgr number(4,0), -- empno 참조
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0)
);
insert into emp_temp(empno, ename)
values(1, 'john doe');
select * from emp_temp;

-- 오류 : empno는 not null이므로 반드시 데이터 지정 필요
insert into emp_temp(ename, job) 
values('jane doe', 'sales');

drop table emp_temp;

-- 직접 테이블 구조를 지정해서 테이블 생성 2
create table emp_temp
(
    -- 컬럼이름 자료형 [null?] [기본키] [외래키] [check] [default-value]
    -- empno number(4,0) not null primary key, -- 기본키 지정
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null 허용 (default)
    job varchar2(9 byte),
    mgr number(4,0), -- empno 참조
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0),
    -- primary key (empno) -- empno를 pk로 지정
    constraint pk_emp_temp primary key (empno), -- empno를 pk로 지정
    constraint fk_emp_temp_to_dept -- 이 행은 생략 가능
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- 이 행은 생략 가능
    foreign key (mgr) references emp_temp(empno)
);
drop table emp_temp;

-- 직접 테이블 구조를 지정해서 테이블 생성 3
create table emp_temp
(
    -- 컬럼이름 자료형 [null?] [기본키] [외래키] [check] [default-value]
    -- empno number(4,0) not null primary key, -- 기본키 지정
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null 허용 (default)
    job varchar2(9 byte),
    mgr number(4,0), -- empno 참조
    hiredate date default(sysdate),
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0),
    -- primary key (empno) -- empno를 pk로 지정
    constraint pk_emp_temp primary key (empno), -- empno를 pk로 지정
    constraint fk_emp_temp_to_dept -- 이 행은 생략 가능
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- 이 행은 생략 가능
    foreign key (mgr) references emp_temp(empno)
);
insert into emp_temp (empno)
values (1);
select * from emp_temp;
drop table emp_temp;

-- 직접 테이블 구조를 지정해서 테이블 생성 4
create table emp_temp
(
    -- 컬럼이름 자료형 [null?] [기본키] [외래키] [check] [default-value]
    -- empno number(4,0) not null primary key, -- 기본키 지정
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null 허용 (default)
    job varchar2(9 byte),
    mgr number(4,0), -- 자기 참조 테이블의 foreign key는 null 허용
    hiredate date default(sysdate),
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0) not null, -- 보통 foreign key column은 not null로 지정
    -- primary key (empno) -- empno를 pk로 지정
    constraint pk_emp_temp primary key (empno), -- empno를 pk로 지정
    constraint fk_emp_temp_to_dept -- 이 행은 생략 가능
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- 이 행은 생략 가능
    foreign key (mgr) references emp_temp(empno)
);
insert into emp_temp(empno, deptno)
values (1, 10); -- deptno는 반드시 dept 테이블에 존재하는 값을 사용해야 합니다.
select * from emp_temp;
commit;
delete from dept where deptno = 10; -- 다른 테이블에서 참조하고 있는 데이터는 삭제 불가능

drop table emp_temp;

-- 직접 테이블 구조를 지정해서 테이블 생성 5
create table emp_temp
(
    -- 컬럼이름 자료형 [null?] [기본키] [외래키] [check] [default-value]
    -- empno number(4,0) not null primary key, -- 기본키 지정
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null 허용 (default)
    job varchar2(9 byte),
    mgr number(4,0), -- 자기 참조 테이블의 foreign key는 null 허용
    hiredate date default(sysdate),
    sal number(7,2) check(sal > 0),
    comm number(7,2),
    deptno number(2,0) not null, -- 보통 foreign key column은 not null로 지정
    -- primary key (empno) -- empno를 pk로 지정
    constraint pk_emp_temp primary key (empno), -- empno를 pk로 지정
    constraint fk_emp_temp_to_dept -- 이 행은 생략 가능
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- 이 행은 생략 가능
    foreign key (mgr) references emp_temp(empno)
);
insert into emp_temp (empno, deptno, sal)
values (1, 10, -1000); -- check 제약조건 위반 insert 실패
select * from emp_temp;

drop table emp_temp;

-- 직접 테이블 구조를 지정해서 테이블 생성 6
create table emp_temp
(
    -- 컬럼이름 자료형 [null?] [기본키] [외래키] [check] [default-value]
    -- empno number(4,0) not null primary key, -- 기본키 지정
    empno number(4,0) not null,
    ename varchar2(10 byte) null, -- null 허용 (default)
    job varchar2(9 byte),
    mgr number(4,0), -- 자기 참조 테이블의 foreign key는 null 허용
    hiredate date default(sysdate),
    sal number(7,2) check(sal > 0),
    comm number(7,2),
    deptno number(2,0) not null, -- 보통 foreign key column은 not null로 지정
    -- primary key (empno) -- empno를 pk로 지정
    constraint pk_emp_temp primary key (empno), -- empno를 pk로 지정
    constraint fk_emp_temp_to_dept -- 이 행은 생략 가능
    foreign key (deptno) references dept(deptno),
    constraint fk_emp_temp_to_emp_temp -- 이 행은 생략 가능
    foreign key (mgr) references emp_temp(empno)
);
create sequence emp_temp_sequence;
select emp_temp_sequence.nextval from dual;
insert into emp_temp(empno, deptno, sal)
values (emp_temp_sequence.nextval, 10, 1000);
select * from emp_temp;

drop table emp_temp;

-- 테이블 수정
create table emp_temp
(
    empno number(4,0) not null primary key,
    ename varchar2(10 byte) null,
    job varchar2(9 byte),
    mgr number(4,0),
    hiredate date default(sysdate),
    sal number(7,2) check(sal > 0),
    comm number(7,2),
    deptno number(2,0) not null,
    constraint fk_emp_temp_to_emp_temp foreign key (mgr) references emp_temp(empno)
);

-- mobile 컬럼 추가
alter table emp_temp
add mobile varchar2(20 byte);
desc emp_temp;

-- foreign key 추가
alter table emp_temp
add constraint fk_emp_temp_to_emp_dept 
foreign key (deptno) references dept(deptno);

-- 컬럼 변경
alter table emp_temp
modify mobile varchar2(20 byte) not null;
desc emp_temp;

-- 컬럼이름변경
alter table emp_temp
rename column mobile to hp;
desc emp_temp;

-- 테이블 이름 변경
rename emp_temp to emp_renamed;

alter table emp_renamed
drop column hp;
desc emp_renamed;
