package com.mrmr.gamto.store.dto;

import lombok.Data;

@Data
public class OrderItemDTO {
	private String i_order_number;
	private String i_order_id;
	private String i_address;
	private String i_name;
	private int i_price;
	private String i_quantity;
	private String i_phone;
	private int i_order_code;
}
