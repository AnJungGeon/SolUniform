package com.soluniform.biz.cart;

import java.util.List;

public interface CartService {

	void insertCart(CartVO vo);
	void updateCart(CartVO vo);
	void deleteCartOne(CartVO vo);
	void deleteCartAll(List<Integer> cartIdList);
	List<CartVO> getCartList(CartVO vo);
	CartVO getCart(CartVO vo); 
	List<CartVO> getCartIdList(List<Integer> cartIdList);
		
}
