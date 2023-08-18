-------------------------주문 테이블(order_table)----------------------
create table order_table(
    o_order_number NUMBER(30) PRIMARY KEY,
    o_date date default sysdate,
    o_id VARCHAR2(20),
    o_address VARCHAR2(50) NOT NULL,
    o_name VARCHAR2(20) NOT NULL,
    o_book_name VARCHAR2(50) NOT NULL,
	o_price number NOT NULL,
	o_total number NOT NULL
);
commit;
--테이블 삭제
drop table order_table;