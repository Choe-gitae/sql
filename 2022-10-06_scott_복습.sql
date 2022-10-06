-- 1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.ename like '%L%';

SELECT e.ename ename, e.job job, d.dname dname, d.loc loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename like '%L%';

-- 2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���
SELECT e1.ename ename, e1.hiredate hiredate, e2.ename mgr_name, e2.hiredate mgr_hiredate
FROM emp e1, emp e2
WHERE e1.mgr = e2.empno(+) AND e1.hiredate < e2.hiredate;

SELECT e1.ename ename, e1.hiredate hiredate, e2.ename mgr_name, e2.hiredate mgr_hiredate
FROM emp e1 LEFT OUTER JOIN emp e2
ON e1.mgr = e2.empno
WHERE e1.hiredate < e2.hiredate;

-- 3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
/*
��� ����� �Ŵ������ �Ŵ�����
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