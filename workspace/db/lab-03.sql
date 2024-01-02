-- kdtda �������� ����

-- ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ�
select 
    sum(saleprice) "�� �Ǹž�", 
    avg(saleprice) "��հ�", 
    min(saleprice) "������", 
    max(saleprice) "�ְ�"
from orders;

-- ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�
select 
    custid,
    count(saleprice) "�� ����",
    sum(saleprice) "�� �Ǹž�"
from orders
group by custid
order by "�� �Ǹž�" desc;

-- ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�.  
-- ��, �� �� �̻� ������ ���� ���Ѵ�
select 
    custid,
    count(saleprice) "�� ����",
    sum(saleprice) "�� �Ǹž�"
from orders
where saleprice >= 8000
group by custid
having count(saleprice) >= 2
order by "�� �Ǹž�" desc;

-- ������ ���� �� ���ž�
-- ������ ���� ������ ������ ��
select * from orders; -- ������ ������ �� ����
select * from customer; -- ���������� custid�� 1���� Ȯ��
select '������' ��, sum(saleprice) "�� ���ž�", count(saleprice) ����
from orders
where custid = 1;

-- ������ �� ����
select count(*) "���� �Ѽ���"
from book;

-- ������ ����ϴ� ���ǻ��� �� ����
select publisher from book; -- ���ǻ�� �ߺ��� �����͸� ����
select count(distinct publisher) "���ǻ� ��"
from book;

-- hr �������� ����

-- ��� ����� ���� ��� �� ���� ������ ���´�. 
-- ��, �ֻ��� ������ ���ӻ�簡 ���� ������ ������ �����ϴ� ������ ����. 
-- �Ҽӵ� ����� �� � ����� ���� �ٹ� ���� ����� �� ���� ����Ͻÿ�
select distinct manager_id from employees;
select count(distinct manager_id) "�������� ��"
from employees
where manager_id is not null; -- ���� ���� (�����Լ��� null �����ϰ� ����)

-- �� ����� �Ҽӵ� �μ����� �޿� �հ�, �޿� ���, �޿� �ִ�, �޿� �ּڰ��� �����ϰ��� �Ѵ�. 
-- ��, �μ��� �Ҽӵ��� ���� ����� ���� ������ ����


-- ������� ������ ��ü �޿� ����� $10,000���� ū ��츦 ��ȸ�Ͽ� ������ �޿� ����� ����Ͻÿ�. 
-- �� ������ ���(CLERK)�� ���Ե� ���� �����ϰ� ��ü �޿� ����� ���� ������� ����Ͻÿ�
