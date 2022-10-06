---- 연습문제 1
-- 1. SCOTT의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
SELECT e.empno, e.ename, e.job, e.sal
FROM emp e, (SELECT sal FROM emp WHERE ename like 'SCOTT') s
WHERE e.sal > s.sal;

SELECT empno, ename, job, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename like 'SCOTT');


-- 2. 30번 부서의 최소 급여보다 각부서의 최소 급여가 높은 부서를 출력
SELECT deptno, MIN(sal)
FROM emp
GROUP BY deptno
HAVING MIN(sal) > (SELECT MIN(sal) FROM emp WHERE deptno = 30);

SELECT DMIN.deptno
FROM (SELECT MIN(sal) MIN FROM emp WHERE deptno = 30) D30
, (SELECT deptno, MIN(sal) MIN FROM emp WHERE deptno != 30 GROUP BY deptno) DMIN
WHERE D30.MIN < DMIN.MIN;


-- 3. 업무별로 평균 급여 중에서 가장 적은 급여를 가진 직업을 출력
SELECT job, AVG(sal) AVG
FROM emp
GROUP BY job
HAVING AVG(sal) = (SELECT MIN(AVG(sal)) FROM emp GROUP BY job); 


-- 4. 사원번호가 7521의 업무와 같고 사번 7934인 직원보다 급여를 많이 받는 사원의 정보를 출력
SELECT *
FROM emp
WHERE job = (SELECT job FROM emp WHERE empno = 7521)
AND sal > (SELECT sal FROM emp WHERE empno = 7934);


-- 5. 'WARD'와 부서와 업무가 같은 사원 명단 출력
SELECT ename
FROM emp
WHERE deptno = (select deptno from emp where ename like 'WARD')
AND job = (select job from emp where ename like 'WARD');

