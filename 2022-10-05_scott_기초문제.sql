------ ���� ���ʹ���
-- 1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
SELECT e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+);

SELECT e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno;

-- 2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���
SELECT e.empno, e.ename, e.sal, e.deptno, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+) and e.job like 'SALESMAN';

SELECT e.empno, e.ename, e.sal, e.deptno, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE e.job like 'SALESMAN';

-- 3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
SELECT e.ename, e.deptno, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+) and (e.comm is not null or e.comm >= 0);

SELECT e.ename, e.deptno, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE e.comm is not null or e.comm >= 0;

-- 4. �μ��� �μ���� �޿� �հ踦 ���
SELECT d.dname, sum(e.sal) dept_sal
FROM emp e, dept d
WHERE e.deptno = d.deptno(+)
GROUP BY d.dname;

-- 5. ������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ��� 
SELECT e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno(+) and job like 'MANAGER';

SELECT e.ename, e.job, d.dname, d.loc
FROM emp e LEFT OUTER JOIN dept d
ON e.deptno = d.deptno
WHERE job like 'MANAGER';