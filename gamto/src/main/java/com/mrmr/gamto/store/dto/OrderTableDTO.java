package com.mrmr.gamto.store.dto;

import lombok.Data;

@Data
public class OrderTableDTO {
	private String o_order_number;
	private String o_date;
	private String o_id;
	private String o_address;
	private String o_name;
	private String o_book_name;
	private String o_price;
	private String o_total;
	private String o_sum;
}
