-----------------------주문 상품 테이블(order_itme)------------------------
create table order_item(
    i_seq_number NUMBER(10) PRIMARY KEY,
    i_order_number NUMBER(10),
    i_code VARCHAR2(20),
    i_quantity NUMBER(5)
);
commit;
--테이블 삭제
drop table order_item;
--시퀀스 생성랍
create sequence i_seq_number;
--시퀀스 드
drop sequence i_seq_number;