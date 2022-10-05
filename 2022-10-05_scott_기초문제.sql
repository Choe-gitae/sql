------ 조인 기초문제
-- 1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력
SELECT e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+);

SELECT e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- 2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력
SELECT e.empno, e.ename, e.sal, e.deptno, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+) and e.job like 'SALESMAN';

SELECT e.empno, e.ename, e.sal, e.deptno, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE e.job like 'SALESMAN';

-- 3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
SELECT e.ename, e.deptno, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+) and (e.comm is not null or e.comm >= 0);

SELECT e.ename, e.deptno, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE e.comm is not null or e.comm >= 0;

-- 4. 부서별 부서명과 급여 합계를 출력
SELECT d.dname, sum(e.sal) dept_sal
FROM emp e, dept d
WHERE e.deptno = d.deptno(+)
GROUP BY d.dname;

-- 5. 업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력 
SELECT e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+) and job like 'MANAGER';

SELECT e.ename, e.job, d.dname, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE job like 'MANAGER';