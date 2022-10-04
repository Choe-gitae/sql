-- 구조 잡기
/*
    이름          name        varchar2(10)
    주민번호      jumin        char(15)
    전화번호      tel           varchar2(20)
    성별          gender      varchar2(10)
    나이          age         number(3)
    출신지        home         varchar2(20)
*/
CREATE TABLE info_tab
(
    name VARCHAR2(10),
    jumin CHAR(15),
    tel VARCHAR2(20),
    gender VARCHAR2(10),
    age NUMBER(3),
    home VARCHAR2(20)
);

-- 테이블 구조확인
DESC info_tab;

-- 데이터 확인
SELECT * FROM info_tab;

/*
    테이블명 : student_score
    학번      id      char(4)
    이름      name    varchar2(20)
    국어      kor     number(3)
    영어      eng     number(3)
    총점      total   number
    평균      avg     number(5,2) -- 앞자리는 전체 자리수 뒤는 소숫점 자리수
*/
CREATE TABLE student_score
(
id      char(4),
name    varchar2(20),
kor     number(3),
eng     number(3),
total   number,
avg     number(5,2)
);

-- 테이블 삭제
DROP TABLE student_score;

-- 테이블 수정
ALTER TABLE student_score ADD (math number(3));
ALTER TABLE student_score MODIFY (avg number(4,1));
ALTER TABLE student_score DROP ( total );

DESC student_score;

-- 데이터 입력
INSERT INTO student_score( id, name, kor, eng )
VALUES ( '0001', '홍길동', 50, 80 );

-- 2000번 학번인 홍길자의 국어와 영어점수를 각각 60, 90으로 저장
INSERT INTO student_score( id, name, kor, eng )
VALUES ( '2000', '홍길자', 60, 90 );

-- 1000번 학번인 학생 홍길숙 정보를 저장
INSERT INTO student_score( id, name, kor, eng )
VALUES ( '1000', '홍길숙', 80, 80 );

-- 이름이 홍길숙인 학생의 레코드 삭제
DELETE FROM student_score WHERE name='홍길숙';

-- 0001번 학생의 국어점수 100으로 수정하기
UPDATE student_score SET kor=100 WHERE id='0001';

-- 홍길자의 수학점수 90점 입력(수정)
UPDATE student_score SET math=100 WHERE name='홍길자';

-- 학생들의 평균 구하기
UPDATE student_score 
SET avg = (kor + eng + nvl(math, 0)) / 3 ;

-- 데이터 검색
SELECT * FROM student_score;

CREATE TABLE emp_copy
as SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;

-- 커밋
commit;



-- [ 연습문제 ] emp 전체 emp_copy 복사본 테이블 생성 후
-- 1. 사원번호가 7788인 사원의 부서를 10번으로 변경
UPDATE emp_copy SET deptno=10 WHERE empno=7788;

-- 2. 사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500으로 변경
UPDATE emp_copy SET ename='홍길숙', sal=3500 WHERE empno=7782;

-- 3. 모든 부서원의 보너스를 300씩 인상 변경
UPDATE emp_copy SET comm = nvl(comm, 0)+300;

-- 4. 사원번호가 7499인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE empno=7499;

-- 5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE hiredate < '1981-06-01';

DELETE FROM emp_copy;

SELECT * FROM emp_copy;

rollback;

truncate table emp_copy;






















