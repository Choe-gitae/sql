-- 회원 테이블
create table ex_member
(
id varchar2(10), -- 아이디 p
pass varchar2(10), -- 패스워드
name varchar2(20), -- 이름
tel varchar2(20), -- 전화번호
addr varchar2(100) -- 주소
);

?
-- 상품 테이블
create table ex_good
(
gno varchar2(10), -- 상품번호 p
gname varchar(30), -- 상품명
gdetail varchar2(300), -- 상세설명
price number -- 가격
); 

?
-- 주문 테이블
create table ex_order 
(
ono number, -- 번호 p
orderno varchar2(20), -- 주문번호
gno varchar2(10), -- 상품번호 f
id varchar2(10), -- 회원 아이디 f
count number, -- 갯수
status varchar2(10) -- 배송상태
);

-- 주문테이블과 회원테이블, 상품테이블의 관계를 맺는다면?
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


-- 회원 테이블 데이타 입력
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '김길동', '02-222-2222','서울 멋지구 이쁜동');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '박길동', '03-333-3333','인천 멋지구 이쁜동');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '맹길동', '04-444-4444','경기 멋지구 이쁜동');

commit;


-- 상픔 테이블 데이타 입력
insert into ex_good( gno, gname, gdetail, price )
values('1001', '머리끈', '아주 비싼 머리끈', 200 );

insert into ex_good( gno, gname, gdetail, price )
values('2002', '자전거-A', '비싸지만 빠르게 달리는 자전거', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '자전거-B', '아주 비싸지만 느리고 안전하게 달린다는 자전거', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '핸드폰케이스', '싸고 유행하는 핸드폰 케이스', 1500 );

commit;


-- 주문 테이블 데이타 입력
-- status 10byte / '배송완료' 12byte
insert into ex_order( ono, orderno, gno, id, count, status )
values( 1, '20161212', '1001', 'park', 1, '배송완료');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 2, '20161212', '2010', 'park', 1, '배송중');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 3, '20161111', '1001', 'kim', 2, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 4, '20161111', '3333', 'kim', 3, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 5, '20163333', '1001', 'park', 3, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 6, '20163333', '2010', 'park', 1, '배송중');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 7, '20163333', '2002', 'park', 2, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 8, '20165050', '1001', 'meng', 1, '배송중');

commit;


---- [ 문제 ]
-- 1. 배송중인 상품에 대한 내용을 출력
select g.gname, g.gdetail, g.price, o.status
from ex_good g INNER JOIN ex_order o
on g.gno = o.gno
WHERE o.status like '배송중';

SELECT o.status, g.gno, g.gname, g.gdetail, g.price
FROM ex_good g, ( SELECT gno, status FROM ex_order WHERE status = '배송중' ) o
WHERE g.gno = o.gno;

-- 2. 주문 들어온 상품 내역과 고객 정보 출력
select m.name name, m.tel tel, m.addr addr, g.gname gname, g.gdetail gdetail
from ex_good g, ex_member m
where (m.id, g.gno) in (select id, gno from ex_order where status like '주문');

-- 3. 주문별로 고객 정보(아이디)와 주문한 상품의 총금액을 출력
select o.id, sum(g.price*o.count) 총금액
from ex_order o INNER JOIN ex_good g
on o.gno = g.gno
group by o.orderno, o.id;

SELECT o.id, sum(g.price * o.count) total
FROM ex_member m, ex_good g, ex_order o
WHERE o.id = m.id AND g.gno = o.gno
GROUP BY o.id, o.orderno;


---- [ 도전문제 ]
-- 4. 3번에 주문 내역을 첫번재 상품명 외 몇 개로 출력
-- [예] 20161212   머리끈 외 1개 
SELECT E.ORDERNO, G.GNAME ||' 외'||(E.COUNT-1)||'개' GOOD
FROM (SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT
FROM EX_ORDER GROUP BY ORDERNO) E, EX_GOOD G
WHERE E.GNO=G.GNO;

