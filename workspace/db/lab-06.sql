-- kdtda2 �������� ����

-- ������ ���� �Ӽ��� ���� NewBook ���̺��� �����Ͻÿ�, 
-- ( �������� NUMBER��, �������� ������ ����Ÿ���� VARCHAR2�� ��� )
	
-- bookid(������ȣ) ? NUMBER
-- bookname(�����̸�) ? VARCHAR2(20)
-- publisher(���ǻ�) ? VARCHAR2(20)
-- price(����) ? NUMBER
create table newbook
(
    bookid number,
    bookname varchar2(20 char),
    publisher varchar2(20 char),
    price number
);

-- ������ ���� �Ӽ��� ���� NewCustomer ���̺��� �����Ͻÿ�
-- custid(����ȣ) 	- NUMBER, �⺻Ű
-- name(�̸�) 	? VARCHAR2(40)
-- address(�ּ�) 	? VARCHAR2(40)
-- phone(��ȭ��ȣ) 	? VARCHAR2(30)
create table newcustomer
(
    custid number primary key,
    name varchar2(20 char),
    address varchar2(40 char),
    phone varchar2(30 byte)
);

-- ������ ���� �Ӽ��� ���� NewOrders ���̺��� �����Ͻÿ�.
-- orderid(�ֹ���ȣ) - NUMBER, �⺻Ű
-- custid(����ȣ) - NUMBER, NOT NULL ��������, �ܷ�Ű(NewCustomer.custid)
-- bookid(������ȣ) - NUMBER, NOT NULL ��������
-- saleprice(�ǸŰ���) - NUMBER 
-- orderdate(�Ǹ�����) - DATE
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

-- �Ʒ��� ������ ���� ����

-- NewBook ���̺� VARCHAR2(13)�� �ڷ����� ���� isbn �Ӽ��� �߰��Ͻÿ�
alter table newbook
add isbn varchar2(13) not null;

-- NewBook ���̺��� isbn �Ӽ��� ������ Ÿ���� NUMBER������ �����Ͻÿ�
alter table newbook
modify isbn number;

-- NewBook ���̺��� isbn �Ӽ��� �����Ͻÿ�
alter table newbook
drop column isbn;

-- NewBook ���̺��� bookid �Ӽ��� NOT NULL ���������� �����Ͻÿ�
alter table newbook
modify bookid number not null;

-- NewBook ���̺��� bookid �Ӽ��� �⺻Ű�� �����Ͻÿ�
alter table newbook
add constraint pk_newbook primary key (bookid);

