package com.soluniform.biz.buy.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soluniform.biz.buy.BuyService;
import com.soluniform.biz.buy.BuyVO;
import com.soluniform.biz.cart.CartVO;
import com.soluniform.biz.cart.impl.CartDAO;
import com.soluniform.biz.member.MemberVO;
import com.soluniform.biz.product.impl.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("buyService")
public class BuyServiceImpl implements BuyService{
	@Autowired
	private BuyDAO buyDAO;
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductDAO productDAO;
	
	
	//트랜잭션 처리 -> 구매 목록 추가, 카트 삭제, 상품 재고 수량 변경
	@Override
	public void insertBuy(List<BuyVO> buyList, List<CartVO> cartList) {
		log.info("{}", "insertBuy");
		buyDAO.insertBuy(buyList);
		cartDAO.deleteCartList(cartList); 
		productDAO.updateProductCount(buyList);
		
	}

	@Override
	public List<BuyVO> getBuyList(MemberVO vo) {
		log.info("{}", "getBuyList");
		return buyDAO.getBuyList(vo); 
	}
	@Override
	public List<BuyVO> getBuyDetail(BuyVO vo) {
		log.info("{}", "getBuyDetail");
		return buyDAO.getBuyDetail(vo); 
	} 
	@Override
	public List<BuyVO> getBuyListSearch(BuyVO vo) {
		log.info("{}", "getBuyListSearch");
		return buyDAO.getBuyListSearch(vo); 
	}
	
	@Override
	public int getBuyIdCount(BuyVO vo) {
		log.info("{}", "getBuyIdCount");
		return buyDAO.getBuyIdCount(vo); 
	}
	  
	
	@Override
	public int getBuyIdSum(BuyVO vo) {
		log.info("{}", "getBuyIdSum");
		return buyDAO.getBuyIdSum(vo); 
	}
}
