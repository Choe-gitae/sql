---- 뷰 : 실제 테이블을 참조하는 가상테이블 (테이블의 내용이 수정되면 뷰의 내용도 수정된다)
-- 일반 뷰 생성		내용을 수정하면 테이블 내용도 수정된다.
CREATE OR REPLACE VIEW v_emp AS
select empno, ename, deptno from emp;

SELECT * FROM v_emp;
SELECT * FROM emp;

INSERT INTO v_emp VALUES (1000, '홍길동', 20);
INSERT INTO v_emp VALUES (1000, '홍홍이', 20);
INSERT INTO v_emp VALUES (2000, '홍홍이', 90);


-- READ ONLY 뷰 생성		테이블 내용 수정 불가
CREATE OR REPLACE VIEW v_emp AS
SELECT empno, ename, deptno FROM emp
WITH READ ONLY;

INSERT INTO v_emp VALUES (1000, '홍홍이', 30);


CREATE OR REPLACE VIEW v_emp_30 AS 
SELECT empno emp_no, ename name, sal salary
FROM emp
WHERE DEPTNO = 30
WITH READ ONLY;

SELECT * FROM v_emp_30;


-- 복합 뷰 생성		여러 테이블 집합
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

SELECT * FROM v_emp_info;

INSERT INTO v_emp_info(empno, ename, dname) VALUES (3333, '맹꽁이', 30);
INSERT INTO v_emp_info(empno, ename) VALUES (3333, '맹꽁이');

DELETE FROM v_emp_info WHERE empno = 7788;


--[ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.
CREATE OR REPLACE VIEW V_DEPT_SUM AS 
SELECT d.DNAME 부서명, MIN(SAL) 최소급여, MAX(SAL) 최대급여, AVG(SAL) 평균급여
FROM emp e, DEPT d
WHERE e.DEPTNO = d.DEPTNO 
GROUP BY DNAME
WITH READ ONLY;

CREATE OR REPLACE VIEW V_DEPT_SUM AS 
SELECT d.DNAME 부서명, MIN(SAL) 최소급여, MAX(SAL) 최대급여, AVG(SAL) 평균급여
FROM emp e LEFT OUTER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO 
GROUP BY DNAME
WITH READ ONLY;

INSERT INTO emp(empno, ename, sal, deptno) VALUES (4444, '호이', 9900, 20);

SELECT * FROM V_DEPT_SUM;

