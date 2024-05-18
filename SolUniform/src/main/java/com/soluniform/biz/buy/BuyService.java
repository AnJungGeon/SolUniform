package com.soluniform.biz.buy;

import java.util.List;

import com.soluniform.biz.cart.CartVO;
import com.soluniform.biz.member.MemberVO;

public interface BuyService {
	void insertBuy(List<BuyVO> buyList, List<CartVO> cartList); 
	List<BuyVO> getBuyList(MemberVO vo);
	List<BuyVO> getBuyDetail(BuyVO vo);
	List<BuyVO> getBuyListSearch(BuyVO vo);
	int getBuyIdCount(BuyVO vo);
	int getBuyIdSum(BuyVO vo);
}
