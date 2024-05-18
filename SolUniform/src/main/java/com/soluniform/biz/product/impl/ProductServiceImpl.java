package com.soluniform.biz.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soluniform.biz.product.ProductService;
import com.soluniform.biz.product.ProductVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Autowired 
	private ProductDAO productDAO; 
	@Override
	public List<ProductVO> getProductListNew(ProductVO vo) {
		log.info("{}", "getProductListNew");
		return productDAO.getProductListNew(vo); 
	} 
	@Override
	public List<ProductVO> getProductListGood(ProductVO vo) {
		log.info("{}", "getProductListGood");
		return productDAO.getProductListGood(vo); 
	}  
	@Override
	public List<ProductVO> getProductListRecom(ProductVO vo) {
		log.info("{}", "getProductListRecom");
		return productDAO.getProductListRecom(vo); 
	}  
	@Override
	public List<ProductVO> getLeagueListNew(ProductVO vo) {
		log.info("{}", "getLeagueListNew");
		return productDAO.getLeagueListNew(vo); 
	}
	@Override
	public List<ProductVO> getProductMenuNew(ProductVO vo) {
		log.info("{}", "getProductMenuNew");
		return productDAO.getProductMenuNew(vo); 
	} 
	@Override
	public List<ProductVO> getProductMenuGood(ProductVO vo) {
		log.info("{}", "getProductMenuGood");
		return productDAO.getProductMenuGood(vo); 
	} 
	@Override 
	public List<ProductVO> getLeagueListKind(ProductVO vo) {
		log.info("{}", "getLeagueListKind");
		return productDAO.getLeagueListKind(vo); 
	} 
	@Override  
	public int getLeagueListKindCount(ProductVO vo) {
		log.info("{}", "getLeagueListKindCount");
		return productDAO.getLeagueListKindCount(vo);
	}
	
	@Override
	public List<ProductVO> getProductSearch(ProductVO vo) {
		log.info("{}", "getLeagueSearch"); 
		return productDAO.getProductSearch(vo); 
	} 
	@Override
	public int getProductSearchCount(ProductVO vo) { 
		log.info("{}", "getProductSearchCount");
		return productDAO.getProductSearchCount(vo);
	}
	@Override
	public ProductVO getProduct(ProductVO vo) {
		log.info("{}", "getProduct");
		return productDAO.getProduct(vo);
	}
	@Override
	public int getProductMenuNewCount(ProductVO vo) {
		log.info("{}", "getProducMenuCount");
		return productDAO.getProductMenuNewCount(vo);
	}
	@Override
	public int getProductMenuGoodCount(ProductVO vo) {
		log.info("{}", "getProductMenuGoodCount");
		return productDAO.getProductMenuGoodCount(vo);
	}
}
