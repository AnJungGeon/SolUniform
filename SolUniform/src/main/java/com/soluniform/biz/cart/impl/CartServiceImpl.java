package com.soluniform.biz.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soluniform.biz.cart.CartService;
import com.soluniform.biz.cart.CartVO;
import com.soluniform.biz.product.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public void insertCart(CartVO vo) {
		log.info("{}", "insertCart");
		cartDAO.insertCart(vo);
		
	}

	@Override
	public void updateCart(CartVO vo) {
		log.info("{}", "updateCart");
		cartDAO.updateCart(vo);
		
	}

	@Override
	public void deleteCartOne(CartVO vo) {
		log.info("{}", "deleteCartOne");
		cartDAO.deleteCartOne(vo);
		
	}

	@Override
	public void deleteCartAll(List<Integer> cartIdList) {
		log.info("{}", "deleteCartAll");
		cartDAO.deleteCartAll(cartIdList); 
		
	}

	@Override
	public List<CartVO> getCartList(CartVO vo) {
		log.info("{}", "getCartList");
		
		return cartDAO.getCartList(vo);
	}
	@Override
	public CartVO getCart(CartVO vo) {
		log.info("{}", "getCart");
		
		return cartDAO.getCart(vo);
	}

	@Override
	public List<CartVO> getCartIdList(List<Integer> cartIdList) {
		log.info("{}", "getCartIdList");
		return cartDAO.getCartIdList(cartIdList); 
	}
	
	
	
}
