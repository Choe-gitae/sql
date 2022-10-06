--1. EMPLOYEES ���̺����� ��� �̸��� first_name�� last_name�� ���� full_name���� ���
SELECT  first_name || last_name full_name
FROM    employees;
--WHERE

--2. �μ���ȣ�� 30(���źμ�)�̰� �޿� 10000�̸��� ����� full_name�� ����,�μ���ȣ�� ���
SELECT  first_name || last_name full_name , salary, department_id
FROM    employees
WHERE   department_id = 30 and salary < 10000;

--3. �μ���ȣ�� 30�̰� �޿��� 10000�޷� ���ϸ� �޴� 2006�⵵ ���� �Ի��� ����� full_name�� ���
SELECT  first_name || last_name full_name
FROM    employees
WHERE   department_id = 30 and salary < 10000 and hire_date < '2006-01-01';

--4. �μ���ȣ�� 30(���źμ�)�̰� �޿��� 10000������ ����� �μ���ȣ�� 60(IT�μ�)���� �޿��� 5000�̻��� ����� ��ȸ
SELECT  *
FROM    employees
WHERE   (department_id = 30 and salary < 10000) or (department_id = 60 and salary >= 5000);

--5. �����ȣ�� 110������ 120���� ��� �� �޿��� 5000���� 10000������ ��������� ��ȸ
SELECT  *
FROM    employees
WHERE   (employee_id between 110 and 120) and (salary between 5000 and 10000);

--6. �����ȣ�� 110������ 120���� �ƴ� ����� ��ȸ
SELECT  *
FROM    employees
WHERE   employee_id not between 110 and 120;

--7. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�)�� ���� ����� ��ȸ
SELECT  *
FROM    employees
WHERE   DEPARTMENT_ID in (30,60,90);

--8. �μ���ȣ�� 30(���źμ�), 60(IT�μ�), 90(�濵�μ�) ���� �μ��� ���� ����� ��ȸ
SELECT  *
FROM    employees
WHERE   DEPARTMENT_ID not in (30,60,90);

--9. ��ȭ��ȣ���� 590���� �����ϴ� ������� ��ȭ��ȣ�� ��ȸ
SELECT  first_name || last_name full_name, PHONE_NUMBER
FROM    employees
WHERE   PHONE_NUMBER like '590%';