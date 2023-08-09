-------------------------주문 테이블(product_order)----------------------
create table product_order(
    o_order_number NUMBER(10) PRIMARY KEY,
    o_date date default sysdate,
    o_id VARCHAR(20),
    o_address VARCHAR2(50) NOT NULL
);
commit;
--테이블 삭제
drop table product_order;