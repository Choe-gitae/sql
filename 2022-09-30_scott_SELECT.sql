/*
    SELECT  �˻��� �׸��
    FROM    ���̺�
    WHERE   ����
*/

-- ��� ����� ������ �޿�, �޿��� ���ʽ��� ���� �հ� ���
SELECT  ename, sal, sal+nvl(comm,0) total_sal
FROM    emp;
--WHERE

SELECT  ename||' '||job staff
FROM    emp;

SELECT DISTINCT job FROM emp;

-- 1- 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
SELECT  empno, ename, deptno
FROM    emp
WHERE   deptno=20;

-- 2- �Ի����� 81/01/01���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
SELECT  empno, ename, hiredate
FROM    emp
WHERE   hiredate between '1981-01-01' and '1981-06-09';

SELECT  empno, ename, hiredate
FROM    emp
WHERE   hiredate >= '1981-01-01' and hiredate <= '1981-06-09';

-- 3- �������� salesman, clerk�� ������� �̸��� ������ ���
SELECT  ename, job
FROM    emp
WHERE   job like 'SALESMAN' or job like 'CLERK';

SELECT  ename, job
FROM    emp
WHERE   job = upper('salesman') or job = upper('clerk');

SELECT  ename, job
FROM    emp
WHERE   job in ('SALESMAN','CLERK');

-- 4- ������ president�̰� �޿��� 1500�̻��̰ų� ������ salesman�� ����� ������ ���
SELECT  *
FROM    emp
WHERE   ( job like 'PRESIDENT' and sal >= 1500 ) or job like 'SALESMAN';

-- 5- ������ president �Ǵ� salesman�̰� �޿��� 1500�̻��� ����� ������ ���?
SELECT  *
FROM    emp
WHERE   ( job like 'PRESIDENT' or job like 'SALESMAN' ) and sal >= 1500;

SELECT  *
FROM    emp
WHERE   job in ('PRESIDENT','SALESMAN') and sal >= 1500;

-- 6- Ŀ�̼�(comm)�� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT  ename, sal, comm
FROM    emp
WHERE   comm is NULL;

--  7- �����, �޿�, Ŀ�̼�, �ѱ޿�( �޿� + Ŀ�̼�)�� ���
SELECT  ename, sal, comm, sal+nvl(null,0) TOTAL_SAL
FROM    emp;
--WHERE   

-- 8- �̸� A�� �����ϴ� ����� ���
SELECT  ename
FROM    emp
WHERE   ename like 'A%';

-- 9- �̸��� �ι�° ���ڰ� L�� ����� ���
SELECT  ename
FROM    emp
WHERE   ename like '_L%';

-- 10- �̸��� L�� �� �� �̻� ���Ե� ����� ���
SELECT  ename
FROM    emp
WHERE   ename like '%L%L%';

-- 11- Ŀ�̼�(COMM)�� NULL�� �ƴ� ����� ��� ������ ���
SELECT  *
FROM    emp
WHERE   comm is not null;

-- 12- ���ʽ��� �޿����� 10%�̻� ���� ��� ����� ���� �̸�, �޿�, ���ʽ��� ���
SELECT  ename, sal, comm
FROM    emp
WHERE   comm*1.1 >= sal;

-- 13- ������ clerk�̰ų� analyst�̰� �޿��� 1000, 3000, 5000�� �ƴ� ��� ����� ������ ���
SELECT  *
FROM    emp
WHERE   job in ('CLERK','ANALYST') and ( sal!=1000 and sal!=3000 and sal!=5000 );

SELECT  *
FROM    emp
WHERE   job in ('CLERK','ANALYST') and sal not in (1000,3000,5000);

-- 14- �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT  *
FROM    emp
WHERE   deptno = 30 or (job like 'MANAGER' and empno=7782);
