-- 사원 테이블(emp)에 사원명과 부서테이블(dept)에 그 사원의 부서명을 출력
SELECT  ename, dname
FROM    emp, dept;

SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept;

-- JOIN 사용
SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept
WHERE   emp.deptno = dept.deptno;
-- 별칭 사용
SELECT  e.ename, d.dname, d.deptno
FROM    emp e, dept d
WHERE   e.deptno = d.deptno;

-- 내부 JOIN
SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno = d.deptno;
-- 내부 JOIN 표준안
SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno;

-- 외부 JOIN & 표준안
SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno = d.deptno(+);

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e LEFT OUTER JOIN dept d
ON      e.deptno = d.deptno;

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno(+) = d.deptno;

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e RIGHT OUTER JOIN dept d
ON      e.deptno = d.deptno;

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno(+) = d.deptno(+); -- 불가능

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e FULL OUTER JOIN dept d
ON      e.deptno = d.deptno;

------ 문제
---- 사원테이블(emp)에 각 사원의 매니저를 조회
-- 내부 조인
SELECT  e1.empno, e1.ename, e2.empno, e2.ename
FROM    emp e1, emp e2
WHERE   e1.mgr = e2.empno;
-- 표준안
SELECT  e1.empno empno, e1.ename ename, e2.empno mgrno, e2.ename mgrname
FROM    emp e1 INNER JOIN emp e2
ON      e1.mgr = e2.empno;

-- 외부 조인
SELECT  e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM    emp e1, emp e2
WHERE   e1.mgr = e2.empno(+);
-- 표준안
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;


---- 집합
-- 업무가 CLERK인 사원조회 -- SMITH / ADAMS / JAMES / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
UNION ALL -- 합집합
-- 10번 부서의 사원조회 -- CLARK / KING / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;

-- 업무가 CLERK인 사원조회 -- SMITH / ADAMS / JAMES / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
INTERSECT -- 교집합
-- 10번 부서의 사원조회 -- CLARK / KING / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;

-- 업무가 CLERK인 사원조회 -- SMITH / ADAMS / JAMES / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
MINUS -- 차집합
-- 10번 부서의 사원조회 -- CLARK / KING / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
