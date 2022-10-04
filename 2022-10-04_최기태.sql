CREATE table dept as select * from scott.dept;
desc dept;
SELECT * from dept;

alter table dept
add constraint pk_dept_deptno PRIMARY KEY (deptno);

-- student ���̺� �����
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

-- �й� �÷��� �⺻Ű(primary key) �������� �߰�
alter table student
add constraint pk_student_no PRIMARY key (no);
-- �ֹι�ȣ �÷����� NOT NULL �������� ����
alter table student
modify ( jumin char(15) null);
-- �ּ� �÷��� ����Ʈ ������������ ����� �߰�
alter table student
modify ( addr varchar2(50) DEFAULT '����' );
-- ���� �÷��� üũ ������������ ��������, �������� �߰�
alter table student
add constraint ck_student_gender check (gender in ('����','����'));

-- ���ڵ� �Է� Ȯ��
INSERT INTO student(no, name, gender, addr, jumin ) 
VALUES('1111', '������', '����', '����� ������', '801212-1234567' );
INSERT INTO student(no, name, jumin ) 
VALUES('2222', '������', '881212-1234567');
-- (no) primary key �ߺ�
INSERT INTO student(no, name, jumin ) 
VALUES('1111', '������', '881212-1234567');
-- ���� check ����
INSERT INTO student(no, name, gender, jumin ) 
VALUES('3333', '������', '����', '830303-1234567');
INSERT INTO student(no, name, addr, jumin ) 
VALUES('4444', '�����', '����� ���ʱ�', '990909-1234567');
-- deptno 50 ����
INSERT INTO student(no, name, addr, deptno ) 
VALUES('8888', '�̺���', '����� �Ѱ�', 50);

-- library ���̺� �����
create table library
(
    rent_id number(10)
    constraint pk_library_rent primary key,
    book_id varchar2(20) not null,
    hakbun char(4)
    constraint fk_library_hakbun references student(no)
);
-- ���ڵ� �Է�
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );
-- ������ hakbun 3333 (student no) ����
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' );
INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );
-- ������ hakbun 5555 (student no) ����
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

-- 1. �������� ( PK / FK )
CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) NOT NULL
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE SET NULL
);
-- 2. �������� ( PK / FK ) + FK (ON DELETE CASCADE )
CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5) NOT NULL
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE CASCADE
);
-- 3. �������� ( PK / FK ) + FK (ON DELETE SET NULL )
CREATE TABLE EMP(
EMPID NUMBER(5) 
, NAME VARCHAR2(20) 
, RESID CHAR(14) 
, GENDER VARCHAR2(10) 
, AGE NUMBER(5) 
, DEPTID NUMBER(5)
, CONSTRAINT PK_EMP_EMPID PRIMARY KEY (EMPID)
, CONSTRAINT UK_EMP_RESID UNIQUE (RESID)
, CONSTRAINT EMP_CK_GENDER CHECK (GENDER IN ('����', '����'))
, CONSTRAINT FK_DEPTNO FOREIGN KEY (DEPTID) 
REFERENCES DEPT(DEPTID) ON DELETE SET NULL
);

desc DEPT;
desc EMP;

-- INSERT (TABLE: DEPT)
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10001, 'IT��');
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10002, '������');
INSERT INTO DEPT(DEPTID, DEPTNAME)
VALUES (10003, '��������');

-- INSERT (TABLE: EMP)
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30001, '�ְ���', '881012-1187527', '����', 32, 10001);
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30002, '��ȿ��', '850712-1000007', '����', 35, 10002);
INSERT INTO EMP(EMPID, NAME, RESID, GENDER, AGE, DEPTID)
VALUES (30003, '������', '881112-1187527', '����', 32, 10003);

-- TEST DML (DELETE)
DELETE FROM DEPT WHERE DEPTID = 10003;

-- SELECT ALL (BOTH)
SELECT * FROM DEPT;
SELECT * FROM EMP;

-- DROP (BOTH)
DROP TABLE EMP;
DROP TABLE DEPT;

commit;