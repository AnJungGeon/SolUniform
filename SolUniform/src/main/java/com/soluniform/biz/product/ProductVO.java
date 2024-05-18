package com.soluniform.biz.product;

import java.sql.Timestamp;

import lombok.Data;

// DataBean - product 테이블과 매핑할 데이터빈

@Data                                                                                                          
public class ProductVO {
	private int product_id;
	private String league_kind;
	private String product_kind;
	private String product_name;
	private int product_price;
	private int product_count;
	private String brand_name;
	private String made_country;
	private String product_imageAll;
	private String product_imageF;
	private String product_imageB;
	private String size_chart;
	private int discount_rate;
	private Timestamp reg_date;
	
	// 페이징 처리 - 첫번째 행, 마지막 행
	private int startRow;
	private int endRow;
	
	// 상품 분류별로 가져올 상품 개수
	private int kind_count;
	
	// 상품 검색 키워드
	private String keyword;
}
