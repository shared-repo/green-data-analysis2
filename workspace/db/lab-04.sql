-- kdtda 계정으로 실행

-- 고객과 고객의 주문에 관한 데이터를 모두 보이시오
-- 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오
select * from customer;
select * from orders;
select c.*, o.*
from customer c, orders o
-- where c.custid = o.custid; -- inner join
where c.custid = o.custid(+) -- left outer join
order by c.name;

select c.*, o.*
from customer c
-- inner join orders o   -- inner join
left outer join orders o -- left outer join
on c.custid = o.custid
order by c.name;

-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오
select c.name, b.bookname, o.saleprice
from customer c, orders o, book b
-- where c.custid = o.custid and o.bookid = b.bookid;
where c.custid = o.custid(+) and o.bookid = b.bookid(+);

select c.name, b.bookname, o.saleprice
from customer c
left outer join orders o
on c.custid = o.custid
left outer join book b
on o.bookid = b.bookid;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
select c.custid, c.name, nvl(sum(o.saleprice), 0) 구매액
from customer c, orders o
where c.custid = o.custid(+)
group by c.custid, c.name;

select c.custid, c.name, nvl(sum(o.saleprice), 0) 구매액
from customer c
left outer join orders o
on c.custid = o.custid
group by c.custid, c.name;

-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오
select * from customer;
select * from book;
select * from orders;

select c.name, b.bookname
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

select c.name, b.bookname
from customer c
inner join orders o
on c.custid = o.custid
inner join book b
on o.bookid = b.bookid;

-- 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오
select c.name, b.bookname, b.price
from customer c, orders o, book b
where b.price = 20000 
      and 
      c.custid = o.custid and o.bookid = b.bookid;

select c.name, b.bookname, b.price
from customer c 
inner join orders o
on c.custid = o.custid
inner join book b
on o.bookid = b.bookid
where b.price = 20000;

-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
-- 위의 연습으로 대체

-- hr 계정으로 실행

-- HR 스키마에 존재하는 Employees, Departments, Locations 테이블의 구조를 파악한 후 
-- Oxford에 근무하는 사원의 이름과 성(Name으로 별칭), 업무, 부서이름, 도시이름을 출력하시오. 
-- 이때 첫 번째 열은 회사이름인 ‘GREEN-IT’라는 상수값이 출력되도록 하시오
select * from locations where city = 'Oxford';
select 
    'GREEN-IT' 회사이름, 
    e.first_name || ' ' || e.last_name name,
    e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where l.city = 'Oxford'
      and 
      e.department_id = d.department_id 
      and 
      d.location_id = l.location_id;

select 
    'GREEN-IT' 회사이름, 
    e.first_name || ' ' || e.last_name name,
    e.job_id, d.department_name, l.city
from employees e
inner join departments d
on e.department_id = d.department_id 
inner join locations l
on d.location_id = l.location_id
where l.city = 'Oxford';
      
-- HR 스키마에 있는 Employees, Departments 테이블의 구조를 파악한 후 
-- 사원 수가 다섯 명 이상인 부서의 부서이름과 사원 수를 출력하시오. 
-- 이때 사원 수가 많은 순으로 정렬하시오
select d.department_name, count(e.employee_id) 사원수
from employees e, departments d
where e.department_id = d.department_id
group by d.department_name
having count(e.employee_id) >= 5
order by 사원수;

-- 각 사원의 급여에 따른 급여 등급을 보고하려고 한다. 
-- 급여 등급은 범위로 Jobs 테이블에 표시된다. ( employees와 jobs를 equi join )
-- 해당 테이블의 구조를 살펴본 후 사원의 이름과 성(Name으로 별칭), 업무, 부서이름, 입사일, 급여, 급여범위를 출력하시오
select 
    e.first_name || ' ' || e.last_name name,
    j.job_title, d.department_name,
    e.hire_date, e.salary, j.min_salary, j.max_salary
from employees e, jobs j, departments d
where e.job_id = j.job_id and e.department_id = d.department_id;

-- 각 사원과 직속 상사와의 관계를 이용하여 다음과 같은 형식의 보고서를 작성하고자 한다.
-- (예) 홍길동은 허균에게 보고한다 → Eleni Zlotkey report to Steven King
-- 어떤 사원이 누구에게 보고하는지 위 예를 참고하여 출력하시오. 
-- 단, 보고할 상사가 없는 사원이 있다면 그 정보도 포함하여 출력하고, 상사의 이름과 성은 대문자로 출력하시오
select e1.first_name || ' ' || e1.last_name || 
       ' report to ' || 
       upper(e2.first_name || ' ' || e2.last_name) 관계보고서 
from employees e1, employees e2
where e1.manager_id = e2.employee_id(+);

