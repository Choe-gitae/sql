-- ���� ���
/*
    �̸�          name        varchar2(10)
    �ֹι�ȣ      jumin        char(15)
    ��ȭ��ȣ      tel           varchar2(20)
    ����          gender      varchar2(10)
    ����          age         number(3)
    �����        home         varchar2(20)
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

-- ���̺� ����Ȯ��
DESC info_tab;

-- ������ Ȯ��
SELECT * FROM info_tab;

/*
    ���̺�� : student_score
    �й�      id      char(4)
    �̸�      name    varchar2(20)
    ����      kor     number(3)
    ����      eng     number(3)
    ����      total   number
    ���      avg     number(5,2) -- ���ڸ��� ��ü �ڸ��� �ڴ� �Ҽ��� �ڸ���
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

-- ���̺� ����
DROP TABLE student_score;

-- ���̺� ����
ALTER TABLE student_score ADD (math number(3));
ALTER TABLE student_score MODIFY (avg number(4,1));
ALTER TABLE student_score DROP ( total );

DESC student_score;

-- ������ �Է�
INSERT INTO student_score( id, name, kor, eng )
VALUES ( '0001', 'ȫ�浿', 50, 80 );

-- 2000�� �й��� ȫ������ ����� ���������� ���� 60, 90���� ����
INSERT INTO student_score( id, name, kor, eng )
VALUES ( '2000', 'ȫ����', 60, 90 );

-- 1000�� �й��� �л� ȫ��� ������ ����
INSERT INTO student_score( id, name, kor, eng )
VALUES ( '1000', 'ȫ���', 80, 80 );

-- �̸��� ȫ����� �л��� ���ڵ� ����
DELETE FROM student_score WHERE name='ȫ���';

-- 0001�� �л��� �������� 100���� �����ϱ�
UPDATE student_score SET kor=100 WHERE id='0001';

-- ȫ������ �������� 90�� �Է�(����)
UPDATE student_score SET math=100 WHERE name='ȫ����';

-- �л����� ��� ���ϱ�
UPDATE student_score 
SET avg = (kor + eng + nvl(math, 0)) / 3 ;

-- ������ �˻�
SELECT * FROM student_score;

CREATE TABLE emp_copy
as SELECT * FROM emp;

DESC emp_copy;

SELECT * FROM emp_copy;

-- Ŀ��
commit;



-- [ �������� ] emp ��ü emp_copy ���纻 ���̺� ���� ��
-- 1. �����ȣ�� 7788�� ����� �μ��� 10������ ����
UPDATE emp_copy SET deptno=10 WHERE empno=7788;

-- 2. �����ȣ�� 7782�� ����� �̸��� ȫ������� �����ϰ� �޿��� 3500���� ����
UPDATE emp_copy SET ename='ȫ���', sal=3500 WHERE empno=7782;

-- 3. ��� �μ����� ���ʽ��� 300�� �λ� ����
UPDATE emp_copy SET comm = nvl(comm, 0)+300;

-- 4. �����ȣ�� 7499�� ����� ������ ����
DELETE FROM emp_copy WHERE empno=7499;

-- 5. �Ի����ڰ� 81�� 6�� 1�� ������ ����� ������ ����
DELETE FROM emp_copy WHERE hiredate < '1981-06-01';

DELETE FROM emp_copy;

SELECT * FROM emp_copy;

rollback;

truncate table emp_copy;






















