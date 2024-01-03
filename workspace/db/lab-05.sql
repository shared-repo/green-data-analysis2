-- kdtda2 계정으로 실행

-- 가장 비싼 도서의 이름을 보이시오
select max(price) from book;
select * 
from book
where price = ( select max(price) from book );

-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
select distinct custid from orders;
select *
from customer c 
where c.custid in ( select distinct o.custid from orders o );

-- 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오
select * from book where publisher = '대한미디어';
select *
from customer c, orders o
where c.custid = o.custid 
      and 
      o.bookid in ( select bookid 
                    from book 
                    where publisher = '대한미디어' );
      
select distinct bookid from orders;

-- 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오 ( 학습하지 않은 내용 )
select *
from book b
where b.price > ( select avg(b2.price)
                  from book b2 
                  where b.publisher = b2.publisher );
                  
-- 주문이 있는 고객의 이름과 주소를 보이시오
select *
from customer c
where c.custid in ( select distinct custid from orders );

-- 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오
select avg(saleprice) from orders;
select *
from orders o
where o.saleprice <= ( select avg(saleprice) from orders );

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 
-- 주문번호, 고객번호, 금액을 보이시오
select *
from orders o
-- where o.saleprice > 현재 처리중인 행의 고객 아이디로 주문한 구매가격의 평균
where o.saleprice > ( select avg(o2.saleprice)
                      from orders o2 
                      where o.custid = o2.custid );
                      
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오
select * from customer where address like '대한민국%';

select sum(saleprice) 대한민국_총판매액
from orders o
where o.custid in ( select c.custid 
                    from customer c 
                    where c.address like '대한민국%' );

-- 3번 고객이 주문한 도서의 최고 금액보다 
-- 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오
select max(saleprice) from orders where custid = 3;
select *
from orders o
where o.saleprice > ( select max(o2.saleprice) 
                      from orders o2 
                      where o2.custid = 3 ); 

-- EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오
select sum(saleprice) 대한민국_총판매액
from orders o
where exists ( select c.custid 
               from customer c 
               where c.custid = o.custid and c.address like '대한민국%' );
                    
-- 마당서점의 고객별 판매액을 보이시오(결과는 고객이름과 고객별 판매액을 출력).
select c.name, sum(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name;

select 
    ( select c.name
      from customer c
      where c.custid = o.custid ) name,
    sum(o.saleprice)
from orders o
group by o.custid;

-- Orders 테이블에 각 주문에 맞는 도서이름을 조회하시오
select o.*, (select b.bookname from book b where o.bookid = b.bookid)
from orders o;

select o.*, b.bookname
from orders o, book b
where o.bookid = b.bookid;

-- 고객번호가 2 이하인 고객의 판매액을 보이시오 
-- (결과는 고객이름과 고객별 판매액 출력)
select c.custid, c.name, sum(o.saleprice) 구매액
from customer c, orders o
where c.custid = o.custid and c.custid <= 2
group by c.custid, c.name;

select c.custid, c.name, sum(o.saleprice) 구매액
from 
    ( select * from customer where custid <= 2 ) c,
    orders o
where c.custid = o.custid
group by c.custid, c.name;




