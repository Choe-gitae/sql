CREATE table dept as select * from scott.dept;
desc dept;
SELECT * from dept;

alter table dept
add constraint pk_dept_deptno PRIMARY KEY (deptno);

-- student 테이블 만들기
create table student
(
    no      char(4),
    name    varchar2(30) not null,
    gender  varchar2(6),
    addr    varchar2(50),
    jumin   char(15) not null,
    deptno number(2),
    constraint fk_student_deptno foreign key (deptno) REFERENCES dept(deptno),
    constraint ck_student_no check ( length(trim(no)) = 4 )
);

-- 학번 컬럼에 기본키(primary key) 제약조건 추가
alter table student
add constraint pk_student_no PRIMARY key (no);
-- 주민번호 컬럼에서 NOT NULL 제약조건 삭제
alter table student
modify ( jumin char(15) null);
-- 주소 컬럼에 디폴트 제약조건으로 “서울” 추가
alter table student
modify ( addr varchar2(50) DEFAULT '서울' );
-- 성별 컬럼에 체크 제약조건으로 “남성”, “여성” 추가
alter table student
add constraint ck_student_gender check (gender in ('남성','여성'));

-- 레코드 입력 확인
INSERT INTO student(no, name, gender, addr, jumin ) 
VALUES('1111', '김태희', '여성', '서울시 강남구', '801212-1234567' );
INSERT INTO student(no, name, jumin ) 
VALUES('2222', '송혜교', '881212-1234567');
-- (no) primary key 중복
INSERT INTO student(no, name, jumin ) 
VALUES('1111', '강동원', '881212-1234567');
-- 남자 check 오류
INSERT INTO student(no, name, gender, jumin ) 
VALUES('3333', '하정우', '남자', '830303-1234567');
INSERT INTO student(no, name, addr, jumin ) 
VALUES('4444', '김새론', '서울시 서초구', '990909-1234567');
-- deptno 50 없음
INSERT INTO student(no, name, addr, deptno ) 
VALUES('8888', '이병헌', '서울시 한강', 50);

-- library 테이블 만들기
create table library
(
    rent_id number(10)
    constraint pk_library_rent primary key,
    book_id varchar2(20) not null,
    hakbun char(4)
    constraint fk_library_hakbun references student(no)
);
-- 레코드 입력
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );
-- 참조값 hakbun 3333 (student no) 없음
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' );
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );
-- 참조값 hakbun 5555 (student no) 없음
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );

desc student;
desc library;
select * from student;
select * from library;

delete student;
delete library;

drop table dept;
drop table student;
drop table library;
--------------------------------------------------------------

CREATE TABLE DEPT(
DEPTID NUMBER(5)
, DEPTNAME VARCHAR(50)
, CONSTRAINT PK_DEPT_DEPTID PRIMARY KEY(DEPTID)
);

-- 1. 제약조건 ( PK / FK )
CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) NOT NULL
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('남성', '여성'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE SET NULL
);
-- 2. 제약조건 ( PK / FK ) + FK (ON DELETE CASCADE )
CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) NOT NULL
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('남성', '여성'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE CASCADE
);
-- 3. 제약조건 ( PK / FK ) + FK (ON DELETE SET NULL )
CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5)
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('남성', '여성'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE SET NULL
);

desc DEPT;
desc EMP;

-- INSERT (TABLE: DEPT)
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10001, 'IT팀');
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10002, '생산운영팀');
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10003, '생산기술팀');

-- INSERT (TABLE: EMP)
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30001, '최가은', '881012-1187527', '여성', 32, 10001);
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30002, '김효준', '850712-1000007', '남성', 35, 10002);
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30003, '서종균', '881112-1187527', '남성', 32, 10003);

-- TEST DML (DELETE)
DELETE FROM DEPT WHERE DEPTID = 10003;

-- SELECT ALL (BOTH)
SELECT * FROM DEPT;
SELECT * FROM EMP;

-- DROP (BOTH)
DROP TABLE EMP;
DROP TABLE DEPT;

commit;