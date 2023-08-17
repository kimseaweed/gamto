package com.mrmr.gamto.store.dto;

import lombok.Data;

@Data
public class OrderTableDTO {
	private int o_order_number;
	private String o_date;
	private String o_id;
	private String o_address;
	/* name, price, total, sum */
}
