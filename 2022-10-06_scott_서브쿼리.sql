-- ��� �޿� ���ϱ�
SELECT round(avg(sal)) FROM emp;
-- �� ��� �޿����� ���� ��� ���� ��ȸ
SELECT ename, sal
FROM emp
WHERE sal < (SELECT ROUND(AVG(sal)) FROM emp);


-- ������ ���� ���� ����� ���� ��ȸ
SELECT ROUND(MAX(sal)) FROM emp;


-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ
SELECT *
FROM emp
WHERE sal > (SELECT ROUND(AVG(sal)) FROM emp)
AND sal < (SELECT MAX(sal) FROM emp);

SELECT e.*
FROM emp e,
(SELECT ROUND(AVG(sal)) avg, MAX(sal) max FROM emp) ext
WHERE e.sal > ext.avg AND e.sal < ext.max;


-- ���޼����� ���� 10���� ����� ���
SELECT sort.ename
FROM (SELECT ename FROM emp ORDER BY sal desc) sort
WHERE ROWNUM < 11;


-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
SELECT MIN(sal) FROM emp GROUP BY job;

SELECT empno, ename, job, sal
FROM emp
WHERE (job, sal) in (SELECT job, MIN(sal) FROM emp GROUP BY job);

INSERT INTO emp(empno, ename, job, sal) VALUES(9999,'�׽�Ʈ','CLERK',1250);


-- 10�� �μ� ������� ������ ������ ������ �˻�
SELECT ename, job
FROM emp
WHERE job in (SELECT job FROM emp WHERE deptno = 10);
-- ANY�� �� �Ⱦ��δ�
SELECT ename, job
FROM emp
WHERE job = ANY(SELECT job FROM emp WHERE deptno = 10);


-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
SELECT empno, ename, job
FROM emp e1
WHERE exists (SELECT empno FROM emp e2 WHERE e1.empno = e2.mgr);

-- ��� ���
SELECT empno, ename, job
FROM emp e1
WHERE not exists (SELECT empno FROM emp e2 WHERE e1.empno = e2.mgr);


-- (1) �μ��� �޿���� ���̺� ����
create table stat_salary ( 
stat_date date not null, -- ��¥
dept_no number, -- �μ�
emp_count number, -- �����
tot_salary number, -- �޿��Ѿ�
avg_salary number ); -- �޿����

DESC stat_salary;

SELECT sysdate, deptno FROM emp GROUP BY deptno;


-- (2) ��¥�� �μ���ȣ �Է�
INSERT INTO stat_salary(stat_date, dept_no)
    SELECT sysdate, deptno FROM emp GROUP BY deptno;

SELECT * FROM stat_salary;

-- (3) �����, �޿��Ѿ�, ��ձ޿� �Է�(?) -> ����
SELECT COUNT(*), SUM(sal), ROUND(AVG(sal)) FROM EMP GROUP BY deptno;

update stat_salary ss
set (emp_count, tot_salary, avg_salary)
    = (SELECT COUNT(*), SUM(sal), ROUND(AVG(sal)) 
        FROM EMP e
        WHERE ss.dept_no = e.deptno
        GROUP BY deptno);

create table emp_cp as select * from emp;
select * from emp_cp;

-- �μ����� 'SALES'�� ����� ���� ���� ( emp_cp )
delete from emp_cp
where deptno = (select deptno from dept where dname like 'SALES');


-- merge ���
merge into emp_cp ec
using emp e
on (ec.ename = e.ename)
when matched then
update set ec.sal = nvl(ec.sal*1.1,0)
when not matched then
insert ec.* values(*);


commit;

