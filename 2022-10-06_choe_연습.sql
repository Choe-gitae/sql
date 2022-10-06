-- ȸ�� ���̺�
create table ex_member
(
id varchar2(10), -- ���̵� p
pass varchar2(10), -- �н�����
name varchar2(20), -- �̸�
tel varchar2(20), -- ��ȭ��ȣ
addr varchar2(100) -- �ּ�
);

?
-- ��ǰ ���̺�
create table ex_good
(
gno varchar2(10), -- ��ǰ��ȣ p
gname varchar(30), -- ��ǰ��
gdetail varchar2(300), -- �󼼼���
price number -- ����
); 

?
-- �ֹ� ���̺�
create table ex_order 
(
ono number, -- ��ȣ p
orderno varchar2(20), -- �ֹ���ȣ
gno varchar2(10), -- ��ǰ��ȣ f
id varchar2(10), -- ȸ�� ���̵� f
count number, -- ����
status varchar2(10) -- ��ۻ���
);

-- �ֹ����̺�� ȸ�����̺�, ��ǰ���̺��� ���踦 �δ´ٸ�?
alter table ex_member
add constraint pk_member_id primary key (id);
alter table ex_good
add constraint pk_good_gno primary key (gno);
alter table ex_order
add constraint pk_order_id primary key (ono);

alter table ex_order
add constraint fk_order_gno foreign key (gno) REFERENCES ex_good(gno);
alter table ex_order
add constraint fk_order_id foreign key (id) references ex_member(id);


-- ȸ�� ���̺� ����Ÿ �Է�
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '��浿', '02-222-2222','���� ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '�ڱ浿', '03-333-3333','��õ ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '�ͱ浿', '04-444-4444','��� ������ �̻۵�');

commit;


-- ���� ���̺� ����Ÿ �Է�
insert into ex_good( gno, gname, gdetail, price )
values('1001', '�Ӹ���', '���� ��� �Ӹ���', 200 );

insert into ex_good( gno, gname, gdetail, price )
values('2002', '������-A', '������� ������ �޸��� ������', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '������-B', '���� ������� ������ �����ϰ� �޸��ٴ� ������', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '�ڵ������̽�', '�ΰ� �����ϴ� �ڵ��� ���̽�', 1500 );

commit;


-- �ֹ� ���̺� ����Ÿ �Է�
-- status 10byte / '��ۿϷ�' 12byte
insert into ex_order( ono, orderno, gno, id, count, status )
values( 1, '20161212', '1001', 'park', 1, '��ۿϷ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 2, '20161212', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 3, '20161111', '1001', 'kim', 2, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 4, '20161111', '3333', 'kim', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 5, '20163333', '1001', 'park', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 6, '20163333', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 7, '20163333', '2002', 'park', 2, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 8, '20165050', '1001', 'meng', 1, '�����');

commit;


---- [ ���� ]
-- 1. ������� ��ǰ�� ���� ������ ���
select g.gname, g.gdetail, g.price, o.status
from ex_good g INNER JOIN ex_order o
on g.gno = o.gno
WHERE o.status like '�����';

SELECT o.status, g.gno, g.gname, g.gdetail, g.price
FROM ex_good g, ( SELECT gno, status FROM ex_order WHERE status = '�����' ) o
WHERE g.gno = o.gno;

-- 2. �ֹ� ���� ��ǰ ������ �� ���� ���
select m.name name, m.tel tel, m.addr addr, g.gname gname, g.gdetail gdetail
from ex_good g, ex_member m
where (m.id, g.gno) in (select id, gno from ex_order where status like '�ֹ�');

-- 3. �ֹ����� �� ����(���̵�)�� �ֹ��� ��ǰ�� �ѱݾ��� ���
select o.id, sum(g.price*o.count) �ѱݾ�
from ex_order o INNER JOIN ex_good g
on o.gno = g.gno
group by o.orderno, o.id;

SELECT o.id, sum(g.price * o.count) total
FROM ex_member m, ex_good g, ex_order o
WHERE o.id = m.id AND g.gno = o.gno
GROUP BY o.id, o.orderno;


---- [ �������� ]
-- 4. 3���� �ֹ� ������ ù���� ��ǰ�� �� �� ���� ���
-- [��] 20161212   �Ӹ��� �� 1�� 
SELECT E.ORDERNO, G.GNAME ||' ��'||(E.COUNT-1)||'��' GOOD
FROM (SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT
FROM EX_ORDER GROUP BY ORDERNO) E, EX_GOOD G
WHERE E.GNO=G.GNO;

