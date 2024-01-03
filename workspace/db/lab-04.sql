-- kdtda �������� ����

-- ������ ������ �ֹ��� ���� �����͸� ��� ���̽ÿ�
-- ������ ������ �ֹ��� ���� �����͸� ������ȣ ������ �����Ͽ� ���̽ÿ�
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

-- ������ �̸��� ������ �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
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

-- �������� �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, �������� �����Ͻÿ�
select c.custid, c.name, nvl(sum(o.saleprice), 0) ���ž�
from customer c, orders o
where c.custid = o.custid(+)
group by c.custid, c.name;

select c.custid, c.name, nvl(sum(o.saleprice), 0) ���ž�
from customer c
left outer join orders o
on c.custid = o.custid
group by c.custid, c.name;

-- ������ �̸��� ������ �ֹ��� ������ �̸��� ���Ͻÿ�
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

-- ������ 20,000���� ������ �ֹ��� ������ �̸��� ������ �̸��� ���Ͻÿ�

-- ������ �������� ���� ������ �����Ͽ� ������ �̸��� ������ �ֹ��� ������ �ǸŰ����� ���Ͻÿ�


-- hr �������� ����

-- HR ��Ű���� �����ϴ� Employees, Departments, Locations ���̺��� ������ �ľ��� �� 
-- Oxford�� �ٹ��ϴ� ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �����̸��� ����Ͻÿ�. 
-- �̶� ù ��° ���� ȸ���̸��� ��GREEN-IT����� ������� ��µǵ��� �Ͻÿ�

-- HR ��Ű���� �ִ� Employees, Departments ���̺��� ������ �ľ��� �� 
-- ��� ���� �ټ� �� �̻��� �μ��� �μ��̸��� ��� ���� ����Ͻÿ�. 
-- �̶� ��� ���� ���� ������ �����Ͻÿ�


-- �� ����� �޿��� ���� �޿� ����� �����Ϸ��� �Ѵ�. 
-- �޿� ����� ������ Jobs ���̺��� ǥ�õȴ�. ( employees�� jobs�� equi join )
-- �ش� ���̺��� ������ ���캻 �� ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �Ի���, �޿�, �޿������� ����Ͻÿ�

-- �� ����� ���� ������ ���踦 �̿��Ͽ� ������ ���� ������ �������� �ۼ��ϰ��� �Ѵ�.
-- (��) ȫ�浿�� ��տ��� �����Ѵ� �� Eleni Zlotkey report to Steven King
-- � ����� �������� �����ϴ��� �� ���� �����Ͽ� ����Ͻÿ�. 
-- ��, ������ ��簡 ���� ����� �ִٸ� �� ������ �����Ͽ� ����ϰ�, ����� �̸��� ���� �빮�ڷ� ����Ͻÿ�