---- �������� 2
-- 1. Zlotkey�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�. 
-- Zlotkey�� �����Ͻʽÿ�.
SELECT last_name, hire_date
FROM employees
WHERE last_name != 'Zlotkey'
AND department_id = (SELECT department_id FROM employees WHERE last_name like 'Zlotkey');


-- 2. �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ�
--    ����� �޿��� ���� ������������ �����Ͻʽÿ�.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES, (SELECT AVG(SALARY) savg FROM EMPLOYEES) avg
WHERE SALARY > avg.savg
ORDER BY SALARY;


-- 3. �̸��� u�� ���Ե� ����� ���� �μ����� ���ϴ� ��� ����� ��� ��ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�.
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME like '%u%');


-- 4. �μ� ��ġ ID�� 1700�� ��� ����� �̸�, �μ� ��ȣ �� ���� ID�� ǥ���Ͻʽÿ�.
SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM departments WHERE LOCATION_ID = 1700);


-- 5. King���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���Ͻʽÿ�.
-- SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME like 'King'
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID in (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME like 'King');


-- 6. Executive �μ��� ��� ����� ���� �μ� ��ȣ, �̸� �� ���� ID�� ǥ���Ͻʽÿ�.
SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments WHERE department_name like 'Executive');


-- 7. ��� �޿����� ���� �޿��� �ް� �̸��� u�� ���Ե� ����� ���� �μ����� �ٹ��ϴ�
--    ��� ����� ��� ��ȣ, �̸� �� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻʽÿ�.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME like '%u%')
AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY;

