-- kdtda2 �������� ����

-- ���� ��� ������ �̸��� ���̽ÿ�
select max(price) from book;
select * 
from book
where price = ( select max(price) from book );

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select distinct custid from orders;
select *
from customer c 
where c.custid in ( select distinct o.custid from orders o );

-- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�
select * from book where publisher = '���ѹ̵��';
select *
from customer c, orders o
where c.custid = o.custid 
      and 
      o.bookid in ( select bookid 
                    from book 
                    where publisher = '���ѹ̵��' );
      
select distinct bookid from orders;

-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ� ( �н����� ���� ���� )
select *
from book b
where b.price > ( select avg(b2.price)
                  from book b2 
                  where b.publisher = b2.publisher );
                  
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�
select *
from customer c
where c.custid in ( select distinct custid from orders );

-- ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�
select avg(saleprice) from orders;
select *
from orders o
where o.saleprice <= ( select avg(saleprice) from orders );

-- �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�
-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�
-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�
-- EXISTS �����ڷ� ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�
-- ���缭���� ���� �Ǹž��� ���̽ÿ�(����� ���̸��� ���� �Ǹž��� ���).
-- Orders ���̺� �� �ֹ��� �´� �����̸��� ��ȸ�Ͻÿ�
-- ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ� (����� ���̸��� ���� �Ǹž� ���)