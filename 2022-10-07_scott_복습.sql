-- 11. scott 또는 ward와 월급이 같은 사원의 정보를 이름, 업무, 급여를 출력
SELECT ename, job, sal
FROM EMP
WHERE sal = (SELECT sal FROM emp WHERE ename LIKE 'SCOTT')
OR sal = (SELECT sal FROM emp WHERE ename LIKE 'WARD');


-- 12. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력
SELECT e.ename, e.job
FROM EMP e LEFT OUTER JOIN DEPT d 
ON e.DEPTNO = d.DEPTNO 
WHERE loc LIKE 'CHICAGO';


-- 13. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
SELECT e1.deptno, e1.ename, e1.sal
FROM emp e1
WHERE sal > (SELECT AVG(sal) FROM emp e2 WHERE e1.deptno = e2.deptno);

SELECT e1.deptno, e1.ename, e1.sal
FROM emp e1, (SELECT DEPTNO, AVG(sal) avg FROM emp GROUP BY DEPTNO) e2
WHERE e1.DEPTNO = e2.DEPTNO AND e1.SAL > e2.avg;
