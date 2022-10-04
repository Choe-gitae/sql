-- 1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
select  EMPLOYEE_ID, LAST_NAME, HIRE_DATE
from    EMPLOYEES
where   to_char(HIRE_DATE, 'YYYY') = '2003';

-- 2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
select  *
from    EMPLOYEES
where   JOB_ID in ('FI_ACCOUNT', 'FI_MGR', 'SA_MAN', 'SA_REP');

-- 3. Ŀ�̼��� �޴� ������� ����� ���
select  FIRST_NAME || ' ' || LAST_NAME name
from    EMPLOYEES
where   COMMISSION_PCT is not null;

-- 4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
select  distinct JOB_ID
, decode(JOB_ID, 'SA_MAN', '�Ǹźμ�', 'SA_REP�̸�', '�Ǹźμ�', '�� �� �μ�') department
from    EMPLOYEES;

-- 5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
select  to_char(HIRE_DATE,'YYYY') year
, min(SALARY) min, max(SALARY) max, sum(SALARY) sum, avg(SALARY) avg
from    EMPLOYEES
group by to_char(HIRE_DATE, 'YYYY')
order by to_char(HIRE_DATE, 'YYYY');

-- 6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
select  DEPARTMENT_ID
from    EMPLOYEES
group by DEPARTMENT_ID
having avg(SALARY) >= 10000
order by avg(SALARY) desc;

-- 7. �μ��� �ִ� �޿��� ���Ͻÿ�
select  DEPARTMENT_ID, max(SALARY) max_SALARY
from    EMPLOYEES
group by DEPARTMENT_ID;