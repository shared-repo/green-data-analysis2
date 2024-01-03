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

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 주문번호, 고객번호, 금액을 보이시오
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 보이시오
-- EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오
-- 마당서점의 고객별 판매액을 보이시오(결과는 고객이름과 고객별 판매액을 출력).
-- Orders 테이블에 각 주문에 맞는 도서이름을 조회하시오
-- 고객번호가 2 이하인 고객의 판매액을 보이시오 (결과는 고객이름과 고객별 판매액 출력)