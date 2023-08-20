-------------------------주문 테이블(order_table)----------------------
create table order_table(
    o_order_number VARCHAR2(30) PRIMARY KEY,
    o_address VARCHAR2(50) NOT NULL,
    o_name VARCHAR2(20) NOT NULL,
	o_price number NOT NULL,
    o_quantity number(10) NOT NULL,
    o_phone VARCHAR2(30) NOT NULL,
    o_order_code VARCHAR2(20) NOT NULL
);
commit;
--테이블 삭제
drop table order_table;
insert into order_table values('주문번호','주소','박승wns',1,1,'핸드폰 번호','0');

select * from order_table;