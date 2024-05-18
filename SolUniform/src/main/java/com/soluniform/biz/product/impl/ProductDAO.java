package com.soluniform.biz.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soluniform.biz.buy.BuyVO;
import com.soluniform.biz.product.ProductVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//shopMain.jsp - bxSlider
	public List<ProductVO> getProductListNew(ProductVO vo) {
		log.info("{}","getProductListNew");
		return mybatis.selectList("ProductDAO.getProductListNew",vo);
	}
	//shopMain.jsp - bxSlider
	public List<ProductVO> getProductListGood(ProductVO vo) {
		log.info("{}","getProductListGood");
		return mybatis.selectList("ProductDAO.getProductListGood",vo);
	}
	//shopContent.jsp - bxSlider
	public List<ProductVO> getLeagueListNew(ProductVO vo) {
		log.info("{}","getLeagueListNew");
		return mybatis.selectList("ProductDAO.getLeagueListNew",vo);
	}
	//shopContent.jsp 
	public List<ProductVO> getProductListRecom(ProductVO vo) {
		log.info("{}","getProductListRecom");
		return mybatis.selectList("ProductDAO.getProductListRecom",vo);
	}
	//shopTop.jsp - 최신상품 메뉴 12개씩 페이징
	public List<ProductVO> getProductMenuNew(ProductVO vo) {
		log.info("{}","getProductMenuNew");
		return mybatis.selectList("ProductDAO.getProductMenuNew",vo);
	}
	//shopTop.jsp - 추천상품 메뉴 12개씩 페이징
	public List<ProductVO> getProductMenuGood(ProductVO vo) {
		log.info("{}","getProductMenuGood");
		return mybatis.selectList("ProductDAO.getProductMenuGood",vo);
	}
	
	public int getProductMenuNewCount(ProductVO vo) {
		log.info("{}","getProductMenuNewCount");
		return mybatis.selectOne("ProductDAO.getProductMenuNewCount",vo);
	}
	
	public int getProductMenuGoodCount(ProductVO vo) {
		log.info("{}","getProductMenuGoodCount");
		return mybatis.selectOne("ProductDAO.getProductMenuGoodCount",vo);
	}
	
	public List<ProductVO> getLeagueListKind(ProductVO vo) {
		log.info("{}","getLeagueListKind");
		return mybatis.selectList("ProductDAO.getLeagueListKind",vo);
	}
	
	public int getLeagueListKindCount(ProductVO vo) {
		log.info("{}","getLeagueListKindCount");
		return mybatis.selectOne("ProductDAO.getLeagueListKindCount",vo);
	}

	
	public List<ProductVO> getProductSearch(ProductVO vo) {
		log.info("{}","getProductSearch");
		return mybatis.selectList("ProductDAO.getProductSearch",vo);
	}
	
	public int getProductSearchCount(ProductVO vo) {
		log.info("{}","getProductSearchCount");
		return mybatis.selectOne("ProductDAO.getProductSearchCount",vo);
	}

	
	public ProductVO getProduct(ProductVO vo) {
		log.info("{}","getProduct");
		return mybatis.selectOne("ProductDAO.getProduct" , vo);
	}
	
	//insertBuy -> 트랜잭션 처리
	public void updateProductCount(List<BuyVO> buyList) {
		log.info("{}","updateProductCount");
		mybatis.update("ProductDAO.updateProductCount", buyList);
	}
	

}
