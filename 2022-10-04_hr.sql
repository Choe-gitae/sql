-- 1. 2003년에 입사한 사원들의 사번, 이름, 입사일을 출력
select  EMPLOYEE_ID, LAST_NAME, HIRE_DATE
from    EMPLOYEES
where   to_char(HIRE_DATE, 'YYYY') = '2003';

-- 2. 업무가 FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP 인 사원들의 정보를 출력
select  *
from    EMPLOYEES
where   JOB_ID in ('FI_ACCOUNT', 'FI_MGR', 'SA_MAN', 'SA_REP');

-- 3. 커미션을 받는 사원들의 명단을 출력
select  FIRST_NAME || ' ' || LAST_NAME name
from    EMPLOYEES
where   COMMISSION_PCT is not null;

-- 4.업무가 SA_MAN 또는 SA_REP이면 "판매부서"를 그 외는 "그 외 부서"라고 출력
select  distinct JOB_ID
, decode(JOB_ID, 'SA_MAN', '판매부서', 'SA_REP이면', '판매부서', '그 외 부서') department
from    EMPLOYEES;

-- 5. 연도별로 입사자들의 최소급여, 최대 급여, 급여의 총합 그리고 평균 급여를 구하시오
select  to_char(HIRE_DATE,'YYYY') year
, min(SALARY) min, max(SALARY) max, sum(SALARY) sum, avg(SALARY) avg
from    EMPLOYEES
group by to_char(HIRE_DATE, 'YYYY')
order by to_char(HIRE_DATE, 'YYYY');

-- 6. 부서별 평균 급여가 $10,000 이상인 부서만 구하시오. ( 평균급여가 높은 순으로 )
select  DEPARTMENT_ID
from    EMPLOYEES
group by DEPARTMENT_ID
having avg(SALARY) >= 10000
order by avg(SALARY) desc;

-- 7. 부서별 최대 급여를 구하시오
select  DEPARTMENT_ID, max(SALARY) max_SALARY
from    EMPLOYEES
group by DEPARTMENT_ID;