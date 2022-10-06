-- 평균 급여 구하기
SELECT round(avg(sal)) FROM emp;
-- 그 평균 급여보다 낮은 사원 정보 조회
SELECT ename, sal
FROM emp
WHERE sal < (SELECT ROUND(AVG(sal)) FROM emp);


-- 월급이 가장 많은 사원의 정보 조회
SELECT ROUND(MAX(sal)) FROM emp;


-- 평균 급여보다 높고 최대 급여보다 낮은 월급을 받는 사원의 정보를 조회
SELECT *
FROM emp
WHERE sal > (SELECT ROUND(AVG(sal)) FROM emp)
AND sal < (SELECT MAX(sal) FROM emp);

SELECT e.*
FROM emp e,
(SELECT ROUND(AVG(sal)) avg, MAX(sal) max FROM emp) ext
WHERE e.sal > ext.avg AND e.sal < ext.max;


-- 월급순으로 상위 10명의 명단을 출력
SELECT sort.ename
FROM (SELECT ename FROM emp ORDER BY sal desc) sort
WHERE ROWNUM < 11;


-- 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
SELECT MIN(sal) FROM emp GROUP BY job;

SELECT empno, ename, job, sal
FROM emp
WHERE (job, sal) in (SELECT job, MIN(sal) FROM emp GROUP BY job);

INSERT INTO emp(empno, ename, job, sal) VALUES(9999,'테스트','CLERK',1250);


-- 10번 부서 사원들의 업무와 동일한 직원들 검색
SELECT ename, job
FROM emp
WHERE job in (SELECT job FROM emp WHERE deptno = 10);
-- ANY는 잘 안쓰인다
SELECT ename, job
FROM emp
WHERE job = ANY(SELECT job FROM emp WHERE deptno = 10);


-- 적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
SELECT empno, ename, job
FROM emp e1
WHERE exists (SELECT empno FROM emp e2 WHERE e1.empno = e2.mgr);

-- 사원 출력
SELECT empno, ename, job
FROM emp e1
WHERE not exists (SELECT empno FROM emp e2 WHERE e1.empno = e2.mgr);


-- (1) 부서별 급여통계 테이블 생성
create table stat_salary ( 
stat_date date not null, -- 날짜
dept_no number, -- 부서
emp_count number, -- 사원수
tot_salary number, -- 급여총액
avg_salary number ); -- 급여평균

DESC stat_salary;

SELECT sysdate, deptno FROM emp GROUP BY deptno;


-- (2) 날짜와 부서번호 입력
INSERT INTO stat_salary(stat_date, dept_no)
    SELECT sysdate, deptno FROM emp GROUP BY deptno;

SELECT * FROM stat_salary;

-- (3) 사원수, 급여총액, 평균급여 입력(?) -> 수정
SELECT COUNT(*), SUM(sal), ROUND(AVG(sal)) FROM EMP GROUP BY deptno;

update stat_salary ss
set (emp_count, tot_salary, avg_salary)
    = (SELECT COUNT(*), SUM(sal), ROUND(AVG(sal)) 
        FROM EMP e
        WHERE ss.dept_no = e.deptno
        GROUP BY deptno);

create table emp_cp as select * from emp;
select * from emp_cp;

-- 부서명이 'SALES'인 사원의 정보 삭제 ( emp_cp )
delete from emp_cp
where deptno = (select deptno from dept where dname like 'SALES');


-- merge 사용
merge into emp_cp ec
using emp e
on (ec.ename = e.ename)
when matched then
update set ec.sal = nvl(ec.sal*1.1,0)
when not matched then
insert ec.* values(*);


commit;

