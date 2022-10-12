
---- 시퀀스 : 자동증가
/*
 *	minvalue 1                  -- 시퀀스 최소 숫자
	maxvalue 999999999999 		-- 시퀀스 최대 숫자
	increment by 1             	-- 증가치
	start with 1            	-- 시작숫자
	nocache                   	-- cache를 사용하면 미리 값을 할당하여 조금 빠르게 접근
	noorder                   	-- 요청되는 순서대로 값 할당
	nocycle                   	-- 다시 시작할지 여부
 */
CREATE  SEQUENCE   seq_temp;
SELECT seq_temp.NEXTVAL FROM dual;
SELECT seq_temp.currVAL FROM dual;

-- 5000번 부터 10씩 증가하는 자동증가 시퀀스
CREATE SEQUENCE seq_temp2
increment by 10             -- 증가치
start with 5000;            -- 시작숫자


INSERT INTO emp(empno, ENAME) VALUES (seq_temp2.nextval, '박씨');


---- 인덱스 : 빠른 검색을 위해
select empno, ename, job, rowid from emp;

-- CREATE INDEX idx_emp_salary ON employees(salary);

CREATE SEQUENCE seq_infono;

INSERT INTO vid_info(dir, tit, act, gen, summ) VALUES (?,?,?,?,?)

SELECT v.vidno vidno, i.tit tit, i.act act 
FROM vid_info i LEFT OUTER JOIN video v
ON v.infono = i.infono ;
