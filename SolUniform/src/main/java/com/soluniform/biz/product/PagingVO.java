package com.soluniform.biz.product;

import lombok.Data;

// 모든 상품 목록 페이지의 페이징 처리를 위한 클래스
//pageNum, count 의 값을 직접 설정 - 
@Data
public class PagingVO {
	private int pageSize = 12;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int leagueCount;
	private int productCount;
	private int pageCount;
	private int startPage = 1;
	private int endPage;
	private int pageBlock = 10;

	public PagingVO(String pageNum,  int leagueCount) {
		this.currentPage = Integer.parseInt(pageNum);
		this.leagueCount = leagueCount;
		
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = currentPage * pageSize;
		pageCount = this.leagueCount / pageSize + (this.leagueCount % pageSize == 0 ? 0 : 1);

		// 시작 페이지 설정
		if (currentPage % 10 != 0)
			startPage = (currentPage / 10) * 10 + 1;
		else
			startPage = (currentPage / 10 - 1) * 10 + 1;

		// 끝 페이지 설정
		endPage = startPage + pageBlock - 1;
		// 끝 페이지가 전체 페이지 수보다 크다면 끝 페이지를 전체 페이지 수로 설정
		if (endPage > pageCount)
			endPage = pageCount;

	}



}
