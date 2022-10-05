--1. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )
SELECT e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees e, departments d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+) and LAST_NAME like 'King';

SELECT e.EMPLOYEE_ID, d.DEPARTMENT_NAME
FROM employees e LEFT OUTER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE LAST_NAME like 'King';

--2. 이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )
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

--3. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력
-- (*) Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면
SELECT e.EMPLOYEE_ID, e.LAST_NAME, e.HIRE_DATE, d.DEPARTMENT_NAME
FROM employees e LEFT OUTER JOIN departments d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE TO_CHAR(e.HIRE_DATE, 'YYYY') = 2007
AND TO_CHAR(e.HIRE_DATE, 'MM') < 07;


--4. 'Executive' 부서에서 사원과 해당 사원의 매니저(상사) 이름을 출력
-- (*) 매니저(상사)가 없는 사원인 'King'이 출력되려면
SELECT e1.LAST_NAME, e2.LAST_NAME
FROM employees e1 LEFT OUTER JOIN employees e2
ON e1.MANAGER_ID = e2.EMPLOYEE_ID
LEFT OUTER JOIN DEPARTMENTS d
ON e1.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME LIKE 'Executive';



