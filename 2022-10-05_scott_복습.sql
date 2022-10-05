-- 1. �����ȣ, �̸�, ����, �޿�,  ���� �޿��� 15% ������ �޿���(New Salary),  ������(Increase)�� ���
SELECT empno, ename, job, sal, sal*1.15 new_salary, sal*0.15 Increase
FROM emp;

-- 2. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �Ŀ� ���ƿ��� �������� ���
SELECT ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate, 6), '������') MONDAY
FROM emp;

-- 3.�̸�, �Ի���, �Ի��Ϸκ��� ���������  ���, �޿�, �Ի��Ϸκ��� ��������� �޿��� �Ѱ踦 ���
SELECT ename, hiredate
, TO_CHAR(sysdate, 'YYYY') - TO_CHAR(hiredate, 'YYYY') year, sal
, (TO_CHAR(sysdate, 'YYYY') - TO_CHAR(hiredate, 'YYYY')) * sal total_sal
FROM emp;

-- 4.�̸�, ����, �Ի���, �Ի��� ������ ���
SELECT ename, job, hiredate, TO_CHAR(hiredate, 'DAY')
FROM emp;

-- 5. ������, �μ��� �޿� �հ�� �ο����� ����ϵ�, 
-- 10�� �μ��� �����ϰ� ������ ��SALESMAN���� ��MANAGER���� ����Ѵ�.
SELECT job, deptno, SUM(sal), count(*)
FROM emp
--WHERE REGEXP_LIKE(job, 'SALESMAN | MANAGER');
WHERE deptno != 10 AND (job LIKE 'SALESMAN' OR job LIKE 'MANAGER')
GROUP BY job, deptno;

-- 6. �������� ��ձ޿��� �ִ�޿��� ����ϵ�, ��ձ޿��� 2000�̻��� �͸� ����ϰ� ��ձ޿��� ���� ������ ����
SELECT job, AVG(sal) AVG, MAX(sal) MAX
FROM emp
GROUP BY job
HAVING AVG(sal) >= 2000
ORDER BY AVG(sal);

?-- 7. ���� �Ի�⵵ ���� �ο����� ���
SELECT TO_CHAR(hiredate, 'YYYY') year, COUNT(*) "�ο���"
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY')
HAVING TO_CHAR(hiredate, 'YYYY') = TO_CHAR(hiredate, 'YYYY');

-- 8. 5���� �޿��հ�� �ο����� ��� (rownum�̿�)
SELECT ceil(ROWNUM/5), SUM(sal), COUNT(*) "�ο���"
FROM emp
GROUP BY ceil(ROWNUM/5)
ORDER BY ceil(ROWNUM/5);

/*
9. ������ ���� ���
   ( ���� ��µ� �ο����� �ٸ� ���� ���� )
   CLERK     SALESMAN        MANAGER      (������)
-----------------------------------------------------------------------
     4          4              3          (�ο���)
*/
SELECT COUNT(DECODE(job, 'CLERK', 1)) CLERK
, COUNT(DECODE(job, 'SALESMAN', 1)) SALESMAN
, COUNT(DECODE(job, 'MANAGER', 1)) MANAGER
FROM emp;
/*
10. ������ ���� ������, �μ��� �޿�  ���
   ( ���� ���� �ݾ��� �ٸ� ���� ���� )
������                10���μ�                20���μ�                30���μ�                �޿��հ�
---------------------------------------------------------------------------------------------------
CLERK                 1300                   1900                    950                   4150
SALESMAN                 0                      0                   5600                   5600
PRESIDENT             5000                      0                      0                   5000
MANAGER               2450                   2975                   2850                   8275
ANALYST                  0                   6000                      0                   6000
*/
SELECT job "������"
, NVL(SUM(DECODE(deptno, 10, sal)), 0) "10�� �μ�"
, NVL(SUM(DECODE(deptno, 20, sal)), 0) "20�� �μ�"
, NVL(SUM(DECODE(deptno, 30, sal)), 0) "30�� �μ�"
, SUM(sal) "�޿��հ�"
FROM emp
GROUP BY job;

Select job as ������,nvl(sum(decode(deptno,10,sal)),0) as "10���μ�"
, nvl(sum(decode(deptno,20,sal)),0) as "20���μ�" 
, nvl(sum(decode(deptno,30,sal)),0) as "30���μ�"
, sum(sal) as �޿��հ�
from emp
group by job;