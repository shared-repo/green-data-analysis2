-- kdtda 계정으로 실행

-- 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가
select 
    sum(saleprice) "총 판매액", 
    avg(saleprice) "평균값", 
    min(saleprice) "최저가", 
    max(saleprice) "최고가"
from orders;

-- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오
select 
    custid,
    count(saleprice) "총 수량",
    sum(saleprice) "총 판매액"
from orders
group by custid
order by "총 판매액" desc;

-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오.  
-- 단, 두 권 이상 구매한 고객만 구한다
select 
    custid,
    count(saleprice) "총 수량",
    sum(saleprice) "총 판매액"
from orders
where saleprice >= 8000
group by custid
having count(saleprice) >= 2
order by "총 판매액" desc;

-- 박지성 고객의 총 구매액
-- 박지성 고객이 구매한 도서의 수
select * from orders; -- 고객명을 구분할 수 없음
select * from customer; -- 박지성고객의 custid가 1임을 확인
select '박지성' 고객, sum(saleprice) "총 구매액", count(saleprice) 수량
from orders
where custid = 1;

-- 도서의 총 개수
select count(*) "도서 총수량"
from book;

-- 도서를 출고하는 출판사의 총 개수
select publisher from book; -- 출판사는 중복된 데이터를 포함
select count(distinct publisher) "출판사 수"
from book;

-- hr 계정으로 실행

-- 모든 사원은 직속 상사 및 직속 직원을 갖는다. 
-- 단, 최상위 직원은 직속상사가 없고 최하위 직원은 관리하는 직원이 없다. 
-- 소속된 사원들 중 어떤 사원의 상사로 근무 중인 사원의 총 수를 출력하시오
select distinct manager_id from employees;
select count(distinct manager_id) "관리직원 수"
from employees
where manager_id is not null; -- 생략 가능 (집계함수는 null 제외하고 수행)

-- 각 사원이 소속된 부서별로 급여 합계, 급여 평균, 급여 최댓값, 급여 최솟값을 집계하고자 한다. 
-- 단, 부서에 소속되지 않은 사원에 대한 정보는 제외


-- 사원들의 업무별 전체 급여 평균이 $10,000보다 큰 경우를 조회하여 업무별 급여 평균을 출력하시오. 
-- 단 업무에 사원(CLERK)이 포함된 경우는 제외하고 전체 급여 평균이 높은 순서대로 출력하시오
