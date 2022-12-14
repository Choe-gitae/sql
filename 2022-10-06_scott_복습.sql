-- 1. 사원명에 ‘L’자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력
SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.ename like '%L%';

SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename like '%L%';

-- 2. 관리자보다 먼저 입사한 사원에 대해 이름, 입사일, 관리자 이름, 관리자 입사일을 출력
SELECT e1.ename ename, e1.hiredate hiredate, e2.ename mgr_name, e2.hiredate mgr_hiredate
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+) AND e1.hiredate < e2.hiredate;

SELECT e1.ename ename, e1.hiredate hiredate, e2.ename mgr_name, e2.hiredate mgr_hiredate
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno
WHERE e1.hiredate < e2.hiredate;

-- 3. 아래의 결과를 출력 ( 관리자가 없는 KING을 포함하여 모든 사원을 출력 )
/*
사번 사원명 매니저사번 매니저명
7839 KING 
7698 BLAKE 7839 KING 
7782 CLARK 7839 KING
*/
SELECT e1.empno empno, e1.ename ename, e1.mgr mgr, e2.ename mgr_name
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+);

SELECT e1.empno empno, e1.ename ename, e1.mgr mgr, e2.ename mgr_name
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2. empno;