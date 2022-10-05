-- 1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력
SELECT empno, ename, job, sal, sal*1.15 new_salary, sal*0.15 Increase
FROM emp;

-- 2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력
SELECT ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate, 6), '월요일') MONDAY
FROM emp;

-- 3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력
SELECT ename, hiredate
, TO_CHAR(sysdate, 'YYYY') - TO_CHAR(hiredate, 'YYYY') year, sal
, (TO_CHAR(sysdate, 'YYYY') - TO_CHAR(hiredate, 'YYYY')) * sal total_sal
FROM emp;

-- 4.이름, 업무, 입사일, 입사한 요일을 출력
SELECT ename, job, hiredate, TO_CHAR(hiredate, 'DAY')
FROM emp;

-- 5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 
-- 10번 부서를 제외하고 업무가 ‘SALESMAN’과 ‘MANAGER’만 출력한다.
SELECT job, deptno, SUM(sal), count(*)
FROM emp
--WHERE REGEXP_LIKE(job, 'SALESMAN | MANAGER');
WHERE deptno != 10 AND (job LIKE 'SALESMAN' OR job LIKE 'MANAGER')
GROUP BY job, deptno;

-- 6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬
SELECT job, AVG(sal) AVG, MAX(sal) MAX
FROM emp
GROUP BY job
HAVING AVG(sal) >= 2000
ORDER BY AVG(sal);

?-- 7. 같은 입사년도 별로 인원수를 출력
SELECT TO_CHAR(hiredate, 'YYYY') year, COUNT(*) "인원수"
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY')
HAVING TO_CHAR(hiredate, 'YYYY') = TO_CHAR(hiredate, 'YYYY');

-- 8. 5개씩 급여합계와 인원수를 출력 (rownum이용)
SELECT ceil(ROWNUM/5), SUM(sal), COUNT(*) "인원수"
FROM emp
GROUP BY ceil(ROWNUM/5)
ORDER BY ceil(ROWNUM/5);

/*
9. 다음과 같이 출력
   ( 실제 출력된 인원수가 다를 수도 있음 )
   CLERK     SALESMAN        MANAGER      (업무명)
-----------------------------------------------------------------------
     4          4              3          (인원수)
*/
SELECT COUNT(DECODE(job, 'CLERK', 1)) CLERK
, COUNT(DECODE(job, 'SALESMAN', 1)) SALESMAN
, COUNT(DECODE(job, 'MANAGER', 1)) MANAGER
FROM emp;
/*
10. 다음과 같이 업무별, 부서별 급여  출력
   ( 실제 계산된 금액이 다를 수도 있음 )
업무명                10번부서                20번부서                30번부서                급여합계
---------------------------------------------------------------------------------------------------
CLERK                 1300                   1900                    950                   4150
SALESMAN                 0                      0                   5600                   5600
PRESIDENT             5000                      0                      0                   5000
MANAGER               2450                   2975                   2850                   8275
ANALYST                  0                   6000                      0                   6000
*/
SELECT job "업무명"
, NVL(SUM(DECODE(deptno, 10, sal)), 0) "10번 부서"
, NVL(SUM(DECODE(deptno, 20, sal)), 0) "20번 부서"
, NVL(SUM(DECODE(deptno, 30, sal)), 0) "30번 부서"
, SUM(sal) "급여합계"
FROM emp
GROUP BY job;

Select job as 업무명,nvl(sum(decode(deptno,10,sal)),0) as "10번부서"
, nvl(sum(decode(deptno,20,sal)),0) as "20번부서" 
, nvl(sum(decode(deptno,30,sal)),0) as "30번부서"
, sum(sal) as 급여합계
from emp
group by job;