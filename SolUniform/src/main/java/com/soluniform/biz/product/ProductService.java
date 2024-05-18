package com.soluniform.biz.product;

import java.util.List;

public interface ProductService {
	//신상품 목록
	List<ProductVO> getProductListNew(ProductVO vo);
	
	//추천상품 목록 - shopMain
	List<ProductVO> getProductListGood(ProductVO vo);
	//신상품 목록 - 같은 리그 shopContent
	List<ProductVO> getLeagueListNew(ProductVO vo);
	//추천상품 목록 - 같은 상품 shopContent.jsp
	List<ProductVO> getProductListRecom(ProductVO vo);
	//최신상품 메뉴
	List<ProductVO> getProductMenuNew(ProductVO vo);
	//추천상품 메뉴
	List<ProductVO> getProductMenuGood(ProductVO vo);
	//최신상품 메뉴 개수
	int getProductMenuNewCount(ProductVO vo);
	//추천 상품 메뉴 개수
	int getProductMenuGoodCount(ProductVO vo);
	//리그 분류 목록
	List<ProductVO> getLeagueListKind(ProductVO vo);
	//상품 분류 목록
	int getLeagueListKindCount(ProductVO vo);
	//상품검색
	List<ProductVO> getProductSearch(ProductVO vo);
	// 상품 검색 목록 개수
	int getProductSearchCount(ProductVO vo);
	//상품 상세 (1건)
	ProductVO getProduct(ProductVO vo);
}
