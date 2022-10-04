-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
select  ename, sal, round(sal/12, -2) wolgeub
from    emp;

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
select  ename, sal, trunc(sal*0.033,-1) tax
from    emp;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
select  empno, ename, lower(job) job
from    emp
where   lower(ename) like lower('smith');

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
select  empno, initcap(ename) ename, initcap(job) job
from    emp;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
select  empno, ename ename, job, sal, deptno
from    emp
where   substr(ename,1,1) > 'K' and substr(ename,1,1) < 'Y'
order by ename asc;

-- �̸��� 5���� �̻��� ������� ���
select  *
from    emp
where   length(ename) >= 5;

-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
select  RPAD(ename, 15, '*') ename
from    emp;

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
select  RPAD(sal, 10, '-') sal
from    emp;

-- �޿��� ���ڿ��� �������̻�����ĥ�ȱ��� ���ڷ� ��ü
select  sal, TRANSLATE(sal,'0123456789','�����̻�����ĥ�ȱ�') sal_kor
from    emp;

-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
select  sal, REPLACE(sal, 0, '$') sal
from    emp;


commit;
select name, jumin, substr(jumin, 8, 1) gender,
                    substr(jumin, 1, 2) birth_year
from info_tab;

select  '-' || trim(' �̼��� ') || '-' as col1, 
        '-' || ltrim(' �̼��� ') || '-' as col2, 
        '-' || rtrim(' �̼��� ') || '-' as col3 
from dual;

-- ***** ���� ����
select REPLACE('     ��     ��     ��    ', ' ', '') ename
from dual;

-- ������� �ٹ��� ���� ���� ��� ������ ���
select  ename, hiredate, sysdate - nvl(hiredate,sysdate), ceil(sysdate - nvl(hiredate,sysdate)) "�ٹ���"
from    emp
order by sysdate - hiredate desc nulls last;

-- ������� �ٹ��� ���� �� �� �� ���ΰ��� ���
select  ename, trunc( (sysdate-hiredate)/7 ) week
             , floor ( mod( sysdate-hiredate,7 ) )day
from    emp;

-- 10�� �μ��� ����� ��������� �ٹ� ������ ���
select  ename, trunc( months_between(sysdate, hiredate) ) "�ٹ� ����1"
            , floor( months_between(sysdate, hiredate) ) "�ٹ� ����2"
from    emp
where   deptno = 10;

-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select add_months( sysdate, 3 ) as mydate from dual;

-- ���� ��¥���� ���ƿ��� ������������ ��¥ ���ϱ�
select next_day(sysdate, '������') monday
from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
select last_day(sysdate)
from dual;

-- �Ի����ڿ��� �Ի�⵵�� ���
select  ename, hiredate, to_char(hiredate,'YYYY') hire_year
from    emp;

-- �Ի����ڸ� ��1999�� 1�� 1�ϡ� �������� ���
select  ename, hiredate, to_char(hiredate,'YYYY"��" MM"��" DD"��"') hire_date
from    emp;

-- 1981�⵵�� �Ի��� ��� �˻�
select  *
from    emp
where   to_char(hiredate, 'YYYY') = '1981';

-- 5���� �Ի��� ��� �˻�
select  *
from    emp
where   to_char(hiredate, 'MM') = '05';

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
select  ename, sal, to_char(sal, '$999,999,999,999') dollar
from    emp;

-- 81�� 2���� �Ի��� ��� �˻�
select  *
from    emp
where   to_char(hiredate, 'YYYY-MM') = '1981-02';

-- 81�⿡ �Ի����� ���� ��� �˻�
select  *
from    emp
where   not to_char(hiredate, 'YYYY') = '1981';

-- 81�� �Ϲݱ⿡ �Ի��� ��� �˻�
select  *
from    emp
where   to_char(hiredate, 'YYYY-MM') > '1981-06'
    and to_char(hiredate, 'YYYY-MM') <= '1981-12';

select  *
from    emp
where   to_char(hiredate, 'YYYY') = '1981'
    and to_char(hiredate, 'MM') > '06';
        
select  *
from    emp
where   hiredate > '1981-06-30'
    and hiredate <= '1981-12-31';
    
-- �ֹι�ȣ���� ���� ���ϱ�
SELECT decode( substr(jumin, 8, 1), '1', '����', '3', '����', '����') gender 
FROM info_tab;

SELECT CASE substr( jumin, 8, 1)
            WHEN '1' THEN '����'
            WHEN '3' THEN '����'
            ELSE '����'
            END as gender
FROM info_tab;

-- �μ���ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
select  decode(deptno, 10, '������', 20, '������', 30, 'IT��', '�����') deprartment
from    emp;

select  case deptno
        when 10 then '������'
        when 20 then '������'
        when 30 then 'IT��'
        else '�����'
        end department
from emp;

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ���
-- �����ȣ, �����, ����, �޿�, ������ �޿��� ���
select empno, ename, job, sal
, decode(job, 'ANALYST', sal*1.1, 'CLERK', sal*1.15
, 'MANAGER', sal*1.2, sal*1) increase_sal
from emp;

select  empno, ename, job, sal
,       case job
        when 'ANALYST' then sal*1.1
        when 'CLERK' then sal*1.15
        when 'MANAGER' then sal*1.2
        else sal
        end increase_sal
from emp;

select all job from emp;
select distinct job from emp;

-- rownum ����Ŭ Ư����
desc emp;
select rownum, empno, ename, job 
from emp
where rownum <= 5;

-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
select  avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
from    emp
where   job = 'SALESMAN';

-- Ŀ�̼�(COMM)�� �޴� ������� ����
select  count(comm)
from    emp
where   nvl(comm, 0) > 0;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
select  deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
from    emp
group by deptno;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������
select  deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
from    emp
group by deptno
order by sum(sal) desc;

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
select  deptno, job, count(*), avg(sal), sum(sal)
from    emp 
group by deptno, job;

-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
select  deptno, avg(sal), sum(sal)
from    emp
group by deptno
having max(sal) >= 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
select  job, avg(sal), sum(sal)
from    emp
group by job
having avg(sal) >= 3000;

-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ���
-- ��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
select  job, sum(sal)
from    emp
where   job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;

-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
select  job, max(sal) - min(sal) "�޿� ����"
from    emp
group by job;

-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
select  deptno, count(*), sum(sal)
from    emp
group by deptno
having count(*) > 4;
