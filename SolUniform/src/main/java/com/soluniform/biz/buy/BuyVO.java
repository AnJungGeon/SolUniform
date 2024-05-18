package com.soluniform.biz.buy;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BuyVO {
	
	private String buy_id;
	private String buyer;
	private int product_id;
	private String product_name;
	private String product_imageF;
	private int buy_price;
	private int buy_count;
	private Timestamp buy_date;
	private String account;
	private String delivery_name;
	private String delivery_tel;
	private String delivery_address1;
	private String delivery_address2; 
	private String delivery_state;
	
	// 구매일 조히
	private String start_date;
	private String end_date;
	
	// 구매 아이디별 
	private int buy_id_count;
	private int buy_id_sum;
}
