-- 문제 1
SELECT ename, eno, hiredate, salary
FROM employee
WHERE salary BETWEEN 2000 AND 3000
ORDER BY ename ;

-- 문제 2
SELECT ename, hiredate, dno
FROM employee
WHERE commission IS NULL
ORDER BY dno, ename ;

-- 문제 3
SELECT eno, ename, salary, commission
FROM employee
WHERE commission IN (300, 500, 1400)
ORDER BY commission DESC ;

-- 문제 4
SELECT ename
FROM employee
WHERE ename LIKE 'S%' ;

-- 문제 5
SELECT ename, hiredate
FROM employee
WHERE hiredate NOT LIKE '81%' ;

-- 문제 6
SELECT DISTINCT dno
FROM employee
ORDER BY dno ;

-- 문제 7
SELECT ename
FROM employee
WHERE ename LIKE '%A%' AND ename LIKE '%E%' ;

-- 문제 8
SELECT eno, ename, hiredate
FROM employee
WHERE SUBSTR(hiredate, 4, 2) = 12 ;

-- 문제 9
SELECT ename, NVL(salary, 0)/12 ms, commission, salary
FROM employee
ORDER BY ms DESC ;

-- 문제 10
SELECT ename, NVL2(salary, salary, 0)*12 ms, commission, salary
FROM employee
ORDER BY ms DESC ;

-- 문제 11
SELECT SUM(salary) 급여총액, 
FROM employee
ORDER BY ms DESC ;



SELECT hiredate
FROM emp
WHERE SUBSTR(hiredate, 4, 2) = 12;









-- 문제 21
-- 기본포트
-- 오라클		1521
-- MySQL	3306
-- MsSQL	1433