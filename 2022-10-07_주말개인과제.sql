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
WHERE REGEXP_LIKE(ename, '^S') ;

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
SELECT ename, ROUND(NVL(salary, 0)/12) ms, commission, salary
FROM employee
ORDER BY ms DESC ;

-- 문제 10
SELECT ename, ROUND(NVL2(salary, salary, 0)/12) ms, commission, salary
FROM employee
ORDER BY ms DESC ;

-- 문제 11
SELECT SUM(salary) "급여총액", ROUND(AVG(salary)) "평균액", MAX(salary) "최고액", MIN(salary) "최소액"
FROM employee ;

-- 문제 12
SELECT COUNT(*) "직업 종류의 갯수"
FROM (SELECT DISTINCT job FROM employee) ;

-- 문제 13
SELECT dno "부서번호", ROUND(AVG(salary)) "평균월급"
FROM employee
GROUP BY dno ;

-- 문제 14
SELECT job, count(*) count
FROM employee
GROUP BY job ;

-- 문제 15
SELECT job, MIN(salary) "최저급여"
FROM employee
WHERE manager IS NOT NULL
GROUP BY job
HAVING MIN(salary) > 2000
ORDER BY DESC ;

-- 문제 16
SELECT ename "사원이름", job "담당업무"
FROM employee
WHERE job LIKE (SELECT job FROM employee WHERE eno = 7788) ;

-- 문제 17
SELECT ename "사원이름", job "담당업무"
FROM employee
WHERE salary > (SELECT salary FROM employee WHERE eno = 7499) ;

-- 문제 18
SELECT e.ename ename, e.salary salary, e.dno dno
FROM employee e, (SELECT dno, MIN(sal) min FROM employee GROUP BY dno) d
WHERE e.salary = d.min AND e.dno = d.dno ;

-- 문제 19
SELECT SUBSTR(ename,1,1) || '*****' ||SUBSTR(ename,-1,1) ename
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee)
ORDER BY salary ;

-- 문제 20
SELECT dno, ename, job
FROM employee
WHERE dno = (SELECT dno FROM dept WHERE dname LIKE 'RESEARCH') ;


-----------------------------------------------------------------------------------
SELECT deptno, ename, job
FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname LIKE 'RESEARCH') ;

SELECT ename
FROM emp
WHERE REGEXP_LIKE(ename, 'A | E')  ;

SELECT ename, ROUND(NVL(sal, 0)/12) ms, comm, sal
FROM emp
ORDER BY ms DESC ;

SELECT deptno, MIN(sal) FROM emp GROUP BY deptno;
SELECT SUBSTR(ename,1,1) || '*****' ||SUBSTR(ename,-1,1) ename FROM emp

SELECT e.ename ename, e.sal sal, e.deptno deptno
FROM emp e, (SELECT deptno, MIN(sal) min FROM emp GROUP BY deptno) d
WHERE e.sal = d.min AND e.DEPTNO = d.deptno ;
-----------------------------------------------------------------------------------

-- 문제 1		기본포트
-- 오라클		1521
-- MS-SQL	1433
-- My-SQL	3306

-- 문제 2
ALTER USER scott IDENTIFIED BY tiger;

-- 문제 3
CREATE USER scott IDENTIFIED BY 1234;
GRANT RESOURCE, CONNECT, DBA TO scott;

-- 문제 4
CREATE TABLE dept
(
	dno NUMBER(2),
	dname VARCHAR2(14),
	loc VARCHAR2(13),
	CONSTRAINT pk_dept_dno PRIMARY KEY (dno)
);

CREATE TABLE emp
(
	eno NUMBER(4),
	ename VARCHAR2(10),
	job VARCHAR2(9),
	manager NUMBER(4),
	hiredate DATE,
	salary NUMBER(7,2),
	commission NUMBER(7,2),
	dno NUMBER(2),
	CONSTRAINT pk_emp_eno PRIMARY KEY (eno),
	CONSTRAINT fk_emp_dno FOREIGN KEY (dno) REFERENCES dept(dno)
);

-- 문제 5
CREATE TABLE salg
(
	grade NUMBER,
	losal NUMBER,
	hisal NUMBER
);

-- 문제 6
INSERT INTO dept(dno, dname, loc) VALUES (10,'ACCOUNTING','NEW YORK');

-- 문제 7
INSERT INTO emp(eno, ename, job, manager, hiredate, salary, dno) 
VALUES (7369,'SMITH','CLERK',7902,'80-12-17',800,20);

-- 문제 8
INSERT INTO salg(grade, losal, hisal) VALUES (1,700,1200);

-- 문제 9
DELETE FROM salg;
DELETE FROM emp;
DELETE FROM dept;

TRUNCATE TABLE salg;
TRUNCATE TABLE emp;
TRUNCATE TABLE dept;

-- 문제 10
DROP TABLE salg;
DROP TABLE emp;
DROP TABLE dept;

