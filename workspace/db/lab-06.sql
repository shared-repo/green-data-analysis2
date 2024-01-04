-- kdtda2 계정으로 실행

-- 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오, 
-- ( 정수형은 NUMBER를, 문자형은 가변형 문자타입인 VARCHAR2를 사용 )
	
-- bookid(도서번호) ? NUMBER
-- bookname(도서이름) ? VARCHAR2(20)
-- publisher(출판사) ? VARCHAR2(20)
-- price(가격) ? NUMBER
create table newbook
(
    bookid number,
    bookname varchar2(20 char),
    publisher varchar2(20 char),
    price number
);

-- 다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오
-- custid(고객번호) 	- NUMBER, 기본키
-- name(이름) 	? VARCHAR2(40)
-- address(주소) 	? VARCHAR2(40)
-- phone(전화번호) 	? VARCHAR2(30)
create table newcustomer
(
    custid number primary key,
    name varchar2(20 char),
    address varchar2(40 char),
    phone varchar2(30 byte)
);

-- 다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오.
-- orderid(주문번호) - NUMBER, 기본키
-- custid(고객번호) - NUMBER, NOT NULL 제약조건, 외래키(NewCustomer.custid)
-- bookid(도서번호) - NUMBER, NOT NULL 제약조건
-- saleprice(판매가격) - NUMBER 
-- orderdate(판매일자) - DATE
create table neworders
(
    orderid number primary key,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    constraint fk_neworders_to_newcustomer 
    foreign key (custid) references newcustomer(custid)
);

-- 아래는 수정에 대한 질문

-- NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가하시오
alter table newbook
add isbn varchar2(13) not null;

-- NewBook 테이블의 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오
alter table newbook
modify isbn number;

-- NewBook 테이블의 isbn 속성을 삭제하시오
alter table newbook
drop column isbn;

-- NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오
alter table newbook
modify bookid number not null;

-- NewBook 테이블의 bookid 속성을 기본키로 변경하시오
alter table newbook
add constraint pk_newbook primary key (bookid);

