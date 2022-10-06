---- 연습문제 2
-- 1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하십시오. 
-- Zlotkey는 제외하십시오.
SELECT last_name, hire_date
FROM employees
WHERE last_name != 'Zlotkey'
AND department_id = (SELECT department_id FROM employees WHERE last_name like 'Zlotkey');


-- 2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고
--    결과를 급여에 대해 오름차순으로 정렬하십시오.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES, (SELECT AVG(SALARY) savg FROM EMPLOYEES) avg
WHERE SALARY > avg.savg
ORDER BY SALARY;


-- 3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하십시오.
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME like '%u%');


-- 4. 부서 위치 ID가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하십시오.
SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM departments WHERE LOCATION_ID = 1700);


-- 5. King에게 보고하는 모든 사원의 이름과 급여를 표시하십시오.
-- SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME like 'King'
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE MANAGER_ID in (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME like 'King');


-- 6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하십시오.
SELECT DEPARTMENT_ID, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM departments WHERE department_name like 'Executive');


-- 7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는
--    모든 사원의 사원 번호, 이름 및 급여를 표시하는 질의를 작성하십시오.
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID in (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME like '%u%')
AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY;

