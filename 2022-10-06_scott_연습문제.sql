---- �������� 1
-- 1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
SELECT e.empno, e.ename, e.job, e.sal
FROM emp e, (SELECT sal FROM emp WHERE ename like 'SCOTT') s
WHERE e.sal > s.sal;

SELECT empno, ename, job, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename like 'SCOTT');


-- 2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
SELECT deptno, MIN(sal)
FROM emp
GROUP BY deptno
HAVING MIN(sal) > (SELECT MIN(sal) FROM emp WHERE deptno = 30);

SELECT DMIN.deptno
FROM (SELECT MIN(sal) MIN FROM emp WHERE deptno = 30) D30
, (SELECT deptno, MIN(sal) MIN FROM emp WHERE deptno != 30 GROUP BY deptno) DMIN
WHERE D30.MIN < DMIN.MIN;


-- 3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
SELECT job, AVG(sal) AVG
FROM emp
GROUP BY job
HAVING AVG(sal) = (SELECT MIN(AVG(sal)) FROM emp GROUP BY job); 


-- 4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
SELECT *
FROM emp
WHERE job = (SELECT job FROM emp WHERE empno = 7521)
AND sal > (SELECT sal FROM emp WHERE empno = 7934);


-- 5. 'WARD'�� �μ��� ������ ���� ��� ��� ���
SELECT ename
FROM emp
WHERE deptno = (select deptno from emp where ename like 'WARD')
AND job = (select job from emp where ename like 'WARD');

