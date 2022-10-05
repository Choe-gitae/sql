--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
SELECT e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees e, departments d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+) and LAST_NAME like 'King';

SELECT e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees e LEFT OUTER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE LAST_NAME like 'King';

--2. �̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
SELECT e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_TITLE
FROM employees e, departments d, jobs j
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.JOB_ID = j.JOB_ID
AND LAST_NAME like 'King';

SELECT e.EMPLOYEE_ID, d.DEPARTMENT_NAME, j.JOB_TITLE
FROM employees e INNER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
INNER JOIN jobs j
ON e.JOB_ID = j.JOB_ID
WHERE LAST_NAME like 'King';

--3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���
-- (*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.HIRE_DATE, d.DEPARTMENT_NAME
FROM employees e LEFT OUTER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE TO_CHAR(e.HIRE_DATE, 'YYYY') = 2007
AND TO_CHAR(e.HIRE_DATE, 'MM') < 07;


--4. 'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���
-- (*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
SELECT e1.LAST_NAME, e2.LAST_NAME
FROM employees e1 LEFT OUTER JOIN employees e2
ON e1.MANAGER_ID = e2.EMPLOYEE_ID
LEFT OUTER JOIN DEPARTMENTS d
ON e1.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME LIKE 'Executive';



