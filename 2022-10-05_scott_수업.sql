-- ��� ���̺�(emp)�� ������ �μ����̺�(dept)�� �� ����� �μ����� ���
SELECT  ename, dname
FROM    emp, dept;

SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept;

-- JOIN ���
SELECT  emp.ename, dept.dname, dept.deptno
FROM    emp, dept
WHERE   emp.deptno = dept.deptno;
-- ��Ī ���
SELECT  e.ename, d.dname, d.deptno
FROM    emp e, dept d
WHERE   e.deptno = d.deptno;

-- ���� JOIN
SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e, dept d
WHERE   e.deptno = d.deptno;
-- ���� JOIN ǥ�ؾ�
SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e INNER JOIN dept d
ON      e.deptno = d.deptno;

-- �ܺ� JOIN & ǥ�ؾ�
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
WHERE   e.deptno(+) = d.deptno(+); -- �Ұ���

SELECT  e.ename ename, d.dname dname, d.deptno deptno
FROM    emp e FULL OUTER JOIN dept d
ON      e.deptno = d.deptno;

------ ����
---- ������̺�(emp)�� �� ����� �Ŵ����� ��ȸ
-- ���� ����
SELECT  e1.empno, e1.ename, e2.empno, e2.ename
FROM    emp e1, emp e2
WHERE   e1.mgr = e2.empno;
-- ǥ�ؾ�
SELECT  e1.empno empno, e1.ename ename, e2.empno mgrno, e2.ename mgrname
FROM    emp e1 INNER JOIN emp e2
ON      e1.mgr = e2.empno;

-- �ܺ� ����
SELECT  e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM    emp e1, emp e2
WHERE   e1.mgr = e2.empno(+);
-- ǥ�ؾ�
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno;


---- ����
-- ������ CLERK�� �����ȸ -- SMITH / ADAMS / JAMES / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
UNION ALL -- ������
-- 10�� �μ��� �����ȸ -- CLARK / KING / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;

-- ������ CLERK�� �����ȸ -- SMITH / ADAMS / JAMES / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
INTERSECT -- ������
-- 10�� �μ��� �����ȸ -- CLARK / KING / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;

-- ������ CLERK�� �����ȸ -- SMITH / ADAMS / JAMES / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
MINUS -- ������
-- 10�� �μ��� �����ȸ -- CLARK / KING / MILLER
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
