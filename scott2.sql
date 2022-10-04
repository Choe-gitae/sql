-- 8000�� ������� <�����̸�>�� �޿� 10000 �� ���� �ϼ���
INSERT INTO emp( empno, ename, sal) 
VALUES ( 8000, '�ֱ���', 10000 );

SELECT * FROM emp;

-- 7788�� ������� <�����̸�>�� �޿� 10000 �� ���� �ϼ���
INSERT INTO emp( empno, ename, sal, deptno)
VALUES ( 8001, '�ֽ���', 10000, 20 );

INSERT INTO emp( empno, ename, sal, deptno)
VALUES ( 8002, 'ȫ�浿', 10000, 50 );

INSERT INTO info_tab(tel, name, jumin, gender, age, home)
VALUES('031','ȫ��','890202','����',33,'����');

INSERT INTO info_tab(tel, name, jumin, gender, age, home)
VALUES('031','ȫ��','890202','����',33,'����');

INSERT INTO info_tab(tel, name) VALUES('1001', 'ȫ�浿');
INSERT INTO info_tab(tel, name) VALUES('1002', '��浿');
INSERT INTO info_tab(tel, name) VALUES('1002', '�Ѹ�');
INSERT INTO info_tab(age, tel) VALUES(60, '1003');
INSERT INTO info_tab(name, tel, gender, age) VALUES('�ֱ���', '9999', '����', 34);
INSERT INTO info_tab(name, tel, jumin) VALUES('ȫ����', '20001', '990101');
INSERT INTO info_tab(name, tel, jumin) VALUES('ȫ����', '20002', '990101');
INSERT INTO info_tab(name, tel) VALUES('ȫ����', '20002');

DELETE FROM info_tab;

DROP TABLE info_tab;

commit;

CREATE TABLE info_tab
(
    name VARCHAR2(10) NOT NULL,
    jumin CHAR(15),
    tel VARCHAR2(20),
    gender VARCHAR2(10) DEFAULT '����',
    age NUMBER(3),
    home VARCHAR2(20),
    deptno NUMBER(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    CONSTRAINT uq_info_jumin UNIQUE (jumin),
    CONSTRAINT ck_info_gender CHECK (gender IN ('����','����')),
    CONSTRAINT fk_info_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

ALTER TABLE info_tab
MODIFY(name varchar2(10) not null);
    
ALTER TABLE info_tab
ADD CONSTRAINT uq_info_jumin UNIQUE (jumin);

ALTER TABLE info_tab
    ADD CONSTRAINT ck_info_gender CHECK (gender in ('����','����'));
    
INSERT INTO info_tab(name, tel, gender) VALUES('ȫ����', '20003', '����');
INSERT INTO info_tab(name, tel, gender) VALUES('ȫ����', '20004', '����');

ALTER TABLE info_tab
    MODIFY (gender varchar(6) default '����');

INSERT INTO info_tab(name, tel) VALUES('ȫ��', '20005');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '02-777-4444', '990909-1234567');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('������','03-555-5555', '880808-1234567', '����', 27, '���');

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
VALUES('ȫ�浿','03-031-0310', '900909-1234567', '����', 27, '���');

INSERT INTO info_tab( name, jumin) 
VALUES('ȫ����', '550505-1234567');

INSERT INTO info_tab( tel, jumin ) 
VALUES('031-777-7777', '700707-1234567');

INSERT INTO info_tab( name, tel, jumin ) 
VALUES('������', '031-000-0000', '700707-1234567');

INSERT INTO info_tab( name, tel, deptno ) 
VALUES('������', '7777', 20);

INSERT INTO info_tab( name, tel ) 
VALUES('¯��', '9999');

CREATE TABLE sawon
(
    sabun number(6),
    sawon_name varchar2(15),
    ubmu varchar2(30),
    weolgub number(10,2),
    buseo number(3),
    CONSTRAINT pk_sabun PRIMARY KEY (sabun)
);
-- 3
ALTER TABLE sawon
ADD ( jiyeok varchar2(30) NOT NULL );
-- 4
ALTER TABLE sawon
MODIFY ( weolgub number(7) );
-- 5
ALTER TABLE sawon
ADD ( CONSTRAINT ck_sawon_ubmu CHECK ( ubmu in ('����', '��������', '����') ) );
-- 6
ALTER TABLE sawon
MODIFY ( ubmu DEFAULT '����' );
-- 7
CREATE TABLE buseo
(
    buseo_no number(3),
    buseo_name varchar2(30),
    CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);
-- 8
ALTER TABLE sawon
ADD ( CONSTRAINT fk_sawon_buseo 
FOREIGN KEY (buseo) REFERENCES buseo(buseo_no) );
-- 9
INSERT INTO buseo (buseo_no, buseo_name)
VALUES (101,'����Ʈ��������������');
INSERT INTO buseo (buseo_no, buseo_name)
VALUES (202,'������');
INSERT INTO buseo (buseo_no, buseo_name)
VALUES (303,'�����ڿ���');
-- 10
INSERT INTO sawon (sabun,sawon_name,weolgub,buseo,jiyeok)
VALUES (8001,'ȫ�浿�̱�',100000,101,'�λ�');
INSERT INTO sawon (sabun,sawon_name,ubmu,buseo,jiyeok)
VALUES (8005,'ȫ��ö','��������',303,'�Ǳ�');
-- 11
ALTER TABLE sawon
DROP ( jiyeok );
-- 12
DELETE FROM sawon
WHERE buseo = 303;
DELETE FROM buseo
WHERE buseo_name = '�����ڿ���';
-- 13
DROP TABLE sawon;
DROP TABLE buseo;
-- 14
CREATE TABLE sawon
(
    sabun number(6),
    sawon_name varchar(15),
    ubmu varchar(30) DEFAULT '����',
    weolgub number(7),
    buseo number(3),
    jiyeok varchar2(30) NOT NULL,
    CONSTRAINT pk_sawon_sabun PRIMARY KEY (sabun),
    CONSTRAINT ck_sawon_ubmu CHECK (ubmu in('����','��������','����')),
    CONSTRAINT fk_sawon_buseo FOREIGN KEY (buseo)
    REFERENCES buseo(buseo_no)
);
CREATE TABLE buseo
(
    buseo_no number(3),
    buseo_name varchar2(30),
    CONSTRAINT pk_buseo_no PRIMARY KEY (buseo_no)
);

select * from sawon;
select * from buseo;
desc sawon;
desc buseo;








