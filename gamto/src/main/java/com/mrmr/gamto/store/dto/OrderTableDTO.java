package com.mrmr.gamto.store.dto;

import lombok.Data;

@Data
public class OrderTableDTO {
	private String o_order_number; //구매번호 
	private String o_name; //구매자 이름 
	private String o_book_name; //
	private String o_address; //구매자 주소 
	private String o_phone; //구매자 핸드폰 번호 
	private String o_total; //구매 총 갯수 
	private String o_price; //제품 가격 
	private String o_quantity; //구매 갯수 
	private String o_order_code; //단품 구매, 여러개 구매 구분 번호 
}
