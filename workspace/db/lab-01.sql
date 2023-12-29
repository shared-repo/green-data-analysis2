-- ���̺� ��� Ȯ��
SELECT table_name from user_tables;

-- �� ���̺� ���� Ȯ��
desc book;

-- ������ Ȯ��
select * from book;

-- 1. ��� ������ �̸��� ������ �˻��Ͻÿ�.
desc book;
select bookname, price from book;

-- 2. ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
-- select *
select bookid, bookname, publisher, price
from book;

-- 3. ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
select distinct publisher from book;

-- 4. ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
select * from book where price < 20000;

-- 5. ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ�.
select * from book 
-- where price <= 20000 and price >= 10000;
where price between 10000 and 20000;

-- 6. ���ǻ簡 ���½������� Ȥ�� �����ѹ̵� �� ������ �˻��Ͻÿ�.
select * 
from book
-- where publisher = '�½�����' or publisher = '���ѹ̵��';
where publisher in ('�½�����', '���ѹ̵��');

-- 7. ���౸�� ���硯�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book
where bookname = '�౸�� ����';

-- 8. �����̸��� ���౸�� �� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
select bookname, publisher
from book
where bookname like '%�౸%';

-- 9. �����̸��� ���� �� ��° ��ġ�� ��������� ���ڿ��� ���� ������ �˻��Ͻÿ�.
select *
from book
where bookname like '_��%';

-- 10. �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%' AND PRICE >= 20000;

-- 11. ������ �̸������� �˻��Ͻÿ�. 
select *
from book
order by bookname asc;

-- ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
-- 12. ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.
select *
from book
order by price desc, bookname asc;


