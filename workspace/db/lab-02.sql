-- hr �������� �۾� ����
select 'abc' || ' ' || 'def' from dual;

-- ���̺� Ž��

-- �������(Employees) ���̺��� �����ȣ, �̸�, �޿�, ����, �Ի���, ����� �����ȣ�� ����Ͻÿ�. 
-- �̶� �̸��� �̸��� ���� �����Ͽ� Name�̶�� ��Ī���� ����Ͻÿ�
select 
    employee_id
    , first_name || ' ' || last_name as Name
    , salary
    , job_id
    , hire_date
    , manager_id
from 
    employees;

-- �������(Employees) ���̺��� ����� �̸��� ���� Name, ������ Job, �޿��� Salary, 
-- ������ $100 ���ʽ��� �߰��Ͽ� ����� ���� Increase Ann_Salary, 
-- �޿��� $100 ���ʽ��� �߰��Ͽ� ����� ������ Increase Salary��� ��Ī�� �ٿ� ����Ͻÿ�
select 
    first_name || ' ' || last_name as Name,
    job_id job,
    salary,
    salary * 12 + 100 "Increase Ann Salary",
    (salary + 100) * 12 "Increase Salary"
from employees;

-- �������(Employees) ���̺��� ��� ����� ��(last_name)�� ������ 
-- ����: 1 Year Salary = $������ �������� ����ϰ�, 1 Year Salary��� ��Ī�� �ٿ� ����Ͻÿ�
select 
    last_name || ': 1 Year Salary = $' || salary * 12 as "1 Year Salary"
from employees;

-- �μ����� ����ϴ� ������ �� ������ ����Ͻÿ�
select distinct department_id, job_id 
from employees
order by department_id;

-- HR �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
-- �������(Employees) ���̺��� �޿��� $7,000~$10,000 ���� �̿��� ����� 
-- �̸��� ��(Name���� ��Ī) �� �޿��� �޿��� ���� ������ ����Ͻÿ�
select 
    first_name || ' ' || last_name Name,
    salary
from employees
where salary not between 7000 and 10000
order by salary asc;

-- ����� ��(last_name) �߿� ��e�� �� ��o�� ���ڰ� ���Ե� ����� ����Ͻÿ�. 
-- �̶� �Ӹ����� ��e or o Name���̶�� ����Ͻÿ�
select last_name "e or o Name"
from employees
where last_name like '%e%' or last_name like '%o%';

-- 2006�� 05�� 20�Ϻ��� 2007�� 05�� 20�� ���̿� ���� ������� 
-- �̸��� ��(Name���� ��Ī), ����, �Ի����� ����Ͻÿ�. 
-- ��, �Ի����� ���� ������ �����Ͻÿ�
select 
    first_name || ' ' || last_name Name,
    job_id,
    hire_date
from employees
where hire_date between '2006-05-20' and '2007-05-20'
order by hire_date asc;

-- HR �μ������� �޿�(salary)�� ������(commission_pct)�� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
-- ������ �޴� ��� ����� �̸��� ��(Name���� ��Ī), �޿�, ����, �������� ����Ͻÿ�. 
-- �̶� �޿��� ū ������� �����ϵ�, �޿��� ������ �������� ū ������� �����Ͻÿ�
select 
    first_name || ' ' || last_name Name,
    salary,
    job_id,
    commission_pct 
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;


