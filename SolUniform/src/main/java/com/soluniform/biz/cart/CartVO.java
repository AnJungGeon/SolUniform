package com.soluniform.biz.cart;

import lombok.Data;

@Data
public class CartVO {
	private int cart_id;
	private String buyer;
	private int product_id;
	private String product_name;
	private String product_imageF;
	private int product_price;
	private int discount_rate;
	private int buy_price;
	private int buy_count;
	
}
