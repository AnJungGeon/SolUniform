package com.soluniform.biz.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soluniform.biz.cart.CartVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("cartDAO")
public class CartDAO {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertCart(CartVO vo) {
		log.info("{}", "insertCart");
		mybatis.insert("CartDAO.insertCart",vo);
	}
	
	public void updateCart(CartVO vo) {
		log.info("{}", "updateCart");
		mybatis.update("CartDAO.updateCart", vo);
	}
	//카트 1개삭제 -> getCartList.jsp
	public void deleteCartOne(CartVO vo) {
		log.info("{}", "deleteCartOne");
		mybatis.delete("CartDAO.deleteCartOne", vo);
	}
	//여러개 또는 전체 ->getCartList.jsp
	public void deleteCartAll(List<Integer> cartIdList) {
		log.info("{}", "deleteCartAll");
		mybatis.delete("CartDAO.deleteCartAll",cartIdList);
	}
	
	public List<CartVO>getCartList (CartVO vo){
		log.info("{}", "getCartList");
		return mybatis.selectList("CartDAO.getCartList", vo);
	}
	
	public CartVO getCart(CartVO vo) {
		log.info("{}", "getCart");
		return mybatis.selectOne("CartDAO.getCart", vo);
	}
	
	public List<CartVO> getCartIdList (List<Integer> cartIdList){
		log.info("{}", "getCartIdList");
		return mybatis.selectList("CartDAO.getCartIdList", cartIdList);
	}
	
	//카트 리스트 삭제 -> insertBuy.jsp
	public void deleteCartList(List<CartVO> cartList) {
		log.info("{}", "deleteCartList");
		mybatis.delete("CartDAO.deleteCartList", cartList);
	}
	
	
}
