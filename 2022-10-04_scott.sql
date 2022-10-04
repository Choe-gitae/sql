-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
select  ename, sal, round(sal/12, -2) wolgeub
from    emp;

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
select  ename, sal, trunc(sal*0.033,-1) tax
from    emp;

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
select  empno, ename, lower(job) job
from    emp
where   lower(ename) like lower('smith');

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
select  empno, initcap(ename) ename, initcap(job) job
from    emp;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
select  empno, ename ename, job, sal, deptno
from    emp
where   substr(ename,1,1) > 'K' and substr(ename,1,1) < 'Y'
order by ename asc;

-- 이름이 5글자 이상인 사원들을 출력
select  *
from    emp
where   length(ename) >= 5;

-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
select  RPAD(ename, 15, '*') ename
from    emp;

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
select  RPAD(sal, 10, '-') sal
from    emp;

-- 급여를 숫자에서 ‘영일이삼사오육칠팔구’ 글자로 대체
select  sal, TRANSLATE(sal,'0123456789','영일이삼사오육칠팔구') sal_kor
from    emp;

-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
select  sal, REPLACE(sal, 0, '$') sal
from    emp;


commit;
select name, jumin, substr(jumin, 8, 1) gender,
                    substr(jumin, 1, 2) birth_year
from info_tab;

select  '-' || trim(' 이순신 ') || '-' as col1, 
        '-' || ltrim(' 이순신 ') || '-' as col2, 
        '-' || rtrim(' 이순신 ') || '-' as col3 
from dual;

-- ***** 공백 제거
select REPLACE('     이     순     신    ', ' ', '') ename
from dual;

-- 현재까지 근무일 수가 많은 사람 순으로 출력
select  ename, hiredate, sysdate - nvl(hiredate,sysdate), ceil(sysdate - nvl(hiredate,sysdate)) "근무일"
from    emp
order by sysdate - hiredate desc nulls last;

-- 현재까지 근무일 수가 몇 주 몇 일인가를 출력
select  ename, trunc( (sysdate-hiredate)/7 ) week
             , floor ( mod( sysdate-hiredate,7 ) )day
from    emp;

-- 10번 부서의 사원의 현재까지의 근무 월수를 계산
select  ename, trunc( months_between(sysdate, hiredate) ) "근무 월수1"
            , floor( months_between(sysdate, hiredate) ) "근무 월수2"
from    emp
where   deptno = 10;

-- 현재 날짜에서 3개월 후의 날짜 구하기
select add_months( sysdate, 3 ) as mydate from dual;

-- 현재 날짜에서 돌아오는 ‘월’요일의 날짜 구하기
select next_day(sysdate, '월요일') monday
from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
select last_day(sysdate)
from dual;

-- 입사일자에서 입사년도를 출력
select  ename, hiredate, to_char(hiredate,'YYYY') hire_year
from    emp;

-- 입사일자를 ‘1999년 1월 1일’ 형식으로 출력
select  ename, hiredate, to_char(hiredate,'YYYY"년" MM"월" DD"일"') hire_date
from    emp;

-- 1981년도에 입사한 사원 검색
select  *
from    emp
where   to_char(hiredate, 'YYYY') = '1981';

-- 5월에 입사한 사원 검색
select  *
from    emp
where   to_char(hiredate, 'MM') = '05';

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
select  ename, sal, to_char(sal, '$999,999,999,999') dollar
from    emp;

-- 81년 2월에 입사한 사원 검색
select  *
from    emp
where   to_char(hiredate, 'YYYY-MM') = '1981-02';

-- 81년에 입사하지 않은 사원 검색
select  *
from    emp
where   not to_char(hiredate, 'YYYY') = '1981';

-- 81년 하반기에 입사한 사원 검색
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
    
-- 주민번호에서 성별 구하기
SELECT decode( substr(jumin, 8, 1), '1', '남자', '3', '남자', '여자') gender 
FROM info_tab;

SELECT CASE substr( jumin, 8, 1)
            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'
            ELSE '여자'
            END as gender
FROM info_tab;

-- 부서번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
select  decode(deptno, 10, '영업부', 20, '관리부', 30, 'IT부', '기술부') deprartment
from    emp;

select  case deptno
        when 10 then '영없부'
        when 20 then '관리부'
        when 30 then 'IT부'
        else '기술부'
        end department
from emp;

-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우
-- 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
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

-- rownum 오라클 특유의
desc emp;
select rownum, empno, ename, job 
from emp
where rownum <= 5;

-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
select  avg(sal) avg, sum(sal) sum, min(sal) min, max(sal) max
from    emp
where   job = 'SALESMAN';

-- 커미션(COMM)을 받는 사람들의 수는
select  count(comm)
from    emp
where   nvl(comm, 0) > 0;

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
select  deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
from    emp
group by deptno;

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 ( 부서별 급여의 합이 높은 순으로
select  deptno, count(*), avg(sal), min(sal), max(sal), sum(sal)
from    emp
group by deptno
order by sum(sal) desc;

-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
select  deptno, job, count(*), avg(sal), sum(sal)
from    emp 
group by deptno, job;

-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
select  deptno, avg(sal), sum(sal)
from    emp
group by deptno
having max(sal) >= 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
select  job, avg(sal), sum(sal)
from    emp
group by job
having avg(sal) >= 3000;

-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력
-- 단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
select  job, sum(sal)
from    emp
where   job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;

-- 업무별 최고 급여와 최소 급여의 차이를 구하라
select  job, max(sal) - min(sal) "급여 차이"
from    emp
group by job;

-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
select  deptno, count(*), sum(sal)
from    emp
group by deptno
having count(*) > 4;
